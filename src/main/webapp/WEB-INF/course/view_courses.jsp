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
       
        <div class="container" style="margin-top: 50px;">
            <form action="${pageContext.request.contextPath}/add/course" method="POST">
                <div class="form-group">
                    <label for="institution">Course Name</label><span style="color: #0069d9;">*</span><br>
                    <input name="name" class="form-control" type="text" id="name" style="width: 60%;" placeholder="Enter Course Name" required="">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-success btn-sm">Add Course</button>
                </div>
            </form>
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
                            <td><a href="" class="btn btn-success btn-sm">Edit</a> <a href="${pageContext.request.contextPath}/delete/institution?institutionId=${course.courseId}" class="btn btn-danger btn-sm">Delete</a></td> 
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
