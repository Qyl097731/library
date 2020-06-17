<%@page contentType="text/html;charset=UTF-8" language="java" isErrorPage="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort() + path + "/";
%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>图书馆主界面</title>
    <script type="text/javascript">
        $(function () {
            time();
        })
        $(document).ready(function () {
            $("#item1").mouseover(function () {
                $("#item1").css("background", "#90138b");
            })
            $("#item1").mouseout(function () {
                $("#item1").css("background", "white");
            })
            $("#item2").mouseover(function () {
                $("#item2").css("background", "#90138b");
            })
            $("#item2").mouseout(function () {
                $("#item2").css("background", "white");
            })
            $("#item3").mouseover(function () {
                $("#item3").css("background", "#90138b");
            })
            $("#item3").mouseout(function () {
                $("#item3").css("background", "white");
            })
            $("#item4").mouseover(function () {
                $("#item4").css("background", "#90138b");
            })
            $("#item4").mouseout(function () {
                $("#item4").css("background", "white");
            })
            $("#item5").mouseover(function () {
                $("#item5").css("background", "#90138b");
            })
            $("#item5").mouseout(function () {
                $("#item5").css("background", "white");
            })
            $("#item6").mouseover(function () {
                $("#item6").css("background", "#90138b");
            })
            $("#item6").mouseout(function () {
                $("#item6").css("background", "white");
            })
            $("#item7").mouseover(function () {
                $("#item7").css("background", "#90138b");
            })
            $("#item7").mouseout(function () {
                $("#item7 ").css("background", "white");
            })
            $(".part1-btn").click(function () {
                if ($(".select").val() == 0) {
                    location.href = "fuzzyQueryAllBooks?path=searchPage&bookName=" + $(".part1-ss").val();
                } else if ($(".select").val() == 1) {
                    location.href = "fuzzyQueryAllBooks?path=searchPage&bookEncrypt=" + $(".part1-ss").val();
                } else if ($(".select").val() == 2) {
                    location.href = "fuzzyQueryAllBooks?path=searchPage&pubName=" + $(".part1-ss").val();
                } else {
                    location.href = "fuzzyQueryAllBooks?path=searchPage&author=" + $(".part1-ss").val();
                }
            })
            $(".login").click(function () {
                location.href = "/jsp/login.jsp";
            })
        })
    </script>
    <link rel="stylesheet" type="text/css" href="/css/index.css">
    <link rel="stylesheet" type="text/css" href="/css/login.css">
</head>
<body background="/img/bg.jpg">
<div class="header">
    <%@include file="banner.jsp" %>
</div>
<br>
<div class="statue">
    <c:if test="${not empty username}">
        <a href="getMyInfo?path=manage" class="manager">${username}</a>&nbsp;,&nbsp;
        <a href="logOut">退出</a>
    </c:if>
    <c:if test="${empty username}">
        <button class="login">登录</button>
    </c:if>
</div>
<br><br>

<div class="wrap">
    <div class="wrap navigation">
        <%@include file="navigation.jsp" %>
    </div>
    <div class="wrap down">
        <table width='1000' height='266' border='0' cellspacing="0">
            <tr>
                <td>
                    <div class="wrap down left">
                        <table width='266px' height='366px' border='0' cellspacing="0" style="text-align: center">
                            <tr>
                                <td id="item1">纸本目录</td>
                            </tr>
                            <tr>
                                <td id="item2">古籍目录</td>
                            </tr>
                            <tr>
                                <td id="item3">电子数据库</td>
                            </tr>
                            <tr>
                                <td id="item4">中文资源发现</td>
                            </tr>
                            <tr>
                                <td id="item5">外文资源发现</td>
                            </tr>
                            <tr>
                                <td id="item6">悦读经典</td>
                            </tr>
                            <tr>
                                <td id="item7">百度学术</td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td class="wrap down right">
                    <div style="display: block">
                        <div class="title">纸本目录</div>
                        <div class="search">
                            <select class="select" style="outline: none">
                                <option value="0" selected="selected">全部检索</option>
                                <option value="0">书名</option>
                                <option value="1">书码</option>
                                <option value="2">出版社</option>
                                <option value="3">作者</option>
                            </select>
                            <input type="text" class="part1-ss" name="keyword" placeholder="请输入检索的名称或作者">
                            <input class="part1-btn" type="submit" alt="搜索" value="">
                        </div>
                        <div class="tab1-link_p">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;南京晓庄学院图书馆馆藏丰富，总藏书量近600多万册（含院系资料室），还收藏了 80 多个国家和地区 20
                            多个语种的期刊，尤以物理、生物、地学、数学、东方学为特色，1949年以前的中文社会科学书刊收藏颇丰。
                        </div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</div>
<div style="height: 30px"></div>
<div class="introduction">
    <p>
        图书馆资源丰富，学科覆盖面较广，馆藏图书总量（含资料室）约120万册，
        其中部分古文献、近现代主要大报及清末以来各个时期的中小学课本收藏在
        同类学校中颇具特色和规模；拥有清末民初中小学教材书目数据库、古籍书
        目数据库、陶行知研究资料中心文献馆等特色馆藏。图书馆订有中文期刊19
        51种，外文期刊118种，电子图书56.5万余种，中外文电子期刊约154.67万
        篇/种，国内外网络版学术资源数据库16个。
  </p>
</div>
<div class="footer">
    <%@include file="copyright.jsp" %>
</div>
</body>
</html>