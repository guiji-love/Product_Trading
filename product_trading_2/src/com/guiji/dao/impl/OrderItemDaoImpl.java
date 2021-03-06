package com.guiji.dao.impl;

import com.guiji.dao.OrderItemDao;
import com.guiji.pojo.OrderItem;

public class OrderItemDaoImpl extends  BaseDao implements OrderItemDao {
    @Override
    public int saveOrderItem(OrderItem orderItem) {
        //System.out.println("OrderItemDaoImpl程序在【"+Thread.currentThread().getName()+"】线程中");
        String sql="insert into t_order_item(name,count,price,total_price,order_id) values(?,?,?,?,?)";
        return update(sql,orderItem.getName(),orderItem.getCount(),orderItem.getPrice(),orderItem.getTotalPrice(),orderItem.getOrderId());
    }
}

