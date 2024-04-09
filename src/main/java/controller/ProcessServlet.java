package controller;

import DAO.ProductDAO;
import entity.Cart;
import entity.Item;
import entity.Products;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProcessServlet", value = {"/process"})
public class ProcessServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Cart cart = null;
        Object o = session.getAttribute("cart");
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }

        String tnum = req.getParameter("num");
        String tid = req.getParameter("id");
        int num, id;
        try {
            num = Integer.parseInt(tnum);
            id = Integer.parseInt(tid);
            if ((num == -1) && (cart.getQuantityById(id)) <= 1) {
                cart.removeItem(id);
            } else {
                ProductDAO productDAO = new ProductDAO();
                Products products = productDAO.findById(id);
                Item t = new Item(products, num, products.getPrice());
                cart.addItem(t); // Thêm mục mới vào giỏ hàng
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }

        List<Item> list = cart.getItems();
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        req.getRequestDispatcher("/views/home1.jsp").forward(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Cart cart = null;
        Object o = session.getAttribute("cart");
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }
        int id = Integer.parseInt(req.getParameter("id"));
        cart.removeItem(id);

        List<Item> list = cart.getItems();

        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        req.getRequestDispatcher("/views/home1.jsp").forward(req, resp);
    }
}
