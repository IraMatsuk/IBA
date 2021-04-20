package by.matsuk.Servlet;

import by.matsuk.Servlet.dao.UserDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;


@WebServlet(urlPatterns = "/LoginServlet")
public class LoginServlet extends jakarta.servlet.http.HttpServlet {
    // public boolean validateUser(String user, String password) {
// return user.equalsIgnoreCase("admin") && password.equals("admin");
// }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        UserDao daoUser = new UserDao();
        if (daoUser.isValidUser(name, password)) {
            request.getSession().setAttribute("name", name);
            response.sendRedirect(request.getContextPath()+"/GroupListServlet");
            // НЕТ ПАРАМЕТРОВ - всегда использует метод get
// request.getRequestDispatcher("/GroupListServlet")
// .forward(request, response);
//переходит на метод пост, передает параметры
        } else {
            request.setAttribute("errorMessage", "Invalid Login and password!!");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp")
                    .forward(request, response);
        }
    }
    protected void doGet(jakarta.servlet.http.HttpServletRequest request,
                         jakarta.servlet.http.HttpServletResponse response)
            throws jakarta.servlet.ServletException, IOException {
        request
                .getRequestDispatcher("/WEB-INF/views/login.jsp")
                .forward(request, response);
    }
}
/*@WebServlet(name = "LoginServlet", urlPatterns = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    public boolean validateUser(String user, String password) {
        return user.equalsIgnoreCase("admin") && password.equals("admin");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/views/login.jsp")
                .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        if (validateUser(name, password)) {
            request.getSession().setAttribute("name", name);
            response.sendRedirect(request.getContextPath() + "/GroupListServlet");
            // НЕТ ПАРАМЕТРОВ - всегда использует метод get
// request.getRequestDispatcher("/GroupServlet")
// .forward(request, response);
//переходит на метод пост, передает параметры
        } else {
            request.setAttribute("errorMessage", "Invalid Login and password!!");
            request.getRequestDispatcher("/WEB-INF/views/login.jsp")
                    .forward(request, response);
        }
    }
}*/