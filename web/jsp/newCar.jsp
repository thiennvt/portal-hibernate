<%-- 
    Document   : newCar
    Created on : May 1, 2017, 10:31:41 PM
    Author     : NGUYEN VAN THIEN
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>new car</title>
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
                            <li class="active">Thêm xe khách</li>
                        </ol>
                    </section>
                    <section class="content-header">
                        <input class="btn btn-primary" type="button" name="Back" value="Back" onclick="history.go(-1)">
                    </section>
                    <section class="content">
                        <div class="table-responsive text-center">
                        <s:form action="handleInsertCar.htm" commandName="newCar" method="GET">
                            <table class="table no-border"style="background: wheat;border:none">
                                <tr style="background: #0091d9">
                                    <td colspan="4" class="thongtin"><h4><b>ĐIỀN THÔNG TIN XE KHÁCH MỚI</b></h4></td>
                                </tr>
                                <tr>
                                    <th style="text-align: right">Car Type</th>
                                    <td><s:input path="carType"/></td>
                                    <th style="text-align: right">Time Come</th>
                                    <td><s:input path="timeCome"/></td>
                                </tr>
                                <tr>
                                    <th style="text-align: right">Number Car</th>
                                    <td><s:input path="numberCar"/></td>
                                    <th style="text-align: right">Company</th>
                                    <td>
                                        <s:select path="com.companyId">
                                            <s:option value="${sessionScope.id}" label="${sessionScope.userName}" class="form-control text-center"/>
                                        </s:select>
                                    </td>
                                </tr>
                                <tr>
                                    <th style="text-align: right">Color</th>
                                    <td><s:input path="color"/></td>
                                    <th style="text-align: right">Schedule</th>
                                    <td>
                                        <s:select path="schedule.scheduleId">
                                            <c:forEach var="schedule" items="${listSchedule}">
                                                <s:option value="${schedule.scheduleId}" label="${schedule.route}"/>
                                            </c:forEach>
                                        </s:select>
                                    </td>
                                </tr>
                                <tr>
                                    <th style="text-align: right">Number of Seat</th>
                                    <td><s:input path="numberOfseat"/></td>
                                    <th style="text-align: right">Price</th>
                                    <td><s:input path="priceTicket"/></td>
                                </tr>
                                <tr>
                                    <th style="text-align: right">Lable</th>
                                    <td><s:input path="company"/></td>
                                    <th style="text-align: right">Status</th>
                                    <td><s:input path="status"/></td>
                                </tr>
                                <tr>
                                    <th style="text-align: right">Time Start</th>
                                    <td><s:input path="timeStart"/></td>
                                    <th style="text-align: right">Note</th>
                                    <td><s:textarea rows="3" path="note"/></td>
                                </tr>
                                <tr>
                                    <td colspan="4"><input class="btn btnUpdate btn-primary" type="submit" name="submit" value="Submit"></td>
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

