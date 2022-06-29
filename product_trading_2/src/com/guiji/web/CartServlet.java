package com.guiji.web;

import com.google.gson.Gson;
import com.guiji.pojo.Product;
import com.guiji.pojo.Cart;
import com.guiji.pojo.CartItem;
import com.guiji.service.ProductService;
import com.guiji.service.impl.ProductServiceImpl;
import com.guiji.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class CartServlet extends BaseServlet {
    private ProductService productService=new ProductServiceImpl();
    /**
     * 未用ajax前，加入购物车的方法
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
/*    protected void addItem(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
        //获取请求参数，得到商品编号
        int id=WebUtils.parseInt(req.getParameter("id"),0);
        //调用productService.queryProductById()方法得到物品信息
        Product product =productService.queryProductById(id);
        //把物品信息转化为CartItem商品项
        CartItem cartItem=new CartItem(product.getId(),product.getName(),1,product.getPrice(),product.getPrice());
        //获取购物车对象和session域中保存的商品数据
        Cart cart= (Cart) req.getSession().getAttribute("cart");
        if(cart==null){
            cart=new Cart();
            req.getSession().setAttribute("cart",cart);
        }
        //调用Cart.addItem()方法，添加商品项
        cart.addItem(cartItem);
        //最后一个添加的商品名称
        req.getSession().setAttribute("lastName",cartItem.getName());
        //重定向回原来商品所在地址
        //http协议中有一个请求头，叫Referer，它可以把请求发起时浏览器的请求地址发送给服务器
        resp.sendRedirect(req.getHeader("Referer"));
    }*/

    /**
     * 使用ajax请求将物品加入购物车
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void ajaxAddItem(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException {
        //获取请求参数，得到商品编号
        int id=WebUtils.parseInt(req.getParameter("id"),0);
        //调用productService.queryProductById()方法得到物品信息
        Product product =productService.queryProductById(id);
        //把物品信息转化为CartItem商品项
        CartItem cartItem=new CartItem(product.getId(),product.getName(),1,product.getPrice(),product.getPrice());
        //获取购物车对象和session域中保存的商品数据
        Cart cart= (Cart) req.getSession().getAttribute("cart");
        if(cart==null){
            cart=new Cart();
            req.getSession().setAttribute("cart",cart);
        }
        //调用Cart.addItem()方法，添加商品项
        cart.addItem(cartItem);
        //最后一个添加的商品名称
        req.getSession().setAttribute("lastName",cartItem.getName());
        //返回购物车总的商品数量和最后一个添加到购物车的商品名称
        Map<String,Object> resultMap=new HashMap<>();
        resultMap.put("totalCount",cart.getTotalCount());
        resultMap.put("lastName",cartItem.getName());
        //将Map对象转换为json对象
        Gson gson=new Gson();
        String resultMapJsonString = gson.toJson(resultMap);
        resp.getWriter().write(resultMapJsonString);
    }
    /**
     * 删除购物车商品项
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void deleteItem(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取请求参数，得到商品编号
        int id=WebUtils.parseInt(req.getParameter("id"),0);
        //获取购物车对象
        Cart cart= (Cart) req.getSession().getAttribute("cart");
        if(cart!=null){
            //删除购物车商品项
            cart.deleteItem(id);
            //从哪来回哪去
            resp.sendRedirect(req.getHeader("Referer"));
        }
    }
    /**
     * 清空
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void clear(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取购物车对象
        Cart cart= (Cart) req.getSession().getAttribute("cart");
        if(cart!=null){
            //清空购物车
            cart.clear();
            //从哪来回哪去
            resp.sendRedirect(req.getHeader("Referer"));
        }
    }

    /**
     * 修改商品数量
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void updateCount(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取请求参数，得到商品编号、商品数量
        int id=WebUtils.parseInt(req.getParameter("id"),0);
        int count=WebUtils.parseInt(req.getParameter("count"),1);
        //获取购物车对象
        Cart cart= (Cart) req.getSession().getAttribute("cart");
        if(cart!=null){
            //清空购物车
            cart.updatCount(id,count);
            //从哪来回哪去
            resp.sendRedirect(req.getHeader("Referer"));
        }
    }
}
