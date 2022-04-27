package by.matsuk.FinalProjectShop.entity;

import java.math.BigDecimal;

/**
 * The type Component order.
 */
public class ComponentOrder extends CustomEntity{
    private Product product;
    private Long orderedProductAmount;
    private BigDecimal orderedProductFullPrice;

    /**
     * Instantiates a new Component order.
     */
    public ComponentOrder(){
    }

    /**
     * Instantiates a new Component order.
     *
     * @param product                 the product
     * @param orderedProductAmount    the ordered product amount
     * @param orderedProductFullPrice the ordered product full price
     */
    public ComponentOrder(Product product,
                          Long orderedProductAmount, BigDecimal orderedProductFullPrice) {
        this.product = product;
        this.orderedProductAmount = orderedProductAmount;
        this.orderedProductFullPrice = orderedProductFullPrice;
    }

    /**
     * Gets product.
     *
     * @return the product
     */
    public Product getProduct() {
        return product;
    }

    /**
     * Sets product.
     *
     * @param product the product
     */
    public void setProduct(Product product) {
        this.product = product;
    }

    /**
     * Gets ordered product amount.
     *
     * @return the ordered product amount
     */
    public Long getOrderedProductAmount() {
        return orderedProductAmount;
    }

    /**
     * Sets ordered product amount.
     *
     * @param orderedProductAmount the ordered product amount
     */
    public void setOrderedProductAmount(Long orderedProductAmount) {
        this.orderedProductAmount = orderedProductAmount;
    }

    /**
     * Gets ordered product full price.
     *
     * @return the ordered product full price
     */
    public BigDecimal getOrderedProductFullPrice() {
        return orderedProductFullPrice;
    }

    /**
     * Sets ordered product full price.
     *
     * @param orderedProductFullPrice the ordered product full price
     */
    public void setOrderedProductFullPrice(BigDecimal orderedProductFullPrice) {
        this.orderedProductFullPrice = orderedProductFullPrice;
    }

    /**
     * Sets ordered product full price.
     */
    public void setOrderedProductFullPrice() {
        this.orderedProductFullPrice = product.getProductPrice().multiply(BigDecimal.valueOf(orderedProductAmount));
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ComponentOrder that = (ComponentOrder) o;

        if (product != null ? !product.equals(that.product) : that.product != null) return false;
        if (orderedProductAmount != null ? !orderedProductAmount.equals(that.orderedProductAmount) : that.orderedProductAmount != null)
            return false;
        return orderedProductFullPrice != null ? orderedProductFullPrice.equals(that.orderedProductFullPrice) : that.orderedProductFullPrice == null;
    }

    @Override
    public int hashCode() {
        int result = product != null ? product.hashCode() : 0;
        result = 31 * result + (orderedProductAmount != null ? orderedProductAmount.hashCode() : 0);
        result = 31 * result + (orderedProductFullPrice != null ? orderedProductFullPrice.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("ComponentOrder{");
        sb.append("product=").append(product);
        sb.append(", orderedProductAmount=").append(orderedProductAmount);
        sb.append(", orderedProductFullPrice=").append(orderedProductFullPrice);
        sb.append('}');
        return sb.toString();
    }
}