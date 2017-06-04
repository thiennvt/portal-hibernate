<%-- 
    Document   : login
    Created on : Apr 16, 2017, 4:24:25 PM
    Author     : root
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="<c:url  value="/resources/css/style_login.css"/>">
    </head>
    <body style="background: #f2f2f2;">
        <div class="title">
            <h3>QUẢN LÍ ĐẶT VÉ XE KHÁCH ĐƯỜNG DÀI</h3>
        </div>
        <div class="main_login">
            <div  class="dangnhap">
                <p>Đăng nhập hệ thống</p>
                <h5 id="error">${error}</h5>
            </div>
            <div>
                <s:form  class="center" method="GET" commandName="user" action="handelLogin.htm" >
                    <label><b>Username</b></label>
                    <s:input path="userName" type="text" placeholder="Username"/>
                    <label><b>Password</b></label>
                    <s:input path="password"  type="password" placeholder="Password"/>
                    <div class="function">
                        <button class="nut">Đăng nhập</button>
                        <button class="nut"><a href="#">Thoát</a></button>
                    </div>
                </s:form>
            </div>

        </div>
    </body>
</html>
