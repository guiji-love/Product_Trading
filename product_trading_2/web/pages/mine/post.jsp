<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%-- 静态包含 base标签、css样式、js文件、标题 --%>
    <%@ include file="/pages/common/head.jsp"%>
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
                <li class="tm-nav-item active"><a href="pages/mine/post.jsp" class="tm-nav-link">
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
            <div class="row tm-row">
                <div class="col-lg-8 tm-post-col">
                    <div class="tm-post-full" >
                        <hr>
                        <div  style="border: 1px solid white">
                            <img src="static/img/默认头像.jpg"
                                 alt="Image"
                                 class="img-fluid"
                                 style="width:100px;
                                        height:100px;
                                        border-radius:50%;
                                        float: left;
                                        margin-top: 20px;
                                        margin-left: 20px;
                                        margin-right: 20px;
                                        ">
                            <h2 class="pt-2 tm-color-primary tm-post-title"
                                style="font-size: 50px;
                                        margin-top: 25px"
                                >${sessionScope.user.username}</h2>
                            <p class="tm-mb-40"></p>
                            <div class="mine_trade_css">
                                <table>
                                    <tr>
                                        <td>10</td>
                                        <td>159</td>
                                        <td>5</td>
                                        <td>0</td>
                                        <td>3</td>
                                    </tr>
                                    <tr>
                                        <td>收藏</td>
                                        <td>历史浏览</td>
                                        <td>关注</td>
                                        <td>粉丝</td>
                                        <td>帖子</td>
                                    </tr>
                                </table>
                            </div>
                            <%--<span class="d-block text-right tm-color-primary">Creative . Design . Business</span>--%>
                        </div>

                        <hr>
                        <!-- Comments -->
                        <div >
                            <h2 class="tm-color-primary tm-post-title">我的交易</h2>
                            <%--<hr class="tm-hr-primary tm-mb-45">--%>
                            <br>
                            <ul class="trade-social-links" >
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
                            <div class="trade_status_menu" >
                                <a href="client/productServlet?action=releasePage">我发布的</a>
                                <a href="pages/user/order.jsp">我卖出的</a>
                                <a href="pages/order/order.jsp">我的订单</a>
                                <a href="pages/order/order.jsp">我可转卖</a>
                            </div>
                            <hr class="tm-hr-primary tm-mb-45">
                            <div class="tm-comment tm-mb-45">
                                <figure class="tm-comment-figure">
                                    <img src="static/img/comment-1.jpg" alt="Image" class="mb-2 rounded-circle img-thumbnail">
                                    <figcaption class="tm-color-primary text-center">团队</figcaption>
                                </figure>
                                <div>
                                    <p>
                                        本项目由交点团队研发，主要制片人张弛、易龙、徐志强、杨卓。项目的全部框架均已实现。还有一些小问题需要后期的完善！
                                    </p>
                                    <div class="d-flex justify-content-between">
                                        <a href="#" class="tm-color-primary">JOIN US</a>
                                        <span class="tm-color-primary">June 6, 2022</span>
                                    </div>                                                 
                                </div>                                
                            </div>
                            <div class="tm-comment-reply tm-mb-45">
                                <hr>
                                <div class="tm-comment">
                                    <figure class="tm-comment-figure">
                                        <img src="static/img/comment-2.jpg" alt="Image" class="mb-2 rounded-circle img-thumbnail">
                                        <figcaption class="tm-color-primary text-center">产品理念</figcaption>
                                    </figure>
                                    <p>
                                        本系统是基于Web的校园二手商品交易系统，为在校学生提供一个供需平台。
                                        <br>
                                        我们的宗旨是全心全意服务学生、方便学生。诚待在校学生积极参与，帮助自己，帮助他人。
                                    </p>

                                </div>
                                <span class="d-block text-right tm-color-primary">June 21, 2020</span>
                            </div>
                        </div>
                    </div>
                </div>
                <aside class="col-lg-4 tm-aside-col" >
                    <div class="tm-post-sidebar">
                        <hr class="mb-3 tm-hr-primary">
                        <h2 class="mb-4 tm-post-title tm-color-primary">互动权益</h2>
                        <br>
                        <ul class=" pl-5 tm-category-list mine_icon">
                            <li ><img src="static/img/icon/公约.png"
                                      alt="Image"
                                      class="img-fluid"
                            >
                                <hr style="margin: 10px;visibility:hidden;">
                                <a href="#" class="mine_a">公约公告</a></li>
                            <li><img src="static/img/icon/客服.png"
                                     alt="Image"
                                     class="img-fluid"
                            >
                                <hr style="margin: 10px;visibility:hidden;">
                                <a href="#" class="mine_a">帮助与客服</a></li>
                            <li> <img src="static/img/icon/安全中心.png"
                                      alt="Image"
                                      class="img-fluid"
                            >
                                <hr style="margin: 10px;visibility:hidden;">
                                <a href="#" class="mine_a">安全中心</a></li>
                            <li >
                                <img src="static/img/icon/奖券.png"
                                     alt="Image"
                                     class="img-fluid"
                                     >
                                <hr style="margin: 10px;visibility:hidden;">
                                <a href="#" class="mine_a">红包奖券</a></li>
                            <li><img src="static/img/icon/family.png"
                                     alt="Image"
                                     class="img-fluid"
                            >
                                <hr style="margin: 10px;visibility:hidden;">
                                <a href="#" class="mine_a">交点Family</a></li>
                        </ul>

                        <hr class="mb-3 tm-hr-primary" style="margin-top: 10px;">
                        <h2 class="tm-mb-40 tm-post-title tm-color-primary">精选推荐</h2>
                        <a href="#" class="d-block tm-mb-40">
                            <figure>
                                <img src="static/img/img-02.jpg" alt="Image" class="mb-3 img-fluid">
                                <figcaption class="tm-color-primary">Duis mollis diam nec ex viverra scelerisque a sit</figcaption>
                            </figure>
                        </a>
                        <a href="#" class="d-block tm-mb-40">
                            <figure>
                                <img src="static/img/img-05.jpg" alt="Image" class="mb-3 img-fluid">
                                <figcaption class="tm-color-primary">Integer quis lectus eget justo ullamcorper ullamcorper</figcaption>
                            </figure>
                        </a>
                        <a href="#" class="d-block tm-mb-40">
                            <figure>
                                <img src="static/img/img-06.jpg" alt="Image" class="mb-3 img-fluid">
                                <figcaption class="tm-color-primary">Nam lobortis nunc sed faucibus commodo</figcaption>
                            </figure>
                        </a>
                    </div>                    
                </aside>
            </div>
            <%--静态包含页脚内容--%>
            <%@include file="/pages/common/footer.jsp"%>

        </main>
    </div>

</body>
</html>