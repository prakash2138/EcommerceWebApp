<%-- 
    Document   : login
    Created on : 10 Jun, 2020, 11:21:38 PM
    Author     : Anshu Sony
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/metaport.jsp" %>
        <title>MyCart-Login</title>
        <%@include file="components/common_css_js.jsp" %>
    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container-fluid">
            <div class="row mt-3">
                <div class="col-md-4 offset-md-4">
                    <div class="card border-custom">
                        <div class="card-header custom-bg text-white">
                            <div class="container text-center ">
                                <img style="max-height: 100px" src="image/login.png" class="img-fluid" alt="Responsive image">
                                <h3 class="text-center">Login Here !</h3>
                            </div>
                        </div>
                        <div class="card-body">
                            <%@include file="components/warning.jsp" %>
                            <form action="LoginServlet" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>
                                <a href="register.jsp">if not registerd click here</a>
                                <div class="container text-center mt-3">
                                    <button type="submit" class="btn btn-outline-success custom-bg text-white mr-2">Submit</button>
                                    <button type="reset" class="btn btn-outline-warning custom-bg text-white ml-2">Reset</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>



            <!--javascript of bootstrps-->
            <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
            <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    </body>
</html>
