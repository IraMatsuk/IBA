package by.matsuk.FinalProjectShop.controller.command.impl;

import by.matsuk.FinalProjectShop.controller.Literal;
import by.matsuk.FinalProjectShop.controller.PagePath;
import by.matsuk.FinalProjectShop.controller.command.CustomCommand;
import by.matsuk.FinalProjectShop.entity.ComponentOrder;
import com.google.gson.Gson;
import jakarta.servlet.http.HttpServletRequest;

import java.util.List;

/**
 * The type Open user order command.
 */
public class OpenUserOrderCommand implements CustomCommand {
    @Override
    public String execute(HttpServletRequest request) {
        String page = null;
        Gson gson = new Gson();
        List<ComponentOrder> componentOrders = (List<ComponentOrder>) request.getSession().getAttribute(Literal.ORDER);
        String orderInGson = gson.toJson(componentOrders);
        request.setAttribute(Literal.PRODUCTS_IN_ORDER, orderInGson);
        page = PagePath.RAW_ORDER_PAGE;
        return page;
    }
}