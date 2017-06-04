<%-- 
    Document   : updateUserStaff
    Created on : Apr 21, 2017, 3:03:46 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert New Staff</title>
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
    </head>
    <body>
        <div class="table_center">
            <h2>Cập nhật thông tin nhân viên</h2>
            <s:form commandName="staff" method="GET" action="handleUpdateUserStaff.htm">
                <table class="table">
                    <tr class="info">
                        <td><label>ID</label></td>
                        <td><s:input path="userId" readonly="true"class="form-control" style="text-align:center;font-weight:bold;color:red"/></td>
                        <td><label>Email</label></td>
                        <td><s:input path="email" class="form-control"/></td>
                    </tr>
                    <tr class="info">
                        <td><label>Username</label></td>
                        <td><s:input path="userName" class="form-control"/></td>
                        <td><label>Phone</label></td>
                        <td><s:input path="phone" class="form-control"/></td>
                    </tr>
                    <tr class="info">
                        <td><label>Password</label></td>
                        <td><s:input path="password" class="form-control"/></td>
                        <td><label>CMND</label></td>
                        <td><s:input path="cmnd" class="form-control"/></td>
                    </tr>
                    <tr class="info">
                        <td><label>Fullname</label></td>
                        <td><s:input path="fullName" class="form-control"/></td>
                        <td><label>Position</label></td>
                        <td><s:input path="position" class="form-control"/></td>
                    </tr>
                    <tr class="info">
                        <td><label>Gender</label></td>
                        <td>
                            <s:select path="gender" class="form-control">
                                <s:option value="true" label="Nam" class="form-control"/>
                                <s:option value="false" label="Nữ" class="form-control"/>
                            </s:select>
                        </td>
                        <td><label>Permision</label></td>
                        <td>
                            <s:select path="permision" class="form-control">
                                <s:option value="admin" label="Admin" class="form-control"/>
                                <s:option value="staff" label="Staff" class="form-control"/>
                                <s:option value="customer" label="Customer" class="form-control"/>
                            </s:select>
                        </td>
                    </tr>
                    <tr class="info">
                        <td><label>Birthday</label></td>
                        <td><s:input path="birthDay" class="form-control"/></td>
                        <td><label>Date create</label></td>
                        <td><s:input path="dateCreate"class="form-control"/></td>
                    </tr>
                    <tr class="info">
                        <td><label>Address</label></td>
                        <td><s:input path="address"class="form-control"/></td>
                        <td><label>Status</label></td>
                        <td><s:input path="status"class="form-control"/></td>
                    </tr>
                    <tr class="info">
                        <td><label>Note</label></td>
                        <td colspan="4"><s:textarea rows="5" path="note" class="form-control"/></td>
                    </tr>
                </table>
                <ul class="text-center list-inline">
                    <li><input class="btn btnUpdate" type="submit" name="submit" value="Update"></li>
                    <li><input class="btn btnUpdate" type="button" name="Back" value="Back" onclick="history.go(-1)"></li>
                </ul>
            </s:form>
        </div>

    </body>
</html>
