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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>个人信息</title>
    <link rel="stylesheet" type="text/css" href="/css/infoDisplay.css">
    <link rel="stylesheet" type="text/css" href="/css/index.css">
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
    <script>
        $(function () {
            time();
            loadSpan();
        })

        $(document).ready(function () {
            $(".login").click(function () {
                location.href = "../../jsp/login.jsp";
            })
            $(".submit:eq(0)").click(function () {
                var id = $(".bookId").val();
                $.ajax({
                    url: "getBookInfo",
                    data: {"id": id},
                    type: "POST",
                    success: function (data) {
                        if (data == null || data == "") {
                            $(".wrongInfo").text("没有这本书！");
                            $(".wrongInfo").css("color", "red");
                            $(".bookInfo").css("display", "none");
                        } else if (data.stock == 1) {
                            $(".wrongInfo").text("您未借过这本书噢！");
                            $(".wrongInfo").css("color", "red");
                            $(".bookInfo").css("display", "none");
                        } else {
                            $(".id:eq(0)").text("序号:" + data.id);
                            $(".bookName").text("书名:" + data.bookName);
                            $(".author").text("作者:" + data.author);
                            $(".bookEncrypt").text("书码:" + data.bookEncrypt);
                            $(".pubName").text("出版商:" + data.pubName);
                            $(".typeName").text("书类:" + data.typeName);
                            $("#formId").prop("value", data.id);
                            $("#bookName").prop("value", data.bookName);
                            $("#author").prop("value", data.author)
                            $("#bookEncrypt").prop("value", data.bookEncrypt)
                            $("#pubName").prop("value", data.pubName)
                            $("#stock").prop("value", 1);
                            $("#typeName").prop("value", data.typeName);
                            $(".line").show();
                            $(".bookInfo").css("display", "block");
                        }
                        $(".body .content").css("display", "block");
                    }
                })
                return false;
            })
            $(".submit:eq(1)").click(function () {
                var id = $("#formId").val();
                var bookName = $("#bookName").val();
                var author = $("#author").val();
                var bookEncrypt = $("#bookEncrypt").val();
                var stock = $("#stock").val();
                var pubName = $("#pubName").val();
                var typeName = $("#typeName").val();
                var ifBorrow = $("#ifBorrow").val();
                var jsonData={ "id": id,
                    "bookName": bookName,
                    "author": author,
                    "stock": stock,
                    "bookEncrypt": bookEncrypt,
                    "pubName": pubName,
                    "typeName": typeName,
                    "ifBorrow":ifBorrow}
                $.ajax({
                    url: "returnBook",
                    data: jsonData,
                    type: "POST",
                    success: function () {
                        $(".body .content").css("display", "none");
                        $(".line").hide();
                        alert("还书成功");

                    }
                })
                return false;
            })
        })


        function loadSpan() {
            $("#delViolate").css("display", "none");
            if (${authority==1}) {
                $("#updateManager").css("display", "none");
                $("#showManager").css("display", "none");
                $("#updateBook").css("display", "none");
                $("#addReaders").css("display", "none");
                $("#updateReader").css("display", "none");
                $("#batchInsertBooks").css("display", "none");
                $("#delViolate").css("display", "none");
                $("#showBorrowLog").css("display", "none");
                $("#addBook").css("display", "none");
                $("#addReader").css("display", "none");
                $("#updateReader").css("display", "none");
            } else if (${authority==-1}) {
                $("#updateManager").css("display", "none");
                $("#showManager").css("display", "none");
                $("#borrowBook").css("display", "none");
                $("#showMyBorrow").css("display", "none");
                $("#returnIndex").css("display", "none");
                $("#returnBook").css("display", "none");
            }
        }
    </script>
</head>
<body>
<div class="infodisplay_banner">
    <%@include file="/jsp/banner.jsp" %>
</div>

<div class="statue">
    <c:if test="${not empty username}">
        <a href="getMyInfo?path=manage" class="manager">${username}</a>&nbsp;&nbsp;
        <a href="logOut">退出</a>
    </c:if>
    <c:if test="${empty username}">
        <button class="login">登录</button>
    </c:if>
</div>
<div class="body">
    <div class="body authority">
        <ul>
            <span id="updateManager"><li><a href="fuzzyQueryAllManagers">修改管理员信息</a></li></span>
            <span id="showManager"><li><a href="toPageUpdateManager">管理员</a></li></span>
            <span id="updateBook"><li><a href="fuzzyQueryAllBooks">修改图书信息</a></li></span>
            <span id="addReader"><li><a href="toPageUpdateReader">添加用户</a></li></span>
            <span id="addBook"><li><a href="toPageUpdateBook">增加图书</a></li></span>
            <span id="updateReader"><li><a href="updateReader">修改用户信息</a></li></span>
            <span id="batchInsertBooks"><li><a href="insertBooksBatch">批量入库</a></li></span>
            <span id="delViolate"><li><a href="dealViolate">处理违规</a></li></span>
            <span id="showBorrowLog"><li><a href="fuzzyQueryAllBorrowLog">查询借阅日志</a></li></span>
            <span id="updateMyInfo"><li><a href="getMyInfo">修改个人信息</a></li></span>
            <span id="borrowBook"><li><a href="fuzzyQueryAllBooks?path=searchPage">借阅书籍</a></li></span>
            <span id="returnBook"><li><a href="toPageReturnBook">归还书籍</a></li></span>
            <span id="showMyBorrow"><li><a href="getLogByUsername">我的借阅记录</a></li></span>
            <span id="returnIndex"><li><a href="/jsp/index.jsp">返回首页</a></li></span>
        </ul>
    </div>
    <div class="body result">
        <div class="inInput" style="font-size: 20px;letter-spacing: 1px;line-height: 40px;margin: 10px 20px;">
            要归还的书籍id :
            <form class="searchFrom" action="">
                <input type="text" name="bookId" class="bookId">
                <input type="submit" name="submit" class="submit" style="margin-left: 505px;height: 30px;">
            </form>
        </div>
        <div style="border-top: dashed 1px #666666;width:400px ;font-size: 25px;line-height: 32px;margin-left:400px " class="line" hidden>图书信息</div>
        <div class=" body content" style="margin: auto;float:none;display: none ;font-size: 20px;line-height: 32px;">
                <form action="returnBook" method="post">
                    <div class="wrongInfo"></div>
                    <div class="bookInfo" style="display: none">
                        <span class="id"></span><br>
                        <span class="bookName"></span><br>
                        <span class="author"></span><br>
                        <span class="bookEncrypt"></span><br>
                        <span class="pubName"></span><br>
                        <span class="typeName" ></span><br>
                        <input type="hidden" name="id" id="formId" value=""/>
                        <input type="hidden" name="bookName" id="bookName" value=""/>
                        <input type="hidden" name="author" id="author" value=""/>
                        <input type="hidden" name="bookEncrypt" id="bookEncrypt" value=""/>
                        <input type="hidden" name="pubName" id="pubName" value=""/>
                        <input type="hidden" name="stock" id="stock" value=""/>
                        <input type="hidden" name="typeName" id="typeName" value=""/>
                        <input type="hidden" name="ifBorrow" id="ifBorrow" value="0">
                        <input type="submit" value="确定" class="submit"style="margin-left: 525px;height: 30px;background:darkorange">
                    </div>
                </form>
        </div>
    </div>
</div>

<div class="footer">
    <%@include file="/jsp/copyright.jsp" %>
</div>
</body>
</html>
