<%-- 
    Document   : paymentPage
    Created on : May 31, 2017, 12:28:10 PM
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
                        <li><a href="<c:url value="/ticket/showSearchTicket.htm"/>">Kiển tra vé</a></li>
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
            <s:form action="handleOrderTicket.htm" commandName="ticket" method="GET">
                <div class="row">
                    <div style="margin-top: 80px;" class="col-xs-12 col-sm-12 col-md-8 col-lg-8 col-md-push-2 col-lg-push-2">
                        <table style="border:none">
                            <tbody>
                                <tr>
                                    <td colspan="2" style="font-weight: bold;color: red;">THÔNG TIN VÉ ĐẶT</td>
                                </tr>
                                <tr>
                                    <td class="format_td">Họ tên</td>
                                    <td><s:input path="customerName" readonly="true" class="format_input"/></td>
                                    <td class="format_td">Điểm xuất phát </td>
                                    <td><s:input path="car.schedule.placeStart" readonly="true" class="format_input"/> : <s:input path="car.timeStart" readonly="true" class="format_input"/></td>
                                </tr>
                                <tr>
                                    <td class="format_td">Ngày đi</td>
                                    <td><s:input path="dateStart" readonly="true" class="format_input"/></td>
                                    <td class="format_td">Điểm đến</td>
                                    <td><s:input path="car.schedule.placeCome" readonly="true" class="format_input"/> : <s:input path="car.timeCome" readonly="true" class="format_input"/></td>
                                </tr>
                                <tr>
                                    <td class="format_td">Số lượng vé: </td>
                                    <td><s:input path="quanTicket" readonly="true" class="format_input"/></td>
                                    <td class="format_td">Hãng xe: </td>
                                    <td><s:input path="company.name" readonly="true" class="format_input"/></td>
                                </tr>
                                <tr>
                                    <td class="format_td">Tổng tiền</td>
                                    <td><s:input path="price" readonly="true" class="format_input"/></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </s:form>
        </div>
        <div class="container">
            <div class="row">
                <legend class="text-center">Hình thức thanh toán</legend><br>
                <div class="form-group col-sm-6 col-xs-12">
                    <label for="">Loại hình thanh toán</label>
                    <select name="" id="" class="form-control" required="required">
                        <option value="">Trực tiếp</option>
                        <option value="">Qua thẻ ngân hàng</option>
                    </select>
                </div>
                <div class="form-group col-sm-6 col-xs-12">
                    <label for="">Tên ngân hàng</label>
                    <input type="text" class="form-control" id="">
                </div>
                <div class="form-group col-sm-6 col-xs-12">
                    <label for="">Số thẻ</label>
                    <input type="text" class="form-control" id="" required="required">
                </div>
                <div class="form-group col-sm-6 col-xs-12">
                    <label for="">Số tài khoản</label>
                    <input type="text" class="form-control" id="" required="required">
                </div>
                <div class="form-group col-sm-6 col-xs-12">
                    <label for="">Ngày hết hạn</label>

                    <select name="" id="input" class="form-control" required="required">
                        <option value="">Tháng</option>
                        <option value="">7</option>
                        <option value="">8</option>
                        <option value="">9</option>
                    </select>

                </div>
                <div class="form-group col-sm-6 col-xs-12">
                    <label for=""> </label>

                    <select name="" id="input" class="form-control" required="required">
                        <option value="">Năm</option>
                        <option value="">2016</option>
                        <option value="">2017</option>
                        <option value="">2018</option>
                    </select>

                </div>
                <a href="<c:url value="/schedule/handlePaymentOrder.htm?ticketId=${sessionScope.ticketOrderId}"/>" class="btn btn-primary pull-right">Thanh toán</a>
            </div>
        </div>
    </body>
</html>


