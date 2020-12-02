<%
     User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("warning", "Sorry, You are not logged in, do Login first !");
        response.sendRedirect("login.jsp");
        return;
    }else{
    
    }
    
    
    %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/metaport.jsp" %>
        <title>Checkout</title> 
        <%@include file="components/common_css_js.jsp" %>

    </head>
    <body>
        <%@include file="components/navbar.jsp" %>

        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <div class="card mt-4 border-custom">
                        <div class="card-body">
                            <div class="container text-center">
                                <img style="max-height: 100px" src="image/SEO_and_Internet_Marketing-50-512.png" class="img-fluid" alt="Responsive image">
                            </div>
                            <h3 class="text-center mb-3 text-color-primary">Your Selected Items</h3>
                            <div class="cart-body">
                            </div>
                        </div>

                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card mt-4 border-custom">
                        <div class="card-body">
                            <div class="container text-center">
                                <img style="max-height: 100px" src="image/boy-pushing-shopping-cart-831.jpg" class="img-fluid" alt="Responsive image">
                            </div>
                            <h3 class="text-center mb-3 text-color-primary">Your Shipping Address</h3>

                            <form action="#" method="post">
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input type="email" class="form-control" id="email" value="<%= user.getUserEmail() %>" aria-describedby="emailHelp" placeholder="Enter email" required>
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Your Full Name</label>
                                    <input type="text" class="form-control" id="name" value="<%= user.getUserName() %>" aria-describedby="emailHelp" placeholder="Enter name" required>
                                </div> 
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Contact no:</label>
                                    <input type="number" class="form-control" id="phone" value="<%= user.getUserPhone() %>" aria-describedby="emailHelp" placeholder="Enter your phone no." required>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Alternate contact no:</label>
                                    <input type="number" class="form-control" id="AltPhone"  aria-describedby="emailHelp" placeholder="Enter your phone no." >
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Complete Address</label>
                                    <textarea style="height: 100px" class="form-control" id="address"  placeholder="Enter Address" required><%= user.getUserAddress() %></textarea>
                                </div>
                                <div class="container text-center">
                                    <button type="submit" class="btn btn-outline-success">Place Order</button>
                                    <button class="btn btn-primary ml-4"><a href="index.jsp" class="text-white">Continue Shopping <span class="fa fa-arrow-right"span></span></a></button>

                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>






        <%@include file="components/common_modals.jsp" %>

        <!--javascript of bootstrps-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <!--script for slides-->
        <script src="js/script.js"></script>
    </body>
</html>
