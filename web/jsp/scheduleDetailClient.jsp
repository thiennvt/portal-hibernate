<%-- 
    Document   : scheduleDetailClient
    Created on : May 1, 2017, 9:54:16 PM
    Author     : NGUYEN VAN THIEN
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>schedule detail</title>
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
                            Lịch trình
                            <small>thông tin lịch tình</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                            <li class="active">Xe khách</li>
                        </ol>
                    </section>
                    <section class="content-header">
                        <input class="btn btn-primary" type="button" name="Back" value="Back" onclick="history.go(-1)">
                    </section>
                    <section class="content">
                        <div class="table-responsive text-center">
                        <s:form action="" commandName="schedule" method="GET">
                            <table class="table text-center"b style="background: skyblue;">
                                <tr style="background: #0091d9">
                                    <td colspan="2" class="thongtin">THÔNG TIN CHI TIẾT LỊCH TRÌNH</td>
                                </tr>
                                <tr>
                                    <th>ID</th>
                                    <td><s:input path="scheduleId" readonly="true" class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Route</th>
                                    <td><s:input path="route" readonly="true" class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Kilometer</th>
                                    <td><s:input path="kilometer" readonly="true" class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Place start</th>
                                    <td><s:input path="placeStart" readonly="true" class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Place Come</th>
                                    <td><s:input path="placeCome" readonly="true" class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Status</th>
                                    <td><s:input path="status" readonly="true" class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Date Create</th>
                                    <td><s:input path="dateCreate" readonly="true" class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Date Last</th>
                                    <td><s:input path="dateCreateLast" readonly="true" class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Note</th>
                                    <td><s:input path="note" readonly="true" class="form-control text-center"/></td>
                                </tr>
                            </table>
                        </s:form>
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
