<%-- 
    Document   : thongke
    Created on : Nov 22, 2017, 1:29:18 AM
    Author     : THIEN-NVT
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
        <script type="text/javascript" src="<c:url value='/resources/jQuery/google-chart.js' />"></script>
        <script type="text/javascript">
            google.charts.load("current", {packages: ["corechart"]});
            google.charts.setOnLoadCallback(drawChart);
            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                ["Element", "Density", {role: "style"}],
                <c:if test="${not empty list_thongke}">
                    <c:forEach var="thongke" items="${list_thongke}">
                        ["${thongke.name}", ${thongke.totalPrice}, "color: blue"],
                    </c:forEach>
                </c:if>
                ]);

                var view = new google.visualization.DataView(data);
                view.setColumns([0, 1,
                    {calc: "stringify",
                        sourceColumn: 1,
                        type: "string",
                        role: "annotation"},
                    2]);

                var options = {
                    title: "Density of Precious Metals, in g/cm^3",
                    width: 600,
                    height: 400,
                    bar: {groupWidth: "95%"},
                    legend: {position: "none"},
                };
                var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
                chart.draw(view, options);
            }
        </script>
    <div id="barchart_values" style="width: 900px; height: 300px;"></div>
</head>
<body>
    <div class="center">
        <div>
            <p style="text-align: center;color: red;font-size: 20px;"><b>Biểu đồ thống kê</b></p>
        </div>
        <section style="float: left;padding-left: 50px;padding-right: 30px;padding-top: 30px;">
            <table style="float: left;padding-right: 30px;" border="1">
                <thead>
                    <tr class="infor">
                        <th>Tên nhà xe</th>
                        <th>Tổng số lượng vé</th>
                        <th>Tổng tiền vé</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="thongke" items="${list_thongke}">
                        <tr>
                            <td>${thongke.name}</td>
                            <td>${thongke.count}</td>
                            <td>${thongke.totalPrice} 00</td>
                        </tr> 
                    </c:forEach>
                </tbody>
            </table>
        </section>
        <div id="top_x_div" style="width: 600px; height: 600px;float: left;padding-top: 30px;"></div>
    </div>

    <script type="text/javascript" src="<c:url value='/resources/jQuery/style.js' />"></script>
</body>
</html>