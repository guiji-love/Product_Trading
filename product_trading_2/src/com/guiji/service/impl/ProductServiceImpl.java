package com.guiji.service.impl;

import com.guiji.dao.ProductDao;
import com.guiji.dao.impl.ProductDaoImpl;
import com.guiji.pojo.Product;
import com.guiji.pojo.Page;
import com.guiji.service.ProductService;

import java.util.List;

public class ProductServiceImpl implements ProductService {

    private ProductDao productDao = new ProductDaoImpl();

    @Override
    public void addProduct(Product product) {
        productDao.addProduct(product);
    }

    @Override
    public void deleteProductById(Integer id) {
        productDao.deleteProductById(id);
    }

    @Override
    public void updateProduct(Product product) {
        productDao.updateProduct(product);
    }

    @Override
    public Product queryProductById(Integer id) {
        return productDao.queryProductById(id);
    }

    @Override
    public List<Product> queryProducts() {
        return productDao.queryProducts();
    }

    @Override
    public Page<Product> page(int pageNo, int pageSize) {
        Page<Product> page = new Page<Product>();

        // 设置每页显示的数量
        page.setPageSize(pageSize);
        // 求总记录数
        Integer pageTotalCount = productDao.queryForPageTotalCount();
        // 设置总记录数
        page.setPageTotalCount(pageTotalCount);
        // 求总页码
        Integer pageTotal = pageTotalCount / pageSize;
        if (pageTotalCount % pageSize > 0) {
            pageTotal+=1;
        }
        // 设置总页码
        page.setPageTotal(pageTotal);

        // 设置当前页码
        page.setPageNo(pageNo);

        // 求当前页数据的开始索引
        int begin = (page.getPageNo() - 1) * pageSize;
        int end=page.getPageNo() * pageSize;
        // 求当前页数据
        List<Product> items = productDao.queryForPageItems(begin,end);
        // 设置当前页数据
        page.setItems(items);

        return page;
    }


    @Override
    public Page<Product> releasePage(int pageNo, int pageSize, String username) {
        Page<Product> page = new Page<Product>();
        // 设置每页显示的数量
        page.setPageSize(pageSize);
        // 求总记录数
        Integer pageTotalCount = productDao.queryForPageTotalCount();
        // 设置总记录数
        page.setPageTotalCount(pageTotalCount);
        // 求总页码
        Integer pageTotal = pageTotalCount / pageSize;
        if (pageTotalCount % pageSize > 0) {
            pageTotal+=1;
        }
        // 设置总页码
        page.setPageTotal(pageTotal);
        // 设置当前页码
        page.setPageNo(pageNo);
        // 求当前页数据的开始索引
        int begin = (page.getPageNo() - 1) * pageSize;
        int end=page.getPageNo() * pageSize;
        // 求当前页数据
        List<Product> items = productDao.queryForReleasePageItems(begin,end,username);
        // 设置当前页数据
        page.setItems(items);

        return page;
    }

    @Override
    public Page<Product> pageByPrice(int pageNo, int pageSize, int min, int max) {
        Page<Product> page = new Page<Product>();

        // 设置每页显示的数量
        page.setPageSize(pageSize);
        // 求总记录数
        Integer pageTotalCount = productDao.queryForPageTotalCountByPrice(min,max);
        // 设置总记录数
        page.setPageTotalCount(pageTotalCount);
        // 求总页码
        Integer pageTotal = pageTotalCount / pageSize;
        if (pageTotalCount % pageSize > 0) {
            pageTotal+=1;
        }
        // 设置总页码
        page.setPageTotal(pageTotal);

        // 设置当前页码
        page.setPageNo(pageNo);

        // 求当前页数据的开始索引
        int begin = (page.getPageNo() - 1) * pageSize;
        int end=page.getPageNo() * pageSize;
        // 求当前页数据
        List<Product> items = productDao.queryForPageItemsByPrice(begin,end,min,max);
        // 设置当前页数据
        page.setItems(items);

        return page;
    }

    @Override
    public Page<Product> pageByFuzzyQuery(int pageNo, int pageSize, String fuzzyQueryName) {
        Page<Product> page = new Page<Product>();

        // 设置每页显示的数量
        page.setPageSize(pageSize);
        // 求总记录数
        Integer pageTotalCount = productDao.queryForPageTotalCountByFuzzyQuery(fuzzyQueryName);
        // 设置总记录数
        page.setPageTotalCount(pageTotalCount);
        // 求总页码
        Integer pageTotal = pageTotalCount / pageSize;
        if (pageTotalCount % pageSize > 0) {
            pageTotal+=1;
        }
        // 设置总页码
        page.setPageTotal(pageTotal);

        // 设置当前页码
        page.setPageNo(pageNo);

        // 求当前页数据的开始索引
        int begin = (page.getPageNo() - 1) * pageSize;
        int end=page.getPageNo() * pageSize;
        // 求当前页数据
        List<Product> items = productDao.queryForPageItemsByFuzzyQuery(begin,end,fuzzyQueryName);
        // 设置当前页数据
        page.setItems(items);

        return page;
    }




}
