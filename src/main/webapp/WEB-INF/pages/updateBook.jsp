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
        <div class="body content" style="margin: auto;float:none">
            <form action="${book.id!=null?'updateBook':'saveBook'}">
                <c:if test="${book.id!=null}">id:${book.id}</c:if>
                <c:if test="${book.id==null}"/>
                <input type="hidden" name="id" id="id" value="${book.id}"/>
                <br>
                <input type="hidden" name="pageNum" id="pageNum" value="${pageNum}"/>
                <br>
                书名:<input type="text" name="bookName" id="bookName" value="${book.bookName}"/>
                <br>

                <c:if test="${book.id!=null}">
                    库藏:${book.stock}
                    <input type="hidden" name="stock" id="stock" value="${book.stock}"/>
                </c:if>
                <c:if test="${book.id==null}">
                    <input type="hidden" name="stock" id="stock" value="${book.stock+1}"/>
                </c:if>

                <br>
                作者:<input type="text" name="author" id="author" value="${book.author}"/>
                <br>
                书码:<input type="text" name="bookEncrypt" id="bookEncrypt" value="${book.bookEncrypt}"/>
                <br>
                出版商:<input type="text" name="pubName" id="pubName" value="${book.pubName}"/>
                <br>
                书类:
                <select name="typeName">
                    <c:forEach items="${bookTypes}" var="bookType">
                        <c:if test="${book.typeName==bookType.typeName}">
                            <option value="${bookType.typeName}" selected="selected">${bookType.typeName}</option>
                        </c:if>
                        <c:if test="${book.typeName!=bookType.typeName}">
                            <option value="${bookType.typeName}">${bookType.typeName}</option>
                        </c:if>
                    </c:forEach>
                </select>
                <br>
                <input type="submit" value="提交">
            </form>
        </div>
    </div>
</div>

<div class="footer">
    <%@include file="/jsp/copyright.jsp" %>
</div>
</body>
</html>
