<%-- 
  Document   : add_user
  Created on : 18 Feb 2022, 08:45:10
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
        <title>Student Management | Add Users</title>
    </head>
    <body>
        <div class ="container">
            <div class="login">
                <legend class="mt-4" style="font-size: 30px; font-weight: 600;">Register</legend>
                <form action="${pageContext.request.contextPath}/add/user" method="POST">
                    <div class="row">
                        <div class="col">
                            <label for="fname" class="mr-sm-2">First Name</label><span style="color: #0069d9;">*</span><br>
                            <input name="fname" class="form-control " type="text" id="fname" placeholder="Enter First Name" required="">
                        </div>
                        <div class="col">
                            <label for="lname" class="mr-sm-2">Last Name</label><span style="color: #0069d9;">*</span><br>
                            <input name="lname" class="form-control " type="text" id="lname" placeholder="Enter Last Name" required="">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col">
                            <label for="uname" class="mr-sm-2">User Name</label><span style="color: #0069d9;">*</span><br>
                            <input name="uname" class="form-control" type="text" id="uname" placeholder="Enter User Name" required="">
                        </div>
                        <div class="col">
                            <label for="email" class="mr-sm-2">Email Address</label><span style="color: #0069d9;">*</span><br>
                            <input name="email" class="form-control" type="email" id="email"  placeholder="Enter Email Address" required="">
                        </div>
                    </div>
                    <div class="row mt-3">
                        <div class="col">
                            <label for="phone" class="mr-sm-2">Phone Number</label><span style="color: #0069d9;">*</span><br>
                            <input name="phone" class="form-control b-2 mr-sm-2" type="text" id="phone" placeholder="Enter Phone Number" required="">
                        </div>
                        <div class="col">
                            <label for="password" class="mr-sm-2">Password</label><span style="color: #0069d9;">*</span>
                            <input name="password" class="form-control" type="password"  id="password" placeholder="Enter Password" required="">
                        </div>
                        
                    </div>
                    <div class="row mt-3" >
                       <div class="col">
                            <label for="confirmPass" class="mr-sm-2">Confirm Password</label><span style="color: #0069d9;">*</span>
                            <input name="confirmPass" class="form-control " type="password"  id="confirmPass" placeholder="Confirm Password" required="">
                        </div>
                        
                    </div>
                    <button class="btn btn-success  mt-4 ml-1" style="width: 60%; " type="submit">Submit</button>

                </form>
            </div>
        </div>
    </body>
</html>
