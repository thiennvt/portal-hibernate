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
            google.charts.load('current', {'packages': ['bar']});
            google.charts.setOnLoadCallback(drawStuff);

            function drawStuff() {
                var data = new google.visualization.arrayToDataTable([
                ['Tên hãng xe', 'Số lượng vé'],
            <c:if test="${not empty list_thongke}">
                <c:forEach var="thongke" items="${list_thongke}">
                ["${thongke.name}", ${thongke.count}],
                </c:forEach>
            </c:if>

                ]);

                var options = {
                    title: 'Biểu đồ thống kê lượng khách của nhà xe',
                    width: 700,
                    legend: {position: 'none'},
                    chart: {title: 'Biểu đồ thống kê lượng khách của nhà xe',
                        subtitle: 'Số lượng vé của từng hãng xe'},
                    bars: 'horizontal', // Required for Material Bar Charts.
                    axes: {
                        x: {
                            0: {side: 'top', label: 'Số lượng vé'} // Top x-axis.
                        }
                    },
                    bar: {groupWidth: "90%"}
                };
                var chart = new google.charts.Bar(document.getElementById('top_x_div'));
                chart.draw(data, options);
            }
            ;
        </script>
    </head>
    <body>
        <div class="center">
            <div>
                <p style="text-align: center;color: red;font-size: 20px;"><b>Biểu đồ thống kê</b></p>
            </div>
            <section style="float: left;padding-left: 50px;padding-right: 30px;padding-top: 30px;">
                <table border="1">
                    <thead>
                        <tr class="infor">
                            <th>Tên nhà xe</th>
                            <th>Tổng số lượng vé</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="thongke" items="${list_thongke}">
                            <tr>
                                <td>${thongke.name}</td>
                                <td>${thongke.count}</td>
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