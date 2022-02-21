<%-- 
    Document   : view_institutions
    Created on : 18 Feb 2022, 08:45:10
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
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/css/index.css" />
        <title>Student Management |Courses</title>

    </head>
    <body>

        <div class="container" style="margin-top: 100px;">
            <nav class="navbar navbar-expand-sm bg-success navbar-dark fixed-top">
                <ul class="navbar-nav">
                    <li class="nav-item ">
                        <a class="nav-link" href="${pageContext.request.contextPath}/view/institution">Institution</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/view/students">Student</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="${pageContext.request.contextPath}/view/course">Course</a>
                    </li>
                    <!--                <li class="nav-item">
                                        <a class="nav-link disabled" href="#">Disabled</a>
                                    </li>-->
                </ul>
            </nav>
            <div class="row">
                <div class="col">
                    <button type="button" class="btn btn-success btn-sm mb-3" data-toggle="modal" data-target="#myModal">
                        Add Course
                    </button>                </div>
                <div class="col">
                    <input class="form-control mr-3" id="myInput" type="text" placeholder="Search..">
                </div>
            </div>
            <div class="modal fade" id="myModal">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Add Course</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body">
                            <form action="${pageContext.request.contextPath}/add/course" method="POST">
                                <div class="form-group">
                                    <label for="institution">Course Name</label><span style="color: #0069d9;">*</span><br>
                                    <input name="name" class="form-control" type="text" id="name"  placeholder="Enter Course Name" required="">
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn-success btn-sm" style="width: 100%;">Add Course</button>
                                </div>
                            </form>
                        </div>

                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </div>
            </div>

            <div class="card" >
                <div class="card-header">Courses</div>
                <p id="demo" value="Already Added"></p>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th style=" font-style: oblique;">Course ID</th>
                            <th style=" font-style: oblique;">Course Name</th>
                            <th style=" font-style: oblique;">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items = "${courses}" var="course" >
                            <tr>
                                <td>${course.courseId}</td>
                                <td>${course.courseName}</td> 
                                <td><div class="dropdown">
                                        <button class="btn btn-success dropdown-toggle" type="button" data-toggle="dropdown">Action
                                            <span class="caret"></span></button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/edit/course?institutionId=${course.courseId}">Edit</a></li>
                                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/delete/institution?institutionId=${course.courseId}">Delete</a></li>

                                        </ul>
                                    </div></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
