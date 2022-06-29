package com.guiji.service.impl;

import com.guiji.dao.ProductDao;
import com.guiji.dao.OrderDao;
import com.guiji.dao.OrderItemDao;
import com.guiji.dao.impl.ProductDaoImpl;
import com.guiji.dao.impl.OrderDaoImpl;
import com.guiji.dao.impl.OrderItemDaoImpl;
import com.guiji.pojo.*;
import com.guiji.service.OrderService;

import java.util.Map;
public class OrderServiceImpl implements OrderService {
    private OrderDao orderDao=new OrderDaoImpl();
    private OrderItemDao orderItemDao=new OrderItemDaoImpl();
    private ProductDao productDao=new ProductDaoImpl();
    @Override
    public String createOrder(Cart cart, Integer userId) {
        //System.out.println("OrderServiceImpl程序在【"+Thread.currentThread().getName()+"】线程中");
        //获取系统当前时间
        java.util.Date sysDate = new java.util.Date();
        java.sql.Timestamp date = new java.sql.Timestamp(sysDate.getTime());
        //创建唯一的订单号,System类的currentTimeMillis()方法返回GMT(格林尼治时间)1970年1月1日0点0分0秒到现在的毫秒数
        //加一个空的字符串将currentTimeMillis()产生的long型转换为String型
        //加一个userId，确保大量用户同时点击生成订单时（如双十一）订单号的唯一性
        String orderId = System.currentTimeMillis() + "" + userId;
        //创建一个订单对象
        Order order = new Order(orderId,date,cart.getTotalPrice(),0, userId);
        //保存订单
        orderDao.saveOrder(order);

        //测试事务是否有效
        //int i=12/0;

        //遍历购物车中每一个商品项转换为订单项保存到数据库
        for (Map.Entry<Integer, CartItem> entry : cart.getItems().entrySet()) {
            //获取每一个购物车中的商品项
            CartItem cartItem = entry.getValue();
            //转换为每一个订单项
            OrderItem orderItem=new OrderItem(null,cartItem.getName(),cartItem.getCount(),cartItem.getPrice(),cartItem.getTotalPrice(),orderId);
            //保存订单项到数据库
            orderItemDao.saveOrderItem(orderItem);
            //更新商品库存和销量
            Product product = productDao.queryProductById(cartItem.getId());
            product.setSales(product.getSales()+cartItem.getCount());
            product.setStock(product.getStock()-cartItem.getCount());
            //这里生成订单后应修改销量、库存、和商品状态，这里没时间写了，以后有空再写
            //productDao.updateProduct(product);
        }
        //订单生成之后，清空购物车
        cart.clear();
        return orderId;
    }
}
