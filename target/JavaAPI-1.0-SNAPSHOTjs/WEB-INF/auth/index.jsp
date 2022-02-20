  
<%-- 
    Document   : index
    Created on : Mar 19, 2019, 2:02:12 PM
    Author     : GraceTina
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
        <title>Student Management | Login</title>
    </head>
    <body>
        <div class ="container">
            <div class="login">
                <fieldset>
                    <legend style="margin-bottom: 40px; font-size: 30px; font-weight: 600;  color: #0069d9;">Log In</legend>
                    <form action="${pageContext.request.contextPath}/login" method="POST">
                        <div class="form-group">
                            <label for="email">Email Address</label><span style="color: #0069d9;">*</span><br>
                            <input name="email" class="form-control" type="email" id="email" style="width: 60%;" placeholder="Enter Email Address" required="">
                        </div>
                        <div class="form-group">
                            <label for="password">Password</label><span style="color: #0069d9;">*</span>
                            <input name="password" class="form-control" type="password" style="width: 60%;" id="password" placeholder="Enter Password" required="">
                        </div>
                        <button class="btn btn-primary btn-sm" style="width: 60%; " type="submit">Submit</button>
                    </form>
                </fieldset>
            </div>
        </div>
    </body>
</html>
