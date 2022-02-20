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
                        <fieldset style="margin-right: 200px;" >
            <div class="card">
                <form action="${pageContext.request.contextPath}/edit/institution" method="POST">

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
                                <input name="instId" class="form-control" type="text"  id="instId" value="${institution.institutionId}" required="">
                            </div>
                        <div class="form-group">
                            <label for="institution">Institution ID</label><span style="color: #0069d9;">*</span>
                            <input name="institution" class="form-control" type="text"  id="institution" value="${institution.institutionName}" required="">
                        </div>
                        <div class="card-footer"> 
                                <button class="btn btn-success btn-sm"  type="submit" style="width: 20%; float: right;">Submit</button>
                        </div>
                </form>

            </div>
        </div>
                        </fieldset>
    </div>
                        
    
</div>
</body>
</html>
