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
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/css/index.css" />
        <script src="${pageContext.request.contextPath}/resources/index/index.js"></script>
        <title>Student Management |Institutions</title>

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
                    <li class="active">
                        <a href="${pageContext.request.contextPath}/view/institution"><span class="fas fa-university"></span> <span>Institutions</span></a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/view/course"><span class="fas fa-book-open"></span> <span>Courses</span></a>

                    </li>
                    <li>
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
                <c:if test="${param.success eq 0}">
                    <div class="alert alert-danger">Institution already exists!</div>
                </c:if>
                <c:if test="${param.success eq 1}">
                    <div class="alert alert-success">Institution added successfully.</div>
                </c:if>
                <c:if test="${param.edited eq 0}">
                    <div class="alert alert-danger">Institution with the name already exists!</div>
                </c:if>
                <c:if test="${param.edited eq 1}">
                    <div class="alert alert-success">Institution edited successfully.</div>
                </c:if> 
                <c:if test="${param.deleted eq 0}">
                    <div class="alert alert-danger">Institution can't be deleted!</div>
                </c:if>
                <c:if test="${param.deleted eq 1}">
                    <div class="alert alert-success">Institution deleted successfully.</div>
                </c:if> 
                <div class="row">
                    <div class="col">
                        <button type="button" class="btn btn-success btn-sm mb-3" data-toggle="modal" data-target="#myModal">
                            Add Institution
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
                                <h4 class="modal-title">Add Institution</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">
                                <form action="${pageContext.request.contextPath}/add/institution" method="POST">
                                    <div class="form-group">
                                        <label for="institution">Institution Name</label><span style="color: #0069d9;">*</span><br>
                                        <input name="institution" class="form-control" type="text" id="institution"  placeholder="Enter Institution Name" required="">
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-success btn-sm" style="width: 100%;">Add Institution</button>
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
                    <div class="card-header">Institutions</div>
                    <p id="demo" value="Already Added"></p>
                    <table class="table table-striped" id="myTable">
                        <thead>
                            <tr>
                                <th style=" font-style: oblique;">Institution ID</th>
                                <th style=" font-style: oblique;" onclick="sortTable(1)">Institution Name</th>
                                <th style=" font-style: oblique;" >Action</th>
                            </tr>
                        </thead>
                        <tbody id="course">
                            <c:forEach items = "${institutions}" var="report" >
                                <tr>
                                    <td>${report.institutionId}</td>
                                    <td>${report.institutionName}</td> 
                                    <td><div class="dropdown">
                                            <button class="btn btn-success dropdown-toggle" type="button" data-toggle="dropdown">Action
                                                <span class="caret"></span></button>
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/view/institution/profile?institutionId=${report.institutionId}">View</a></li>
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
        </div>
        <script>
            $(document).ready(function () {
                $('#sidebarCollapse').on('click', function () {
                    $('#sidebar').toggleClass('active');
                });
            });
        </script>
    </body>
</html>
