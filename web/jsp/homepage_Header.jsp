<%-- 
    Document   : homePageHeader
    Created on : Apr 25, 2017, 9:56:07 AM
    Author     : NGUYEN VAN THIEN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page Header</title>
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
        <link rel="stylesheet" href="<c:url value= "/resources/font-awesome/css/font-awesome.min.css"/>"" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="main">
            <header class="_header">
                <a href="<c:url value="welCome.htm"/>" target="display" class="logo">TEAM<span style="font-weight: bold;color: red"> 5</span></a>
                <nav class="itemright">
                    <div class="dropdown">
                        <a href="#"><img src="${pageContext.request.contextPath}/images/${sessionScope.avatar}">     ${sessionScope.userName}</a>
                        <div class="dropdown-content">
                            <ul>
                                <li><a href="<c:url value="detailUserStaff.htm?userId=${sessionScope.userId}" />" target="display"><i class="fa fa-user-md"></i>   Ho so</a></li>
                                <li><a href="<c:url value="/user/loginPage.htm"/>"><i class="fa fa-sign-out"></i> Dang xuat</a></li>
                            </ul>
                        </div>
                    </div>
                </nav>
            </header>
        </div>
    </body>
</html>
