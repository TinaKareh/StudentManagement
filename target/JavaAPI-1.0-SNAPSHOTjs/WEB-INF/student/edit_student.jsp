<%-- 
    Document   : edit_student
    Created on : 18 Feb 2022, 08:47:55
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
        <title>Student Management |Edit Student</title>
    </head>
    <body>
        <script>
            $(document).ready(function () {
                $('#stitution').change(function () {
                    $('#uni').find('option').remove();
                    $('#uni').append('<option>Select Course</option>');
                    let institutionId = $('#stitution').val();
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
                                $('#uni').append('<option value="' + value.course.courseId + '">' + value.course.courseName + '</option>')
                            });

                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            $('#uni').append('<option>Course Unavailable</option>');
                        },
                        cache: false
                    });
                });

            });
        </script>
        <div class="container" style="margin-top: 100px;">
            <nav class="navbar navbar-expand-sm bg-success navbar-dark fixed-top justify-content-between">
                <ul class="navbar-nav">
                    <li class="nav-item active">
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
            <div class="form-group">
                <a href="${pageContext.request.contextPath}/view/students" class="btn btn-success btn-sm" style="position: absolute;
                   right: 20vw; width: 15%;">Back</a>
            </div>
            <fieldset class="ml-5" >
                <div class="card">
                    <form action="${pageContext.request.contextPath}/edit/student" method="POST">
                        <div class="card-header"><i class="fa fa-home">Edit Student</i></div>
                        <div class="card-body">
                            <table class="mb-3" id="table">
                                <tr>
                                    <td><b>Full Name:</b></td>
                                    <td class="table_row">${student.firstName} ${student.middleName} ${student.surname}</td>
                                    <td><b>Course:</b></td>
                                    <td class="table_row">${student.course.courseName}</td>
                                    <td><b>Institution:</b></td>
                                    <td class="table_row">${student.institution.institutionName}</td>
                                </tr>

                            </table>
                            <div class="row">
                                <div class="col">
                                    <label for="fname">First Name</label><span>*</span><br>
                                    <input name="fname" class="form-control" value="${student.firstName}" type="text" id="fname" placeholder="Enter First Name" required="">
                                    <input hidden name="student" class="form-control" value="${student.studentId}"  type="text" id="institution"  placeholder="Enter Student ID" required="">
                                </div>
                                <div class="col">
                                    <label for="lname">Middle Name</label><span>*</span><br>
                                    <input name="lname" class="form-control" value="${student.middleName}"  type="text" id="lname"  placeholder="Enter Middle Name" required="">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col">
                                    <label for="uname"> Surname</label><span>*</span><br>
                                    <input name="uname" class="form-control" value="${student.surname}"  type="text" id="uname"  placeholder="Enter Surname" required="">
                                    <input hidden name="inst" class="form-control" value="${student.institution.institutionId}"  type="text" id="inst"  placeholder="Enter Student ID" required="">

                                </div>
                                <div class="col">
                                    <label for="course">Course</label><span>*</span><br>
                                    <select name="course" class="form-control"  style="width: 100%;">
                                        <c:forEach items="${courses}" var="added">
                                            <option value="${added.course.courseId}" ${added.course.courseId == student.course.courseId ? 'selected="selected"' : ''}>${added.course.courseName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer mt-3"> 
                            <button class="btn btn-success"  type="submit" style="width: 30%">Edit</button>
                        </div>
                    </form>
                </div>
                <div class="mt-3"> 
                    <fieldset>
                        <div class="card" >
                            <form action="${pageContext.request.contextPath}/transfer/student" method="POST">
                                <div class="card-header"><i class="fa fa-home">Transfer University</i></div>
                                <div class="card-body">
                                    <div class="row">
                                        <div class="col">
                                            <label for="stitution">Institution</label><span>*</span><br>
                                            <input hidden name="student" class="form-control" value="${student.studentId}"  type="text" id="institution"  placeholder="Enter Student ID" required="">
                                            <select name="stitution" id="stitution" class="form-control">
                                                <option value="">Select Institution</option>
                                                <c:forEach items="${institutions}" var="institution">
                                                    <option value="${institution.institutionId}">${institution.institutionName}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="col">
                                            <label for="uni">Course</label><span>*</span><br>
                                            <select name="uni" id="uni" class="form-control">

                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-footer"> 
                                    <button class="btn btn-success"  type="submit" style="width: 30%">Transfer</button>
                                </div>
                            </form>
                        </div>
                    </fieldset>
                </div>
            </fieldset>
        </div>

    </body>
</html>
