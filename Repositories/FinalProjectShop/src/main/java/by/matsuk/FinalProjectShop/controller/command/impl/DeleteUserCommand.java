package by.matsuk.FinalProjectShop.controller.command.impl;

import by.matsuk.FinalProjectShop.controller.Literal;
import by.matsuk.FinalProjectShop.controller.PagePath;
import by.matsuk.FinalProjectShop.controller.command.CustomCommand;
import by.matsuk.FinalProjectShop.entity.User;
import by.matsuk.FinalProjectShop.exception.ServiceException;
import by.matsuk.FinalProjectShop.service.impl.UserService;
import by.matsuk.FinalProjectShop.util.locale.LocalizedTextExtractor;
import com.google.gson.Gson;
import jakarta.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.List;

/**
 * The type Delete user command.
 */
public class DeleteUserCommand implements CustomCommand {
    private static Logger logger = LogManager.getLogger();

    @Override
    public String execute(HttpServletRequest request) {
        String page = null;
        Gson gson = new Gson();
        String login = request.getParameter(Literal.LOGIN_NAME);
        UserService userService = UserService.getInstance();
        LocalizedTextExtractor localizedTextExtractor = LocalizedTextExtractor.getInstance();
        String currentLocale = request.getSession().getAttribute(Literal.LOCALE_NAME).toString();
        try {
            if(!userService.deleteUser(login)) {
                request.setAttribute(Literal.ERROR_USER_DELETE_MESSAGE,
                        localizedTextExtractor.getText(currentLocale,"USER_DELETE_ERROR"));
            }
            List<User> users  = userService.findAllUsers();
            String usersInGson = gson.toJson(users);
            request.setAttribute(Literal.USERS_FOR_ADMIN,usersInGson);
            page = PagePath.RAW_MAIN_ADMIN_USERS_VIEW_PAGE;
        } catch (ServiceException e) {
            logger.error(e.getMessage());
        }
        return page;
    }
}