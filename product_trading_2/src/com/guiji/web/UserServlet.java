package com.guiji.web;

import com.google.gson.Gson;
import com.guiji.pojo.User;
import com.guiji.service.UserService;
import com.guiji.service.impl.UserServiceImpl;
import com.guiji.utils.WebUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

public class UserServlet extends BaseServlet {

    private UserService userService = new UserServiceImpl();

    protected void ajaxExistsUsername(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //获取请求参数username
        String username = req.getParameter("username");
        //调用userService.existsUsername();
        boolean existsUsername = userService.existsUsername(username);
        //把返回的结果封装成为map对象
        Map<String,Object> resultMap=new HashMap<>();
        resultMap.put("existsUsername",existsUsername);
        //将Map对象转换为json对象
        Gson gson=new Gson();
        String json = gson.toJson(resultMap);
        resp.getWriter().write(json);

    }


    /**
     * 退出登录
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void logOut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //销毁用户session
        req.getSession().invalidate();
        //重定向到首页
        resp.sendRedirect(req.getContextPath());
    }

    /**
     * 处理登录的功能
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void login(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //  1、获取请求的参数
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        // 调用 userService.login()登录处理业务
        User loginUser = userService.login(new User(null, username, password, null));
        if (username=="" ||password=="") {
            req.setAttribute("msg", "请输入用户名和密码！");
            req.setAttribute("username", username);
            //   跳回登录页面
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req, resp);
        } else if(!userService.existsUsername(username)) {
            req.setAttribute("msg", "该用户不存在！");
            req.setAttribute("username", username);
            //   跳回登录页面
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req, resp);
        } else if (loginUser == null){
            // 如果等于null,说明登录 失败!
            // 把错误信息，和回显的表单项信息，保存到Request域中
            req.setAttribute("msg", "密码错误！");
            req.setAttribute("username", username);
            //   跳回登录页面
            req.getRequestDispatcher("/pages/user/login.jsp").forward(req, resp);
        }
        else {
            // 登录成功
            req.getSession().setAttribute("user",loginUser);
            req.getSession().setAttribute("id",loginUser.getId());

            req.setAttribute("id",loginUser.getId());
            //跳到首页
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
        }
    }

    /**
     * 处理注册的功能
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    protected void regist(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //  1、获取请求的参数
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");
        String code=req.getParameter("code");
        //获取session中的验证码
        String sessionCode =(String)req.getSession().getAttribute(KAPTCHA_SESSION_KEY);
        //删除session中的验证码
        req.getSession().removeAttribute(KAPTCHA_SESSION_KEY);
        User user = WebUtils.copyParamToBean(req.getParameterMap(), new User());

        // 2、检查验证码是否正确
        if (sessionCode !=null && sessionCode.equalsIgnoreCase(code)) {
            // 3、检查用户名是否可用
            if (userService.existsUsername(username)) {
                // 把回显信息，保存到Request域中
                req.setAttribute("msg", "用户名已存在！！！");
                req.setAttribute("username", username);
                req.setAttribute("email", email);
                //跳回注册页面
                req.getRequestDispatcher("/pages/user/regist.jsp").forward(req, resp);
            } else {
                //调用Service层方法保存到数据库
                userService.registUser(new User(null, username, password, email));
                //跳到注册成功页面 regist_success.jsp
                req.setAttribute("msg", "注册成功，请登录您的账号");
                req.getRequestDispatcher("/pages/user/login.jsp").forward(req, resp);
            }
        } else {
            // 把回显信息，保存到Request域中
            req.setAttribute("msg", "验证码错误！！");
            req.setAttribute("username", username);
            req.setAttribute("email", email);
            req.getRequestDispatcher("/pages/user/regist.jsp").forward(req, resp);
        }
    }
}
