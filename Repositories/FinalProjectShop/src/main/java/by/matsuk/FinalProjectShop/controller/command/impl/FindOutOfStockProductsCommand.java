package by.matsuk.FinalProjectShop.controller.command.impl;

import by.matsuk.FinalProjectShop.controller.Literal;
import by.matsuk.FinalProjectShop.controller.PagePath;
import by.matsuk.FinalProjectShop.controller.command.CustomCommand;
import by.matsuk.FinalProjectShop.entity.Product;
import by.matsuk.FinalProjectShop.exception.ServiceException;
import by.matsuk.FinalProjectShop.service.impl.ProductService;
import com.google.gson.Gson;
import jakarta.servlet.http.HttpServletRequest;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.List;

/**
 * The type Find out of stock products command.
 */
public class FindOutOfStockProductsCommand implements CustomCommand {
    private static Logger logger = LogManager.getLogger();

    @Override
    public String execute(HttpServletRequest request) {
        String page = null;
        Gson gson = new Gson();
        ProductService service = ProductService.getInstance();
        try {
            List<Product> products = service.findAllOutOfStockProductsFromDb();
            String productsInGson = gson.toJson(products);
            request.setAttribute(Literal.PRODUCTS_FOR_ADMIN, productsInGson);
            page = PagePath.RAW_MAIN_ADMIN_PAGE;
        } catch (ServiceException e) {
            logger.error(e.getMessage());
        }
        return page;
    }
}
