package controller;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import entity.Categories;
import entity.Products;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/products")
public class ProductServlet extends HttpServlet {

    CategoryDAO categoryDAO = new CategoryDAO();
    ProductDAO productDAO = new ProductDAO();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("products")) {
            doGetProduct(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/Products.jsp").forward(request, response);
    }

    protected void doGetProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Categories> list = categoryDAO.findAll();
        request.setAttribute("categories", list);
        String cid_raw = request.getParameter("key");
        int cid;
        try {
            cid = (cid_raw == null) ? 0 :Integer.parseInt(cid_raw);
            List<Products> products = productDAO.findProductsByCategoryId(cid);
            request.setAttribute("products", products);
            request.setAttribute("cid", cid);
            request.getRequestDispatcher("/views/Products.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
