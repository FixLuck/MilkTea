package controller;

import DAO.OrderDAO;
import entity.Cart;
import entity.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "CheckoutServlet", urlPatterns = {"/checkout"})
public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Object o = session.getAttribute("cart");
        Cart cart = null;
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }

        Users users = null;
        Object a = session.getAttribute("account");
        if (a != null) {
            users = (Users) a;
            OrderDAO oDAO = new OrderDAO();
            oDAO.addOrder(users, cart);
            session.removeAttribute("cart");
            session.setAttribute("size", 0);
            resp.sendRedirect("/views/home.jsp");
        } else {
            System.out.println("Error");
        }
    }
}
