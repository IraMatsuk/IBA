package by.matsuk.FinalProjectShop.controller.filter;

import by.matsuk.FinalProjectShop.controller.CommandType;
import by.matsuk.FinalProjectShop.controller.Literal;
import by.matsuk.FinalProjectShop.controller.PagePath;
import by.matsuk.FinalProjectShop.entity.UserRole;
import by.matsuk.FinalProjectShop.util.locale.LocalizedTextExtractor;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import jakarta.servlet.annotation.WebFilter;
import java.io.IOException;
import java.util.EnumSet;

/**
 * The type Role access filter.
 */
@WebFilter(urlPatterns = { "/controller" })
public class RoleAccessFilter implements Filter {
    private EnumSet<CommandType> allowedToUnRegisteredAccessCommands;
    private EnumSet<CommandType> onlyAdminAccessCommands;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        allowedToUnRegisteredAccessCommands = EnumSet.of(CommandType.REGISTER,CommandType.LOGIN,
                CommandType.PREPARE_MAIN_CLIENT_PAGE,CommandType.CHANGE_LOCALE,CommandType.SORT_PRODUCTS_BY_NAME,CommandType.SORT_PRODUCTS_BY_CATEGORY,
                CommandType.SORT_PRODUCTS_BY_PRICE,CommandType.FIND_PRODUCT, CommandType.CONFIRM_REGISTRATION);
        onlyAdminAccessCommands = EnumSet.of(CommandType.PREPARE_MAIN_ADMIN_PAGE, CommandType.PREPARE_ADMIN_ADDING_PAGE, CommandType.PREPARE_VIEW_ORDERS_PAGE,
                CommandType.PREPARE_VIEW_USERS_PAGE, CommandType.PREPARE_PRODUCT_ADDING_PAGE, CommandType.SHOW_PRODUCTS_SELLING_STATISTICS);
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request= (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        HttpSession session = request.getSession();
        String command = request.getParameter(Literal.COMMAND);
        RequestDispatcher requestDispatcher = null;
        String page = null;
        String currentLocale = String.valueOf(session.getAttribute(Literal.LOCALE_NAME));
        LocalizedTextExtractor localizedTextExtractor  = LocalizedTextExtractor.getInstance();
        if(command == null) {
            page = PagePath.AUTHORIZATION_PAGE;
            requestDispatcher = request.getServletContext().getRequestDispatcher(page);
            request.setAttribute(Literal.AUTHORIZATION_ERROR_MESSAGE,
                    localizedTextExtractor.getText(currentLocale,"EXPIRED_SESSION_ERROR"));
            requestDispatcher.forward(request,response);
        } else {
            if(session.getAttribute(Literal.ROLE) == null || session.getAttribute(Literal.PREPARED_FOR_REGISTRATION) != null){
                if(allowedToUnRegisteredAccessCommands.stream().filter(o -> o.toString().equals(command.toUpperCase())).toArray().length > 0){
                    filterChain.doFilter(request,response);
                } else {
                    page = PagePath.AUTHORIZATION_PAGE;
                    requestDispatcher = request.getServletContext().getRequestDispatcher(page);
                    request.setAttribute(Literal.AUTHORIZATION_ERROR_MESSAGE,
                            localizedTextExtractor.getText(currentLocale,"EXPIRED_SESSION_ERROR"));
                    requestDispatcher.forward(request,response);
                }
            } else {
                if(String.valueOf(session.getAttribute(Literal.ROLE)).equals(UserRole.CLIENT.toString())){
                    if(onlyAdminAccessCommands.stream().filter(o -> o.toString().equals(command.toUpperCase())).toArray().length > 0){
                        page = PagePath.AUTHORIZATION_PAGE;
                        requestDispatcher = request.getServletContext().getRequestDispatcher(page);
                        request.setAttribute(Literal.AUTHORIZATION_ERROR_MESSAGE,
                                localizedTextExtractor.getText(currentLocale,"WRONG_ROLE_ACCESS_DENIAL"));
                        requestDispatcher.forward(request,response);
                    } else {
                        filterChain.doFilter(request,response);
                    }
                } else {
                    filterChain.doFilter(request,response);
                }
            }
        }
    }

    @Override
    public void destroy() {
    }
}
