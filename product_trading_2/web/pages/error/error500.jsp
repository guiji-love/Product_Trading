<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error500</title>

	<%-- 静态包含 base标签、css样式、jQuery文件 --%>
	<%@ include file="/pages/common/head.jsp"%>
	<style type="text/css">
		.fontcss{
			font-weight: bold;
			font-size: 16px;
			margin-top: 0;
			margin-bottom:1px;
			color: black;

		}
	</style>
</head>
<body>

<div style="text-align:center;margin-left: 50px;">
	<div style="margin-top: 100px;margin-bottom: 0px">
		<img src="static/img/error/error500.jpg" width="650" /><br>
	</div>
	<div class="fontcss">
		非常抱歉，技术小哥正在努力抢修！！！<br>
		</div>
	<div>
		<a href="index.jsp" class="fontcss">回到首页</a>
	</div>
</div>
</body>
</html>