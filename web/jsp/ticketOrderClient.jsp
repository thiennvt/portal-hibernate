<%-- 
    Document   : ticketOrderClient
    Created on : May 30, 2017, 10:31:45 PM
    Author     : THIEN-NVT
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>home page</title>
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
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="row jumbotron">
                        <s:form action="handleOrderTicketDetial.htm" commandName="schedule" method="GET">
                            <div style="margin-top: 80px;" class="col-xs-6 col-sm-6">
                                <table class="table" style="border: none">
                                    <tbody>
                                        <tr>
                                            <td colspan="2" style="font-weight: bold;color: red;">THÔNG TIN LỊCH TRÌNH</td>
                                        </tr>
                                        <tr>
                                            <td class="format_td">Tuyến đường</td>
                                            <td><s:input path="route" readonly="true" class="format_input form-control format_input"/></td>
                                        </tr>
                                        <tr>
                                            <td class="format_td">Chiều dài</td>
                                            <td><s:input path="kilometer" readonly="true" class="format_input form-control format_input"/></td>
                                        </tr>
                                        <tr>
                                            <td class="format_td">Nơi khởi hành</td>
                                            <td><s:input path="placeStart" readonly="true" class="format_input form-control format_input"/></td>
                                        </tr>
                                        <tr>
                                            <td class="format_td">Nơi đến</td>
                                            <td><s:input path="placeCome" readonly="true" class="format_input form-control format_input"/></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </s:form>
                            <s:form action="handleOrderTicket.htm" commandName="ticket" method="GET">
                                <div>
                                    <table class="table-hover" style="border: none">
                                        <tbody>
                                            <tr>
                                                <td colspan="2" style="font-weight: bold;color: red;">THÔNG TIN XE ĐẶT</td>
                                            </tr>
                                            <tr>
                                                <td class="format_td">Hãng xe</td>
                                                <td class="format_td"></td>
                                                <td>
                                                    <s:select path="company.companyId" class="form-control text-center format_input">
                                                        <s:option value="${companyID}" label="${companyName}" class="form-control text-center format_input" style="border:none; outline:0px"/>
                                                    </s:select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="format_td">Xe đặt</td>
                                                <td class="format_td"></td>
                                                <td><s:select path="car.carId" class="form-control text-center">
                                                        <s:option value="${sessionScope.carId1}" label="${carNumber}" class="form-control text-center"/>
                                                    </s:select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="format_td">Giá vé</td>
                                                <td class="format_td"></td>
                                                <td>
                                                    <s:select path="price" class="form-control text-center">
                                                        <s:option value="${price}" class="form-control text-center"/>
                                                    </s:select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="format_td">Ngày đi</td>
                                                <td class="format_td"></td>
                                                <td><input value="${sessionScope.dateStart}" type="text" class="form-control" id="" readonly="true"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style="margin-top: 90px;">
                                    <p class="text-center" style="font-size: 25px;color: blue;font-weight: bold">
                                        <label for=""  center;">Thông tin khách hàng</label>
                                    </p>
                                    <label for="">Họ tên</label>
                                    <s:input path="customerName" type="text" class="form-control" id="" placeholder="Điền họ tên" required="required"/>
                                    <label for="">Di động</label>
                                    <s:input path="phone" type="text" class="form-control" id="" placeholder="Điền di động" required="required"/>
                                    <label for="">Email</label>
                                    <s:input path="email" type="Email" class="form-control" id="" placeholder="Điền email" required="required"/>
                                    <label for="">Số lượng vé</label>
                                    <s:input path="quanTicket" type="text" class="form-control" id="" placeholder="Số lượng vé" required="required"/>
                                    <label for="">Ngày đi</label>
                                    <s:select path="dateStart" class="form-control text-center">
                                        <s:option value="${sessionScope.dateStart}" label="${sessionScope.dateStart}" class="form-control text-center"/>
                                    </s:select>
                                    <input class="btn btn-primary"  type="submit" role="button" style="margin-left:45%;margin-top: 10px" value="Tiếp tục">
                                </div>
                            </s:form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>

