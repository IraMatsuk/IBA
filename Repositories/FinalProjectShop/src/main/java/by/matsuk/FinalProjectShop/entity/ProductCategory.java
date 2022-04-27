package by.matsuk.FinalProjectShop.entity;

/**
 * The type Product category.
 */
public class ProductCategory extends CustomEntity{
    private Long categoryId;
    private String category;

    /**
     * Instantiates a new Product category.
     */
    public ProductCategory(){
    }

    /**
     * Instantiates a new Product category.
     *
     * @param category the category
     */
    public ProductCategory(String category) {
        this.category = category;
    }

    /**
     * Instantiates a new Product category.
     *
     * @param categoryId the category id
     * @param category   the category
     */
    public ProductCategory(Long categoryId, String category) {
        this.categoryId = categoryId;
        this.category = category;
    }

    /**
     * Gets category id.
     *
     * @return the category id
     */
    public Long getCategoryId() {
        return categoryId;
    }

    /**
     * Sets category id.
     *
     * @param categoryId the category id
     */
    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    /**
     * Gets category.
     *
     * @return the category
     */
    public String getCategory() {
        return category;
    }

    /**
     * Sets category.
     *
     * @param category the category
     */
    public void setCategory(String category) {
        this.category = category;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        ProductCategory that = (ProductCategory) o;

        if (categoryId != null ? !categoryId.equals(that.categoryId) : that.categoryId != null) return false;
        return category != null ? category.equals(that.category) : that.category == null;
    }

    @Override
    public int hashCode() {
        int result = categoryId != null ? categoryId.hashCode() : 0;
        result = 31 * result + (category != null ? category.hashCode() : 0);
        return result;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("ProductCategory{");
        sb.append("categoryId=").append(categoryId);
        sb.append(", category='").append(category).append('\'');
        sb.append('}');
        return sb.toString();
    }
}