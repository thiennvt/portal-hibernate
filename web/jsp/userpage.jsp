<%-- 
    Document   : userpage
    Created on : Apr 17, 2017, 1:55:55 PM
    Author     : root
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>user page</title>
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
        <link rel="stylesheet" href="<c:url value= "/resources/font-awesome/css/font-awesome.min.css"/>"" rel="stylesheet" type="text/css">

    </head>
    <body>
        <div class="center">
            <div>
                <button class="button_left"><a href="<c:url value="initInsertUserStaff.htm"/>" target="display">Insert</a></button>
                <p style="text-align: center;color: red;font-size: 20px;"><b>Quản lí User</b></p>
                <div class="search_right">
                    <s:form action="handleSearchUser.htm" commandName="user" method="GET">
                        <s:input path="userName" type="text" placeholder="Search information"/>
                        <button style="cursor: pointer">Search</button>
                    </s:form>
                </div>
            </div>
            <section>
                <table border="1">
                    <thead>
                        <tr class="infor">
                            <th>ID</th>
                            <th>Avatar</th>
                            <th>Username</th>
                            <th>Password</th>
                            <th>Fullname</th>
                            <th>Gender</th>
                            <th>Birthday</th>
                            <th>Address</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Permision</th>
                            <th>Status</th>
                            <th colspan="3">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="user" items="${listUser}">
                            <tr>
                                <td>${user.userId}</td>
                                <td><img src="${pageContext.request.contextPath}/images/${user.avatar}" width="150px"></td>
                                <td>${user.userName}</td>
                                <td>${user.password}</td>
                                <td>${user.fullName}</td>
                                <td>${user.gender}</td>
                                <td>${user.birthDay}</td>
                                <td>${user.address}</td>
                                <td>${user.email}</td>
                                <td>${user.phone}</td>
                                <td>${user.permision}</td>
                                <td>${user.status}</td>
                                <td><a class="update" href="<c:url value="detailUserStaff.htm?userId=${user.userId}" />" target="display">Xem chi tiết</a></td>
                                <td><a class="update" href="<c:url value="initUpdateUserStaff.htm?userId=${user.userId}" />" target="display">Update</a></td>
                                <td><a onclick="confirmDelete()" class="delete" href="<c:url value="initDeleteUserStaff.htm?userId=${user.userId}" />" target="display">${delete}</a></td>
                            </tr> 
                        </c:forEach>
                    </tbody>
                </table>
            </section>

        </div>
        <script type="text/javascript" src="<c:url value='/resources/jQuery/style.js' />"></script>
    </body>
</html>
