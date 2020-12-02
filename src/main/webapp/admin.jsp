<%@page import="java.util.Map"%>
<%@page import="com.learn.mycart.helper.HelperDao"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>

<%  CategoryDao catdao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = catdao.getCategories();
    
//    get counts
    HelperDao hdao=new HelperDao();
    Map<String, Long> m=hdao.getCounts(FactoryProvider.getFactory());
%>

<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("warning", "Sorry, You are not logged in, do Login first !");
        response.sendRedirect("login.jsp");
        return;
    } else if (user.getUserType().equals("normal")) {
        session.setAttribute("warning", "You are not an Admin ! you can not access this page..");
        response.sendRedirect("login.jsp");
        return;
    }

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/metaport.jsp" %>
        <title>Admin Pannel</title>
        <%@include file="components/common_css_js.jsp" %>

    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <div class="container mt-2">
            <%@include file="components/message.jsp" %>
            <%@include file="components/warning.jsp" %>
        </div>
        <div class="container admin my-3">
            <!--first row-->
            <div class="row mt-4">
                <!--first row first column--> 
                <div class="col-md-4">
                    <div class="card border-custom card">
                        <div class="card-body">
                            <div class="container text-center ">
                                <img style="max-height: 125px" src="image/man.png" class="img-fluid" alt="Responsive image">
                                <h2 class="text-center mt-1"><%= m.get("userCount") %></h2>
                                <h2 class="text-center">Users</h2>
                            </div>
                        </div>

                    </div>
                </div> 
                <!--first row second column-->
                <div class="col-md-4">
                    <div class="card border-custom">
                        <div class="card-body">
                            <div class="container text-center ">
                                <img style="max-height: 125px" src="image/wishlist.png" class="img-fluid" alt="Responsive image">
                                <h2 class="text-center mt-1"><%= list.size() %></h2>
                                <h2 class="text-center">Categories</h2>
                            </div>
                        </div>

                    </div>
                </div>
                <!--first row third column-->
                <div class="col-md-4">
                    <div class="card border-custom">
                        <div class="card-body">
                            <div class="container text-center ">
                                <img style="max-height: 125px" src="image/product.png" class="img-fluid" alt="Responsive image">
                                <h2 class="text-center mt-1"><%= m.get("productCount") %></h2>
                                <h2 class="text-center">Products</h2>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <!--second row-->
            <div class="row mt-4">
                <!--second row first column-->
                <div class="col-md-6">
                    <div class="card border-custom" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body">
                            <div class="container text-center ">
                                <img style="max-height: 125px" src="image/stories.png" class="img-fluid" alt="Responsive image">
                                <p>add a new category</p>
                                <h2 class="text-center">Add Category</h2>
                            </div>
                        </div>
                    </div>
                </div>
                <!--second row second column-->
                <div class="col-md-6">
                    <div class="card border-custom" data-toggle="modal" data-target="#add-product-modal">
                        <div class="card-body">
                            <div class="container text-center ">
                                <img style="max-height: 125px" src="image/add-to-cart.png" class="img-fluid" alt="Responsive image">
                                <p>add a new product</p>
                                <h2 class="text-center">Add Product</h2>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>





        <!--add category modal-->
        <!-- Modal -->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post">
                            <input type="hidden" name="operation" value="addCategory"/>
                            <div class="form-group">
                                <input type="text" class="form-control" name="category-title" placeholder="Enter Category Title" required>
                            </div>
                            <div class="form-group">
                                <textarea style="height: 250px" class="form-control" name="categroy-description" placeholder="Enter category description" required></textarea>
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-success">Add Category</button>
                                <button type="button" class="btn btn-outline-warning" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!--end of add category modal-->

        <!--add product modal-->
        <div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header custom-bg text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Fill Product Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
                            <input type="hidden" name="operation" value="addProduct"/>
                            <div class="form-group">
                                <input type="text" class="form-control" name="productName" placeholder="Enter product name" required>
                            </div>
                            <div class="form-group">
                                <textarea style="height: 200px" class="form-control" name="productDescription" placeholder="Enter product description" required></textarea>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="productPrice" placeholder="Enter product price" required>
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="productQuantity" placeholder="Enter product quatities">
                            </div>
                            <div class="form-group">
                                <input type="number" class="form-control" name="productDiscount" placeholder="Enter product discount in percentage">
                            </div>

                            <!--for product catrgories-->

                            <div class="form-group">
                                <select name="catId" class="form-control">
                                    <%                                        
                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCategoryId()%>"><%= c.getCategoryTitle()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="photofile">Select picture for product</label>
                                <input id="photofile" type="file" class="form-control" name="productPhoto" required>
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-success">Add Product</button>
                                <button type="button" class="btn btn-outline-warning" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!--end of add product modal-->



        <!--javascript of bootstrps-->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>
</html>
