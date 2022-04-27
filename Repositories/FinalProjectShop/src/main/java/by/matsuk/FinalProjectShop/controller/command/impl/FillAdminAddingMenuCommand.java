package by.matsuk.FinalProjectShop.controller.command.impl;

import by.matsuk.FinalProjectShop.controller.PagePath;
import by.matsuk.FinalProjectShop.controller.command.CustomCommand;
import jakarta.servlet.http.HttpServletRequest;

/**
 * The type Fill admin adding menu command.
 */
public class FillAdminAddingMenuCommand implements CustomCommand {

    @Override
    public String execute(HttpServletRequest request) {
        return PagePath.ADMIN_REGISTRATION_PAGE;
    }
}