<%-- 
    Document   : detialUser_fgdgdf
    Created on : Apr 28, 2017, 9:07:06 PM
    Author     : NGUYEN VAN THIEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detial user</title>
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
        <link rel="stylesheet" href="<c:url value= "/resources/font-awesome/css/font-awesome.min.css"/>"" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="center">
            <input class="btn btnBack" type="button" name="Back" value="Back" onclick="history.go(-1)">
            <section class="section_Content">
                <s:form action="" commandName="user" method="GET">
                    <table border="1">
                        <tr>
                            <td colspan="2" class="thongtin">THÔNG TIN CHI TIẾT NHÂN VIÊN</td>
                        </tr>
                        <tr>
                            <th>ID</th>
                            <td><s:input path="userId" readonly="true" class="form_td"/></td>
                        </tr>
                        <tr>
                            <th>Username</th>
                            <td><s:input path="userName" readonly="true" class="form_td"/></td>
                        </tr>
                        <tr>
                            <th>Password</th>
                            <td><s:input path="password" readonly="true" class="form_td"/></td>
                        </tr>
                        <tr>
                            <th>Fullname</th>
                            <td><s:input path="fullName" readonly="true" class="form_td"/></td>
                        </tr>
                        <tr>
                            <th>Gender</th>
                            <td><s:input path="gender" readonly="true" class="form_td"/></td>
                        </tr>
                        <tr>
                            <th>Birthday</th>
                            <td><s:input path="birthDay" readonly="true" class="form_td"/></td>
                        </tr>
                        <tr>
                            <th>Address</th>
                            <td><s:input path="address" readonly="true" class="form_td"/></td>
                        </tr>
                        <tr>
                            <th>Email</th>
                            <td><s:input path="email" readonly="true" class="form_td"/></td>
                        </tr>
                        <tr>
                            <th>Phone</th>
                            <td><s:input path="phone" readonly="true" class="form_td"/></td>
                        </tr>
                        <tr>
                            <th>CMND</th>
                            <td><s:input path="cmnd" readonly="true" class="form_td"/></td>
                        </tr>
                        <tr>
                            <th>Position</th>
                            <td><s:input path="position" readonly="true" class="form_td"/></td>
                        </tr>   
                        <tr>
                            <th>Permision</th>
                            <td><s:input path="permision" readonly="true" class="form_td"/></td>
                        </tr>   
                        <tr>
                            <th>Note</th>
                            <td><s:input path="note" readonly="true" class="form_td"/></td>
                        </tr>   
                        <tr>
                            <th>Status</th>
                            <td><s:input path="status" readonly="true" class="form_td"/></td>
                        </tr>   
                        <tr>
                            <th>Date Create</th>
                            <td><s:input path="dateCreate" readonly="true" class="form_td"/></td>
                        </tr>   
                        <tr>
                            <th>Date Last</th>
                            <td><s:input path="dateCreateLast" readonly="true" class="form_td"/></td>
                        </tr>
                    </s:form>
                </table>
            </section>
        </div>
    </body>
</html>
