<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>error404</title>
	<%-- 静态包含 base标签、css样式、jQuery文件 --%>
	<%@ include file="/pages/common/head.jsp"%>
	<style type="text/css">
		.fontcss{
			font-weight: bold;
			font-size: 20px;
			line-height: 32px;
			margin-top: 0;
			word-wrap: break-word;
			color: black;
			margin-bottom: 22px;
		}
	</style>

</head>
<body>
<div style="margin-bottom:20px;margin-left:80px;">
		 非常抱歉，您访问的页面不存在或已被删除<br>
	<a href="index.jsp" class="fontcss" >回到首页</a>
</div>
<div style="text-align:center;margin-left: 50px;">
	<div>
		<img src="static/img/error/error404.jpg" width="450" /><br>
	</div>
	<div class="fontcss">
	技术小哥自驾游去了<br>
	因为生活不止眼前的代码还有诗和远方！！！<br>
	</div>
</div>
</body>
</html>