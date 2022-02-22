<%-- 
    Document   : assign_courses
    Created on : 18 Feb 2022, 08:44:38
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
        <title>Institution | Assign Courses</title>
    </head>
    <body>
        <div class="container" style="margin-top: 100px;">
            <c:if test="${param.success eq 0}">
                        <div class="alert alert-danger">Course already exists in the institution!</div>
            </c:if>
             <c:if test="${param.success eq 1}">
                        <div class="alert alert-success">Course added successfully.</div>
            </c:if> 
             <nav class="navbar navbar-expand-sm bg-success navbar-dark fixed-top justify-content-between">
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

            </ul>
                 <ul class="navbar-nav mr-2">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
                            ${user.firstName} ${user.lastName}
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Logout</a>
                            
                        </div>
                    </li>
            
                </ul>
        </nav>
                <div class="form-group">
                    <a href="${pageContext.request.contextPath}/view/institution" class="btn btn-success btn-sm" style="position: absolute;
    right: 20vw; width: 15%;">Back</a>
                </div>
            <fieldset style="margin-right: 100px;" >
                
                <legend style="font-size: 20px; font-weight: 600; margin-bottom:30px;">Add Course</legend>
                <div class="card">
                    <form action="${pageContext.request.contextPath}/assign/course" method="POST">
                        <div class="card-header">
                            <table>
                                <tr>
                                    <td align="left"><b>Institution:</b></td>
                                    <td>${institution.institutionName}</td>
                                </tr>

                            </table>
                        </div>
                        <div class="card-body">
                            <div class="form-group">
                                <label for="instId">Institution ID</label><span style="color: #0069d9;">*</span>
                                <input name="institutionId" class="form-control" type="text"  id="instId" value="${institution.institutionId}" required="">
                            </div>
                            <div class="form-group">
                                <label for="course">Add Courses</label><span style="color: #0069d9;">*</span><br>
                                <select name="course" class="form-control"  style="width: 100%;"><c:forEach items="${courses}" var="course">
                                        <option value="${course.courseId}">${course.courseName}</option>
                                    </c:forEach></select>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="form-group">
                                <button class="btn btn-success btn-sm"  type="submit" style="width: 30%; float: right;">Submit</button>
                            </div>
                        </div>
                    </form>
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
