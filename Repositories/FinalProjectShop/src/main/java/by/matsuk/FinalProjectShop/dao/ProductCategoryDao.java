package by.matsuk.FinalProjectShop.dao;

import by.matsuk.FinalProjectShop.entity.ProductCategory;
import by.matsuk.FinalProjectShop.exception.InteractionException;

import java.util.List;

/**
 * The interface Product category dao.
 */
public interface ProductCategoryDao extends BaseDao<ProductCategory>{
    /**
     * Find product category by name and collect them in the list.
     *
     * @param name the name
     * @return the list
     * @throws InteractionException the interaction exception
     */
    List<ProductCategory> findProductCategoryByName(String name) throws InteractionException;

    /**
     * Update category name and return boolean true if operation was successful.
     *
     * @param newCategoryName the new category name
     * @param oldCategoryName the old category name
     * @return the boolean success result
     * @throws InteractionException the interaction exception
     */
    boolean updateCategoryName(String newCategoryName, String oldCategoryName) throws InteractionException;
}