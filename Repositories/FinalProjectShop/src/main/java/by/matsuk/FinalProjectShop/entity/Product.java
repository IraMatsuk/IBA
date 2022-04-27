package by.matsuk.FinalProjectShop.entity;

import java.math.BigDecimal;

/**
 * The type Product.
 */
public class Product extends CustomEntity{
    private Long productId;
    private String productName;
    private BigDecimal productPrice;
    private boolean isInStock;
    private String picturePath;
    private String productComment;
    private ProductCategory productCategory;

    /**
     * Instantiates a new Product.
     */
    public Product(){
    }

    /**
     * Instantiates a new Product.
     *
     * @param productId the product id
     */
    public Product(Long productId){
        this.productId = productId;
    }

    /**
     * Instantiates a new Product.
     *
     * @param productId       the product id
     * @param productName     the product name
     * @param productPrice    the product price
     * @param isInStock       the is in stock
     * @param picturePath     the picture path
     * @param productComment  the product comment
     * @param productCategory the product category
     */
    public Product(Long productId, String productName, BigDecimal productPrice,
                   boolean isInStock, String picturePath, String productComment,
                   ProductCategory productCategory) {
        this.productId = productId;
        this.productName = productName;
        this.productPrice = productPrice;
        this.isInStock = isInStock;
        this.picturePath = picturePath;
        this.productComment = productComment;
        this.productCategory = productCategory;
    }

    /**
     * Instantiates a new Product.
     *
     * @param productName     the product name
     * @param productPrice    the product price
     * @param isInStock       the is in stock
     * @param picturePath     the picture path
     * @param productComment  the product comment
     * @param productCategory the product category
     */
    public Product(String productName, BigDecimal productPrice,
                   boolean isInStock, String picturePath, String productComment,
                   ProductCategory productCategory) {
        this.productName = productName;
        this.productPrice = productPrice;
        this.isInStock = isInStock;
        this.picturePath = picturePath;
        this.productComment = productComment;
        this.productCategory = productCategory;
    }

    /**
     * Instantiates a new Product.
     *
     * @param productName     the product name
     * @param isInStock       the is in stock
     * @param productCategory the product category
     */
    public Product(String productName,
                   boolean isInStock,
                   ProductCategory productCategory) {
        this.productName = productName;
        this.isInStock = isInStock;
        this.productCategory = productCategory;
    }

    /**
     * Gets product id.
     *
     * @return the product id
     */
    public Long getProductId() {
        return productId;
    }

    /**
     * Sets product id.
     *
     * @param productId the product id
     */
    public void setProductId(Long productId) {
        this.productId = productId;
    }

    /**
     * Gets product name.
     *
     * @return the product name
     */
    public String getProductName() {
        return productName;
    }

    /**
     * Sets product name.
     *
     * @param productName the product name
     */
    public void setProductName(String productName) {
        this.productName = productName;
    }

    /**
     * Gets product price.
     *
     * @return the product price
     */
    public BigDecimal getProductPrice() {
        return productPrice;
    }

    /**
     * Sets product price.
     *
     * @param productPrice the product price
     */
    public void setProductPrice(BigDecimal productPrice) {
        this.productPrice = productPrice;
    }

    /**
     * Is in stock boolean.
     *
     * @return the boolean
     */
    public boolean isInStock() {
        return isInStock;
    }

    /**
     * Sets in stock status.
     *
     * @param inStock the in stock
     */
    public void setInStockStatus(boolean inStock) {
        isInStock = inStock;
    }

    /**
     * Gets picture path.
     *
     * @return the picture path
     */
    public String getPicturePath() {
        return picturePath;
    }

    /**
     * Sets picture path.
     *
     * @param picturePath the picture path
     */
    public void setPicturePath(String picturePath) {
        this.picturePath = picturePath;
    }

    /**
     * Gets product comment.
     *
     * @return the product comment
     */
    public String getProductComment() {
        return productComment;
    }

    /**
     * Sets product comment.
     *
     * @param productComment the product comment
     */
    public void setProductComment(String productComment) {
        this.productComment = productComment;
    }

    /**
     * Gets product category.
     *
     * @return the product category
     */
    public ProductCategory getProductCategory() {
        return productCategory;
    }

    /**
     * Sets product category.
     *
     * @param productCategory the product category
     */
    public void setProductCategory(ProductCategory productCategory) {
        this.productCategory = productCategory;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Product product = (Product) o;

        if (isInStock != product.isInStock) return false;
        if (productId != null ? !productId.equals(product.productId) : product.productId != null) return false;
        if (productName != null ? !productName.equals(product.productName) : product.productName != null) return false;
        if (productPrice != null ? !productPrice.equals(product.productPrice) : product.productPrice != null)
            return false;
        if (picturePath != null ? !picturePath.equals(product.picturePath) : product.picturePath != null) return false;
        if (productComment != null ? !productComment.equals(product.productComment) : product.productComment != null)
            return false;
        return productCategory != null ? productCategory.equals(product.productCategory) : product.productCategory == null;
    }

    @Override
    public int hashCode() {
        int result = productId != null ? productId.hashCode() : 0;
        result = 31 * result + (productName != null ? productName.hashCode() : 0);
        result = 31 * result + (productPrice != null ? productPrice.hashCode() : 0);
        result = 31 * result + (isInStock ? 1 : 0);
        result = 31 * result + (picturePath != null ? picturePath.hashCode() : 0);
        result = 31 * result + (productComment != null ? productComment.hashCode() : 0);
        result = 31 * result + (productCategory != null ? productCategory.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Product{");
        sb.append("productId=").append(productId);
        sb.append(", productName='").append(productName).append('\'');
        sb.append(", productPrice=").append(productPrice);
        sb.append(", isInStock=").append(isInStock);
        sb.append(", picturePath='").append(picturePath).append('\'');
        sb.append(", productComment='").append(productComment).append('\'');
        sb.append(", productCategory=").append(productCategory);
        sb.append('}');
        return sb.toString();
    }
}