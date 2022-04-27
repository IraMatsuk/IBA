package by.matsuk.FinalProjectShop.controller.command.impl;

import by.matsuk.FinalProjectShop.controller.Literal;
import by.matsuk.FinalProjectShop.controller.PagePath;
import by.matsuk.FinalProjectShop.controller.command.CustomCommand;
import by.matsuk.FinalProjectShop.controller.validator.impl.CustomUserDataValidator;
import by.matsuk.FinalProjectShop.entity.UserRole;
import by.matsuk.FinalProjectShop.exception.ServiceException;
import by.matsuk.FinalProjectShop.service.impl.UserService;
import by.matsuk.FinalProjectShop.util.locale.LocalizedTextExtractor;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * The type Change password command.
 */
public class ChangePasswordCommand implements CustomCommand {
    private static Logger logger = LogManager.getLogger();

    @Override
    public String execute(HttpServletRequest request) {
        LocalizedTextExtractor localizedTextExtractor = LocalizedTextExtractor.getInstance();
        HttpSession session = request.getSession();
        String password = request.getParameter(Literal.PASSWORD);
        String login = session.getAttribute(Literal.LOGIN_NAME).toString();
        String currentLocale = session.getAttribute(Literal.LOCALE_NAME).toString();
        String page = null;

        if(CustomUserDataValidator.getInstance().validateUserChangePasswordData(password)){
            try {
                UserService.getInstance().setUserNewPassword(login,password);
                session.setAttribute(Literal.PASSWORD,password);
                if(session.getAttribute(Literal.ROLE).equals(UserRole.ADMIN.toString())) {
                    page = PagePath.MAIN_ADMIN_PAGE;
                } else {
                    page = PagePath.MAIN_CLIENT_PAGE;
                }
            } catch (ServiceException e) {
                logger.error(e.getMessage());
            }
        } else {
            request.setAttribute(Literal.AUTHORIZATION_ERROR_MESSAGE,
                    localizedTextExtractor.getText(currentLocale,"INVALID_FORM_DATA_ERROR"));
            page = PagePath.AUTHORIZATION_PAGE;
        }
        return page;
    }
}