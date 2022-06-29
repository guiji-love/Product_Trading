<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>购物车</title>
	<%-- 静态包含 base标签、css样式、js文件 --%>
	<%@ include file="/pages/common/head.jsp"%>
    <script type="text/javascript">
        $(function () {
            //给删除a标签绑定单击事件
            $("a.deleteItme").click(function () {
                return confirm("你确定要删除【"+$(this).parent().parent().find("td:first").text()+"】吗？");
            })
            $("#clearCart").click(function () {
                return confirm("你确定要清空购物车吗？");
            })
            $("#checkout").click(function () {
                return confirm("你确定要结账吗")
            })
            // 给输入框绑定 onchange内容发生改变事件
            $(".updateCount").change(function () {
                // 获取商品名称
                var name = $(this).parent().parent().find("td:first").text();
                var id = $(this).attr('productId');
                // 获取商品数量
                var count = this.value;
                if ( confirm("你确定要将【" + name + "】商品修改数量为：" + count + " 吗?") ) {
                    //发起请求。给服务器保存修改
                    location.href = "http://localhost:8080/product_trading_2/cartServlet?action=updateCount&count="+count+"&id="+id;
                } else {
                    // defaultValue属性是表单项 Dom对象的属性。它表示默认的value属性值。
                    this.value = this.defaultValue;
                }
            });
        })
    </script>
    </div>
</head>
<body>
<%--静态包含用户菜单栏--%>
<%@ include file="/pages/common/user_menu.jsp"%>

<div class="container-fluid">
	<main class="tm-main">


		<div class="row tm-row tm-mb-120" >
			<div class="col-12" style="height: 80px">
				<h2 class="tm-color-primary tm-post-title tm-mb-60" style="float: left;font-size: 50px">购物车</h2>
				<%--静态包含用户状态栏--%>
				<div style=" float: right;width: 60%"><%@ include file="/pages/common/user_status.jsp"%></div>
			</div>
			<br>
			<hr class="col-12" style="margin-top: 20px">
			<div class="table_css" style="width: 90%">

					<table>
						<tr>
							<td>商品名称</td>
							<td>数量</td>
							<td>单价</td>
							<td>金额</td>
							<td>操作</td>
						</tr>
						<c:if test="${empty sessionScope.cart.items}">
							<%--购物车为空情况下--%>
							<tr>
								<td colspan="5"><a href="index.jsp">亲，当前购物车为空哦！去首页浏览加购吧</a></td>
							</tr>
						</c:if>
						<c:if test="${not empty sessionScope.cart.items}">
							<%--购物车非空情况下--%>
							<c:forEach items="${sessionScope.cart.items}" var="entry">
								<tr>
									<td>${entry.value.name}</td>
									<td>
										<input class="updateCount" style="width: 80px;"
											   productId="${entry.value.id}"
											   type="text" value="${entry.value.count}">
									</td>
									<td>${entry.value.price}</td>
									<td>${entry.value.totalPrice}</td>
									<td><a class="deleteItme" href="cartServlet?action=deleteItem&id=${entry.value.id}">删除</a></td>
								</tr>
							</c:forEach>
						</c:if>
					</table>

					<%--购物车非空才输出--%>
					<c:if test="${not empty sessionScope.cart.items}">
						<div class="cart_info">
							<span class="cart_span">购物车中共有<span class="b_count">${sessionScope.cart.totalCount}</span>件商品</span>
							<span class="cart_span">总金额<span class="b_price">${sessionScope.cart.totalPrice}</span>元</span>
							<span class="cart_span"><a id="clearCart" href="cartServlet?action=clear">清空购物车</a></span>
							<span class="cart_span"><a id="checkout" href="orderServlet?action=createOrder">结算</a></span>
						</div>
					</c:if>


			</div>



		</div>
		<%--静态包含页脚内容--%>
		<%@include file="/pages/common/footer.jsp"%>

	</main>
</div>



</body>
</html>