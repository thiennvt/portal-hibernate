<%-- 
    Document   : homePage_MenuLeft
    Created on : Apr 25, 2017, 9:59:04 AM
    Author     : NGUYEN VAN THIEN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page Menu Left</title>
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
        <link rel="stylesheet" href="<c:url value= "/resources/font-awesome/css/font-awesome.min.css"/>"" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div id="menu" class="clearfix">
            <header class="clearfix">
                <h5 class="mainmenu"><strong>MAIN MENU</strong></h5>
            </header>
            <nav>
                <ul>
                    <li><a href="<c:url value="/user/getAllUser.htm"/>" target="display"><i class="fa fa-user"></i>   Quản lí user</a></li>
                    <li><a href="<c:url value="/company/getAllCompany.htm" />"" target="display"><i class="fa fa-link"></i>     Quản lí nhà xe</a></li>
                    <li><a href="<c:url value="/schedule/getAllScheduleAdmin.htm"/>" target="display"><i class="fa fa-map-marker"></i>    Thống kê lịch trình</a></li>
                </ul>
            </nav>
        </div>
    </body>
</html>
