package by.matsuk.FinalProjectShop.controller.command.impl;

import by.matsuk.FinalProjectShop.controller.Literal;
import by.matsuk.FinalProjectShop.controller.PagePath;
import by.matsuk.FinalProjectShop.controller.command.CustomCommand;
import by.matsuk.FinalProjectShop.exception.ServiceException;
import by.matsuk.FinalProjectShop.service.impl.ProductService;
import jakarta.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.Map;

/**
 * The type Show products selling statistics command.
 */
public class ShowProductsSellingStatisticsCommand implements CustomCommand {
    private static Logger logger = LogManager.getLogger();

    @Override
    public String execute(HttpServletRequest request) {
        String page = null;
        ProductService productService = ProductService.getInstance();
        try {
            Map<String, Integer> productsSellingStatistics = productService.findAllProductsSellingStatistics();
            request.setAttribute(Literal.PRODUCTS_SELLING_STATISTICS, productsSellingStatistics);
            page = PagePath.PRODUCT_SELLING_STATISTICS_PAGE;
        } catch (ServiceException e) {
            logger.error(e.getMessage());
        }
        return page;
    }
}