$(function () {
    $(".navbar-toggler").on("click", function (e) {
        $(".tm-header").toggleClass("show");
        e.stopPropagation();
    });

    $("html").click(function (e) {
        var header = document.getElementById("tm-header");

        if (!header.contains(e.target)) {
            $(".tm-header").removeClass("show");
        }
    });

    $("#tm-nav .nav-link").click(function (e) {
        $(".tm-header").removeClass("show");
    });


/*    $("#test li").click(function () {
        $(this).siblings('li').removeClass('active');  // 删除其他兄弟元素的样式
        $(this).addClass('active');                            // 添加当前元素的样式
    });*/
    $("#test  li").on("click", function (e) {
        //alert('我是一个li');
        $(this).toggleClass("active");
        e.stopPropagation();
    });


});