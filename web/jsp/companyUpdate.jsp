<%-- 
    Document   : companyUpdate
    Created on : May 1, 2017, 8:30:19 AM
    Author     : NGUYEN VAN THIEN
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>company upate</title>
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
                            <small>update Company</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                            <li class="active">Hồ sơ</li>
                        </ol>
                    </section>
                    <section class="content-header">
                        <input class="btn btn-primary" type="button" name="Back" value="Back" onclick="history.go(-1)">
                    </section>
                    <section class="content">
                        <div class="table-responsive text-center">
                        <s:form action="handleUpdateCompanyDetialClient.htm" commandName="updateCompany" method="GET">
                            <table class="table no-border"style="background: wheat;border:none">
                                <tr style="background: #0091d9">
                                    <td colspan="4" class="thongtin"><h4><b>CẬP NHẬT THÔNG TIN HÃNH XE</b></h4></td>
                                </tr>
                                <tr>
                                    <th style="text-align: right">ID</th>
                                    <td><s:input path="companyId" readonly="true"/></td>
                                    <th style="text-align: right">Email</th>
                                    <td><s:input path="email"/></td>
                                </tr>
                                <tr>
                                    <th style="text-align: right">Company Name</th>
                                    <td><s:input path="name"/></td>
                                    <th style="text-align: right">Phone</th>
                                    <td><s:input path="phone"/></td>
                                </tr>
                                <tr>
                                    <th style="text-align: right">Account</th>
                                    <td><s:input path="accountName"/></td>
                                    <th style="text-align: right">Hotline</th>
                                    <td><s:input path="hotline"/></td>
                                </tr>
                                <tr>
                                    <th style="text-align: right">Password</th>
                                    <td><s:input path="password"/></td>
                                    <th style="text-align: right">Date Create</th>
                                    <td><s:input path="dateCreate"/></td>
                                </tr>
                                <tr>
                                    <th style="text-align: right">Address</th>
                                    <td><s:input path="address"/></td>
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
