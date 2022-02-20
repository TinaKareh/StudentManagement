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
        <title>Student Management |Institutions</title>

    </head>

    <body>
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
        <div class="container" style="margin-top: 100px;">
            <form action="${pageContext.request.contextPath}/add/institution" method="POST">
                <div class="form-group">
                    <label for="institution">Institution Name</label><span style="color: #0069d9;">*</span><br>
                    <input name="institution" class="form-control" type="text" id="institution" style="width: 60%;" placeholder="Enter Institution Name" required="">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-success btn-sm">Add Institution</button>
                </div>
            </form>
            <div class="card" >
                <div class="card-header">Institutions</div>
                <p id="demo" value="Already Added"></p>
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th style=" font-style: oblique;">Institution ID</th>
                            <th style=" font-style: oblique;">Institution Name</th>
                            <th style=" font-style: oblique;">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items = "${institutions}" var="report" >
                            <tr>
                                <td>${report.institutionId}</td>
                                <td>${report.institutionName}</td> 
                                <td><div class="dropdown">
                                        <button class="btn btn-success dropdown-toggle" type="button" data-toggle="dropdown">Action
                                            <span class="caret"></span></button>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/edit/institution?institutionId=${report.institutionId}">Edit</a></li>
                                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/delete/institution?institutionId=${report.institutionId}">Delete</a></li>
                                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/assign/course?institutionId=${report.institutionId}">Assign Course</a></li>
                                        </ul>
                                    </div></td>
                                <td> </td> 
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </body>
</html>
