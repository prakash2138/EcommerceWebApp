<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.entities.User"%>
<%
    User user1 = (User) session.getAttribute("current-user");

    CategoryDao cda = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list5 = cda.getCategories();
%>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg ">
    <div class="container">
        <a class="navbar-brand" href="index.jsp"><span><img style="max-height: 25px" src="image/mycartlogo.png" class="img-fluid" alt="Responsive image">
            </span>myCarts</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Catagories
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a  href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                            All Products
                        </a>
         
                        <%
                            for (Category c : list5) {
                        %>
                        <a class="dropdown-item list-group-item " href="index.jsp?category=<%= c.getCategoryId()%>"><%= c.getCategoryTitle() %></a>

                        <%
                            }
                        %>

                    </div>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto"> 
                <li class="nav-item active">
                    <a class="nav-link" href="#" data-toggle="modal" data-target="#cart"><i class="fa fa-cart-plus" style="font-size: 23px;"></i><span class="ml-1 cart-item">( 0 )</span></a>
                </li>

                <%
                    if (user1 == null) {
                %>   
                <li class="nav-item active">
                    <a class="nav-link" href="login.jsp"><span class="fa fa-user-circle-o fa-spin"></span>&nbsp;Login <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="register.jsp"><span class="fa fa-user-plus">&nbsp;</span>Register <span class="sr-only">(current)</span></a>
                </li>
                <%
                } else {
                %>
                <li class="nav-item active">
                    <a class="nav-link" href="<%= user1.getUserType().equals("admin")?"admin.jsp":"normal.jsp" %>"> <span class=" fa fa-user-circle-o">&nbsp;</span><%=user1.getUserName()%><span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="LogoutServlet"><span class=" fa fa-external-link">&nbsp;</span>Logout<span class="sr-only">(current)</span></a>
                </li>
                <%
                    }

                %>
            </ul>

        </div>
    </div>
</nav> 
            
            <div id="toast">
                <h4>This is custom toast</h4>
            </div>