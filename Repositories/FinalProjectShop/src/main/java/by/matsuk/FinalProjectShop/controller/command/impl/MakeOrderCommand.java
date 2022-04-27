package by.matsuk.FinalProjectShop.controller.command.impl;

import by.matsuk.FinalProjectShop.controller.Literal;
import by.matsuk.FinalProjectShop.controller.PagePath;
import by.matsuk.FinalProjectShop.controller.command.CustomCommand;
import by.matsuk.FinalProjectShop.entity.ComponentOrder;
import by.matsuk.FinalProjectShop.exception.ServiceException;
import by.matsuk.FinalProjectShop.service.impl.OrderService;
import by.matsuk.FinalProjectShop.util.locale.LocalizedTextExtractor;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.ArrayList;
import java.util.List;

/**
 * The type Make order command.
 */
public class MakeOrderCommand implements CustomCommand {
    private static Logger logger = LogManager.getLogger();

    @Override
    public String execute(HttpServletRequest request) {
        String page = null;
        OrderService orderService = OrderService.getInstance();
        HttpSession session = request.getSession();
        LocalizedTextExtractor localizedTextExtractor = LocalizedTextExtractor.getInstance();
        String login = session.getAttribute(Literal.LOGIN_NAME).toString();
        List<ComponentOrder> componentOrders = (List<ComponentOrder>) session.getAttribute(Literal.ORDER);
        String currentLocale = session.getAttribute(Literal.LOCALE_NAME).toString();
        if (componentOrders.size() > 0) {
            try {
                orderService.makeOrderAndSendNotificationMessageOnUserEmail(componentOrders, login, currentLocale);
                page = PagePath.MAIN_CLIENT_PAGE;
                session.setAttribute(Literal.ORDER, new ArrayList<ComponentOrder>());
            } catch (ServiceException e) {
                logger.error(e.getMessage());
            }
        } else {
            page = PagePath.AUTHORIZATION_PAGE;
            request.setAttribute(Literal.AUTHORIZATION_ERROR_MESSAGE,
                    localizedTextExtractor.getText(currentLocale, "main_client.empty_order"));
        }
        return page;
    }
}