<%--
  Created by IntelliJ IDEA.
  User: guiji
  Date: 2022-05-31
  Time: 10:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
      <div style="text-align: center">
          <c:if test="${empty sessionScope.cart.items}">
              <%--购物车为空的输出--%>
              <%--非空也要加上class是为了第一次打开页面时，json能找到对应class的标签，否则它找不到，
              不跳转一次，页面上就一直显示为空的输出--%>
              <%--<span id="cartTotalCount"></span>--%>
              <div class="addCartLastName" style="margin-top:0px;margin-bottom: 10px">
                      <%--<span style="color: red">当前购物车为空</span>--%>
              </div>
          </c:if>
          <c:if test="${not empty sessionScope.cart.items}">
              <%--购物车非空的输出--%>
              <%--<span id="cartTotalCount">您的购物车中有${sessionScope.cart.totalCount}件商品</span>--%>
              <div class="addCartLastName" style="margin-top:0px;margin-bottom: 10px">
                  您刚刚将<span style="color: red" >${sessionScope.lastName}</span>加入到了购物车中
              </div>
          </c:if>
      </div>
</body>
</html>
