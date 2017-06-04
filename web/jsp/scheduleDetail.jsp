<%-- 
    Document   : scheduleDetail
    Created on : May 1, 2017, 8:48:17 PM
    Author     : NGUYEN VAN THIEN
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detial schedule</title>
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>">
        <link rel="stylesheet" href="<c:url value= "/resources/font-awesome/css/font-awesome.min.css"/>"" rel="stylesheet" type="text/css">
    </head>
    <body>
        <div class="center">
            <input class="btn btnBack" type="button" name="Back" value="Back" onclick="history.go(-1)">
            <section class="section_Content">
                <s:form action="" commandName="schedule" method="GET">
                    <table border="1">
                        <tr>
                            <td colspan="2" class="thongtin">THÔNG TIN CHI TIẾT LỊCH TRÌNH</td>
                        </tr>
                        <tr>
                            <th>ID</th>
                            <td><s:input path="scheduleId" readonly="true" class="form_td"/></td>
                        </tr>
                        <tr>
                            <th>Route</th>
                            <td><s:input path="route" readonly="true" class="form_td"/></td>
                        </tr>
                        <tr>
                            <th>Kilometer</th>
                            <td><s:input path="kilometer" readonly="true" class="form_td"/></td>
                        </tr>
                        <tr>
                            <th>Place start</th>
                            <td><s:input path="placeStart" readonly="true" class="form_td"/></td>
                        </tr>
                        <tr>
                            <th>Place Come</th>
                            <td><s:input path="placeCome" readonly="true" class="form_td"/></td>
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
                        <tr>
                            <th>Note</th>
                            <td><s:input path="note" readonly="true" class="form_td"/></td>
                        </tr>
                    </s:form>
                </table>
            </section>
        </div>
    </body>
</html>