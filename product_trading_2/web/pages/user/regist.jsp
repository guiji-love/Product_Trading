<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>交点会员注册</title>

		<%-- 静态包含 base标签、css样式、js文件 --%>
		<%@ include file="/pages/common/head.jsp"%>



		<script type="text/javascript">
			// 页面加载完成之后
			$(function () {
			    $("#username").blur(function () {
			        var username=this.value;
			        $.getJSON("http://localhost:8080/product_trading_2/userServlet","action=ajaxExistsUsername&username="+username,function (data) {
						if (username==null || username=="") {
                            $("#errorMsg").text("用户名为空！");
						} else if (data.existsUsername){
							$("#errorMsg").text("用户名已存在！请重新输入");
						} else {
							$("#errorMsg").text("用户名可用！");
						}
                    })
                });
			    //给验证码图片绑定单击事件
				$("#code_img").click(function () {
				    //在事件响应的function函数中有一个this对象，这个this对象是当前正在响应事件的dom对象
					//即此处的img标签，src属性是img标签的属性，表示图片路径，它可读、可写
					this.src="${bathPath}kaptcha.jpg";
                })

				// 给注册绑定单击事件
				$("#sub_btn").click(function () {
					//1 获取用户名输入框里的内容
					var usernameText = $("#username").val();
					//2 创建正则表达式对象
                     /*验证用户名：必须由字母，数字下划线组成，并且长度为5到12位
					 var usernamePatt = /^\w{5,12}$/;*/
					//验证用户名：最长不得超过7个汉字，或14个字节(数字，字母和下划线)
                    var usernamePatt =/^[\u4e00-\u9fa5]{1,7}$|^[\dA-Za-z_]{1,14}$/;
					//3 使用test方法验证
					if (!usernamePatt.test(usernameText)) {
						//4 提示用户结果
						$("#errorMsg").text("用户名不合法！");

						return false;
					}
					// 验证密码：必须由字母，数字下划线组成，并且长度为5到12位
					//1 获取用户名输入框里的内容
					var passwordText = $("#password").val();
					//2 创建正则表达式对象
					var passwordPatt = /^\w{5,12}$/;
					//3 使用test方法验证
					if (!passwordPatt.test(passwordText)) {
						//4 提示用户结果
						$("#errorMsg").text("密码不合法！");
						return false;
					}
					// 验证确认密码：和密码相同
					//1 获取确认密码内容
					var repwdText = $("#repwd").val();
					//2 和密码相比较
					if (repwdText != passwordText) {
						//3 提示用户
						$("#errorMsg").text("确认密码和密码不一致！");
						return false;
					}
					// 邮箱验证：xxxxx@xxx.com
					//1 获取邮箱里的内容
					var emailText = $("#email").val();
					//2 创建正则表达式对象
					var emailPatt = /^[a-z\d]+(\.[a-z\d]+)*@([\da-z](-[\da-z])?)+(\.{1,2}[a-z]+)+$/;
					//3 使用test方法验证是否合法
					if (!emailPatt.test(emailText)) {
						//4 提示用户
						$("#errorMsg").text("邮箱格式不合法！");
						return false;
					}
					// 验证码
					var codeText = $("#code").val();
					//去掉验证码前后空格
					// alert("去空格前：["+codeText+"]")
					codeText = $.trim(codeText);
					// alert("去空格后：["+codeText+"]")
					if (codeText == null || codeText == "") {
						//4 提示用户
						$("#errorMsg").text("验证码不能为空！");
						return false;
					}
					// 去掉错误信息
					$("#errorMsg").text("");
				});
			});
		</script>

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
					>欢迎注册</h2>

				</div>
				<hr class="col-12">
				<div class="col-lg-7 tm-contact-left">

					<div class="user_status_menu" style="height: 50px">
						<h3 style="margin-left: 60px;float: left;" href="pages/user/login.jsp">注册交点会员</h3>


						&nbsp;
						<em id="errorMsg"
							style="float: right;
    						       margin-left: 10px;

    						       color: red;">
							${ requestScope.msg }
						</em>
					</div>

					<form action="userServlet" method="post"
						  class="mb-5 ml-auto mr-0 tm-contact-form">
						<input type="hidden" name="action" value="regist" />

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

							</div>
						</div>
						<div class="form-group row mb-6">
							<label for="repwd" class="col-sm-3 col-form-label text-right tm-color-primary">确认密码</label>
							<div class="col-sm-9">
								<input type = "password" class="form-control mr-0 ml-auto"
									   autocomplete="off"
									   name="repwd"
									   id="repwd"
									   tabindex="1"
									   placeholder="确认密码"

								>

							</div>
						</div>
						<div class="form-group row mb-6">
							<label for="email" class="col-sm-3 col-form-label text-right tm-color-primary">电子邮件</label>
							<div class="col-sm-9">
								<input type = "text" class="form-control mr-0 ml-auto"
									   value="${requestScope.email}"
									   autocomplete="off"
									   name="email"
									   id="email"
									   tabindex="1"
									   placeholder="请输入邮箱地址"

								>

							</div>
						</div>
						<div class="form-group row mb-6">
							<label for="code" class="col-sm-3 col-form-label text-right tm-color-primary">验证码</label>
							<div class="col-sm-9" >
								<input type = "text" class="form-control mr-0 "
									   value="${requestScope.email}"
									   autocomplete="off"
									   name="code"
									   id="code"
									   tabindex="1"
									   style="width: 45%;
									   		  /*让两个标签处于同一行加float: left;*/
									   		  float: left;"
								>
								<img id="code_img" alt="" src="kaptcha.jpg"
									 style="float: right;
									        margin-right: 40px;
									        /*让两个标签处于同一行加float: left;*/
									        float: left;
									        margin-top: 10px;
									        margin-left: 20px;
									        width: 130px;
									        hight:100px;
											">
								<br>
							</div>
						</div>
						<div class="form-group row text-right">
							<div class="col-12">
								<button id="sub_btn" class="tm-btn tm-btn-primary tm-btn-small">注册</button>
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