<%-- 
    Document   : edit_student
    Created on : 18 Feb 2022, 08:47:55
    Author     : Futuristic Ltd
--%>

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
        <title>Student Management |Edit Student</title>
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
            <div class="card">
                <form action="${pageContext.request.contextPath}/edit/student" method="POST">
                    <div class="card-header">
                         <table>
                            <tr>
                                <td><b>Full Name:</b></td>
                                <td class="table_row">${student.firstName} ${student.middleName}</td>
                            </tr>

                            <tr>
                                <td><b> Surname:</b></td>
                                <td class="table_row">${student.surname}</td>
                            </tr>

                            <tr>
                                <td><b>Institution:</b></td>
                                <td class="table_row">${student.institution.institutionName}</td>
                            </tr>

                        </table>
                    </div>
                    <div class="card-body">
                       <div class="form-group">
                                    <label for="fname">First Name</label><span style="color: #0069d9;">*</span><br>
                                    <input name="fname" class="form-control" value="${student.firstName}" type="text" id="fname" placeholder="Enter First Name" required="">
                                </div>
                                <div class="form-group">
                                    <label for="lname">Middle Name</label><span style="color: #0069d9;">*</span><br>
                                    <input name="lname" class="form-control" value="${student.middleName}"  type="text" id="lname"  placeholder="Enter Middle Name" required="">
                                </div>
                                <div class="form-group">
                                    <label for="uname"> Surname</label><span style="color: #0069d9;">*</span><br>
                                    <input name="uname" class="form-control" value="${student.surname}"  type="text" id="uname"  placeholder="Enter Surname" required="">
                                </div>
                              <div class="form-group">
                                    <input hidden name="institution" class="form-control" value="${student.institution.institutionId}"  type="text" id="institution"  placeholder="Enter Student ID" required="">
                                </div>
                                <div class="form-group">
                                    <input hidden name="student" class="form-control" value="${student.studentId}"  type="text" id="institution"  placeholder="Enter Student ID" required="">
                                </div>
<!--                                <div class="form-group">
                                    <label for="course">Course</label><span style="color: #0069d9;">*</span><br>
                                    <select name="course" class="form-control"  style="width: 100%;"><c:forEach items="${courses}" var="added">
                                            <option value="${added.course.courseId}">${added.course.courseName}</option>
                                        </c:forEach></select>
                                </div>-->
                        <div class="card-footer"> 
                                <button class="btn btn-success btn-sm"  type="submit" style="width: 20%; float: right;">Submit</button>
                        </div>
                    </div>
                </form>
                        </div>
                        <div class="" style="margin-top: 50px; margin-right: 50px; margin-left: 600px;"> 
                            <fieldset>
<!--
                                <div class="card" style=" ">
                                    <div class="card-header"><i class="fa fa-home">Education</i></div>
                                    <div class="card-body">
                                        <table class="table">
                                            <c:forEach items="${educations}" var="education">
                                                <h1 style="font-size: 20px;">${education.degree}</h1>
                                                <h8>${education.country}</h8>
                                                <p>${education.startYear} - ${education.endYear}</p>
                                            </c:forEach>
                                        </table>
                                    </div>
                                    <div class="card-footer"> 
                                        <a href="/freelancer/education" class="btn btn-sm btn-primary" style="float: right;"  >+ Education</a>
                                    </div>
                                </div>-->
                              
                               
                            </fieldset>
                        </div>
                        </div>
                        </body>
                        </html>
