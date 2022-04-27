package by.matsuk.FinalProjectShop.controller.command.impl;

import by.matsuk.FinalProjectShop.controller.Literal;
import by.matsuk.FinalProjectShop.controller.PagePath;
import by.matsuk.FinalProjectShop.controller.command.CustomCommand;
import by.matsuk.FinalProjectShop.entity.ComponentOrder;
import by.matsuk.FinalProjectShop.entity.Product;
import by.matsuk.FinalProjectShop.exception.ServiceException;
import by.matsuk.FinalProjectShop.service.impl.ProductService;
import jakarta.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.math.BigDecimal;
import java.util.List;
import java.util.Optional;

/**
 * The type Add product to order command.
 */
public class AddProductToOrderCommand implements CustomCommand {
    private static Logger logger = LogManager.getLogger();

    @Override
    public String execute(HttpServletRequest request) {
        String page = null;
        ProductService productService = ProductService.getInstance();
        Long productId = Long.parseLong(request.getParameter(Literal.PRODUCT_ID));
        Long productAmount = Long.parseLong(request.getParameter(Literal.PRODUCT_AMOUNT));
        try {
            page = PagePath.MAIN_CLIENT_PAGE;
            Optional<Product> foundProductInDbById = productService.findProductById(productId);
            if(foundProductInDbById.isPresent()){
                List<ComponentOrder> ordersList = (List<ComponentOrder>) request.getSession().getAttribute(Literal.ORDER);
                ComponentOrder newComponentToAddInOrder = new ComponentOrder(foundProductInDbById.get(), productAmount,
                        foundProductInDbById.get().getProductPrice().multiply(BigDecimal.valueOf(productAmount)));
                ordersList.add(newComponentToAddInOrder);
            }
        } catch (ServiceException e) {
            logger.error(e.getMessage());
        }
        return page;
    }
}