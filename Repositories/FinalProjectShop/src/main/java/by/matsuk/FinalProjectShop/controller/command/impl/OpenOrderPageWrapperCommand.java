package by.matsuk.FinalProjectShop.controller.command.impl;

import by.matsuk.FinalProjectShop.controller.PagePath;
import by.matsuk.FinalProjectShop.controller.command.CustomCommand;
import jakarta.servlet.http.HttpServletRequest;

/**
 * The type Open order page wrapper command.
 */
public class OpenOrderPageWrapperCommand implements CustomCommand {
    @Override
    public String execute(HttpServletRequest request) {
        String page = PagePath.ORDER_PAGE;
        return page;
    }
}