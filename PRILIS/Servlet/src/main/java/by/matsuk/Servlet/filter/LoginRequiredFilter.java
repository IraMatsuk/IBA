package by.matsuk.Servlet.filter;

import by.matsuk.Servlet.command.session.SessionAttribute;
import by.matsuk.Servlet.util.pages.Page;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import java.io.IOException;
@WebFilter(urlPatterns = "/controller")
public class LoginRequiredFilter implements Filter {
    private static final String COMMAND = "command";
    private static final String WELCOME = "welcome";
    private static final String ERROR_MESSAGE = "error_message";
    private static final String ERROR_TEXT = "No authorization to execute this command";
    private static final Logger logger =
            LogManager.getLogger(LoginRequiredFilter.class.getName());
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain
            chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        String command = request.getParameter(COMMAND);
        logger.info("Filter is working " + COMMAND + "= " + command);
        if (!command.equals(WELCOME)) {
            chain.doFilter(req, resp);
        } else {
            if (request.getSession().getAttribute(SessionAttribute.NAME) != null)
            {
                chain.doFilter(req, resp);
            } else {
                request.setAttribute(ERROR_MESSAGE, ERROR_TEXT);

                request.getRequestDispatcher(Page.ERROR_PAGE.getPage()).forward(req, resp);
            }
        }
    }
}

/*import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter(filterName = "LoginRequiredFilter", urlPatterns = "/GroupListServlet")
public class LoginRequiredFilter implements Filter {
    public void destroy() {
    }
    public void doFilter(ServletRequest req, ServletResponse resp,
                         FilterChain chain) throws ServletException, IOException {

        HttpServletRequest httpReq = (HttpServletRequest) req;
        HttpServletResponse httpResp = (HttpServletResponse) resp;
        HttpSession session = httpReq.getSession();
        if (session.getAttribute("name")!= null) {
            chain.doFilter(req, resp);
        }
        else {
            session.invalidate();
            req.getRequestDispatcher("LoginServlet").forward(req, resp);
        }
    }
    public void init(FilterConfig config) throws ServletException {
    }
}
*/