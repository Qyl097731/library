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
            $("#borrowBtn").click(function () {
                if(${empty username}){
                    alert("请登录")
                    location.href = "/jsp/login.jsp";
                    return false;
                }else{
                    return true;
                }
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
    <div class="body content" style="margin: auto;float:none">
        <form action="fuzzyQueryAllBooks?path=searchPage" method="post">
            <br>
            &nbsp;&nbsp;&nbsp;&nbsp;书名：<input type="text" name="bookName" id="bookName"/>
            &nbsp;&nbsp;&nbsp;&nbsp;书码：<input type="text" name="bookEncrypt" id="bookEncrypt"/>
            <br><br>
            出版社：<input type="text" name="pubName" id="pubName"/>&nbsp;&nbsp;&nbsp;&nbsp;作者：<input type="text"
                                                                                                  name="author"
                                                                                                  id="author"/>
            <br> <br>
            &nbsp;&nbsp;&nbsp;&nbsp;分类：
            <select name="typeName">
                <c:forEach items="${bookTypes}" var="bookType">
                    <option value="${bookType.typeName}">${bookType.typeName}</option>
                </c:forEach>
            </select>
            <input type="submit" name="submit" value="查询图书信息" class="submit"/>
        </form>
        <div class="body result" style="margin: auto;float:none">
            <table style=" border-collapse: collapse; text-align: center ;" border="1px" ; cellspacing="20px"
                   cellpadding="10px">
                <tr>
                    <th>序号</th>
                    <th>书名</th>
                    <th>在架馆藏</th>
                    <th>作者</th>
                    <th>编码</th>
                    <th>出版商</th>
                    <th>类别</th>
                    <th>显示详情</th>

                </tr>
                <c:forEach items="${info.list}" var="book" varStatus="vs">
                    <tr>
                        <td>${vs.index+1}</td>
                        <td>${book.bookName}</td>
                        <td>${book.stock}</td>
                        <td>${book.author}</td>
                        <td>${book.bookEncrypt}</td>
                        <td>${book.pubName}</td>
                        <td>${book.typeName}</td>
                        <td><a style="text-decoration: none;color: ${book.stock<=0?'black':'mediumblue'}"
                               href="accurateQueryAllBooks?&bookName=${book.bookName}&bookEncrypt=${book.bookEncrypt}&pubName=${book.pubName}&typeName=${book.typeName}&author=${book.author}"
                               class="borrowBtn">显示详情</a>
                        </td>
                    </tr>
                </c:forEach>
                <tr>
                    <td colspan="10">
                        <a href="fuzzyQueryAllBooks?pageNum=1&typeName=${typeName}">首页</a><a
                            href="fuzzyQueryAllBooks?pageNum=${info.prePage}&typeName=${typeName}"
                            contenteditable="${info.pageNum==1}"
                            style="outline: none">上一页</a>
                        <c:forEach items="${nums}" var="num">

                            <a href="fuzzyQueryAllBooks?pageNum=${info.prePage}"
                               style="text-decoration:${num==info.pageNum?'none':'underline'}"
                               contenteditable="${num==info.pageNum}" style="outline: none">${num}</a>
                        </c:forEach>
                        <a
                                href="fuzzyQueryAllBooks?pageNum=${info.nextPage}&typeName=${typeName}"
                                contenteditable="${info.pageNum==info.pages}" style="outline: none">下一页</a><a
                            href="fuzzyQueryAllBooks?pageNum=${info.pages}&typeName=${typeName}">末页</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<div class="footer">
    <%@include file="/jsp/copyright.jsp" %>
</div>
</body>
</html>




