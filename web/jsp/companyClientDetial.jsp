<%-- 
    Document   : companyClientDetial
    Created on : Apr 29, 2017, 9:01:20 AM
    Author     : NGUYEN VAN THIEN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>detial company</title>
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
                            Hồ sơ
                            <small>thông tin nhà xe</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                            <li class="active">Hồ sơ</li>
                        </ol>
                    </section>
                    <section class="content-header">
                        <input class="btn btn-primary" type="button" name="Back" value="Back" onclick="history.go(-1)">
                        <button class="btn pull-right btn-warning"><a style="color: blue" href="<c:url value="initUpdateCompanyDetial.htm?companyId=${sessionScope.id}" />">Update</a></button>
                </section>
                <section class="content">
                    <div class="table-responsive text-center">
                        <s:form action="initCompanyDetialClient.htm" commandName="companyDetail" method="GET">
                            <table class="table text-center"b style="background: skyblue;">
                                <tr style="background: #0091d9">
                                    <td colspan="2" class="thongtin"><h4><b>THÔNG TIN CHI TIẾT HÃNH XE</b></h4></td>
                                </tr>
                                <tr>
                                    <th>ID</th>
                                    <td><s:input path="companyId" readonly="true" class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Company Name</th>
                                    <td><s:input path="name" readonly="true" class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Account</th>
                                    <td><s:input path="accountName" readonly="true" class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Password</th>
                                    <td><s:input path="password" readonly="true" class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Address</th>
                                    <td><s:input path="address" readonly="true" class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Email</th>
                                    <td><s:input path="email" readonly="true" class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Phone</th>
                                    <td><s:input path="phone" readonly="true" class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Hotline</th>
                                    <td><s:input path="hotline" readonly="true" class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Date Create</th>
                                    <td><s:input path="dateCreate" readonly="true" class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Date Last</th>
                                    <td><s:input path="dateCreatelast" readonly="true" class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <th>Note</th>
                                    <td><s:textarea rows="3" path="note" readonly="true" class="form-control text-center"/></td>
                                </tr>
                                <tr>
                                    <td colspan="2"><a class="update" href="<c:url value="initConfirmCompany.htm?companyId=${company.companyId}" />" target="display"><strong>${confirm}</strong></a></td>
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

