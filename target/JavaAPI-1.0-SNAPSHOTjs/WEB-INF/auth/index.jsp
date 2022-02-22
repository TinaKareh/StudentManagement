  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
    Document   : index
    Created on : 18 Feb 2022, 08:45:10
    Author     : Futuristic Ltd
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.request.contextPath}/resources/css/index.css" />
        <title>Student Management | Login</title>
    </head>
    <body style="display: grid; place-items: center;min-height: 100vh; position: relative">
        <div class ="container" style="position: relative; min-height: 80%;min-width: 60%; display: grid; place-items:center">
            <div class="login" style="
                 position: relative;
                 min-width: 100%;
                 margin-left: auto;
                 transform: translateX(25%);
                 ">
                <fieldset>
                    <legend style="margin-bottom: 40px; font-size: 30px; font-weight: 600;">Log In</legend>
                    <c:if test="${param.success eq 0}">
                        <div class="alert alert-danger">Wrong username or password.Please try again</div>
                    </c:if>
                    <form action="${pageContext.request.contextPath}/login" method="POST">
                        <div class="form-group">
                            <label for="email">Email Address</label><span style="color: #0069d9;">*</span><br>
                            <input name="email" class="form-control" type="email" id="email" style="width: 60%;" placeholder="Enter Email Address" required="">
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label><span style="color: #0069d9;">*</span>
                            <input name="password" class="form-control" type="password" style="width: 60%;" id="password" placeholder="Enter Password" required="">
                        </div>
                        <button class="btn btn-success btn-sm" style="width: 60%; " type="submit">Submit</button>
                    </form>
                </fieldset>
            </div>
        </div>
    </body>
</html>
