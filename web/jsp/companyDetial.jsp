<%-- 
    Document   : companyDetial
    Created on : Apr 28, 2017, 10:26:16 PM
    Author     : NGUYEN VAN THIEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detil company</title>
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
        <link rel="stylesheet" href="<c:url value= "/resources/font-awesome/css/font-awesome.min.css"/>"" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="center">
            <input class="btn btnBack" type="button" name="Back" value="Back" onclick="history.go(-1)">
            <section class="section_Content">
                <s:form action="initDetailCompany.htm" commandName="company" method="GET">
                    <table border="1">
                        <tr>
                            <td colspan="2" class="thongtin">THÔNG TIN CHI TIẾT HÃNH XE</td>
                        </tr>
                        <tr>
                            <th>ID</th>
                            <td><s:input path="companyId" readonly="true" class="form_td"/></td>
                        </tr>
                        <tr>
                            <th>Company Name</th>
                            <td><s:input path="name" readonly="true" class="form_td"/></td>
                        </tr>
                        <tr>
                            <th>Account</th>
                            <td><s:input path="accountName" readonly="true" class="form_td"/></td>
                        </tr>
                        <tr>
                            <th>Password</th>
                            <td><s:input path="password" readonly="true" class="form_td"/></td>
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
                            <th>Hotline</th>
                            <td><s:input path="hotline" readonly="true" class="form_td"/></td>
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
                            <td><s:input path="dateCreatelast" readonly="true" class="form_td"/></td>
                        </tr>  
                        <tr>
                            <th>Note</th>
                            <td><s:input path="note" readonly="true" class="form_td"/></td>
                        </tr>
                        <tr>
                            <td colspan="2"><a class="update" href="<c:url value="initConfirmCompany.htm?companyId=${company.companyId}" />" target="display"><strong>${confirm}</strong></a></td>
                        </tr>
                    </s:form>
                </table>
            </section>
        </div>
    </body>
</html>
