package com.guiji.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class Product {
    private Integer id;
    private String name;
    private String username;
    private BigDecimal price;
    private Integer sales=1;
    private Integer stock=1;
    private String imgPath = "static/img/img-01.jpg";
    private String describe;
    private String releaseTime;//商品发布时间


    public Product() {

    }

    public Product(Integer id, String name, String username, BigDecimal price, Integer sales, Integer stock, String imgPath, String describe, String releaseTime) {
        this.id = id;
        this.name = name;
        this.username = username;
        this.price = price;
        this.sales = sales;
        this.stock = stock;
        // 要求给定的物品封面物品路径不能为空
        if (imgPath != null && !"".equals(imgPath)) {
            this.imgPath = imgPath;
        }
        this.describe = describe;
        this.releaseTime = releaseTime;
    }



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getSales() {
        return sales;
    }

    public void setSales(Integer sales) {
        this.sales = sales;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        // 要求给定的物品封面物品路径不能为空
        if (imgPath != null && !"".equals(imgPath)) {
            this.imgPath = imgPath;
        }
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    public String getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(String releaseTime) {
        this.releaseTime = releaseTime;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", username='" + username + '\'' +
                ", price=" + price +
                ", sales=" + sales +
                ", stock=" + stock +
                ", imgPath='" + imgPath + '\'' +
                ", describe='" + describe + '\'' +
                ", releaseTime=" + releaseTime +
                '}';
    }
}
