<%-- 
    Document   : homepageClient
    Created on : Apr 28, 2017, 10:08:29 AM
    Author     : NGUYEN VAN THIEN
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
        <script href='<c:url value="/resources/sliderengine/jquery.js"/>'></script>
        <script href='<c:url value="/resources/sliderengine/amazingslider.js"/>'></script>
        <link rel="stylesheet" href="<c:url value="/resources/font-awesome/css/font-awesome.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/sliderengine/amazingslider-1.css"/>">
        <script href='<c:url value="/resources/sliderengine/initslider-1.js"/>'></script>
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
                    <div id="carousel-id" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-id" data-slide-to="0" class=""></li>
                            <li data-target="#carousel-id" data-slide-to="1" class=""></li>
                            <li data-target="#carousel-id" data-slide-to="2" class="active"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="item">
                                <img data-src="holder.js/900x500/auto/#777:#7a7a7a/text:First slide" alt="First slide" src="<c:url value="/images/girl.jpg"/>">
                            </div>
                            <div class="item">
                                <img data-src="holder.js/900x500/auto/#777:#7a7a7a/text:First slide" alt="First slide" src="<c:url value="/images/jannina.jpg"/>">
                            </div>
                            <div class="item active">
                                <img data-src="holder.js/900x500/auto/#777:#7a7a7a/text:First slide" alt="First slide" src="<c:url value="/images/girl_wants.jpg"/>">
                            </div>
                            <a class="left carousel-control" href="#carousel-id" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
                            <a class="right carousel-control" href="#carousel-id" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div id="amazingslider-wrapper-1" style="display:block;position:relative;max-width:1500px;margin:0px auto 0px;">
                            <div id="amazingslider-1" style="display:block;position:relative;margin:0 auto;">
                                <ul class="amazingslider-slides" style="display:none;">
                                    <li><img src="<c:url value="/resources/img/1.png"/>"/>
                                    </li>
                                    <li><img src="<c:url value="/resources/img/5.jpg"/>"/>
                                    </li>
                                    <li><img src="<c:url value="/resources/img/4.jpg"/>"/>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <div id="amazingslider-wrapper-1" style="display:block;position:relative;max-width:1500px;margin:0px auto 0px;">
                            <div id="amazingslider-1" style="display:block;position:relative;margin:0 auto;">
                                <ul class="amazingslider-slides" style="display:none;">
                                    <li><img src="<c:url value="/resources/img/2.jpg"/>"></li>
                                    <li><img src="<c:url value="/resources/img/3.jpg"/>"></li>
                                    <li><img src="<c:url value="/resources/img/4.jpg"/>"></li>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container jumbotron">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                        <s:form action="handleSearchScheduleClient.htm" method="GET" commandName="schedule" role="form">
                            <legend>Tìm vé nhanh</legend>
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
                                        <s:input path="dateStart" type="date" class="form-control" id="" placeholder="" required="required"/>
                                    </div>
                                </div>
                                <button class="btn btn-primary text-center " style="margin-top: 25px">Tìm xe</button>
                            </div>
                        </s:form>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <legend class="text-center">Các tuyến <strong style="color: red">HOT</strong></legend>
                    <c:forEach var="schedule" items="${listSchedule}">
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <ul class="danhSachChuyen">
                                <li class="Chuyen1">
                                    <span class="gia"><a href="<c:url value="/schedule/SearchScheduleByIdClient.htm?scheduleId=${schedule.scheduleId}"/>"class="btn btn-warning pull-right" >DS xe chạy</a></span>
                                    <span class="gia" style="font-size: 13px;font-weight: bold;color: red;padding-top: 5px">${schedule.company.name}</span>
                                    <span class="gia"><a href="<c:url value="/schedule/SearchScheduleByIdClient.htm?scheduleId=${schedule.scheduleId}"/>" style="font-weight: bold;font-size: 18px">${schedule.placeStart} → ${schedule.placeCome}</a></span>
                                </li>
                                <br>										
                            </ul>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="container ">
                <div class="row content">
                    <legend>Mạng lưới nhà xe</legend>
                    <c:forEach var="company" items="${listCompany}">
                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3">
                            <div class="thumbnail">
                                <img src="<c:url value="/resources/img/5.jpg"/>" >
                                <div class="caption">
                                    <h3>${company.name}</h3>
                                    <p>

                                    </p>
                                    <p>
                                        <a href="#" class="btn btn-primary">Xem thêm</a>
                                        <a href="#" class="btn btn-default">Tìm xe</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                    <a href="" class="pull-right">Xem thêm</a>
                </div>
            </div>


    </body>
</html>
