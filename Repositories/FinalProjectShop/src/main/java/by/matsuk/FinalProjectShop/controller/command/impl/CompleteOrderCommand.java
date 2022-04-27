package by.matsuk.FinalProjectShop.controller.command.impl;

import by.matsuk.FinalProjectShop.controller.Literal;
import by.matsuk.FinalProjectShop.controller.PagePath;
import by.matsuk.FinalProjectShop.controller.command.CustomCommand;
import by.matsuk.FinalProjectShop.entity.CompleteOrder;
import by.matsuk.FinalProjectShop.exception.ServiceException;
import by.matsuk.FinalProjectShop.service.impl.OrderService;
import by.matsuk.FinalProjectShop.util.locale.LocalizedTextExtractor;
import com.google.gson.Gson;
import jakarta.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.List;

/**
 * The type Complete order command.
 */
public class CompleteOrderCommand implements CustomCommand {
    private static Logger logger = LogManager.getLogger();

    @Override
    public String execute(HttpServletRequest request) {
        String page = null;
        Gson gson = new Gson();
        Long orderId = Long.parseLong(request.getParameter(Literal.ORDER_ID));
        OrderService orderService = OrderService.getInstance();
        LocalizedTextExtractor localizedTextExtractor = LocalizedTextExtractor.getInstance();
        String currentLocale = request.getSession().getAttribute(Literal.LOCALE_NAME).toString();

        try {
            if(!orderService.completeOrder(orderId)) {
                request.setAttribute(Literal.ERROR_ORDER_COMPLETE_MESSAGE,
                        localizedTextExtractor.getText(currentLocale,"ORDER_COMPLETE_ERROR"));
            }
            List<CompleteOrder> orders  = orderService.findAllOrdersFromDb();
            String ordersInGson = gson.toJson(orders);
            request.setAttribute(Literal.ORDERS_FOR_ADMIN,ordersInGson);
            page = PagePath.RAW_MAIN_ADMIN_ORDERS_VIEW_PAGE;
        } catch (ServiceException e) {
            logger.error(e.getMessage());
        }
        return page;
    }
}