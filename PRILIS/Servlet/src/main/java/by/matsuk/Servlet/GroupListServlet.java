package by.matsuk.Servlet;

import by.matsuk.Servlet.dao.PersonDao;
import by.matsuk.Servlet.model.ListService;
import by.matsuk.Servlet.model.Person;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
@WebServlet(name = "GroupListServlet", value = "/GroupListServlet")
public class GroupListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse
            response) throws ServletException, IOException {
        PersonDao daoPerson = new PersonDao();
        String nname = request.getParameter("nname");
        String nphone = request.getParameter("nphone");
        String nemail= request.getParameter("nemail");
        if (nname.isBlank() || nphone.isBlank() || nemail.isBlank()) {
            request.setAttribute("errorMessage", "Заполните все поля");
        } else {
            daoPerson.insertPerson(new Person(nname, nphone,nemail));
        }
        request.setAttribute("group", daoPerson.getPersons());
        request.getRequestDispatcher("/WEB-INF/views/welcome.jsp").forward(request, response);
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PersonDao daoPerson = new PersonDao();
        request.setAttribute("group",daoPerson.getPersons());
        request.getRequestDispatcher("/WEB-INF/views/welcome.jsp")
                .forward(request, response);
    }
}
/*@WebServlet(name = "GroupListServlet", value = "/GroupListServlet")
public class GroupListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ListService todoService = new ListService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("group", ListService.retrieveList());
        request.getRequestDispatcher("/WEB-INF/views/welcome.jsp").forward(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nname = request.getParameter("nname");
        String nphone = request.getParameter("nphone");
        String nemail= request.getParameter("nemail");
        if (("".equals(nname))|| ("".equals(nphone)) || ("".equals(nemail))) {
            request.setAttribute("errorMessage", "Заполните все поля");
        } else {
            ListService.addPerson(new Person(nname, nphone,nemail));
        }
        request.setAttribute("group", ListService.retrieveList());
        request.getRequestDispatcher("/WEB-INF/views/welcome.jsp").forward(request,
                response);
    }
}*/
