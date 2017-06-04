<%-- 
    Document   : adminClientPage
    Created on : Apr 23, 2017, 3:04:58 PM
    Author     : root
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>car page</title>
        <link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/css/style.min.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/css/jquery-ui.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/css/skins/skin-blue.min.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/css/skins/_all-skins.min.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/css/jquery.dataTables.min.css"/>" rel="stylesheet" type="text/css" />
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="homeAdminClient_HeaderAndMenu.jsp"></jsp:include>
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
                            <a class="btn btn-primary" href="<c:url value="initInsertCar.htm?companyId=${sessionScope.id}"/>">Thêm</a>
                        <form  class="navbar-form breadcrumb" role="search">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Search"/>
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
                                        <td><label>Schedule</label></td>
                                        <td><label>Time Start</label></td>
                                        <td><label>Time Come</label></td>
                                        <td><label>Status</label></td>
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
                                            <td><a href="<c:url value="/schedule/initScheduleDetailClient.htm?scheduleId=${car.schedule}" />" style="color: blue;">${car.schedule}</a></td>
                                            <td>${car.timeStart}</td>
                                            <td>${car.timeCome}</td>
                                            <td>${car.status}</td>
                                            <td><a class="update" href="<c:url value="initCarDetail.htm?carId=${car.carId}" />" style="color: blue;">Chi tiết xe</a></td>
                                            <td><a class="update" style="color: blue" href="<c:url value="initUpdateCar.htm?carId=${car.carId}&companyId=${sessionScope.id}" />">Update</a></td>
                                            <td><a onclick="confirmDelete()" class="update" style="color: red" href="<c:url value="initDeleteCar.htm?carId=${car.carId}&companyId=${sessionScope.id}" />">Delete</a></td>
                                        </tr> 
                                    </c:forEach>
                                </tbody>
                            </table>  
                        </div>
                    </section>
                    <!-- /.content -->
                </div>
                <!-- /.content-wrapper -->
                <jsp:include page="homeAdminClient_Footer.jsp"></jsp:include>
                </div>

                <!-- jQuery 2.2.3 -->
                <script type="text/javascript" src="<c:url value='/resources/jQuery/jquery.min.js' />"></script>
            <script type="text/javascript" src="<c:url value='/resources/jQuery/jquery-1.12.4.js' />"></script>
            <script type="text/javascript" src="<c:url value='/resources/jQuery/jquery-ui.js' />"></script>
            <script type="text/javascript" src="<c:url value='/resources/jQuery/style.js' />"></script>
            <!-- Bootstrap 3.3.6 -->
            <script type="text/javascript" src="<c:url value='/resources/bootstrap/js/bootstrap.min.js' />"></script>
            <script type="text/javascript" src="<c:url value='/resources/jQuery/app.min.js' />"></script>
            <script type="text/javascript" src="<c:url value='/resources/jQuery/jquery.dataTables.min.js' />"></script>
    </body>
</html>
