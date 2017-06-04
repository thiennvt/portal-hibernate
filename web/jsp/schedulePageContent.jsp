<%-- 
    Document   : schedulePageAdmin
    Created on : May 1, 2017, 8:29:33 PM
    Author     : NGUYEN VAN THIEN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
        <link rel="stylesheet" href="<c:url value= "/resources/font-awesome/css/font-awesome.min.css"/>"" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="center">
            <div>
                <%--<button class="button_left"><a href="<c:url value="initInsertUserStaff.htm"/>" target="display">Insert</a></button>--%>
                <p style="text-align: center;color: red;font-size: 20px;"><b>Danh sách lịch trình</b></p>
                <div class="search_right">
                    <s:form action="handleSearchSchedule.htm" commandName="schedule" method="GET">
                        <s:input path="route" type="text" placeholder="Search information"/>
                        <button>Search</button>
                    </s:form>
                </div>
            </div>
            <section>
                <table border="1">
                    <thead>
                        <tr class="infor">
                            <td><label>ID </label></td>
                            <td><label>Route</label></td>
                            <td><label>Kilometer Car</label></td>
                            <td><label>Place Start</label></td>
                            <td><label>Place Come</label></td>
                            <td><label>Status</label></td>
                            <td colspan="3">Action</td>
                        </tr>
                    </thead>  
                    <tbody>
                        <c:forEach var="schedule" items="${listSchedule}">
                            <tr class="success">
                                <td>${schedule.scheduleId}</td>
                                <td>${schedule.route}</td>
                                <td>${schedule.kilometer}</td>
                                <td>${schedule.placeStart}</td>
                                <td>${schedule.placeCome}</td>
                                <td>${schedule.status}</td>
                                <td><a class="update" href="<c:url value="initScheduleDetail.htm?scheduleId=${schedule.scheduleId}" />" target="display">Xem chi tiết</a></td>
                                <td><a onclick="confirmDelete()" style="color: red" class="update" href="<c:url value="initAdminDeleteSchedule.htm?scheduleId=${schedule.scheduleId}" />">${delete}</a></td>
                            </tr> 
                        </c:forEach>
                    </tbody>
                </table>
            </section>
        </div>
        <script type="text/javascript" src="<c:url value='/resources/jQuery/style.js' />"></script>
    </body>
</html>

