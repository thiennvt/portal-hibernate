<%-- 
    Document   : newSchedule
    Created on : May 2, 2017, 2:44:39 PM
    Author     : NGUYEN VAN THIEN
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>new schedule</title>
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
                            <small>thêm lịch trình</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                            <li class="active">Quản lí lịch trình</li>
                        </ol>
                    </section>
                    <section class="content-header">
                        <input class="btn btn-primary" type="button" name="Back" value="Back" onclick="history.go(-1)">
                    </section>
                    <section class="content">
                        <div class="table-responsive text-center">
                        <s:form action="handleInsertSchedule.htm" commandName="schedule" method="GET">
                            <table class="table text-center"b style="background: skyblue;">
                                <tr style="basckground: #0091d9">
                                    <td colspan="2" class="thongtin">NHẬP THÔNG TIN LỊCH TRÌNH MỚI</td>
                                </tr>
                                <tr>
                                    <td>Company</td>
                                    <td>
                                        <s:select path="company.companyId" class="form-control text-center">
                                            <s:option value="${sessionScope.id}" label="${sessionScope.userName}" class="form-control text-center"/>
                                        </s:select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Route</th>
                                    <td><s:input path="route" class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Kilometer</th>
                                    <td><s:input path="kilometer" class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Date Start</th>
                                    <td><s:input path="dateStart" class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Place start</th>
                                    <td><s:input path="placeStart" class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Place Come</th>
                                    <td><s:input path="placeCome" class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Status</th>
                                    <td><s:input path="status" class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Note</th>
                                    <td><s:input path="note" class="form-control text-center"/></td>
                                </tr>

                                <tr>
                                    <td colspan="2"><input class="btn btnUpdate btn-primary" type="submit" name="submit" value="Submit"></td>
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
