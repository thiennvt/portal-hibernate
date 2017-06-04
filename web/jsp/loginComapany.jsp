<%-- 
    Document   : loginComapany
    Created on : Apr 23, 2017, 12:58:46 PM
    Author     : root
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
        <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/jQuery/jquery.min.js"/>">
        <link rel="stylesheet" href="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>">
        <link rel="stylesheet" href="<c:url value="/resources/font-awesome/css/font-awesome.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/main.css"/>">
    </head>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container-fluid">
                <h2 style="color: blue;text-align: center;">QUẢN LÍ ĐẶT VÉ XE KHÁCH ĐƯỜNG DÀI</h2>
            </div>
        </nav>
        <div class="container ">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 formlogin loginleft pull-left">

                    <legend>Đăng nhập</legend>
                    <h5 style="color: red;text-align:center;">${errorCompany}</h5>
                    <s:form action="handelLoginCompany.htm" commandName="company" method="GET">
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 ">
                                <div class="form-group">
                                    <label>Tên tài khoản</label>
                                    <s:input path="accountName" type="text" class="form-control" placeholder="Nhập tên tài khoản"/>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                <div class="form-group">
                                    <label>Mật khẩu</label>
                                    <s:input path="password" type="password" class="form-control" placeholder="Nhập mật khẩu"/>
                                </div>
                            </div>
                        </div>
                        <div class="pull-right"><a href="#">Quên mật khẩu?</a></div>
                        <button class="btn btn-primary pull-left">Đồng ý</button>
                        <a href="<c:url value="/schedule/showHomePageClient.htm"/>" class="btn btn-primary" style="text-decoration: none;color: #fff;margin-left: 15px">Trở về</a>
                    </s:form>
                        
                </div>
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 register text-center loginright ">
                    <legend>BẠN LÀ KHÁCH HÀNG MỚI?</legend>
                    <div class="btn btn-success">Đăng ký</div>
                    <hr width="60%">
                    <legend>ĐĂNG NHẬP BẰNG TÀI KHOẢN KHÁC</legend>
                    <a href="" class="btn btn-primary">ĐĂNG NHẬP BẰNG FACEBOOK</a><br>
                    <a href="" class="btn btn-danger btngg"> ĐĂNG NHẬP BẰNG GOOGLE </a>
                </div>
            </div>
        </div>

    </body>
</html>