<%-- 
    Document   : ticketSearch
    Created on : Nov 5, 2017, 6:18:13 PM
    Author     : THIEN-NVT
--%>

<%@page import="entity.Car"%>
<%@page import="java.util.ArrayList"%>
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
                        <li><a href="<c:url value="/ticket/showSearchTicket.htm"/>">Đăng kí</a></li>
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
        <div class="container-fluid">
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <s:form action="handleSearchTicketClient.htm" commandName="ticket" method="GET">
                            <div>
                                <table class="table text-center">
                                    <tr style="background: #0091d9">
                                        <td colspan="4" class="thongtin">THÔNG TIN VÉ</td>
                                    </tr>
                                    <tr>
                                        <th>Mã vé</th>
                                        <td><s:input path="ticketId" readonly="true" class="form-control text-center"/></td>
                                        <th>Số điện thoại</th>
                                        <td><s:input path="phone" class="form-control text-center"/></td>
                                    </tr>
                                    <tr>
                                        <th>Họ tên</th>
                                        <td><s:input path="customerName" class="form-control text-center"/></td>
                                        <th>Hãng xe</th>
                                        <td><s:input path="company.name" class="form-control text-center"/></td>
                                    </tr>
                                    <tr>
                                        <th>Địa chỉ</th>
                                        <td><s:input path="address" class="form-control text-center"/></td>
                                        <th>Số xe</th>
                                        <td><s:input path="car.numberCar" class="form-control text-center"/></td>
                                    </tr>
                                    <tr>
                                        <th>Ngày đặt</th>
                                        <td><s:input path="dateOrder" class="form-control text-center"/></td>
                                        <th>Ngày đi</th>
                                        <td><s:input path="dateStart" class="form-control text-center"/></td>
                                    </tr>
                                    <tr>
                                        <th>Số lượng vé</th>
                                        <td><s:input path="quanTicket" class="form-control text-center"/></td>
                                        <th>Điểm xuất phát</th>
                                        <td><s:input path="car.schedule.placeStart" class="form-control text-center"/></td>
                                    </tr>
                                    <tr>
                                        <th>Tổng tiền</th>
                                        <td><s:input path="price" class="form-control text-center"/></td>
                                        <th>Điểm đến</th>
                                        <td><s:input path="car.schedule.placeCome" class="form-control text-center"/></td>
                                    </tr>
                                    <tr>
                                        <th>Email</th>
                                        <td><s:input path="email" class="form-control text-center"/></td>
                                        <th>Giờ đi</th>
                                        <td><s:input path="car.timeStart" class="form-control text-center"/></td>
                                    </tr>
                                    <tr>
                                        <th>Trạng thái</th>
                                        <td><s:input path="status" class="form-control text-center"/></td>
                                        <th>Giờ đến</th>
                                        <td><s:input path="car.timeCome" class="form-control text-center"/></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <input class="btn btnUpdate btn-info" type="submit" name="submit" value="Cập nhật vé">
                                            <input class="btn btnUpdate btn-danger" type="submit" name="submit" value="Trờ lại" onclick="history.go(-1)">   
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </s:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> 

</body>
</html>

