package by.matsuk.FinalProjectShop.controller.command.impl;

import by.matsuk.FinalProjectShop.controller.Literal;
import by.matsuk.FinalProjectShop.controller.PagePath;
import by.matsuk.FinalProjectShop.controller.command.CustomCommand;
import by.matsuk.FinalProjectShop.controller.validator.impl.CustomUserDataValidator;
import by.matsuk.FinalProjectShop.entity.ComponentOrder;
import by.matsuk.FinalProjectShop.entity.User;
import by.matsuk.FinalProjectShop.exception.ServiceException;
import by.matsuk.FinalProjectShop.service.impl.UserService;
import by.matsuk.FinalProjectShop.util.locale.LocalizedTextExtractor;
import jakarta.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.*;

public class LoginCommand implements CustomCommand {
    private static Logger logger = LogManager.getLogger();

    @Override
    public String execute(HttpServletRequest request) {
        LocalizedTextExtractor localizedTextExtractor = LocalizedTextExtractor.getInstance();
        String currentLocale = request.getSession().getAttribute(Literal.LOCALE_NAME).toString();
        String page = null;
        String login = request.getParameter(Literal.LOGIN_NAME);
        String password = request.getParameter(Literal.PASSWORD);
        Map<String,String> formValues = new HashMap<>();
        formValues.put(Literal.LOGIN_TO_ADD_IN_FORM,login);
        formValues.put(Literal.PASSWORD_TO_ADD_IN_FORM,password);
        Boolean enterAsAdmin = true;
        if(request.getParameter(Literal.ENTER_AS_ADMIN) ==null){
            enterAsAdmin = false;
        }
        try {
            if(CustomUserDataValidator.getInstance().validateUserLoginData(formValues, currentLocale)){
                if(request.getSession().getAttribute(Literal.LOGIN_NAME) == null){
                    Optional<User> foundUser = UserService.getInstance().findUserWithLoginAndPassword(login,password,enterAsAdmin);
                    if(foundUser.isPresent()){
                        request.getSession().setAttribute(Literal.LOGIN_NAME, foundUser.get().getLogin());
                        request.getSession().setAttribute(Literal.PASSWORD, foundUser.get().getPassword());
                        request.getSession().setAttribute(Literal.EMAIL, foundUser.get().getEmail());
                        request.getSession().setAttribute(Literal.ROLE, foundUser.get().getUserRoleName());
                        if(enterAsAdmin){
                            page = PagePath.MAIN_ADMIN_PAGE;
                        } else {
                            page = PagePath.MAIN_CLIENT_PAGE;
                        }
                        List<ComponentOrder> componentOrders = new ArrayList<>();
                        request.getSession().setAttribute(Literal.ORDER, componentOrders);
                    }else {
                        request.setAttribute(Literal.AUTHORIZATION_ERROR_MESSAGE,
                                localizedTextExtractor.getText(currentLocale,"LOGIN_ERROR"));
                        page = PagePath.AUTHORIZATION_PAGE;
                    }
                } else {
                    request.setAttribute(Literal.AUTHORIZATION_ERROR_MESSAGE,
                            localizedTextExtractor.getText(currentLocale,"FIRST_LOGOUT_ERROR"));
                    page = PagePath.AUTHORIZATION_PAGE;
                }
            } else {
                request.setAttribute(Literal.AUTHORIZATION_ERROR_MESSAGE,
                        localizedTextExtractor.getText(currentLocale,"INVALID_FORM_DATA_ERROR"));
                request.setAttribute(Literal.LOGIN_FORM_DATA_MAP,formValues);
                page = PagePath.AUTHORIZATION_PAGE;
            }
        } catch (ServiceException e) {
            logger.error(e.getMessage());
        }
        return page;
    }
}
