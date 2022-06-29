<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>交点</title>
	<%-- 静态包含 base标签、css样式、js文件 --%>
	<%@ include file="/pages/common/head.jsp"%>

</head>
<body>


<%--静态包含用户菜单栏--%>
<%@ include file="/pages/common/user_menu.jsp"%>

<div class="container-fluid">
	<main class="tm-main">


		<div class="row tm-row tm-mb-120">
			<div class="col-12" >
				<h2 class="tm-color-primary tm-post-title tm-mb-60"
					style="margin-bottom: 1px;
						   width: 50%;
						   font-size: 50px"
				>欢迎登录</h2>

			</div>
			<hr class="col-12">
			<div class="col-lg-7 tm-contact-left">

				<div class="user_status_menu">
					<a style="margin-left: 70px" href="pages/user/login.jsp">用户登录</a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a style="margin-left: 250px" href="pages/user/regist.jsp">立即注册</a>
					&nbsp;&nbsp;&nbsp;&nbsp;
				</div>

				<form action="userServlet" method="post"
					  class="mb-5 ml-auto mr-0 tm-contact-form">
					<input type="hidden" name="action" value="login" />

					<div class="form-group row mb-4" style="margin-top: 10px;">
						<div class="col-sm-9" style="width: 100%">
							<div class="msg_cont">
								<b></b>
								<em class="errorMsg" style="font-size:18px">
									${ empty requestScope.msg ? "请输入用户名和密码！":requestScope.msg }
								</em>
							</div>
						</div>
					</div>

					<div class="form-group row mb-4">
						<label for="username" class="col-sm-3 col-form-label text-right tm-color-primary">用户名称</label>
						<div class="col-sm-9">
							<input class="form-control mr-0 ml-auto"
								   autocomplete="off"
								   name="username" id="username"
								   value="${requestScope.username}"
								   id="name" type="text"
								   tabindex="1"
								   placeholder="请输入用户名"
								   required>
						</div>
					</div>

					<div class="form-group row mb-6">
						<label for="password" class="col-sm-3 col-form-label text-right tm-color-primary">用户密码</label>

						<div class="col-sm-9">
							<input type = "password" class="form-control mr-0 ml-auto"
								   autocomplete="off"
								   name="password"
								   id="password"
								   tabindex="1"
								   placeholder="请输入密码"

								   >
							<br>
						</div>
					</div>


					<div class="form-group row text-right">
						<div class="col-12">
							<button class="tm-btn tm-btn-primary tm-btn-small">登录</button>
						</div>
					</div>
				</form>


			</div>
			<div class="col-lg-5 tm-contact-right">
				<address class="mb-4 tm-color-gray">
					120 Lorem ipsum dolor sit amet,
					consectetur adipiscing 10550
				</address>
				<span class="d-block">
                        Tel:
                        <a href="tel:060-070-0980" class="tm-color-gray">060-070-0980</a>
                    </span>
				<span class="mb-4 d-block">
                        Email:
                        <a href="mailto:info@company.com" class="tm-color-gray">info@company.com</a>
                    </span>
				<p class="mb-5 tm-line-height-short">
					Maecenas eu mi eu dui cursus
					consequat non eu metus. Morbi ac
					turpis eleifend, commodo purus
					eget, commodo mauris.
				</p>
				<ul class="tm-social-links">
					<li class="mb-2">
						<a href="https://faceproduct.com" class="d-flex align-items-center justify-content-center">
							<i class="fab fa-faceproduct"></i>
						</a>
					</li>
					<li class="mb-2">
						<a href="https://twitter.com" class="d-flex align-items-center justify-content-center">
							<i class="fab fa-twitter"></i>
						</a>
					</li>
					<li class="mb-2">
						<a href="https://youtube.com" class="d-flex align-items-center justify-content-center">
							<i class="fab fa-youtube"></i>
						</a>
					</li>
					<li class="mb-2">
						<a href="https://instagram.com" class="d-flex align-items-center justify-content-center mr-0">
							<i class="fab fa-instagram"></i>
						</a>
					</li>
				</ul>
			</div>

		</div>
		<%--静态包含页脚内容--%>
		<%@include file="/pages/common/footer.jsp"%>

	</main>
</div>

</body>
</html>