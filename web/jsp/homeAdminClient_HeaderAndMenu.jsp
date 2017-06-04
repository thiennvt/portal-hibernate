<%-- 
    Document   : homeAdminClient_HeaderAndMenu
    Created on : May 27, 2017, 12:22:37 AM
    Author     : THIEN-NVT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>header and menu Page</title>
        <link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/css/style.min.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/css/jquery-ui.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/css/skins/skin-blue.min.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/css/skins/_all-skins.min.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/css/jquery.dataTables.min.css"/>" rel="stylesheet" type="text/css" />
    </head>
    <body class="hold-transition skin-blue sidebar-mini">
        <header class="main-header">
            <!-- Logo -->
            <a href="<c:url value="/company/adminClient.htm"/>" class="logo">
                <!-- mini logo for sidebar mini 50x50 pixels -->
                <span class="logo-mini"><b>TRAI</b>ĐẸP</span>
                <!-- logo for regular state and mobile devices -->
                <span class="logo-lg"><b>NHÓM 5 </b>TRAI ĐẸP</span>
            </a>

            <!-- Header Navbar -->
            <nav class="navbar navbar-static-top" role="navigation">
                <!-- Sidebar toggle button-->
                <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>
                <!-- Navbar Right Menu -->
                <div class="navbar-custom-menu">
                    <ul class="nav navbar-nav">
                        <!-- Messages: style can be found in dropdown.less-->
                        <!-- User Account Menu -->
                        <li class="dropdown user user-menu">
                            <!-- Menu Toggle Button -->
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <!-- The user image in the navbar-->
                                <img src="<c:url value="/resources/img/avatar.JPG"/>" class="user-image" alt="User Image">
                                <!-- hidden-xs hides the username on small devices so only the image appears. -->
                                <span class="hidden-xs">${sessionScope.userName}</span>
                            </a>
                            <ul class="dropdown-menu">
                                <!-- The user image in the menu -->
                                <li class="user-header">
                                    <img src="<c:url value="/resources/img/avatar.JPG"/>"  class="img-circle" alt="User Image">
                                    <p>
                                        ${sessionScope.userName} - Web Developer
                                        <small>Member since 1 2017</small>
                                    </p>
                                </li>
                                <!-- Menu Body -->
                                <!-- Menu Footer-->
                                <li class="user-footer">
                                    <div class="pull-left">
                                        <a href="<c:url value="/company/initCompanyDetialClient.htm?companyId=${sessionScope.id}"/>" class="btn btn-default btn-flat fa fa-user-md"> Hồ sơ</a>
                                    </div>
                                    <div class="pull-right">
                                        <a href="<c:url value="/company/loginPageCompany.htm"/>" class="btn btn-default btn-flat fa fa-sign-out"> Đăng xuất</a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <!-- Left side column. contains the logo and sidebar -->
        <aside class="main-sidebar">

            <!-- sidebar: style can be found in sidebar.less -->
            <section class="sidebar">
                <!-- Sidebar Menu -->
                <ul class="sidebar-menu">
                    <li class="header">MENU CHÍNH</li>
                    <!-- Optionally, you can add icons to the links -->
                    <li class="active"><a href="<c:url value="/car/getAllCar.htm?companyId=${sessionScope.id}"/>"><i class="fa fa-bus"></i> <span>Quản lí xe khách</span></a></li>
                    <li><a href="<c:url value="/schedule/getAllSchedule.htm?companyId=${sessionScope.id}"/> "><i class="fa fa-map-marker"></i> <span>Quản lí lịch trình</span></a></li>
                    <li class="treeview">
                        <a href="#"><i class="fa fa-ticket"></i> <span>Quản lí vé xe</span>
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="<c:url value="/ticket/getAllTicket.htm?companyId=${sessionScope.id}"/>"><i class="fa fa-chevron-circle-right"></i> Vé đặt</a></li>
                            <li><a href="<c:url value="/ticket/getAllTicketCancel.htm?companyId=${sessionScope.id}"/>"><i class="fa fa-chevron-circle-right"></i> Vé hủy</a></li>
                        </ul>
                    </li>
                </ul>
                <!-- /.sidebar-menu -->
            </section>
            <!-- /.sidebar -->
        </aside>
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