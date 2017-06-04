<%-- 
    Document   : carContent
    Created on : Apr 29, 2017, 12:08:38 AM
    Author     : NGUYEN VAN THIEN
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
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Xe khách 
                        <small>thông tin xe khách</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Quản lí xe khách</li>
                    </ol>
                </section>
                <section class="content-header">
                    <a class="btn btn-primary" href="initInsertNhaxe.htm">Thêm</a>
                    <form class="navbar-form breadcrumb" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-primary">Search</button>
                    </form>
                </section>
                <section class="content">
                    <div class="table-responsive text-center">
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr class="back_color text-center">
                                    <td><label>ID </label></td>
                                    <td><label>Car Type</label></td>
                                    <td><label>Number Car</label></td>
                                    <td><label>Number Seat</label></td>
                                    <td><label>Status</label></td>
                                    <td><label>Schedule</label></td>
                                    <td><label>Company Name</label></td>
                                    <td colspan="3">Action</td>
                                </tr>
                            </thead>  
                            <tbody>
                                <c:forEach var="car" items="${listCar}">
                                    <tr class="success">
                                        <td>${car.carId}</td>
                                        <td>${car.carType}</td>
                                        <td>${car.numberCar}</td>
                                        <td>${car.numberOfseat}</td>
                                        <td>${car.status}</td>
                                        <td><a class="update" href="<c:url value="initUpdateCar.htm?carId=${car.carId}" />">Schedule Detail</a></td>
                                        <td>${car.com}</td>
                                        <td><a class="update" href="<c:url value="initCarDetail.htm?carId=${car.carId}" />">Xem chi tiết</a></td>
                                        <td><a class="update" href="<c:url value="initUpdateCar.htm?carId=${car.carId}" />">Update</a></td>
                                        <td><a onclick="confirmDelete()" class="update" href="<c:url value="initDeleteCar.htm?carId=${car.carId}" />">Delete</a></td>
                                    </tr> 
                                </c:forEach>
                            </tbody>
                        </table>  
                    </div>
                </section>
                <!-- /.content -->
            </div>
        </div>
        <script type="text/javascript" src="<c:url value='/resources/jQuery/jquery.min.js' />"></script>
        <script type="text/javascript" src="<c:url value='/resources/jQuery/jquery-1.12.4.js' />"></script>
        <script type="text/javascript" src="<c:url value='/resources/jQuery/jquery-ui.js' />"></script>
        <script type="text/javascript" src="<c:url value='/resources/jQuery/style.js' />"></script>
        <!-- Bootstrap 3.3.6 -->
        <script type="text/javascript" src="<c:url value='/resources/bootstrap/js/bootstrap.min.js' />"></script>
        <script type="text/javascript" src="<c:url value='/resources/jQuery/app.min.js' />"></script>
    </body>
</html>
