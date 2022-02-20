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
        <link rel="stylesheet" type="text/css" media="screen" href="/resources/css/index.css" />
        <title>Student Management |Student</title>


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
            <button type="button" class="btn btn-success btn-sm mb-3" data-toggle="modal" data-target="#myModal">
                Add Student
            </button>

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
                                    <select name="institution" class="form-control"  style="width: 100%;"><c:forEach items="${institutions}" var="institution">
                                            <option value="${institution.institutionId}">${institution.institutionName}</option>
                                        </c:forEach></select>
                                </div>

                                <button class="btn btn-success btn-sm" style="width: 100%;"  type="submit">Submit</button>
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
                            <th style=" font-style: oblique;">Institution</th>
                            <th style=" font-style: oblique;">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items = "${students}" var="report" >
                            <tr>
                                <td>${report.studentId}</td>
                                <td>${report.firstName}</td> 
                                <td>${report.middleName}</td>
                                <td>${report.surname}</td>
                                <td>${report.institution.institutionName}</td>
                                <td><div class="dropdown">
                                        <button class="btn btn-success dropdown-toggle" type="button" data-toggle="dropdown">Action
                                            <span class="caret"></span></button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/edit/student?studentId=${report.studentId}&institutionId=${report.institution.institutionId}">Edit</a></li>
                                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/delete/institution?institutionId=${report.studentId}">Delete</a></li>
                                            <li><a class="dropdown-item" href="#assignCourse" data-id="${report.institution.institutionId}">Assign Course</a></li>
                                        </ul>
                                    </div>
                                    <script>
                                        $('a[href$="#assignCourse"]').on("click", function () {
                                            var ids = $(this).data('id');
                                            $(".modal-body #idkl").val(ids);
                                            $('#assignModal').modal('show');
                                        });
                                    </script>
                                    <!-- The Modal -->
                                    <div class="modal fade" id="assignModal">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">

                                                <!-- Modal Header -->
                                                <div class="modal-header">
                                                    <h4 class="modal-title">Assign Course</h4>
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                </div>

                                                <!-- Modal body -->
                                                <div class="modal-body">
                                                    <input type="hidden" class="form-control" name="idkl" id="idkl" value="">
                                                    <form action="${pageContext.request.contextPath}/add/student" method="POST">
                                                        <div class="form-group">
                                                            <label for="institution">Course</label><span style="color: #0069d9;">*</span><br>
                                                            <select name="institution" class="form-control"  style="width: 100%;"><c:forEach items="${courses}" var="added">
                                                                    <option value="${added.course.courseId}">${added.course.courseName}</option>
                                                                </c:forEach></select>
                                                        </div>

                                                        <button class="btn btn-success btn-sm" style="width: 100%;"  type="submit">Submit</button>
                                                    </form>
                                                </div>

                                                <!-- Modal footer -->
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </td>

                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
