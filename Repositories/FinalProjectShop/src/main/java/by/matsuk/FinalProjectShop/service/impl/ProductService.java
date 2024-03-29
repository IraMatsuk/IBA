package by.matsuk.FinalProjectShop.service.impl;

import by.matsuk.FinalProjectShop.dao.ProductCategoryDao;
import by.matsuk.FinalProjectShop.dao.ProductDao;
import by.matsuk.FinalProjectShop.dao.impl.ProductCategoryDaoImpl;
import by.matsuk.FinalProjectShop.dao.impl.ProductDaoImpl;
import by.matsuk.FinalProjectShop.entity.Product;
import by.matsuk.FinalProjectShop.entity.ProductCategory;
import by.matsuk.FinalProjectShop.exception.InteractionException;
import by.matsuk.FinalProjectShop.exception.ServiceException;
import by.matsuk.FinalProjectShop.service.CustomProductService;

import java.math.BigDecimal;
import java.util.*;

/**
 * The type Product service.
 */
public class ProductService implements CustomProductService {
    private static final String BLANK_CATEGORY_VALUE = "-";
    private static ProductService instance;
    private ProductDao productDao;
    private ProductCategoryDao productCategoryDao;

    private ProductService(){
        productDao = new ProductDaoImpl();
        productCategoryDao = new ProductCategoryDaoImpl();
    }

    /**
     * Get instance product service.
     *
     * @return the product service
     */
    public static ProductService getInstance(){
        if(instance == null){
            instance = new ProductService();
        }
        return instance;
    }

    public List<Product> findAllProductsInStockFromDb() throws ServiceException {
        List<Product> products = new ArrayList<>();
        try {
            products = productDao.findAllProductInStock();
        } catch (InteractionException e) {
            throw new ServiceException(e.getMessage(),e);
        }
        return products;
    }

    public List<ProductCategory> findAllProductCategoriesFromDb() throws ServiceException {
        List<ProductCategory> productCategories = new ArrayList<>();
        try {
            productCategories = productCategoryDao.findAll();
        } catch (InteractionException e) {
            throw new ServiceException(e.getMessage(),e);
        }
        return productCategories;
    }

    public List<Product> findAllProductsInStockFromDbAndSortByName() throws ServiceException {
        List<Product> products = new ArrayList<>();
        try {
            products = productDao.findAllProductInStockAndSortByName();
        } catch (InteractionException e) {
            throw new ServiceException(e.getMessage(),e);
        }
        return products;
    }

    public List<Product> findAllProductsInStockFromDbAndSortByCategory() throws ServiceException {
        List<Product> products = new ArrayList<>();
        try {
            products = productDao.findAllProductInStockAndSortByCategory();
        } catch (InteractionException e) {
            throw new ServiceException(e.getMessage(),e);
        }
        return products;
    }

    public Map<String,Integer> findAllProductsSellingStatistics() throws ServiceException {
        Map<String,Integer> productsSellingStatistics = new HashMap<>();
        try {
            productsSellingStatistics = productDao.findProductsSellingStatistics();
        } catch (InteractionException e) {
            throw new ServiceException(e.getMessage(),e);
        }
        return productsSellingStatistics;
    }

    public List<Product> findAllProductsInStockFromDbAndSortByPrice() throws ServiceException {
        List<Product> products = new ArrayList<>();
        try {
            products = productDao.findAllProductInStockAndSortByPrice();
        } catch (InteractionException e) {
            throw new ServiceException(e.getMessage(),e);
        }
        return products;
    }

    public List<Product> findProductsInStockFromDbByParams(String name, String category, BigDecimal minPrice, BigDecimal maxPrice) throws ServiceException {
        List<Product> allProducts = findAllProductsInStockFromDb();
        List<Product> requiredProducts = new ArrayList<>();
        int counter = 0;
        while (counter < allProducts.size()){
            if(((allProducts.get(counter).getProductName().contains(name) && name.length()>3) || name.isBlank()) &&
                    (allProducts.get(counter).getProductCategory().getCategory().equals(category) || category.equals(BLANK_CATEGORY_VALUE)) &&
                    (allProducts.get(counter).getProductPrice().compareTo(minPrice) > -1 || minPrice.compareTo(BigDecimal.valueOf(0)) == 0) && (allProducts.get(counter).getProductPrice().compareTo(maxPrice) < 1 || maxPrice.compareTo(BigDecimal.valueOf(0)) == 0)) {
                requiredProducts.add(allProducts.get(counter));
            }
            counter++;
        }
        return requiredProducts;
    }

