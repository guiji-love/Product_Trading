package com.guiji.dao.impl;

import com.guiji.dao.ProductDao;
import com.guiji.pojo.Product;

import java.util.List;

public class ProductDaoImpl extends BaseDao implements ProductDao {
    @Override
    public int addProduct(Product product) {

        String sql = "insert into t_product(`name`,`price`,`username`,`sales`,`stock`,`img_path`,`describe`,`releaseTime`) values(?,?,?,?,?,?,?,?)";

        return update(sql, product.getName(),product.getPrice(),product.getUsername(),product.getSales(),product.getStock(),product.getImgPath(),product.getDescribe(),product.getReleaseTime());

    }

    @Override
    public int deleteProductById(Integer id) {
        String sql = "delete from t_product where id = ?";
        return update(sql, id);
    }

    @Override
    public int updateProduct(Product product) {
        //System.out.println("ProductDaoImpl程序在【"+Thread.currentThread().getName()+"】线程中");
        String sql = "update t_product set name=?,`describe`,price=?,`releaseTime`,img_path=? where id = ?";
        return update(sql,product.getName(),product.getDescribe(),product.getPrice(),product.getReleaseTime(),product.getImgPath(),product.getId());
    }

    @Override
    public Product queryProductById(Integer id) {
        String sql = "select id , name , username , price , sales , stock , img_path,`describe` imgPath from t_product where id = ?";
        return queryForOne(Product.class, sql,id);
    }

    @Override
    public List<Product> queryProducts() {
        String sql = "select id , name , username , price , sales , stock , img_path imgPath from t_product";
        return queryForList(Product.class, sql);
    }


    @Override
    public Integer queryForPageTotalCount() {
        String sql = "select count(*) from t_product";
        Number count = (Number) queryForSingleValue(sql);
        return count.intValue();
    }

    @Override
    public List<Product> queryForPageItems(int begin, int end) {
        String sql = "select id , `name` , username , price , sales , stock , img_path imgPath, `describe`,`releaseTime` from t_product limit ?,?";
        return queryForList(Product.class,sql,begin,end);
    }

    @Override
    public List<Product> queryForReleasePageItems(int begin, int end,String username) {
        String sql = "select id , `name` , username , price , sales , stock , img_path imgPath, `describe`,`releaseTime` from t_product  where `username`=? limit ?,?";
        return queryForList(Product.class,sql,username,begin,end);
    }



    //region 根据价格区间查询物品,不用了
    @Override
    public Integer queryForPageTotalCountByPrice(int min, int max) {
        String sql = "select count(*) from t_product where price between ? and ?";
        Number count = (Number) queryForSingleValue(sql,min,max);
        return count.intValue();

    }

    @Override
    public List<Product> queryForPageItemsByPrice(int begin, int end, int min, int max) {
        String sql ="select *"+
                "from (select rownum rn,a.* from (select  id,name,username,price,sales,stock,img_path imgPath from t_product where price between ? and ? order by price) a)"
        + "where rn>? and rn <=?"
        ;
        return queryForList(Product.class,sql,min,max,begin,end);
    }
    //endregion

    //region 物品模糊查询
    @Override
    public Integer queryForPageTotalCountByFuzzyQuery(String fuzzyQueryName) {
        //sql中的lower()方法将字符串转换为小写。
        String sql = "select count(*) from t_product where lower(name) like ?";
        //直接在sql中写模糊查询报错原因：模糊查询进行了转义 %'字段'% 的值加上了 '' 导致查询报错
        //解决办法:将要传入的参数直接加上%%，作为一个整体参数传入
        //java中的String类的toLowerCase()方法将字符串转换为小写。
        String  fuzzyQueryCondition="%"+fuzzyQueryName.toLowerCase()+"%";
        Number count = (Number) queryForSingleValue(sql,fuzzyQueryCondition);
        return count.intValue();
    }

    @Override
    public List<Product> queryForPageItemsByFuzzyQuery(int begin, int end, String fuzzyQueryName) {

        /*oracle数据库采用此sql
        String sql ="select *"+
                "from (select rownum rn,a.* from (select  id,name,username,price,sales,stock,img_path imgPath from t_product where lower(name) like ? order by price) a)"
                + "where rn>? and rn <=?"
                ;*/
        //因为product类中属性名为imgPath，所以这里查询为了取别名都变得冗长
        String sql ="select  id,name,username,price,sales,stock,img_path imgPath from t_product where lower(name) like ? order by price limit ?,?";
        String  fuzzyQueryCondition="%"+fuzzyQueryName.toLowerCase()+"%";
        return queryForList(Product.class,sql,fuzzyQueryCondition,begin,end);
    }
    //endregion
}
