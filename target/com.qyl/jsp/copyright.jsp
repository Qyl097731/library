<%@page contentType="text/html;charset=UTF-8" language="java" isErrorPage="false" %>
<html>
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
<script>
    //获取当前日期

    $(function () {
        time();
    })

    function time() {
        const now = new Date();// 创建Date对象
        const year = now.getFullYear();// 获取年份
        const month = now.getMonth() + 1;// 获取月份
        const day = now.getDate();// 获取日期
        const hour = now.getHours();// 获取小时
        const min = now.getMinutes();// 获取分钟
        const sec = now.getSeconds();// 获取秒
        document.getElementById("clock").innerHTML = "当前时间：" + year + "/" + month + "/" + day + " " + hour + ":" + min + ":" + sec;// 显示当前时间
    }

    // 每隔1秒调用一次time(clock)实时显示系统时间
    window.onload = function () {
        window.setInterval("time()", 1000);// 实时获取并显示系统时间
    }
</script>

<body>
<p>&nbsp;咨询邮箱:553579048@qq.com&nbsp;All Copyright &copy; 2020 南京晓庄学院</p>
<div id="clock"></div>
</body>
</html>