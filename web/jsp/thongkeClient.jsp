<%-- 
    Document   : thongke2
    Created on : Nov 25, 2017, 4:26:28 PM
    Author     : THIEN-NVT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>car page</title>
        <link href="<c:url value="/resources/bootstrap/css/bootstrap.min.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/css/style.min.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/css/jquery-ui.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/css/skins/skin-blue.min.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/css/skins/_all-skins.min.css"/>" rel="stylesheet" type="text/css" />
        <link href="<c:url value="/resources/css/jquery.dataTables.min.css"/>" rel="stylesheet" type="text/css" />
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
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <jsp:include page="homeAdminClient_HeaderAndMenu.jsp"></jsp:include>
                <div class="content-wrapper">
                    <!-- Content Header (Page header) -->
                    <section class="content-header">
                        <h1>
                            Xe khách
                            <small>thông tin xe khách</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                            <li class="active">Quản lí xe khách</li>
                        </ol>
                    </section>
                    <section class="content-header">
                        <a class="btn btn-primary" href="<c:url value="initInsertCar.htm?companyId=${sessionScope.id}"/>">Thêm</a>
                </section>
                <section class="content">
                    <table style="float: left;padding-right: 30px;" border="1">
                        <thead>
                            <tr class="infor">
                                <th>Tên xe</th>
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
                    <div id="top_x_div" style="width: 300px; height: 300px;float: left;padding-left: 30px;"></div>
                </section>
                <!-- /.content -->
            </div>
            <!-- /.content-wrapper -->
            <jsp:include page="homeAdminClient_Footer.jsp"></jsp:include>
            </div>

            <!-- jQuery 2.2.3 -->
            <script type="text/javascript" src="<c:url value='/resources/jQuery/jquery.min.js' />"></script>
        <script type="text/javascript" src="<c:url value='/resources/jQuery/jquery-1.12.4.js' />"></script>
        <script type="text/javascript" src="<c:url value='/resources/jQuery/jquery-ui.js' />"></script>
        <script type="text/javascript" src="<c:url value='/resources/jQuery/style.js' />"></script>
        <!-- Bootstrap 3.3.6 -->
        <script type="text/javascript" src="<c:url value='/resources/bootstrap/js/bootstrap.min.js' />"></script>
        <script type="text/javascript" src="<c:url value='/resources/jQuery/app.min.js' />"></script>
        <script type="text/javascript" src="<c:url value='/resources/jQuery/jquery.dataTables.min.js' />"></script>
    </body>
</html>