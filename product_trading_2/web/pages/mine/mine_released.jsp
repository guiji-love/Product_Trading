<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta charset="UTF-8">
	<title>我发布的</title>

	<%-- 静态包含 base标签、css样式、jQuery文件 --%>
	<%@ include file="/pages/common/head.jsp"%>
	<script type="text/javascript">
        $(function () {
            // 给删除的a标签绑定单击事件，用于删除的确认提示操作
            $("a.deleteClass").click(function () {
                // 在事件的function函数中，有一个this对象。这个this对象，是当前正在响应事件的dom对象。
                /**
                 * confirm是确认提示框函数
                 * 参数是它的提示内容
                 * 它有两个按钮，一个确认，一个是取消。
                 * 返回true表示点击了，确认，返回false表示点击取消。
                 */
                return confirm("你确定要删除【" + $(this).parent().parent().find("td:first").text() + "】?");
                // return false// 阻止元素的默认行为===不提交请求
            });
        });
	</script>
</head>
<body>
<%--静态包含用户菜单栏--%>
<%@ include file="/pages/common/user_menu.jsp"%>

<div class="container-fluid">
	<main class="tm-main">


		<div class="row tm-row tm-mb-120" >
			<div class="col-12" style="height: 80px">
				<h2 class="tm-color-primary tm-post-title tm-mb-60" style="float: left;font-size: 50px">我发布的</h2>
				<%--静态包含用户状态栏--%>
				<div style=" float: right;width: 60%"><%@ include file="/pages/common/user_status.jsp"%></div>
			</div>

			<hr class="col-12" style="margin-top: 10px">
			<div class="table_css" style="width: 90%">

				<table>
					<tr>
						<td>名称</td>
						<td>描述</td>
						<td>价格</td>

						<td>发布时间</td>
						<td>状态</td>
						<td colspan="2">操作</td>
					</tr>

					<c:if test="${empty requestScope.page.items}">
					<%--未发布商品情况下--%>
					<tr>
						<td colspan="5"><span class="tm-color-primary">你还没有发布宝贝呢</span></td>
					</tr>
					</c:if>

					<c:forEach items="${requestScope.page.items}" var="product">
						<tr>
							<td>${product.name}</td>
							<td>${product.describe}</td>
							<td>${product.price}</td>
							<td>${product.releaseTime}</td>
							<td>在卖</td>
							<td><a href="productServlet?action=getProduct&id=${product.id}&pageNo=${requestScope.page.pageNo}">修改</a></td>
							<td><a class="deleteClass" href="productServlet?action=delete&id=${product.id}&pageNo=${requestScope.page.pageNo}">删除</a></td>
						</tr>
					</c:forEach>

					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td><a href="pages/mine/contact.jsp?pageNo=${requestScope.page.pageTotal}">发布宝贝</a></td>
					</tr>
				</table>
			</div>



		</div>
		<%--静态包含页脚内容--%>
		<%@include file="/pages/common/footer.jsp"%>

	</main>
</div>



</body>
</html>