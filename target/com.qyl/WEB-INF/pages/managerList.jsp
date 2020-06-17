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
    <link rel="stylesheet" type="text/css" href="/css/infodisplay.css">
    <link rel="stylesheet" type="text/css" href="/css/index.css">
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
    <script>
        $(function () {
            time();
            loadSpan();
        })
        $(document).ready(function () {
            $(".login").click(function () {
                location.href = "/jsp/login.jsp";
            })
        })

        function loadSpan() {
            $("#delViolate").css("display","none");
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
        <a href="getMyInfo?path=manage" class="manager">${username}</a>&nbsp;,&nbsp;
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
        <table style="margin: auto; border-collapse: collapse; text-align: center ;" border="1px" ; cellspacing="20px"
               cellpadding="10px">
            <tr>
                <th>序号</th>
                <th>账号</th>
                <th>密码</th>
                <th>姓名</th>
                <c:if test="${empty null}">
                    <th>修改</th>
                    <th>删除</th>
                </c:if>
            </tr>
            <c:forEach items="${info.list}" var="manager" varStatus="vs">
                <tr>
                    <td>${vs.index+1}</td>
                    <td>${manager.username}</td>
                    <td>${manager.password}</td>
                    <td>${manager.name}</td>
                    <c:if test="${empty null}">
                        <td><a href="getManagerByUsername?pageNum=${info.pageNum}&username=${manager.username}">修改</a>
                        </td>
                        <td>
                            <a href="deleteManagerByUsername?pageNum=${info.pageNum}&username=${manager.username}">删除</a>
                        </td>
                    </c:if>
                </tr>
            </c:forEach>
            <tr>
                <td colspan="9">
                    <a href="fuzzyQueryAllManagers?pageNum=1">首页</a><a
                        href="fuzzyQueryAllManagers?pageNum=${info.prePage}">上一页</a>
                    <c:forEach items="${nums}" var="num">

                        <a href="fuzzyQueryAllManagers?pageNum=${num}"
                           style=" text-decoration:${num==info.pageNum?'none':'underline'};outline: none"
                           contenteditable="${num==info.pageNum}">${num}</a>
                    </c:forEach>
                    <a
                            href="fuzzyQueryAllManagers?pageNum=${info.nextPage}">下一页</a><a
                        href="fuzzyQueryAllManagers?pageNum=${info.pages}">末页</a>
                </td>
            </tr>
        </table>

    </div>
</div>

<div class="footer">
    <%@include file="/jsp/copyright.jsp" %>
</div>
</body>
</html>
