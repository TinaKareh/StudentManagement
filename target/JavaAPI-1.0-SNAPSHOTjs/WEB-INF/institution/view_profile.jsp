<%-- 
    Document   : view_profile
    Created on : 21 Feb 2022, 08:29:44
    Author     : Futuristic Ltd
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/index/style.css" />
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/font-awesome-line-awesome/css/all.min.css">
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" type="text/css" media="screen" href="/resources/css/index.css" />
        <title>Institution | Profile</title>
    </head>
    <body>
        <div class="wrapper">
            <!-- Sidebar  -->
            <nav id="sidebar">
                <div class="sidebar-header">
                    <h3><span class="lab la-accusoft"></span><span>Zeraki</span></h3>
                </div>

                <ul class="list-unstyled components">
                    <li>
                        <a href="${pageContext.request.contextPath}/dashboard"><span class="fas fa-chart-bar"></span> <span>Dashboard</span></a>

                    </li>
                    <li class="active">
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

                <div class="form-group">
                    <a href="${pageContext.request.contextPath}/view/institution" class="btn btn-success btn-sm" style="position: absolute;
                       right: 10vw; width: 15%;">Back</a>
                </div>
                <fieldset style="margin-right: 100px;" >

                    <legend style="font-size: 20px; font-weight: 600; margin-bottom:30px;">${institution.institutionName}</legend>
                    <div class="card">
                        <div class="card-header">Students:</div>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th style=" font-style: oblique;">Student ID</th>
                                    <th style=" font-style: oblique;">First Name</th>
                                    <th style=" font-style: oblique;">Middle Name</th>
                                    <th style=" font-style: oblique;">Surname</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items = "${students}" var="report" >
                                    <tr>
                                        <td>${report.studentId}</td>
                                        <td>${report.firstName}</td> 
                                        <td>${report.middleName}</td>
                                        <td>${report.surname}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div><br>
                    <div class="card">
                        <div class="card-header">Courses:</div>
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th style="font-style: oblique;">Course ID:</th>
                                    <th style=" font-style: oblique;">Course Name</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items = "${addedCourses}" var="added" >
                                    <tr>
                                        <td>${added.course.courseId}</td>
                                        <td>${added.course.courseName}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </fieldset>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('#sidebarCollapse').on('click', function () {
                    $('#sidebar').toggleClass('active');
                });
            });
        </script>
    </body>
</html>
