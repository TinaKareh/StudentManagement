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
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" type="text/css" media="screen" href="/resources/css/index.css" />
        <title>Institution | Profile</title>
    </head>
    <body>
        <div class="container" style="margin-top: 100px;">
            <nav class="navbar navbar-expand-sm bg-success navbar-dark fixed-top">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="${pageContext.request.contextPath}/view/institution">Institution</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/view/students">Student</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/view/course">Course</a>
                    </li>
                    <!--                <li class="nav-item">
                                        <a class="nav-link disabled" href="#">Disabled</a>
                                    </li>-->
                </ul>
            </nav>
            <div class="form-group">
                <a href="${pageContext.request.contextPath}/view/institution" class="btn btn-success btn-sm" style="position: absolute;
                   right: 20vw; width: 15%;">Back</a>
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
    </body>
</html>
