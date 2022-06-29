package com.guiji.filter;

import com.guiji.utils.JdbcUtils;

import javax.servlet.*;
import java.io.IOException;

//为所有页面捕获异常，实现事务管理
public class TransactionFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        try {
            filterChain.doFilter(servletRequest,servletResponse);
            //如果没有异常，提交事务，关闭连接
            JdbcUtils.commitAndClose();
        } catch (Exception e) {
            //如果有异常，回滚事务，关闭连接
            JdbcUtils.rollbackAndClose();
            e.printStackTrace();
            //把异常抛给Tomcat展示错误页面
            throw new RuntimeException(e);
        }
    }

    @Override
    public void destroy() {

    }
}
