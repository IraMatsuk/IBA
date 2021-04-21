package by.matsuk.Servlet;

import by.matsuk.Servlet.dao.UserDao;
import by.matsuk.Servlet.model.User;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(urlPatterns = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        String name = request.getParameter("newLoginName");
        String password = request.getParameter("newPassword");
        UserDao daoUser = new UserDao();
        User user = new User(name,password);
        if (daoUser.insertUser(user)) {
            request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(
                    request, response);
        }
        else{
            request.setAttribute("errorRegister", "Выберите другое имя, такой пользователь существет");
                    request.getRequestDispatcher("/WEB-INF/views/register.jsp")
                            .forward(request, response);
        }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request
                .getRequestDispatcher("/WEB-INF/views/register.jsp")
                .forward(request, response);
    }
}