<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">


    <%-- 静态包含 base标签、css样式、js文件 --%>
    <%@ include file="/pages/common/head.jsp"%>

    <script type="text/javascript">
        $(function () {
            //给加入购物车按钮绑定单击事件
            $("button.addToCart").click(function () {
                //先将this对象代表的dom对象转换为jquery对象，在用jquery对象的attr方法获取属性值
                var productId=$(this).attr("productId");
                //location.href = "http://localhost:8080/guiji_book/cartServlet?action=addItem&id="+productId;
                //发ajax请求，添加商品到购物车
                $.getJSON("http://localhost:8080/product_trading_2/cartServlet","action=ajaxAddItem&id="+productId,function (data) {
                    $(".cartTotalCount").html("购物车(<span style=\"color: red\" >"+data.totalCount+"</span>)");
                    $(".addCartLastName").html("您刚刚将<span style=\"color: red\" id=\"cartLastName\">"
                        +data.lastName+"</span>加入到了购物车中");
                })
            })
        })
    </script>
<!--

TemplateMo 553 Xtra Blog

https://templatemo.com/tm-553-xtra-blog

-->
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
                <li class="tm-nav-item active" id="test_1"><a href="index.jsp" class="tm-nav-link">
                    <i class="fas fa-home"></i>
                    猜你喜欢
                </a></li>
                <li class="tm-nav-item"><a href="pages/mine/contact.jsp" class="tm-nav-link">
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
            <%--静态包含用户状态栏--%>
            <%@ include file="/pages/common/user_status.jsp"%>
            <hr>
            <!-- Search form -->
            <div style="height: 80px;">
                <div class="col-12">
                    <form method="GET" class="form-inline tm-mb-80 tm-search-form" action="client/productServlet">
                        <input type="hidden" name="action" value="pageByFuzzyQuery">
                        <input class="form-control tm-search-input" name="fuzzyQueryName" value="${param.fuzzyQueryName}" type="text" placeholder="搜索宝贝" aria-label="Search">
                        <button class="mb-2 tm-btn tm-btn-primary"  type="submit">
                            <i class="fas fa-search tm-search-icon" aria-hidden="true"></i>
                        </button>                                
                    </form>
                </div>                
            </div>
            <div >
                <%--静态包含用户状态栏--%>
                <%@ include file="/pages/common/addCart.jsp"%>
            </div>


            <div class="row tm-row">
                <c:forEach items="${requestScope.page.items}" var="product">
                <article class="col-12 col-md-6 tm-post" >
                    <hr class="tm-hr-primary">
                    <a href="#" class="effect-lily tm-post-link tm-pt-60">
                        <div class="tm-post-link-inner">
                            <img src="${product.imgPath}" alt="Image" class="img-fluid">
                        </div>
                        <span class="position-absolute tm-new-badge">New</span>
                        <h2 class="tm-pt-30 tm-color-primary tm-post-title">${product.name}</h2>
                    </a>                    
                    <p class="tm-pt-30">
                            ${product.describe}
                    </p>
                    <div class="d-flex justify-content-between tm-pt-45">
                        <span class="tm-color-primary">用户：${product.username}</span>
                        <span class="tm-color-primary">发布于：${product.releaseTime}</span>
                    </div>
                    <hr>
                    <div class="d-flex justify-content-between" >
                        <span><button productId="${product.id}" class="mb-2 tm-btn tm-btn-primary addToCart">加入购物车</button></span>
                        <span class="tm-color-primary">价格：${product.price}</span>

                    </div>
                </article>
                </c:forEach>
            </div>



            <%--静态包含分页条--%>
            <%@include file="/pages/common/page_nav.jsp"%>
            <%--静态包含页脚内容--%>
            <%@include file="/pages/common/footer.jsp"%>

        </main>
    </div>
    <%--<script src="static/js/jquery.min.js"></script>--%>

</body>
</html>