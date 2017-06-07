<%-- 
    Document   : ticketPage
    Created on : Apr 24, 2017, 9:08:01 AM
    Author     : root
--%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ticket order</title>
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
                <!-- Content Wrapper. Contains page content -->
                <div class="content-wrapper">
                    <!-- Content Header (Page header) -->
                    <section class="content-header">
                        <h1>
                            Đặt vé
                            <small>thông tin đặt vé</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                            <li class="active">Quản lí đặt vé</li>
                        </ol>
                    </section>
                    <section class="content-header">
                        <a class="btn btn-primary" href="<c:url value="initInsertTicket.htm"/>">Thêm</a>
                    <form class="navbar-form breadcrumb" role="search">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Search">
                        </div>
                        <button type="submit" class="btn btn-primary">Search</button>
                    </form>
                </section>
                <section class="content">
                    <div class="table-responsive text-center">
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr class="info text-center">
                                    <td><label>ID </label></td>
                                    <td><label>Customer Name</label></td>
                                    <td><label>Address</label></td>
                                    <td><label>Email</label></td>
                                    <td><label>Phone</label></td>
                                    <td><label>Quantity Ticket</label></td>
                                    <td><label>Date Start</label></td>
                                    <td><label>Total Price(000 VND)</label></td>
                                    <td><label>Date Order</label></td>
                                    <td><label>Status</label></td>
                                    <td><label>Car order</label></td>
                                    <td colspan="2">Action</td>
                                </tr>
                            </thead>  
                            <tbody>
                                <c:forEach var="ticket" items="${listTicket}">
                                    <tr class="warning">
                                        <td>${ticket.ticketId}</td>
                                        <td>${ticket.customerName}</td>
                                        <td>${ticket.address}</td>
                                        <td>${ticket.email}</td>
                                        <td>${ticket.phone}</td>
                                        <td>${ticket.quanTicket}</td>
                                        <td>${ticket.dateStart}</td>
                                        <td>${ticket.price}</td>
                                        <td>${ticket.dateOrder}</td>
                                        <td>${ticket.status}</td>
                                        <td><a class="update" style="color: blue" href="<c:url value="/car/initCarDetail.htm?carId=${ticket.car}" />" style="color: blue;">${ticket.car}</a></td>
                                        <td><a class="update" style="color: blue" href="<c:url value="initUpdateTicketOrder.htm?ticketId=${ticket.ticketId}" />">Update</a></td>
                                        <td><a onclick="confirmDelete()" style="color: red" class="update" style="color: red" href="<c:url value="initDeleteTicket.htm?ticketId=${ticket.ticketId}&companyId=${sessionScope.id}" />">Cancel</a></td>
                                    </tr> 
                                </c:forEach>
                            </tbody>
                        </table>  
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
    </body>
</html>

