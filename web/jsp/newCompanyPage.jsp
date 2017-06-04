<%-- 
    Document   : newCompanyPage
    Created on : Apr 23, 2017, 11:30:42 AM
    Author     : root
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Company</title>
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
    </head>
    <body>
        <div class="table_center">
            <h2>Cập nhật thông tin nha xe</h2>
            <s:form commandName="newStaff" method="GET" action="handleInsertUserStaff.htm">
                <table class="table" border="1">
                    <tr class="info">
                        <td><label>Name</label></td>
                        <td><s:input path="name" class="form-control"/></td>
                        <td><label>Date Create</label></td>
                        <td><s:input path="dateCreate" class="form-control"/></td>
                    </tr>
                    <tr class="info">
                        <td><label>Account</label></td>
                        <td><s:input path="accountName" class="form-control"/></td>
                        <td><label>Password</label></td>
                        <td><s:input path="password" class="form-control"/></td>
                    </tr>
                    <tr class="info">
                        <td><label>Address</label></td>
                        <td><s:input path="address" class="form-control"/></td>
                        <td><label>Date last</label></td>
                        <td><s:input path="dateCreatelast" class="form-control"/></td>
                    </tr>
                    <tr class="info">
                        <td><label>Email</label></td>
                        <td><s:input path="email" class="form-control"/></td>
                        <td><label>Note</label></td>
                        <td><td><s:input path="note" class="form-control"/></td></td>

                    </tr>
                    <tr class="info">
                        <td><label>Phone</label></td>
                        <td><td><s:input path="phone" class="form-control"/></td></td>
                        <td><label>Status</label></td>
                        <td><s:input path="status" class="form-control"/></td>
                    </tr>
                    <tr class="info">
                        <td><label>hotline</label></td>
                        <td><s:input path="hotline" class="form-control"/></td>
                        <td><label>Status</label></td>
                        <td></td>
                    </tr>
                </table>
                <ul class="text-center list-inline">
                    <li><input class="btn" type="submit" name="submit" value="Save"></li>
                    <li><input class="btn" type="reset" name="reset" value="Reset"></li>
                    <li><input class="btn" type="button" name="Back" value="Back" onclick="history.go(-1)"></li>
                </ul>
            </s:form>
        </div>

    </body>
</html>
