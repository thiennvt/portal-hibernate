<%-- 
    Document   : companyPage
    Created on : Apr 23, 2017, 11:02:47 AM
    Author     : root
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Company page</title>
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
        <link rel="stylesheet" href="<c:url value= "/resources/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="center">
            <div>
                <button class="button_left"><a href="<c:url value="/company/ThongKeNhaXe.htm"/>" target="display">Xem thống kê</a></button>
                <p style="text-align: center;color: red;font-size: 20px;"><b>Quản lí nhà xe</b></p>
                <div class="search_right">
                    <s:form action="handleSearchCompany.htm" commandName="company" method="GET">
                        <s:input path="name" type="text" placeholder="Search information"/>
                        <button style="cursor: pointer">Search</button>
                    </s:form>
                </div>
            </div>
            <section>
                <table border="1">
                    <thead>
                        <tr class="infor">
                            <th>ID</th>
                            <th>Company Name</th>
                            <th>Account</th>
                            <th>Password</th>
                            <th>Address</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Status Confirm</th>
                            <th colspan="2">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="company" items="${listCompany}">
                            <tr>
                                <td>${company.companyId}</td>
                                <td>${company.name}</td>
                                <td>${company.accountName}</td>
                                <td>${company.password}</td>
                                <td>${company.address}</td>
                                <td>${company.email}</td>
                                <td>${company.phone}</td>
                                <td id="status">${company.status}</td>
                                <td><a class="update" href="<c:url value="initDetailCompany.htm?companyId=${company.companyId}" />" target="display">Xem chi tiết</a></td>
                                <td><a onclick="confirmDelete()" class="delete" href="<c:url value="initDeleteCompany.htm?companyId=${company.companyId}" />" target="display">${delete}</a></td>
                            </tr> 
                        </c:forEach>
                    </tbody>
                </table>
            </section>
        </div>
        <script type="text/javascript" src="<c:url value='/resources/jQuery/style.js' />"></script>
    </body>
</html>
