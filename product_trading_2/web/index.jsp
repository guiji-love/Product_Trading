<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--该jsp只负责请求转发。目的是为了让前台首页有分页数据，
让该目录下的index访问请求转发到ClientProductServlet程序，
在ClientProductServlet中实现page方法从而查询分页数据--%>
<jsp:forward page="/client/productServlet?action=page"></jsp:forward>

<%--请求重定向到/pages/index.jsp--%>
<%--<%
    response.sendRedirect("http://localhost:8080/product_trading_2/client/productServlet?action=page");
%>--%>

<%--<jsp:forward page="/pages/index.jsp"></jsp:forward>--%>

