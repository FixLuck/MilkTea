package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.CategoryDAO;
import entity.Categories;
import org.apache.commons.beanutils.BeanUtils;

import DAO.ProductDAO;
import entity.Products;

@WebServlet({
	"/admin/index",
	"/admin/creat",
	"/admin/update",
	"/admin/delete",
	"/admin/reset",
	"/admin/edit/*",
	"/admin/delete/*",
})

public class AdminServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
	
	public AdminServlet() {
		super();
	}
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String url = req.getRequestURI().toString();
	    
	    req.setCharacterEncoding("utf-8");
	    
	    if (url.contains("delete")) {
	        // Check if id parameter is present
	        String ProductIdParam = req.getParameter("productId");
	        if (ProductIdParam != null && !ProductIdParam.isEmpty()) {
	            try {
	                // Convert idParam to integer
	                int ProductId = Integer.parseInt(ProductIdParam);
	                
	                // Instantiate ProductDAO
	                ProductDAO dao = new ProductDAO();
	                
	                // Remove product with the given id
	                Products removedProduct = dao.remove(ProductId);
	                
	                if (removedProduct != null) {
	                    req.setAttribute("message", "Delete successful!");
	                } else {
	                    req.setAttribute("message", "Failed to delete product");
	                }
	            } catch (NumberFormatException e) {
	                req.setAttribute("message", "Invalid product ID");
	                e.printStackTrace();
	            }
	        } else {
	            req.setAttribute("message", "Product ID not provided");
	        }
	    } else if (url.contains("edit")) {
	        // For edit functionality (assuming it's similar to your existing code)
	        String ProductIdParam = req.getParameter("productId");
	        if (ProductIdParam != null && !ProductIdParam.isEmpty()) {
	            try {
	                int ProductId = Integer.parseInt(ProductIdParam);
	                ProductDAO dao = new ProductDAO();
	                Products products = dao.findById(ProductId);
	                req.setAttribute("productById", products);
	            } catch (NumberFormatException e) {
	                req.setAttribute("message", "Invalid product ID");
	                e.printStackTrace();
	            }
	        }
	    }
		
	 // Load all products
	    findAll(req, resp);
	    
	    // Forward the request to admin.jsp
	    getServletContext().getRequestDispatcher("/views/admin.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String url = req.getRequestURL().toString();
		req.setCharacterEncoding("utf-8");
		Products products = new Products();
		if(url.contains("creat")) {
			creat(req,resp);
		}
		else if(url.contains("update")){
			update(req,resp);
		}
		else if(url.contains("delete")) {
			delete(req,resp);
		}
		else if(url.contains("reset")){
			req.setAttribute("products", new Products());
		}
		findAll(req, resp);
		req.getRequestDispatcher("/views/admin.jsp").forward(req, resp);
	}
	

	protected void creat(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Products products = new Products();
			BeanUtils.populate(products, request.getParameterMap());
			ProductDAO dao = new ProductDAO();
			dao.creat(products);
			request.setAttribute("message", "Create success!");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			request.setAttribute("error", "Error: "+e.getMessage());
		}
	}
	
	protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			int prodId = Integer.parseInt(request.getParameter("prodId"));
			CategoryDAO cdao = new CategoryDAO();
			Categories category = cdao.findById(prodId);

			Products products = new Products();
			BeanUtils.populate(products, request.getParameterMap());
			ProductDAO pdao = new ProductDAO();
			products.setCategoriesByCategoryId(category);
			pdao.update(products);
			request.setAttribute("message", "Update success!");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			request.setAttribute("error", "Error: "+e.getMessage());
		}
	}
	
	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Products products = new Products();
			BeanUtils.populate(products, request.getParameterMap());
			ProductDAO dao = new ProductDAO();
			if(products.getProductId()!=-1)
				dao.remove(products.getProductId());
			request.setAttribute("message", "Delete success!");
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			request.setAttribute("error", "Error: "+e.getMessage());
		}
	}
	
	protected void findAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			ProductDAO dao = new ProductDAO();
			List<Products> list = dao.findAll();
			request.setAttribute("products", list);
		}
		catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			request.setAttribute("error", "Error: "+e.getMessage());
		}
	}

	protected void getCategories(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			List<Categories> list = (List<Categories>) session.getAttribute("categories");
			request.setAttribute("categories", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
