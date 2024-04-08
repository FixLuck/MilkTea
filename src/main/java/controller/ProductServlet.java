package controller;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import entity.Cart;
import entity.Categories;
import entity.Item;
import entity.Products;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = {"/products", "/buy"})
public class ProductServlet extends HttpServlet {

    CategoryDAO categoryDAO = new CategoryDAO();
    ProductDAO productDAO = new ProductDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("products")) {
            doGetProduct(request, response);
        }
//        request.getRequestDispatcher("/views/home1.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (uri.contains("buy")) {
            doBuyProduct(request, response);
        }
    }

    protected void doGetProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Categories> list = categoryDAO.findAll();
        session.setAttribute("categories", list);
        String cid_raw = request.getParameter("key");
        int cid;
        try {

            cid = (cid_raw == null) ? 0 : Integer.parseInt(cid_raw);
            List<Products> products = productDAO.findProductsByCategoryId(cid);
            session.setAttribute("products", products);
            session.setAttribute("cid", cid);
            request.getRequestDispatcher("/views/Products.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    protected void doBuyProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = null;
        Object o = session.getAttribute("cart");
        if (o != null) {
            cart = (Cart) o;
        } else {
            cart = new Cart();
        }

        String tnum = request.getParameter("num");
        String tid = request.getParameter("id");
        int num, id;
        try {
            num = Integer.parseInt(tnum);
            id = Integer.parseInt(tid);

            Products products = productDAO.findById(id);
            Item item = new Item(products, num, products.getPrice());
            cart.addItem(item);
        } catch (Exception e) {
            num = 1;
            e.printStackTrace();
        }

        List<Item> list = cart.getItems();
        session.setAttribute("cart", cart);
        session.setAttribute("size", list.size());
        request.getRequestDispatcher("/views/Products.jsp").forward(request, response);
    }
}
