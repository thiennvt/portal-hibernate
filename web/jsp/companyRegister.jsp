<%-- 
    Document   : companyRegister
    Created on : Apr 29, 2017, 4:54:37 PM
    Author     : NGUYEN VAN THIEN
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
                    <s:form action="handleInsertCompany.htm" commandName="newCompany" method="GET">
                        <legend class="text-center" style="color: blue"><strong>Điền thông tin nhà xe</strong></legend>
                        <div class="form-group">
                            <label>Tên công ty *</label>
                            <s:input path="name" type = "text" class="form-control" name="hoTen" id="" placeholder="Điền tên công ty" required="required"/>
                            <label>Tên tài khoản *</label>
                            <s:input path="accountName" type="text" class="form-control" name="taikhoan" id="" placeholder="Điền tên tài khoản" required="required"/>
                            <label>Email *</label>
                            <s:input path="email" type="Email" class="form-control" name="email" id="" placeholder="Điền địa chỉ email" required="required"/>
                            <label>Điện thoại *</label>
                            <s:input path="phone" type="text" class="form-control" name="dienthoai" id="" placeholder="Điền số điện thoại" required="required"/>
                            <label>Mật khẩu *</label>
                            <s:input path="password" type="password" class="form-control" name="matKhau" id="matKhau" placeholder="Điền mật khẩu" required="required"/>
                        </div>
                        <button class="btn btn-primary">Submit</button>
                        <div class="text-center">Nếu bạn đã có tài khoản, <a href="<c:url value="/company/loginPageCompany.htm"/>">Click đây</a> để đăng nhập</div>
                    </s:form>
                </div>
            </div>
        </div>
        <link rel="stylesheet" href="<c:url value="/resources/jQuery/style.js"/>">
    </body>
</html>
