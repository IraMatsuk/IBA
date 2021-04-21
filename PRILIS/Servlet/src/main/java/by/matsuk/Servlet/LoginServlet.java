package by.matsuk.Servlet;

import by.matsuk.Servlet.dao.UserDao;
import by.matsuk.Servlet.util.HashPassword;
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
        if (daoUser.isValidUser(name, HashPassword.getHash(password))) {
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
