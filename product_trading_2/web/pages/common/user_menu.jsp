<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link href="static/css/templatemo-xtra-blog.css" rel="stylesheet">
<script type="text/javascript">
    $(function () {
        $("#loginOut").click(function () {
            return confirm("你确定要退出登录吗")
        });
    })
</script>

<%--<div>
    <span>欢迎<span class="um_span">${sessionScope.user.username}</span>光临轨迹书城</span>
    <a href="pages/order/order.jsp">我的订单</a>
    <a href="index.jsp">返回首页</a>
    <a id="loginOut" href="userServlet?action=logOut">退出登录</a>&nbsp;&nbsp;
</div>--%>
<title>交点</title>


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