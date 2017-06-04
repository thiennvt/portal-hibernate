<%-- 
    Document   : carUpdate
    Created on : May 4, 2017, 1:13:42 PM
    Author     : NGUYEN VAN THIEN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>car update</title>
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
                            <small>Quản lí xe khách</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                            <li class="active">Cập nhật xe khách</li>
                        </ol>
                    </section>
                    <section class="content-header">
                        <input class="btn btn-primary" type="button" name="Back" value="Back" onclick="history.go(-1)">
                    </section>
                    <section class="content">
                        <div class="table-responsive text-center">
                        <s:form action="handleUpdateCar.htm" commandName="carUpdate" method="GET">
                            <table class="table text-center"b style="background: skyblue;">
                                <tr style="background: #0091d9">
                                    <td colspan="2" class="thongtin"><h4><b>ĐIỀN THÔNG TIN XE KHÁCH MỚI</b></h4></td>
                                </tr>
                                <tr>
                                    <th>ID</th>
                                    <td><s:input path="carId" readonly="true"  class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Car Type</th>
                                    <td><s:input path="carType"  class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Number Car</th>
                                    <td><s:input path="numberCar"  class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Color</th>
                                    <td><s:input path="color"  class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Number of Seat</th>
                                    <td><s:input path="numberOfseat"  class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Lable</th>
                                    <td><s:input path="company"  class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Time Start</th>
                                    <td><s:input path="timeStart"  class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Time Come</th>
                                    <td><s:input path="timeCome"  class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Schedule</th>
                                    <td>
                                        <s:select path="schedule.scheduleId" class="form-control text-center">
                                            <c:forEach var="schedule" items="${listSchedule}">
                                                <s:option value="${schedule.scheduleId}" label="${schedule.route}" class="form-control text-center"/>
                                            </c:forEach>
                                        </s:select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>Price</th>
                                    <td><s:input path="priceTicket"  class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Date Create</th>
                                    <td><s:input path="dateCreate"  class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Status</th>
                                    <td><s:input path="status"  class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Note</th>
                                    <td><s:textarea rows="3" path="note"  class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <td colspan="2"><input class="btn btnUpdate btn-primary" type="submit" value="Submit"></td>
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

