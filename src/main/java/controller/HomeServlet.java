package controller;

import DAO.CategoryDAO;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeServlet", value = {"/home"})
public class HomeServlet extends HttpServlet {

    CategoryDAO categoryDAO = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("home")) {
            getCategoriesName(request, response);
        }


        request.getRequestDispatcher("/views/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/views/home.jsp").forward(request, response);

    }

    protected void getCategoriesName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> name = categoryDAO.findAllNameCategories();
        request.setAttribute("names", name);
        request.getRequestDispatcher("/views/home.jsp").forward(request, response);
    }
}
