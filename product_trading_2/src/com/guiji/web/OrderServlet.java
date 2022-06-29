package com.guiji.web;

import com.guiji.pojo.Cart;
import com.guiji.pojo.User;
import com.guiji.service.OrderService;
import com.guiji.service.impl.OrderServiceImpl;
import com.guiji.utils.JdbcUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class OrderServlet extends BaseServlet {
    private OrderService orderService=new OrderServiceImpl();

    protected void createOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取购物车对象
        Cart cart= (Cart) req.getSession().getAttribute("cart");
        //获取userId
        User loginUser= (User) req.getSession().getAttribute("user");
        if(loginUser==null){
            req.getRequestDispatcher("pages/user/login.jsp").forward(req,resp);
            return;
        }
        //System.out.println("OrderServlet程序在【"+Thread.currentThread().getName()+"】线程中");
        Integer userId=loginUser.getId();
        //调用Service层方法生成订单
        String orderId = orderService.createOrder(cart, userId);


/*      //请求转发到pages/cart/checkout.jsp页面
        req.setAttribute("orderId",orderId);
        req.getRequestDispatcher("pages/cart/checkout.jsp").forward(req,resp);*/

        //为了防止用户按F5重复提交订单，使用重定向
        //因为重定向不支持数据保存在request域中，所以将orderId保存在session域中
        req.getSession().setAttribute("orderId",orderId);
        resp.sendRedirect(req.getContextPath()+"/pages/cart/checkout.jsp");
    }


}
