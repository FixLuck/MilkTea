package filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public interface HttpFilter extends Filter {

    default public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        this.doFilter(request, response, chain);
    }

    void doFilter(HttpServletRequest req, HttpServletResponse resp,FilterChain chain)throws IOException,ServletException;

    @Override
    default void init(FilterConfig filterConfig) throws ServletException {
        Filter.super.init(filterConfig);
    }

    @Override
    default void destroy() {
        Filter.super.destroy();
    }
}
