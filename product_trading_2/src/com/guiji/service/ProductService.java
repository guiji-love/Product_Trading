package com.guiji.service;

import com.guiji.pojo.Product;
import com.guiji.pojo.Page;

import java.util.List;

public interface  ProductService {

    public void addProduct(Product product);

    public void deleteProductById(Integer id);

    public void updateProduct(Product product);

    public Product queryProductById(Integer id);

    public List<Product> queryProducts();

    Page<Product> page(int pageNo, int pageSize);

    Page<Product> releasePage(int pageNo, int pageSize,String username);

    Page<Product> pageByPrice(int pageNo, int pageSize, int min, int max);

    Page<Product> pageByFuzzyQuery(int pageNo, int pageSize, String fuzzyQueryName);
}
