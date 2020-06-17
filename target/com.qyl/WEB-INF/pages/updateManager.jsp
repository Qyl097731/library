<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2020/6/12
  Time: 12:23
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html;charset=UTF-8" language="java" isErrorPage="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getLocalPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>添加用户</title>
</head>
<body>
<%--private String username;--%>
<%--private String password;--%>
<%--private String name;--%>
<form action="${manager.username!=null?'updateManager':'insertManager'}" method="post">
    username:
    <c:if test="${empty manager.username}">
        <input type="text" name="username" id="username" />
    </c:if>
    <c:if test="${not empty manager.username}">
        <input type="hidden" name="username" id="username" value="${manager.username}"/>
        ${manager.username}
    </c:if>
    <input type="hidden" name="pageNum" id="pageNum" value="${pageNum}"/>
    password:<input type="text" name="password" id="password"  value="${manager.password}"/>
    name:<input type="text" name="name" id="name"  value="${manager.name}"/>
    <input type="submit" name="submit" >
</form>
</body>
</html>
