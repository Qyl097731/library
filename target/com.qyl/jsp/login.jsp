<%@page contentType="text/html;charset=UTF-8" language="java" isErrorPage="false" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getLocalPort() + path + "/";
%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <base href="<%=basePath%>">
    <script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="/css/index.css">
    <link rel="stylesheet" type="text/css" href="/css/login.css">
    <fmt:setLocale value="${param.locale}"/>
    <fmt:setBundle basename="locale"/>
    <script>
        $(document).ready(function () {
            $(function () {
                time();
            })
            $(function createCode() {
                $.ajax({
                    url: "CreateCode",
                    type: "GET",
                    success: function (data) {
                        document.getElementById("codeSpan").innerHTML = data;
                    }
                })
            })
            $(".eng_btn").click(function () {
                window.location = ("/jsp/login.jsp?locale=en_US");
            })
            $(".cn_btn").click(function () {
                window.location = ("/jsp/login.jsp?locale=zh_CN");
            })
            $("#username").blur(function () {
                const username = this.value;
                const reg = /^\d\d{6}\d$/;
                if (username == "" || username == null) {
                    $(".usernameError").text("请输入账号");
                    $("#username").focus();
                } else if (!reg.test(username)) {
                    $(".usernameError").text("账号非法");
                    $("#username").focus();
                } else {
                    $(".usernameError").text("");
                }
            });
            $("#password").blur(function () {
                const password = this.value;
                if (password == "" || password == null) {
                    $(".passwordError").text("请输入密码");
                    $("#password").focus();
                    return;
                } else {
                    $(".passwordError").text("");
                    return;
                }
            });
        })


        //校验确认验证码
        function checkCode() {
            var code = document.getElementById("code").value;
            var codeSpan = document.getElementById("codeSpan").innerHTML;
            var codeError = document.getElementById("codeError");
            if (code == "" || code == null) {
                codeError.innerHTML = "*验证码不能为空";
                codeError.style.color = "red";
                return false;
            } else if (code == codeSpan) {
                codeError.innerHTML = "*验证码通过";
                codeError.style.color = "green";
                return true;
            } else {
                codeError.innerHTML = "*验证码错误"
                codeError.style.color = "red";
                return false;
            }
        }
    </script>
</head>
<body  background="/img/bg.jpg" >
    <div class="header">
        <%@include file="banner.jsp" %>
    </div>
    <br><br><br>
    <div class="auth-language">
        <c:if test="${param.locale!='en_US'}">
            <button class="eng_btn">Eng</button>
            <button class="cn_btn" style="background:#90138b">中文</button>
        </c:if>
        <c:if test="${param.locale=='en_US'}">
            <button class="eng_btn" style="background:#90138b">Eng</button>
            <button class="cn_btn">中文</button>
        </c:if>

    </div>
    <div class="middle">
        <div class="loginTable">
            <table width='500' height='280' border='0' align="center" cellspacing="0">
                <form action="checkUser" method="post">
                    <tbody>
                    <tr>
                        <td class="login_first" colspan="3"><fmt:message key="ToolTip"></fmt:message></td>
                    </tr>
                    <tr>
                        <td class="login_right">身份：</td>
                        <td><select name="userType" class="login_left">
                            <option value="-1" selected="selected">管理员</option>
                            <option value="1">普通成员</option>
                        </select>
                            <p style="color: red;font-size:2px" name="wrongInfo">${param.wrongInfo}</p></td>
                    </tr>

                    <tr>
                        <td class="login_right">账号：</td>
                        <td><input type="text" name="username" id="username" placeholder="学号" class="login_left">
                            <span class="usernameError" style="color: red"></span>
                        </td>
                    </tr>

                    <tr>
                        <td class="login_right">密码：</td>
                        <td><input type="password" name="password" id="password" placeholder="默认身份证后六位"
                                   class="login_left">
                            <span class="passwordError" style="color: red"></span>
                        </td>
                    </tr>
                    <tr>
                        <td class="login_right">验证码：</td>
                        <td><input type="text" id="code" onblur="checkCode()"/>&nbsp;&nbsp;&nbsp;
                            <span id="codeSpan" onclick="createCode()"></span>
                            <span id="codeError"></span>
                    </tr>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <input type="submit" value="<fmt:message key="loginBtn"></fmt:message>" name="submit"
                                   id="submit">
                    </tr>
                    </tbody>
                </form>
            </table>
        </div>
    </div>
    <div class="blank"></div>
    <div class="footer">
        <%@include file="/jsp/copyright.jsp" %>
    </div>
</body>


</html>