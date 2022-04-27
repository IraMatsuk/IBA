package by.matsuk.FinalProjectShop.controller.command.impl;

import by.matsuk.FinalProjectShop.controller.Literal;
import by.matsuk.FinalProjectShop.controller.PagePath;
import by.matsuk.FinalProjectShop.controller.command.CustomCommand;
import by.matsuk.FinalProjectShop.controller.validator.ProductDataValidator;
import by.matsuk.FinalProjectShop.controller.validator.impl.CustomProductDataValidator;
import by.matsuk.FinalProjectShop.entity.Product;
import by.matsuk.FinalProjectShop.entity.ProductCategory;
import by.matsuk.FinalProjectShop.exception.ServiceException;
import by.matsuk.FinalProjectShop.service.impl.ProductService;
import by.matsuk.FinalProjectShop.util.locale.LocalizedTextExtractor;
import com.google.gson.Gson;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * The type Change product data command.
 */
public class ChangeProductDataCommand implements CustomCommand {
    private static Logger logger = LogManager.getLogger();
    private static final String IMAGE_LOCATION_FOLDER = "pictures\\";

    @Override
    public String execute(HttpServletRequest request) {
        String page = null;
        LocalizedTextExtractor localizedTextExtractor = LocalizedTextExtractor.getInstance();
        String rawId = request.getParameter(Literal.PRODUCT_ID);
        String name = request.getParameter(Literal.PRODUCT_NAME);
        String rawPrice = request.getParameter(Literal.PRODUCT_PRICE);
        String category = request.getParameter(Literal.PRODUCT_CATEGORY);
        String imagePath = request.getParameter(Literal.PRODUCT_IMAGE_PATH);
        String comment = request.getParameter(Literal.PRODUCT_COMMENT);
        Map<String, String> formData = new HashMap<>();
        formData.put(Literal.PRODUCT_ID, rawId);
        formData.put(Literal.PRODUCT_NAME, name);
        formData.put(Literal.PRODUCT_PRICE, rawPrice);
        formData.put(Literal.PRODUCT_CATEGORY, category);
        formData.put(Literal.PRODUCT_IMAGE_PATH, imagePath);
        formData.put(Literal.PRODUCT_COMMENT, comment);
        Boolean isInStock = true;
        if (request.getParameter(Literal.PRODUCT_IN_STOCK_STATUS) == null) {
            isInStock = false;
        }
        ProductService productService = ProductService.getInstance();
        Gson gson = new Gson();
        ProductDataValidator productDataValidator = CustomProductDataValidator.getInstance();
        HttpSession session = request.getSession();
        String currentLocale = session.getAttribute(Literal.LOCALE_NAME).toString();
        try {
            List<ProductCategory> productCategories = productService.findAllProductCategoriesFromDb();
            String productCategoriesInGson = gson.toJson(productCategories);
            request.setAttribute(Literal.PRODUCT_CATEGORIES_FOR_SEARCH, productCategoriesInGson);
            if (productDataValidator.validateProductAddData(formData, currentLocale)) {
                String finalImagePath = null;
                if (!imagePath.isBlank()) {
                    finalImagePath = IMAGE_LOCATION_FOLDER + imagePath;
                }
                BigDecimal price = BigDecimal.valueOf(Double.parseDouble(rawPrice));
                Long productId = Long.parseLong(rawId);
                Product product = new Product(productId, name, price, isInStock, finalImagePath, comment, new ProductCategory(category));
                if (productService.updateChangedFieldsInProduct(product)) {
                    page = PagePath.MAIN_ADMIN_PAGE;
                } else {
                    request.setAttribute(Literal.CHANGE_PRODUCT_ERROR_MESSAGE,
                            localizedTextExtractor.getText(currentLocale, "UNEXPECTED_ERROR"));
                    request.setAttribute(Literal.PRODUCT_FOR_CHANGE_DATA, formData);
                    page = PagePath.RAW_CHANGE_PRODUCT;
                }
            } else {
                request.setAttribute(Literal.CHANGE_PRODUCT_ERROR_MESSAGE,
                        localizedTextExtractor.getText(currentLocale, "INVALID_FORM_DATA_ERROR"));
                request.setAttribute(Literal.PRODUCT_FOR_CHANGE_DATA, formData);
                page = PagePath.RAW_CHANGE_PRODUCT;
            }
        } catch (ServiceException e) {
            logger.error(e.getMessage(), e);
        }
        return page;
    }
}