package by.matsuk.FinalProjectShop.controller.command.impl;

import by.matsuk.FinalProjectShop.controller.Literal;
import by.matsuk.FinalProjectShop.controller.PagePath;
import by.matsuk.FinalProjectShop.controller.command.CustomCommand;
import by.matsuk.FinalProjectShop.util.locale.LocalizedTextExtractor;
import jakarta.servlet.http.HttpServletRequest;

/**
 * The type Empty command.
 */
public class EmptyCommand implements CustomCommand {
    @Override
    public String execute(HttpServletRequest request) {
        String page = null;
        page = PagePath.AUTHORIZATION_PAGE;
        LocalizedTextExtractor localizedTextExtractor = LocalizedTextExtractor.getInstance();
        String currentLocale = request.getSession().getAttribute(Literal.LOCALE_NAME).toString();
        request.setAttribute(Literal.AUTHORIZATION_ERROR_MESSAGE,
                localizedTextExtractor.getText(currentLocale,"COMMAND_ERROR"));
        return page;
    }
}