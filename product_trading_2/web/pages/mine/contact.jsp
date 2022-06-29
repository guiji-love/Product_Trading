<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">


    <%-- 静态包含 base标签、css样式、js文件、标题 --%>
    <%@ include file="/pages/common/head.jsp"%>


    <script type="text/javascript">
        /*---------- 动态获取系统当前日期方法start ------*/
        /*setInterval(
            "document.getElementById('releaseTime').value=new Date().toLocaleString()+'  星期'+'日一二三四五六'.charAt(new Date().getDay());",
            1000);*/
        setInterval(
            "document.getElementById('releaseTime').value=new Date().toLocaleString();",
            1000);

        /*---------- 动态获取系统当前日期方法end ------*/
    </script>



</head>
<body>
<header class="tm-header" id="tm-header">
    <div class="tm-header-wrapper">
        <button class="navbar-toggler" type="button" aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
        </button>
        <div class="tm-site-header">
            <div class="mb-3 mx-auto tm-site-logo"><i class="fas fa-times fa-2x"></i></div>
            <h1 class="text-center">交点</h1>
        </div>
        <nav class="tm-nav" id="tm-nav">
            <ul id="test">
                <li class="tm-nav-item" id="test_1"><a href="index.jsp" class="tm-nav-link">
                    <i class="fas fa-home"></i>
                    猜你喜欢
                </a></li>
                <li class="tm-nav-item active"><a href="pages/mine/contact.jsp" class="tm-nav-link">
                    <i class="fas fa-pen"></i>
                    发布闲置
                </a></li>
                <li class="tm-nav-item"><a href="pages/about.jsp" class="tm-nav-link">
                    <i class="far fa-comments"></i>
                    消息
                </a></li>
                <li class="tm-nav-item"><a href="pages/mine/post.jsp" class="tm-nav-link">
                    <i class="fas fa-users"></i>
                    我的
                </a></li>
            </ul>
        </nav>
        <div class="tm-mb-65">
            <a rel="nofollow" href="https://fb.com/templatemo" class="tm-social-link">
                <i class="fab fa-faceproduct tm-social-icon"></i>
            </a>
            <a href="https://twitter.com" class="tm-social-link">
                <i class="fab fa-twitter tm-social-icon"></i>
            </a>
            <a href="https://instagram.com" class="tm-social-link">
                <i class="fab fa-instagram tm-social-icon"></i>
            </a>
            <a href="https://linkedin.com" class="tm-social-link">
                <i class="fab fa-linkedin tm-social-icon"></i>
            </a>
        </div>
        <p class="tm-mb-80 pr-5 text-white">
            交点 is a multi-purpose HTML template from TemplateMo website. Left side is a sticky menu bar. Right side content will scroll up and down.
        </p>
    </div>

</header>

    <div class="container-fluid">
        <main class="tm-main">


            <div class="row tm-row tm-mb-120" >
                <div class="col-12" >
                    <h2 class="tm-color-primary tm-post-title tm-mb-60"><a href="index.jsp">取消</a></h2>
                </div>
                <hr class="col-12">
                <hr class="tm-hr-primary">
                <div class="col-lg-7 tm-contact-left">
                    <form action="http://localhost:8080/product_trading_2/productServlet" method="get"
                          class="mb-5 ml-auto mr-0 tm-contact-form">
                        <%--发生文件使用该编码enctype="multipart/form-data"--%>
                        <%--加hidden类型的input标签,为了给后端传值--%>
                        <input type="hidden" name="pageNo" value="${param.pageNo}">
                        <input type="hidden" name="action" value="${ empty param.id ? "add" : "update" }" />
                        <input type="hidden" name="id" value="${ requestScope.product.id }" />
                        <input type="hidden" name="username" value="${sessionScope.user.username}" />
                        <input type="hidden" name = "releaseTime" id="releaseTime" value="${requestScope.product.releaseTime}">
                        <%--<input type="hidden" name="releaseTime" id="now_time" value="" />--%>

                        <div class="form-group row mb-4">
                            <label for="name" class="col-sm-3 col-form-label text-right tm-color-primary">Name</label>
                            <div class="col-sm-9">
                                <input class="form-control mr-0 ml-auto"
                                       name="name" value="${requestScope.product.name}"
                                       id="name" type="text" required>
                            </div>

                        </div>
                        <div class="form-group row mb-5">
                            <label for="message" class="col-sm-3 col-form-label text-right tm-color-primary">Describe</label>
                            <div class="col-sm-9">
                                <textarea class="form-control mr-0 ml-auto"
                                          name="describe" value="${requestScope.product.describe}"
                                          id="message" rows="8" required></textarea>
                            </div>
                        </div>

                        <%--<div class="form-group row mb-6">
                            <label for="releaseTime" class="col-sm-3 col-form-label text-right tm-color-primary">当前时间</label>

                            <div class="col-sm-9">
                                <input type = "text" name = "releaseTime" id="releaseTime" class="form-control mr-0 ml-auto"
                                value="${requestScope.product.releaseTime}">
                                <br>
                            </div>
                        </div>--%>
                        <%--<div class="form-group row mb-6">
                            <label for="pic" class="col-sm-3 col-form-label text-right tm-color-primary">上传图片</label>
                            <div class="col-sm-9">
                                <input type="file"
                                       name="${param.pageNo}" value="${requestScope.product.imgPath}"
                                       id="pic"/><br>
                            </div>
                        </div>
                            --%>

                        <div class="form-group row mb-4">
                            <label for="price" class="col-sm-3 col-form-label text-right tm-color-primary">Price</label>
                            <div class="col-sm-9">
                                <input class="form-control mr-0 ml-auto"
                                       name="price" value="${requestScope.product.price}"
                                       id="price" type="text" required>
                            </div>
                        </div>

                        <div class="form-group row text-right">
                            <div class="col-12">
                                <button class="tm-btn tm-btn-primary tm-btn-small">提交</button>
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