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
            var items = $(".item");
            $(".item:eq(0)").click(function () {
                items.css("background", "white");
                $(".item:eq(0)").css("background", "#90138b");
                $(".title").text("纸本目录");
                $(".tab1-link_p").text("　　南京晓庄学院图书馆馆藏丰富，总藏书量近600多万册（含院系资料室），还收藏了 80 多个国家和地区 20\n" +
                    "多个语种的期刊，尤以物理、生物、地学、数学、东方学为特色，1949年以前的中文社会科学书刊收藏颇丰。");
                $(".wrap .down .right").fadeOut("fast");
                $(".wrap .down .right").fadeIn("fast")
            })
            $(".item:eq(1)").click(function () {
                items.css("background", "white");
                $(".item:eq(1)").css("background", "#90138b");
                $(".title").text("古籍目录");
                $(".tab1-link_p").text("　　我国古代目录学家留下的许多目录以及目录学专著，是一笔宝贵的财富，可以\n" +
                    "视为引导我们打开我国古代文化遗产宝库的一把金钥匙，是逐步了解、利用、掌握这一宝库不可缺少的向\n" +
                    "导。所以古人称目录学为读书治学的门径。\n");
                $(".wrap .down .right").fadeOut("fast");
                $(".wrap .down .right").fadeIn("fast")
            })
            $(".item:eq(2)").click(function () {
                items.css("background", "white");
                $(".item:eq(2)").css("background", "#90138b");
                $(".title").text("电子数据库");
                $(".tab1-link_p").text("　　电子数据库是通过在线系统供公众使用的，同时配有搜寻、检索、数据操作和模型的数据库。\n");
                $(".wrap .down .right").fadeOut("fast");
                $(".wrap .down .right").fadeIn("fast")
            })
            $(".item:eq(3)").click(function () {
                items.css("background", "white");
                $(".item:eq(3)").css("background", "#90138b");
                $(".title").text("中文资源发现");
                $(".tab1-link_p").text("　　超星发现以近十亿海量元数据为基础，利用数据仓储、资源整合、知识挖掘、数据分析、文献计量学模型等相关技术，较好地解决了复杂异构数据库群的集成整合、完成高效、精准、统一的学术资源搜索，进而通过分面聚类、引文分析、知识关联分析等实现高价值学术文献发现、纵横结合的深度知识挖掘、可视化的全方位知识关联。");
                $(".wrap .down .right").fadeOut("fast");
                $(".wrap .down .right").fadeIn("fast")
            })
            $(".item:eq(4)").click(function () {
                items.css("background", "white");
                $(".item:eq(4)").css("background", "#90138b");
                $(".title").text("外文资源发现");
                $(".tab1-link_p").text("　　覆盖全球7万多家图书出版社、2万家期刊出版社、20多万种学术期刊、 2000家开放获取平台、200种语言、超过5000家非英语出版社资源的全文资源，提供超过30亿文献，包含学术期刊论文、会议论文、图书、传记、评论、新闻等几十种类型的学术资源。");
                $(".wrap .down .right").fadeOut("fast");
                $(".wrap .down .right").fadeIn("fast")
            })
            $(".item:eq(5)").click(function () {
                items.css("background", "white");
                $(".item:eq(5)").css("background", "#90138b");
                $(".title").text("悦读经典");
                $(".tab1-link_p").text("　　大学肩负文化传承与发展的使命，阅读文化是大学文化内核之一。营造校园阅读文化和养成良好阅读习\n" +
                    "惯，关乎学生终身学习与发展。一所大学，不仅要传道授业解惑，更要以“立德树人”为根本，通过学校\n" +
                    "的文化积淀进行文化熏陶、文化育人，培养有品位有底蕴有气质的”读书人”。\n");
                $(".wrap .down .right").fadeOut("fast");
                $(".wrap .down .right").fadeIn("fast")
            })
            $(".item:eq(6)").click(function () {
                items.css("background", "white");
                $(".item:eq(6)").css("background", "#90138b");
                $(".title").text("百度学术");
                $(".tab1-link_p").text("　　致力于将资源检索技术和大数据挖掘分析能力贡献于学术研究，优化学术资源生态，引导学术价值创新，为海内外科研工\n" +
                    "作者提供最全面的学术资源检索和最好的科研服务体验。");
                $(".wrap .down .right").fadeOut("fast");
                $(".wrap .down .right").fadeIn("fast")
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
<body  style="background:url('/img/bg.jpg') no-repeat center;">
<div class="header">
    <%@include file="banner.jsp" %>
</div>
<br>
<div class="statue">
    <c:if test="${not empty username}">
        <a href="getMyInfo?path=manage" class="manager">${username}</a>　
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
                        <table width='266px' height='366px' border='0' cellspacing="0" style="text-align: center ">
                            <tr>
                                <td class="item">纸本目录</td>
                            </tr>
                            <tr>
                                <td class="item">古籍目录</td>
                            </tr>
                            <tr>
                                <td class="item">电子数据库</td>
                            </tr>
                            <tr>
                                <td class="item">中文资源发现</td>
                            </tr>
                            <tr>
                                <td class="item">外文资源发现</td>
                            </tr>
                            <tr>
                                <td class="item">悦读经典</td>
                            </tr>
                            <tr>
                                <td class="item">百度学术</td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td class="wrap down right">
                    <div style="margin-left: 40px"><br>
                        <div class="title" style="font-size: 40px">纸本目录</div><br>
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
<br>
<div class="footer">
    <%@include file="copyright.jsp" %>
</div>
</body>
</html>