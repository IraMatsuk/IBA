package by.matsuk.FinalProjectShop.controller.command.impl;

import by.matsuk.FinalProjectShop.controller.Literal;
import by.matsuk.FinalProjectShop.controller.PagePath;
import by.matsuk.FinalProjectShop.controller.command.CustomCommand;
import by.matsuk.FinalProjectShop.entity.ComponentOrder;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

import java.util.List;

/**
 * The type Remove product from order command.
 */
public class RemoveProductFromOrderCommand implements CustomCommand {
    @Override
    public String execute(HttpServletRequest request) {
        String page = PagePath.ORDER_PAGE;
        Long productId = Long.parseLong(request.getParameter(Literal.PRODUCT_ID));
        Long orderedAmount = Long.parseLong(request.getParameter(Literal.PRODUCT_AMOUNT));
        HttpSession session = request.getSession();
        List<ComponentOrder> orderList = (List<ComponentOrder>) session.getAttribute(Literal.ORDER);
        int counter = 0;
        while (counter < orderList.size()) {
            if (orderList.get(counter).getProduct().getProductId().equals(productId) &&
                    orderList.get(counter).getOrderedProductAmount().equals(orderedAmount)) {
                orderList.remove(counter);
                break;
            }
            counter++;
        }
        return page;
    }
}