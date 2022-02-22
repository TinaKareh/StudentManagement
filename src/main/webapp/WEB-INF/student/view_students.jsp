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
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/index/style.css" />
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/font-awesome-line-awesome/css/all.min.css">
        <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
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
                    <li>
                        <a href="${pageContext.request.contextPath}/view/institution"><span class="fas fa-university"></span> <span>Institutions</span></a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/view/course"><span class="fas fa-book-open"></span> <span>Courses</span></a>

                    </li>
                    <li  class="active">
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
                <c:if test="${param.success eq 1}">
                    <div class="alert alert-success">Student added successfully.</div>
                </c:if> 
                     <c:if test="${param.deleted eq 1}">
                    <div class="alert alert-success">Student deleted successfully.</div>
                </c:if> 
                     <c:if test="${param.edited eq 1}">
                    <div class="alert alert-success">Student details edited successfully.</div>
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
                                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/delete/student?institutionId=${report.studentId}">Delete</a></li>
                                            </ul>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <script>
            $(document).ready(function () {
                $('#sidebarCollapse').on('click', function () {
                    $('#sidebar').toggleClass('active');
                });
            });

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
