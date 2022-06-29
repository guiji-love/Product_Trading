package com.guiji.web;

import com.guiji.pojo.Product;
import com.guiji.pojo.Page;
import com.guiji.service.ProductService;
import com.guiji.service.impl.ProductServiceImpl;
import com.guiji.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

//我的交易
public class ProductServlet extends BaseServlet{

    private ProductService productService = new ProductServiceImpl();

/*    *//**
     * 处理分页功能
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     *//*
    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1 获取请求的参数 pageNo 和 pageSize
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);
        //2 调用ProductService.page(pageNo，pageSize)：Page对象
        Page<Product> page = productService.page(pageNo,pageSize);
        page.setUrl("manager/productServlet?action=page");
        //3 保存Page对象到Request域中
        req.setAttribute("page",page);
        //4 请求转发到pages/manager/product_manager.jsp页面
        req.getRequestDispatcher("/pages/manager/product_manager.jsp").forward(req,resp);
    }*/


    /**
     * 新增物品
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void add(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 0);
        System.out.println(pageNo);
        pageNo+=1;
        //  1、获取请求的参数==封装成为Product对象
        System.out.println("req.getParameterMap()= "+req.getParameterMap());
        Product product = WebUtils.copyParamToBean(req.getParameterMap(),new Product());
//        2、调用ProductService.addProduct()保存物品
        productService.addProduct(product);
//        3、跳到物品列表页面
//                /manager/productServlet?action=list
//        req.getRequestDispatcher("/manager/productServlet?action=list").forward(req, resp);
        resp.sendRedirect(req.getContextPath() + "/client/productServlet?action=releasePage&pageNo=" + pageNo);

    }


    /**
     * 删除物品
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void delete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        1、获取请求的参数id，物品编程
        int id = WebUtils.parseInt(req.getParameter("id"), 0);
//        2、调用productService.deleteProductById();删除物品
        productService.deleteProductById(id);
//        3、重定向回物品列表管理页面
//                /product/manager/productServlet?action=list
        resp.sendRedirect(req.getContextPath() + "/client/productServlet?action=releasePage&pageNo=" + req.getParameter("pageNo"));
    }


    /**
     * 修改物品
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        1、获取请求的参数==封装成为Product对象
        Product product = WebUtils.copyParamToBean(req.getParameterMap(),new Product());
//        2、调用ProductService.updateProduct( product );修改物品
        productService.updateProduct(product);
//        3、重定向回物品列表管理页面
//        地址：/工程名/manager/productServlet?action=list
        resp.sendRedirect(req.getContextPath() + "/client/productServlet?action=releasePage&pageNo=" + req.getParameter("pageNo"));
    }


    /**
     * 修改物品时 在新跳转的页面获取物品信息
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void getProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1 获取请求的参数物品编号
        int id = WebUtils.parseInt(req.getParameter("id"), 0);
        //2 调用productService.queryProductById查询物品
        Product product = productService.queryProductById(id);
        //3 保存到物品到Request域中
        req.setAttribute("product", product) ;
        //4 请求转发到
        req.getRequestDispatcher("/pages/mine/contact.jsp").forward(req,resp);
    }


    /**
     *未分页前查询全部物品列表
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
/*
    protected void list(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1 通过ProductService查询全部物品
        List<Product> products = productService.queryProducts();
        //2 把全部物品保存到Request域中
        req.setAttribute("products", products);
        //3、请求转发到/pages/manager/product_manager.jsp页面
        req.getRequestDispatcher("/pages/manager/product_manager.jsp").forward(req,resp);
    }
*/

}
