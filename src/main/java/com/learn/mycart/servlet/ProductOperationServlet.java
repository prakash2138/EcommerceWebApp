package com.learn.mycart.servlet;

import com.learn.mycart.dao.CategoryDao;
import com.learn.mycart.dao.ProductDao;
import com.learn.mycart.entities.Category;
import com.learn.mycart.entities.Product;
import com.learn.mycart.helper.FactoryProvider;
import com.learn.mycart.helper.Helper;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import javax.swing.JFileChooser;

@MultipartConfig
public class ProductOperationServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
//            checking operation name
            String op = request.getParameter("operation");
            if (op.trim().equals("addCategory")) {
//                 fetching addcategory details
                String categoryTitle = request.getParameter("category-title");
                String categoryDescription = request.getParameter("categroy-description");

//                    setting value to category
                Category category = new Category();
                category.setCategoryTitle(categoryTitle);
                category.setCategoryDescription(categoryDescription);

//                    saving to database
                CategoryDao catdao = new CategoryDao(FactoryProvider.getFactory());
                int catid = catdao.saveCategory(category);

                HttpSession httpsession = request.getSession();
                httpsession.setAttribute("message", "Category added successfully : " + catid);
                response.sendRedirect("admin.jsp");
                return;
            } else if (op.trim().equals("addProduct")) {
//                   fetching addproduct details

                String productName = request.getParameter("productName");
                String productDescription = request.getParameter("productDescription");
                int productPrice = Integer.parseInt(request.getParameter("productPrice"));
                int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
                int productDiscount = Integer.parseInt(request.getParameter("productDiscount"));
                int catId = Integer.parseInt(request.getParameter("catId"));
                Part part = request.getPart("productPhoto");
                String pPic = part.getSubmittedFileName();

                Product p = new Product();
                p.setpName(productName);
                p.setpDesc(productDescription);
                p.setpPrice(productPrice);
                p.setpQuatity(productQuantity);
                p.setpDiscount(productDiscount);
                p.setpPhoto(part.getSubmittedFileName());

//                   to set category to product entity
                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
                Category c = pdao.getCategoryById(catId);
                p.setCategry(c);

                boolean condition = pdao.saveProduct(p);

                if (condition == true) {

                    String path = request.getRealPath("/") + "productsimage" + File.separator + pPic;
                    Helper.saveFile(part.getInputStream(), path);

                    HttpSession httpsession = request.getSession();
                    httpsession.setAttribute("message", "Product added successfully..");
                    response.sendRedirect("admin.jsp");
                    return;
                } else {
                    HttpSession httpsession = request.getSession();
                    httpsession.setAttribute("warning", "Oops ! Something went wrong...");
                    response.sendRedirect("admin.jsp");
                    return;
                }

            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
