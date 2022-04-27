package by.matsuk.FinalProjectShop.controller.command.impl;

import by.matsuk.FinalProjectShop.controller.Literal;
import by.matsuk.FinalProjectShop.controller.PagePath;
import by.matsuk.FinalProjectShop.controller.command.CustomCommand;
import by.matsuk.FinalProjectShop.entity.CompleteOrder;
import by.matsuk.FinalProjectShop.exception.ServiceException;
import by.matsuk.FinalProjectShop.service.impl.OrderService;
import com.google.gson.Gson;
import jakarta.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.List;

/**
 * The type Sort orders by date command.
 */
public class SortOrdersByDateCommand implements CustomCommand {
    private static Logger logger = LogManager.getLogger();

    @Override
    public String execute(HttpServletRequest request) {
        String page = null;
        Gson gson = new Gson();
        OrderService orderService = OrderService.getInstance();
        try {
            List<CompleteOrder> orders = orderService.findAllOrdersFromDbAndSortByDate();
            String ordersInGson = gson.toJson(orders);
            request.setAttribute(Literal.ORDERS_FOR_ADMIN, ordersInGson);
            page = PagePath.RAW_MAIN_ADMIN_ORDERS_VIEW_PAGE;
        } catch (ServiceException e) {
            logger.error(e.getMessage());
        }
        return page;
    }
}