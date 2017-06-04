<%-- 
    Document   : companyRegister
    Created on : Apr 28, 2017, 9:31:27 AM
    Author     : NGUYEN VAN THIEN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Document</title>
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
                    <s:form action="handleUpdateCompany.htm" commandName="updateCompany" method="GET">
                        <legend class="text-center" style="color: blue"><strong>Cập nhật thông tin nhà xe</strong></legend>
                        <div class="form-group">
                            <label>ID *</label>
                            <s:input path="companyId" readonly="true" type = "text" class="form-control" name="hoTen" id="" placeholder="Điền tên công ty" required="required"/>
                            <label>Địa chỉ *</label>
                            <s:input path="address" type="text" class="form-control" name="" id="" placeholder="Điền địa chỉ liên hệ" required="required"/>
                            <label>HotLine *</label>
                            <s:input path="hotline" type="text" class="form-control" name="diDong" id="" placeholder="Điền số hotline" required="required"/>
                            <label>Giới thiệu về công ty</label>
                            <s:textarea path="note" class="form-control" rows="5" placeholder="Điền giới thiệu về công ty"/>
                        </div>
                        <button class="btn btn-primary">Submit</button>
                        <div class="text-center"><a href="">Click vào đây</a> để đăng nhập</div>
                    </s:form>
                </div>
            </div>
        </div>
        <link rel="stylesheet" href="<c:url value="/resources/jQuery/style.js"/>">
    </body>
</html>
