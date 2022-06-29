package com.guiji.dao.impl;

import com.guiji.dao.OrderDao;
import com.guiji.pojo.Order;

public class OrderDaoImpl extends BaseDao implements OrderDao {
    @Override
    public int saveOrder(Order order) {
        //System.out.println("OrderDaoImpl程序在【"+Thread.currentThread().getName()+"】线程中");
        String sql="insert into t_order values(?,?,?,?,?)";
        return  update(sql,order.getOrderId(),order.getCreateTime(), order.getPrice(),order.getStatus(),order.getUserId());
    }
}
