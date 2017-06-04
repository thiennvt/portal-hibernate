<%-- 
    Document   : homePageContent
    Created on : Apr 25, 2017, 10:01:13 AM
    Author     : NGUYEN VAN THIEN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page Content</title>
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
        <link rel="stylesheet" href="<c:url value= "/resources/font-awesome/css/font-awesome.min.css"/>"" rel="stylesheet" type="text/css">
    </head>
    <body>
        <section class="content">
            <p class="title_left">
                <a href="<c:url value="/user/homePage.htm"/>" style="text-decoration: none;color: black"><b class="fa fa-home" style="font-size: 15px"></b>  Home</a>
                <span style="font-size: 20px;padding-left: 350px;color: blue">QUẢN LÍ ĐẶT VÉ XE KHÁCH ĐƯỜNG DÀI</span>
            </p>
            <div class="items" >
                <iframe src="<c:url value="welCome.htm"/>" class="wallapper" name="display" frameBorder="0"></iframe>
            </div>
            <footer class="main-footer">
                <strong>Copyright &copy; 2016 <a href="#">Company</a>.</strong> All rights reserved.
            </footer>
        </section>
    </body>
</html>
