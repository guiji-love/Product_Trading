package com.guiji.dao;

import com.guiji.pojo.Product;

import java.util.List;

public interface ProductDao {

    public int addProduct(Product product);

    public int deleteProductById(Integer id);

    public int updateProduct(Product product);

    public Product queryProductById(Integer id);

    public List<Product> queryProducts();

    Integer queryForPageTotalCount();

    List<Product> queryForPageItems(int begin, int over);

    List<Product> queryForReleasePageItems(int begin, int over,String username);


    Integer queryForPageTotalCountByPrice(int min, int max);

    List<Product> queryForPageItemsByPrice(int begin, int pageSize, int min, int max);

    Integer queryForPageTotalCountByFuzzyQuery(String fuzzyQueryName);

    List<Product> queryForPageItemsByFuzzyQuery(int begin, int pageSize, String fuzzyQueryName);
}
