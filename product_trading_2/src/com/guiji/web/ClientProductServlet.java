package com.guiji.web;

import com.guiji.pojo.Product;
import com.guiji.pojo.Page;
import com.guiji.pojo.User;
import com.guiji.service.ProductService;
import com.guiji.service.impl.ProductServiceImpl;
import com.guiji.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
//该类为了实现前台分页
public class ClientProductServlet extends BaseServlet {

    private ProductService productService = new ProductServiceImpl();

    /**
     * 实现前台首页分页
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void page(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("经过了的page方法");
        //1 获取请求的参数 pageNo 和 pageSize
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);
        //2 调用ProductService.page(pageNo，pageSize)：Page对象
        Page<Product> page = productService.page(pageNo,pageSize);
        page.setUrl("client/productServlet?action=page");
        //3 保存Page对象到Request域中
        req.setAttribute("page",page);
        //4 请求转发到首页
        //req.getRequestDispatcher("/pages/client/index.jsp").forward(req,resp);
        req.getRequestDispatcher("/pages/client/index.jsp").forward(req,resp);
    }

    /**
     * 查找用户发布的物品，这个方法应该放在Product里，
     * 或者将ClientProductServlet和ProductServlet合并，然后修改xml中的Servlet路径。现在路径很乱，但没时间改了。
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void releasePage(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("经过了的releasePage方法");

        User user = (User) req.getSession().getAttribute("user");
        String username=user.getUsername();
        //1 获取请求的参数 pageNo 和 pageSize
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);
        //2 调用ProductService.page(pageNo，pageSize)：Page对象
        Page<Product> page = productService.releasePage(pageNo,pageSize,username);
        page.setUrl("client/productServlet?action=releasePage");
        //3 保存Page对象到Request域中
        req.setAttribute("page",page);
        //4 请求转发到pages/manager/product_manager.jsp页面
        req.getRequestDispatcher("/pages/mine/mine_released.jsp").forward(req,resp);
    }
    /**
     * 根据价格查询
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void pageByPrice(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1 获取请求的参数 pageNo 和 pageSize
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);
        int min = WebUtils.parseInt(req.getParameter("min"), 0);
        int max = WebUtils.parseInt(req.getParameter("max"), Integer.MAX_VALUE);

        //2 调用ProductService.page(pageNo，pageSize)：Page对象
        Page<Product> page = productService.pageByPrice(pageNo,pageSize,min,max);

        //StringBuilder:可变字符序列。如果要对字符串进行大量修改，并且单线程中，使用StringBuilder
        StringBuilder sb = new StringBuilder("client/productServlet?action=pageByPrice");

        // 如果有最小价格的参数,追加到分页条的地址参数中
        if (req.getParameter("min") != null) {
            sb.append("&min=").append(req.getParameter("min"));
        }
        // 如果有最大价格的参数,追加到分页条的地址参数中
        if (req.getParameter("max") != null) {
            sb.append("&max=").append(req.getParameter("max"));
        }
        page.setUrl(sb.toString());
        //3 保存Page对象到Request域中
        req.setAttribute("page",page);
        //4 请求转发到首页
        req.getRequestDispatcher("/pages/client/index.jsp").forward(req,resp);
    }



    /**
     * 根据物品名模糊查询
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void pageByFuzzyQuery(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1 获取请求的参数 pageNo 和 pageSize
        int pageNo = WebUtils.parseInt(req.getParameter("pageNo"), 1);
        int pageSize = WebUtils.parseInt(req.getParameter("pageSize"), Page.PAGE_SIZE);
        final String fuzzyQueryName = req.getParameter("fuzzyQueryName");

        //2 调用ProductService.page(pageNo，pageSize)：Page对象
        Page<Product> page = productService.pageByFuzzyQuery(pageNo,pageSize,fuzzyQueryName);

        StringBuilder sb = new StringBuilder("client/productServlet?action=pageByFuzzyQuery");
        // 如果有物品名,追加到分页条的地址参数中
        if (req.getParameter("fuzzyQueryName") != null) {
            sb.append("&fuzzyQueryName=").append(req.getParameter("fuzzyQueryName"));
        }

        page.setUrl(sb.toString());
        //3 保存Page对象到Request域中
        req.setAttribute("page",page);
        //4 请求转发到首页
        req.getRequestDispatcher("/pages/client/index.jsp").forward(req,resp);
    }

}
