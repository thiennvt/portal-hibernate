<%-- 
    Document   : showScheduleOrder
    Created on : May 27, 2017, 2:07:00 PM
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
                        <s:form action="handleSearchScheduleClient.htm" method="GET" commandName="schedule" role="form">
                            <legend>Lich trình: ${sessionScope.diemdau} - ${sessionScope.diemcuoi}</legend>
                            <div class="row">
                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <div class="form-group">
                                        <label for="">Tỉnh Đi</label>
                                        <s:input path="placeStart" type="text" class="form-control" id="" placeholder="Điền vào tỉnh đi" required="required"/>
                                    </div>
                                </div>
                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <div class="form-group">
                                        <label for="">Tỉnh Đến</label>
                                        <s:input path="placeCome" type="text" class="form-control" id="" placeholder="Điền vào tỉnh đến" required="required"/>
                                    </div>
                                </div>
                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                                    <div class="form-group">
                                        <label for="">Ngày Đi</label>
                                        <s:input path="dateStart" type="date" class="form-control" id="" placeholder="Nhập ngày đi" required="required"/>
                                    </div>
                                </div>
                                <button class="btn btn-primary text-center " style="margin-top: 25px">Tìm xe</button>
                            </div>
                        </s:form>
                        <table class="table table-hover">
                            <thead style="background-color: #cfc">
                                <tr class="info">
                                    <th>Hãng xe</th>
                                    <th>Giờ đi</th>
                                    <th>Giờ đến</th>
                                    <th>Loại xe</th>
                                    <th>Số chỗ trống</th>
                                    <th>Giá vé</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    ArrayList<String> listGheTrong = (ArrayList<String>) request.getAttribute("listChotrong");
                                    ArrayList<Car> listCar = (ArrayList<Car>) request.getAttribute("listCar");
                                    for (int i = 0; i < listCar.size(); i++) {
                                        out.print("<tr class=\"scheduleInfo jumbotron\">");
                                        out.print("<td>" + listCar.get(i).getCom().getName() + "</td>");
                                        out.print("<td>" + listCar.get(i).getTimeStart() + "</td>");
                                        out.print("<td>" + listCar.get(i).getTimeCome() + "</td>");
                                        out.print("<td>" + listCar.get(i).getCarType() + " " + listCar.get(i).getNumberOfseat() + " " + "chỗ" + "</td>");
                                        out.print("<td>" + listGheTrong.get(i).toString() + "</td>");
                                        out.print("<td>" + listCar.get(i).getPriceTicket() + "</td>");
                                        out.print("<td><a class=\"btn btn-primary text-center\" href=\"/WebApplication.teamfive/schedule/orderTicketDetail.htm?scheduleId=" + listCar.get(i).getSchedule().getScheduleId() + "&carId=" + listCar.get(i).getCarId() + "\">Đặt vé</a></td>");
                                        out.print("</tr>");
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
