package filter;

import entity.Users;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(filterName = "AuthFilter", urlPatterns = {"/buy", "/admin/*", "/process", "/checkout"})
public class AuthFilter implements HttpFilter{
    @Override
    public void doFilter(HttpServletRequest req, HttpServletResponse resp, FilterChain chain) throws IOException, ServletException {
        String uri = req.getRequestURI();
        Users account = (Users) req.getSession().getAttribute("account");
        String error = "";

        if (account == null) {
            error = resp.encodeURL("Please login to use this function!");
        } else if (!account.getRolesByRoleId().getRoleName().equalsIgnoreCase("admin") && uri.startsWith("/admin")) {
            error = resp.encodeURL("Unauthorized access!");
        }

        if (!error.isEmpty()) {
            req.getSession().setAttribute("errorLogin", error);
            resp.sendRedirect("/MilkTea/login");
        } else {
            chain.doFilter(req, resp);
        }

    }
}
