package controller;

import DAO.UserDAO;
import entity.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/views/Login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("user");
        String password = req.getParameter("password");
        UserDAO userDAO = new UserDAO();
        Users a = userDAO.getAccount(username, password);
        if (a == null) {
            req.setAttribute("error", "Sai tài khoản hoặc mật khẩu");
            req.getRequestDispatcher("/views/Login.jsp").forward(req, resp);
        } else {
            HttpSession session = req.getSession();
            session.setAttribute("account", a);
            req.getRequestDispatcher("/views/home.jsp").forward(req, resp);
        }
    }







}
