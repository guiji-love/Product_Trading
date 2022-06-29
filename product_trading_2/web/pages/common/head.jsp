<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme()
            + "://"
            + request.getServerName()
            + ":"
            + request.getServerPort()
            + request.getContextPath()
            + "/";
    pageContext.setAttribute("basePath",basePath);
%>

<%--basePath的值为<%=basePath%>--%>
<!--写base标签，永远固定相对路径跳转的结果-->
<base href="<%=basePath%>">



<link rel="stylesheet" href="static/fontawesome/css/all.min.css"> <!-- https://fontawesome.com/ -->
<link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet"> <!-- https://fonts.google.com/ -->
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/templatemo-xtra-blog.css" rel="stylesheet">
<script src="static/js/jquery-1.7.2.js"></script>
<script src="static/js/templatemo-script.js"></script>
<script src="static/js/jquery.min.js"></script>
<script src="static/js/templatemo-script.js"></script>
