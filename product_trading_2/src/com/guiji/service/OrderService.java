package com.guiji.service;

import com.guiji.pojo.Cart;

public interface OrderService {
    public String createOrder(Cart cart, Integer userId);
}
