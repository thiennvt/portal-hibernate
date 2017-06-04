<%-- 
    Document   : showScheduleOrder
    Created on : May 27, 2017, 2:07:00 PM
    Author     : THIEN-NVT
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>schedule order</title>
        <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.css"/>">
        <script href='<c:url value="/resources/jQuery/jquery.min.js"/>'></script>
        <script href='<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>'></script>
        <script href='<c:url value="/resources/jQuery/jquery.js"/>'></script>
        <script href='<c:url value="/resources/jQuery/amazingslider.js"/>'></script>
        <link rel="stylesheet" href="<c:url value="/resources/font-awesome/css/font-awesome.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/css/amazingslider-1.css"/>">
        <script href='<c:url value="/resources/jQuery/initslider-1.js"/>'></script>
        <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/main.css"/>">
    </head>
    <body>
        <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
            <div class="container-fluid">

                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="<c:url value="/schedule/showHomePageClient.htm"/>"><img src="<c:url value="/resources/img/1.png"/>"></a>
                </div>


                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="<c:url value="/company/loginPageCompany.htm"/>">Đăng nhập</a></li>
                        <li><a href="<c:url value="/company/initInsertCompany.htm"/>">Đăng kí</a></li>
                    </ul>

                    <form class="navbar-form navbar-right" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-default">Tìm kiếm</button>
                    </form>

                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="#"><i class="fa fa-facebook"></i>&nbsp;Fanpage</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container ">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-6 col-md-push-3 col-lg-6 col-lg-push-3">
                    <div style="padding-top: 70px">
                        
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <!-- cái này theo t ko cần đầu vì nó hơi vướng tầm nhìn nhưng tùy m nếu vẫn nuốn thì cho xuống cuối ý ưu tiên danh sách lịch trình -->
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    
                </div>
            </div>

        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <table class="table table-hover">
                        <thead style="background-color: #cfc">
                            <tr>
                                <td colspan="10" style="background: moccasin;font-weight: bold;text-align: center;">DANH SÁCH XE XE CHẠY THEO TUYẾN: <b style="color: blue">${sessionScope.diemdau} - ${sessionScope.diemcuoi}</b></td>
                            </tr>
                            <tr>
                                <th>ID</th>
                                <th>Hãng xe</th>
                                <th>Loại xe</th>
                                <th>Biển số</th>
                                <th>Số chỗ ngồi</th>
                                <th>Số chỗ còn</th>
                                <th>Giá vé</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="car" items="${listCar}">
                                <tr class="scheduleInfo">
                                    <td>${car.carId}</td>
                                    <td>${car.com.name}</td>
                                    <td>${car.carType}</td>
                                    <td>${car.numberCar}</td>
                                    <td>${car.numberOfseat}</td>
                                    <td>${car.numaVailable}</td>
                                    <td>${car.priceTicket}</td>
                                    <td><a href="<c:url value="/schedule/orderTicketDetail.htm?scheduleId=${car.schedule.scheduleId}&carId=${car.carId}"/>"><button class="btn btn-warning pull-right">Đặt Vé</button></a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