    public Optional<Product> findProductById(Long productId) throws ServiceException {
        Optional<Product> foundProduct = Optional.empty();
        try {
            List<Product> dbSearchResult = productDao.findProductById(productId);
            if(dbSearchResult.size() > 0 ) {
                foundProduct = Optional.ofNullable(dbSearchResult.get(0));
            }
        } catch (InteractionException e) {
            throw new ServiceException(e.getMessage(),e);
        }
        return foundProduct;
    }

    public Optional<Product> findProductByName(String name) throws ServiceException {
        Optional<Product> foundProduct = Optional.empty();
        try {
            List<Product> dbSearchResult = productDao.findProductsByName(name);
            if(dbSearchResult.size() > 0 ) {
                foundProduct = Optional.ofNullable(dbSearchResult.get(0));
            }
        } catch (InteractionException e) {
            throw new ServiceException(e.getMessage(),e);
        }
        return foundProduct;
    }

    public List<Product> findAllProductsFromDb() throws ServiceException {
        List<Product> products = new ArrayList<>();
        try {
            products = productDao.findAll();
        } catch (InteractionException e) {
            throw new ServiceException(e.getMessage(),e);
        }
        return products;
    }

    public List<Product> findAllOutOfStockProductsFromDb() throws ServiceException {
        List<Product> products = new ArrayList<>();
        try {
            products = productDao.findAllProductOutOfStock();
        } catch (InteractionException e) {
            throw new ServiceException(e.getMessage(),e);
        }
        return products;
    }

    public boolean addProductToDb(Product product) throws ServiceException {
        try {
            Optional<Long> createdProductId = Optional.ofNullable(productDao.create(product));
            return createdProductId.isPresent();
        } catch (InteractionException e) {
            throw new ServiceException(e.getMessage(),e);
        }
    }

    public boolean updateChangedFieldsInProduct(Product product) throws ServiceException {
        Long productId = product.getProductId();
        boolean isValidToChange = true;
        String newName = null;
        String newCategory = null;
        BigDecimal newPrice = null;
        String newComment = null;
        Boolean newStatus = null;
        String newImagePath = null;
        try {
            Optional<Product> initialProduct  = findProductById(productId);
            if (initialProduct.isPresent()) {
                if (!product.getProductName().trim().equals(initialProduct.get().getProductName())) {
                    Optional<Product> productWithNewName = findProductByName(product.getProductName());
                    if(!productWithNewName.isPresent()) {
                        newName = product.getProductName();
                    } else {
                        isValidToChange = false;
                    }
                }
                if (!product.getProductCategory().getCategory().equals(initialProduct.get().getProductCategory().getCategory())) {
                    newCategory = product.getProductCategory().getCategory();
                }
                if (!product.getProductPrice().equals(initialProduct.get().getProductPrice())) {
                    newPrice = product.getProductPrice();
                }
                if (!product.getProductComment().equals(initialProduct.get().getProductComment())) {
                    newComment = product.getProductComment();
                }
                if(product.getPicturePath() != null) {
                    if (!product.getPicturePath().equals(initialProduct.get().getPicturePath())) {
                        newImagePath = product.getPicturePath();
                    }
                }
                if (product.isInStock() != initialProduct.get().isInStock()) {
                    newStatus = product.isInStock();
                }
            } else {
                isValidToChange = false;
            }
            if (isValidToChange) {
                if(newName != null) {
                    productDao.updateProductName(newName,productId);
                }
                if (newCategory != null) {
                    productDao.updateProductCategory(newCategory,productId);
                }
                if (newPrice != null) {
                    productDao.updatePrice(newPrice,productId);
                }
                if(newComment != null) {
                    productDao.updateComment(newComment,productId);
                }
                if(newStatus != null) {
                    productDao.updateIsInStockStatus(newStatus,productId);
                }
                if(newImagePath != null) {
                    productDao.updatePicturePath(newImagePath,productId);
                }
            }
            return isValidToChange;
        } catch (InteractionException e) {
            throw new ServiceException(e.getMessage(),e);
        }
    }
}