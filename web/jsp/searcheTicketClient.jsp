<%-- 
    Document   : searcheTicketClient
    Created on : Nov 27, 2017, 12:59:57 AM
    Author     : THIEN-NVT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Đăng kí tài khoản nhà xe</title>
        <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/bootstrap.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/jQuery/jquery.min.js"/>">
        <link rel="stylesheet" href="<c:url value="/resources/bootstrap/js/bootstrap.min.js"/>">
        <link rel="stylesheet" href="<c:url value="/resources/font-awesome/css/font-awesome.css"/>">
        <link rel="stylesheet" href="<c:url value="/resources/bootstrap/css/main.css"/>">
    </head>
    <body>
        <jsp:include page="companyRegister_Header.jsp"/>
        <div class="container formDangKy">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-6 col-md-push-3 col-lg-6 col-lg-push-3">
                    <s:form action="handleSearchTicketClient.htm" commandName="ticket" method="GET">
                        <h3 class="text-center" style="color: blue"><strong>Mời nhập mã vé</strong></h3>
                        <h4 id="error">${errorSearch}</h4>
                        <div class="form-group">
                            <s:input path="ticketId" class="form-control" placeholder="Điền mã vé xe" required="required"/>
                        </div>
                        <div style="margin-left: 250px"><button  class="btn btn-primary">Submit</button></div>

                    </s:form>
                </div>
            </div>
        </div>
        <link rel="stylesheet" href="<c:url value="/resources/jQuery/style.js"/>">
    </body>
</html>