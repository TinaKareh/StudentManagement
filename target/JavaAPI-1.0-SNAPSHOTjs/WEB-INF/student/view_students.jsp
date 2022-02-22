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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/css/index.css" />
        <script src="${pageContext.request.contextPath}/resources/index/index.js"></script>
        <title>Student Management |Student</title>


    </head>

    <body>
        <div class="container" style="margin-top: 100px;">

            <nav class="navbar navbar-expand-sm bg-success navbar-dark fixed-top justify-content-between">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/view/institution">Institution</a>
                    </li>
                    <li class="nav-item active">
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

            <c:if test="${param.success eq 1}">
                <div class="alert alert-success">Student added successfully.</div>
            </c:if> 
            <div class="row">

                <div class="col">
                    <button class="btn btn-success btn-sm mb-3" data-toggle="modal" data-target="#myModal">
                        Add Student
                    </button>               
                </div>
                <div class="col">
                    <input class="form-control mr-3" id="myInput" type="text" placeholder="Search..">
                </div>
            </div>
            <!-- The Modal -->
            <div class="modal fade" id="myModal">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">Add Student</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        <!-- Modal body -->
                        <div class="modal-body">
                            <form action="${pageContext.request.contextPath}/add/student" method="POST">
                                <div class="form-group">
                                    <label for="fname">First Name</label><span style="color: #0069d9;">*</span><br>
                                    <input name="fname" class="form-control" type="text" id="fname" placeholder="Enter First Name" required="">
                                </div>
                                <div class="form-group">
                                    <label for="lname">Middle Name</label><span style="color: #0069d9;">*</span><br>
                                    <input name="lname" class="form-control" type="text" id="lname"  placeholder="Enter Middle Name" required="">
                                </div>
                                <div class="form-group">
                                    <label for="uname"> Surname</label><span style="color: #0069d9;">*</span><br>
                                    <input name="uname" class="form-control" type="text" id="uname"  placeholder="Enter Surname" required="">
                                </div>
                                <div class="form-group">
                                    <label for="email">Student Identification Number</label><span style="color: #0069d9;">*</span><br>
                                    <input name="email" class="form-control" type="text" id="email"  placeholder="Enter Student ID" required="">
                                </div>
                                <div class="form-group">
                                    <label for="institution">Institution</label><span style="color: #0069d9;">*</span><br>
                                    <select name="institution" id="institution" class="form-control">
                                        <option value="">Select Institution</option>
                                        <c:forEach items="${institutions}" var="institution">
                                            <option value="${institution.institutionId}">${institution.institutionName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="course">Course</label><span style="color: #0069d9;">*</span><br>
                                    <select name="course" id="course" class="form-control">

                                    </select>
                                </div>

                                <button class="btn btn-success  mt-4 ml-1" style="width: 100%; " type="submit">Submit</button>
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
                <div class="card-header">Students</div>
                <p id="demo" value="Already Added"></p>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th style=" font-style: oblique;">Student ID</th>
                            <th style=" font-style: oblique;">First Name</th>
                            <th style=" font-style: oblique;">Middle Name</th>
                            <th style=" font-style: oblique;">Surname</th>
                            <th style=" font-style: oblique;">Course</th>
                            <th style=" font-style: oblique;">Institution</th>
                            <th style=" font-style: oblique;">Action</th>
                        </tr>
                    </thead>
                    <tbody id="course">
                        <c:forEach items = "${students}" var="report" >
                            <tr>
                                <td>${report.studentId}</td>
                                <td>${report.firstName}</td> 
                                <td>${report.middleName}</td>
                                <td>${report.surname}</td>
                                <td>${report.course.courseName}</td>
                                <td>${report.institution.institutionName}</td>
                                <td><div class="dropdown">
                                        <button class="btn btn-success dropdown-toggle" type="button" data-toggle="dropdown">Action
                                            <span class="caret"></span></button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/edit/student?studentId=${report.studentId}&amp;institutionId=${report.institution.institutionId}">Edit</a></li>
                                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/delete/institution?institutionId=${report.studentId}">Delete</a></li>
                                        </ul>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('#institution').change(function () {
                    $('#course').find('option').remove();
                    $('#course').append('<option>Select Course</option>');
                    let institutionId = $('#institution').val();
                    console.log(institutionId);
                    let data = {
                        id: institutionId
                    };
                    $.ajax({
                        url: "${pageContext.request.contextPath}/register/user",
                        method: "GET",
                        data: data,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            let obj = $.parseJSON(data);
                            $.each(obj, function (key, value) {
                                $('#course').append('<option value="' + value.course.courseId + '">' + value.course.courseName + '</option>')
                            });

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $('#course').append('<option>Course Unavailable</option>');
                        },
                        cache: false
                    });
                });

            });
        </script>
    </body>
</html>
