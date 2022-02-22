<%-- 
    Document   : dashboard
    Created on : 18 Feb 2022, 08:42:21
    Author     : Futuristic Ltd
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/font-awesome-line-awesome/css/all.min.css">
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/amcharts/3.21.15/amcharts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/amcharts/3.21.15/serial.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/amcharts/3.21.15/light.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/amcharts/3.21.15/plugins/dataloader/dataloader.min.js"></script>
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/index/style.css" />
        <title>Student Management | Dashboard</title>
    </head>
    <body>
        <div class="wrapper">
            <!-- Sidebar  -->
            <nav id="sidebar">
                <div class="sidebar-header">
                    <h3><span class="lab la-accusoft"></span><span>Zeraki</span></h3>
                </div>

                <ul class="list-unstyled components">
                    <li class="active">
                        <a href="${pageContext.request.contextPath}/dashboard"><span class="fas fa-chart-bar"></span> <span>Dashboard</span></a>

                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/view/institution"><span class="fas fa-university"></span> <span>Institutions</span></a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/view/course"><span class="fas fa-book-open"></span> <span>Courses</span></a>

                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/view/students"><span class="fas fa-user"></span> <span>Students</span></a>
                    </li>
                </ul>

            </nav>
            <div id="content">

                <nav class="navbar navbar-expand-lg navbar-light bg-light">
                    <div class="container-fluid">

                        <button type="button" id="sidebarCollapse" class="btn btn-success">
                            <i class="fas fa-align-left"></i>

                        </button>
                        <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <i class="fas fa-align-justify"></i>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="nav navbar-nav ml-auto">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                                        ${user.firstName} ${user.lastName}
                                    </a>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Logout</a>

                                    </div>
                                </li>

                            </ul>
                        </div>
                    </div>
                </nav>
                <div class="card-columns">
                    <div class="card ">
                        <div class="card-body text-center">
                            <h4 class="card-title text-success">Total Institutions</h4>
                            <span class="fas fa-university"></span><h3>${institutions}</h3>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body text-center">
                            <h4 class="card-title text-success">Total Courses</h4>
                            <span class="fas fa-book-open"></span><h3>${courses}</h3>
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-body text-center">
                            <h4 class="card-title text-success">Total Students</h4>
                            <span class="fas fa-user"></span><h3>${students}</h3>
                        </div>
                    </div>
                </div>
                <div class="mt-3">
                    <div id="chartdiv" style="
                         height		: 360px;
                         font-size	: 11px;">

                    </div>
                </div>
                <div>
                    <div id="chartdiv_course" style="
                         height		: 360px;
                         font-size	: 11px;">

                    </div>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            $(document).ready(function () {
            $('#sidebarCollapse').on('click', function () {
            $('#sidebar').toggleClass('active');
            });
            
            
            var chart = AmCharts.makeChart("chartdiv", {
            "type": "serial",
                    "theme": "light",
                    "titles": [{
                    "text": "Total Students per Institution"
                    },
                    {
                    "text": '',
                            "bold": false
                    }],
                    "dataProvider": [
            <c:forEach items="${graphs}" var="item">
                    {
                    institution: "${item[0]}",
                            student: "${item[1]}"
                    },
            </c:forEach>
                    ],
                    "gridAboveGraphs": true,
                    "graphs": [
                    {
                    "balloonText": "Total Students:[[value]]",
                            "fillAlphas": 0.9,
                            "id": "AmGraph-2",
                            "lineAlpha": 0.2,
                            "title": "Total Students",
                            "type": "column",
                            "valueField": "student"
                    }, ],
                    "chartCursor": {
                    "categoryBalloonEnabled": false,
                            "cursorAlpha": 0,
                            "zoomable": true
                    },
                    "categoryField": "institution",
//                    "categoryAxis": {
//                    // ... other category axis settings
//                    "labelRotation": 90
//                    },
                    "export": {
                    "enabled": true,
                            "fileName": "Total Students per Institution"
                    }
            });
            });
        </script>
        <script>
            $(document).ready(function () {
             AmCharts.makeChart("chartdiv_course", {
                    "type": "serial",
                    "theme": "light",
                    "titles": [{
                    "text": "Total Courses per Institution"
                    },
                    {
                    "text": '',
                            "bold": false
                    }],
                    "dataProvider": [
            <c:forEach items="${totals}" var="item">
                    {
                    institution: "${item[0]}",
                            course: "${item[1]}"
                    },
            </c:forEach>
                    ],
                    "gridAboveGraphs": true,
                    "graphs": [
                    {
                    "balloonText": "Total Courses:[[value]]",
                            "fillAlphas": 0.9,
                            "id": "AmGraph-2",
                            "lineAlpha": 0.2,
                            "title": "Total Courses",
                            "type": "column",
                            "valueField": "course"
                    }, ],
                    "chartCursor": {
                    "categoryBalloonEnabled": false,
                            "cursorAlpha": 0,
                            "zoomable": true
                    },
                    "categoryField": "institution",
//                    "categoryAxis": {
//                    // ... other category axis settings
//                    "labelRotation": 90
//                    },
                    "export": {
                    "enabled": true,
                    "fileName": "Total Courses per Institution"
                    }
            });
            });
        </script>
    </body>
</html>
