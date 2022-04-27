package by.matsuk.FinalProjectShop.controller.command.impl;

import by.matsuk.FinalProjectShop.controller.Literal;
import by.matsuk.FinalProjectShop.controller.PagePath;
import by.matsuk.FinalProjectShop.controller.command.CustomCommand;
import by.matsuk.FinalProjectShop.controller.validator.impl.CustomUserDataValidator;
import by.matsuk.FinalProjectShop.exception.ServiceException;
import by.matsuk.FinalProjectShop.service.impl.UserService;
import by.matsuk.FinalProjectShop.util.locale.LocalizedTextExtractor;
import jakarta.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.HashMap;
import java.util.Map;

public class RegisterAdminCommand implements CustomCommand {
    private static Logger logger = LogManager.getLogger();

    @Override
    public String execute(HttpServletRequest request) {
        LocalizedTextExtractor localizedTextExtractor = LocalizedTextExtractor.getInstance();
        String currentLocale = request.getSession().getAttribute(Literal.LOCALE_NAME).toString();
        String login = request.getParameter(Literal.LOGIN_NAME);
        String email = request.getParameter(Literal.EMAIL);
        String password = request.getParameter(Literal.PASSWORD);
        Map<String,String> formValues = new HashMap<>();
        formValues.put(Literal.LOGIN_TO_ADD_IN_FORM,login);
        formValues.put(Literal.PASSWORD_TO_ADD_IN_FORM,password);
        formValues.put(Literal.EMAIL_TO_ADD_IN_FORM,email);
        UserService userService = UserService.getInstance();
        String page = null;

        try {
            if(CustomUserDataValidator.getInstance().validateUserRegistrationData(formValues, currentLocale)){
                System.out.println("juu");
                if(userService.checkIfUserIsValidForRegistration(login,email)){
                    userService.registerAdmin(login,password,email);
                    page = PagePath.MAIN_ADMIN_PAGE;
                } else {
                    request.setAttribute(Literal.ERROR_REGISTRATION_MESSAGE,
                            localizedTextExtractor.getText(currentLocale,"REGISTRATION_ERROR"));
                    page = PagePath.ADMIN_REGISTRATION_PAGE;
                }
            } else {
                request.setAttribute(Literal.ERROR_REGISTRATION_MESSAGE,
                        localizedTextExtractor.getText(currentLocale,"INVALID_FORM_DATA_ERROR"));
                request.setAttribute(Literal.REGISTRATION_FORM_DATA_MAP,formValues);
                page = PagePath.ADMIN_REGISTRATION_PAGE;
            }
        } catch (ServiceException e){
            logger.error(e.getMessage());
        }
        return page;
    }
}
