<%--
  Created by IntelliJ IDEA.
  User: guiji
  Date: 2022-05-30
  Time: 22:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>交点</title>
    <link href="static/css/templatemo-xtra-blog.css" rel="stylesheet">

</head>
<body>
    <div class="user_status"  >
        <%--用户未登录情况下--%>
        <c:if test="${empty sessionScope.user}">
            <div class="user_status_menu">
            <a href="pages/user/login.jsp">登录</a>
            &nbsp;&nbsp;|&nbsp;&nbsp;
            <a href="pages/user/regist.jsp">注册</a>
            &nbsp;&nbsp;|&nbsp;&nbsp;
            <a class="cartTotalCount" href="pages/cart/cart.jsp">
                购物车(<span style="color: red" >${sessionScope.cart.totalCount}</span>)
            </a>
            &nbsp;
                <%--&nbsp;|&nbsp;&nbsp;<a href="pages/order/order.jsp">我的订单</a>--%>
        </div>
        </c:if>
        <%--普通用户登录后--%>
        <c:if test="${sessionScope.user.id>0}">

            &nbsp;&nbsp;
            <div class="user_status_menu">
                <div id="welcome">欢迎<em>${sessionScope.user.username}</em>光临交点</div>
                &nbsp;&nbsp;
                <a class="cartTotalCount" href="pages/cart/cart.jsp">
                    购物车(<span style="color: red" >${sessionScope.cart.totalCount}</span>)
                </a>
                <%--|&nbsp;&nbsp;<a href="pages/order/order.jsp">我的订单</a>&nbsp;&nbsp;--%>
                &nbsp;&nbsp;|&nbsp;&nbsp;
                <a href="userServlet?action=logOut">退出登录</a>&nbsp;
            </div>
        </c:if>
    </div>



</body>
</html>
