

<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/metaport.jsp" %>
        <title>myCarts-Homepage</title
        <%@include file="components/common_css_js.jsp" %>

    </head>
    <body>
        <%@include file="components/navbar.jsp" %>
        <%@include file="components/slides.jsp" %>

        <div class="container-fluid">
            <%                String cat = request.getParameter("category");
                List<Product> li = null;
                if (cat == null || cat.trim().equals("all")) {
                    ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                    li = pdao.getAllProducts();
                } else {
                    int catid = Integer.parseInt(cat);
                    ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                    li = pdao.getProductsById(catid);
                }

                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                List<Category> list = cdao.getCategories();

            %>


            <div class="row mt-4 mx-1">
                <div class="col-md-2">

                    <div  class="list-group">
                        <a  href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                            All Products
                        </a>
                        <%                            for (Category c : list) {
                        %>
                        <a id="foo" onclick="changeClass()" href="index.jsp?category=<%= c.getCategoryId()%>" class="list-group-item list-group-item-action new"><%= c.getCategoryTitle()%></a>
                        <%
                            }
                        %>
                    </div>

                </div>

                <div class="col-md-10">
                    <div class="row"> 
                        <div class="col-md-12">
                            <div class="card-columns">
                                <%
                                    for (Product p : li) {
                                %>
                                <!--product card-->
                                <div class="card border-custom">
                                    <div class="container text-center mt-2">
                                        <img style="max-height:180px; max-width: 100%; width: auto;" class="card-img-top" src="productsimage/<%= p.getpPhoto()%>" alt="Card image cap">
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title"><%= p.getpName()%></h5>
                                        <p class="card-text"><%= p.getpDesc()%></p>
                                    </div>
                                    <div class="card-footer">
                                        <div class="container">
                                            <button onclick="add_to_cart(<%= p.getpId() %>,'<%= p.getpName() %>', <%= p.getPriceAfterApplyingDiscount() %>)" class="btn custom-bg text-white my-2">Add to Cart</button>
                                            <button class="btn btn-outline-success">&#8377 <%= p.getPriceAfterApplyingDiscount()%>/- <span class="text-secondary discount-label"><s><%= p.getpPrice()%></s>&nbsp;&nbsp;<%= p.getpDiscount()%>% off</span></button>
                                        </div>
                                    </div>
                                </div>
                                <%
                                    }
                                    if (li.size() == 0) {
                                        out.println("<h4>No any item in this category.. </h4>");
                                    }
                                %>
                            </div>
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

