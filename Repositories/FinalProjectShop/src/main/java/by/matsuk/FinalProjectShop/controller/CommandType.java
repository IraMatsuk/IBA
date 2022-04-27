package by.matsuk.FinalProjectShop.controller;

import by.matsuk.FinalProjectShop.controller.command.CustomCommand;
import by.matsuk.FinalProjectShop.controller.command.impl.*;

/**
 * The enum Command type.
 */
public enum CommandType {
    /**
     * The Login.
     */
    LOGIN {
        {
            this.command = new LoginCommand();
        }
    },
    /**
     * The Logout.
     */
    LOGOUT{
        {
            this.command = new LogoutCommand();
        }
    },
    /**
     * The Register.
     */
    REGISTER {
        {
            this.command = new RegisterCommand();
        }
    },
    /**
     * The Confirm registration.
     */
    CONFIRM_REGISTRATION {
        {
            this.command = new ConfRegCommand();
        }
    },
    /**
     * The Empty.
     */
    EMPTY {
        {
            this.command = new EmptyCommand();
        }
    },
    /**
     * The Prepare main client page.
     */
    PREPARE_MAIN_CLIENT_PAGE {
        {
            this.command = new FillMainClientMenuCommand();
        }
    },
    /**
     * The Change locale.
     */
    CHANGE_LOCALE {
        {
            this.command = new ChangeLocaleCommand();
        }
    },
    /**
     * The Change login.
     */
    CHANGE_LOGIN {
        {
            this.command = new ChangeLoginCommand();
        }
    },
    /**
     * The Change password.
     */
    CHANGE_PASSWORD {
        {
            this.command = new ChangePasswordCommand();
        }
    },
    /**
     * The Sort products by name.
     */
    SORT_PRODUCTS_BY_NAME {
        {
            this.command = new SortProductsByNameCommand();
        }
    },
    /**
     * The Sort products by category.
     */
    SORT_PRODUCTS_BY_CATEGORY {
        {
            this.command = new SortProductsByCategoryCommand();
        }
    },
    /**
     * The Sort products by price.
     */
    SORT_PRODUCTS_BY_PRICE {
        {
            this.command = new SortProductsByPriceCommand();
        }
    },
    /**
     * The Find product.
     */
    FIND_PRODUCT {
        {
            this.command = new FindProductCommand();
        }
    },
    /**
     * The Add product to bucket.
     */
    ADD_PRODUCT_TO_BUCKET {
        {
            this.command = new AddProductToOrderCommand();
        }
    },
    /**
     * The Open user basket.
     */
    OPEN_USER_BASKET {
        {
            this.command = new OpenUserOrderCommand();
        }
    },
    /**
     * The Open order page wrapper.
     */
    OPEN_ORDER_PAGE_WRAPPER {
        {
            this.command = new OpenOrderPageWrapperCommand();
        }
    },
    /**
     * The Remove product from order.
     */
    REMOVE_PRODUCT_FROM_ORDER {
        {
            this.command = new RemoveProductFromOrderCommand();
        }
    },
    /**
     * The Make order.
     */
    MAKE_ORDER {
        {
            this.command = new MakeOrderCommand();
        }
    },
    /**
     * The Prepare main admin page.
     */
    PREPARE_MAIN_ADMIN_PAGE {
        {
            this.command = new FillMainAdminMenuCommand();
        }
    },
    /**
     * The Prepare product adding page.
     */
    PREPARE_PRODUCT_ADDING_PAGE {
        {
            this.command = new FillProductAddingMenuCommand();
        }
    },
    /**
     * The Prepare view users page.
     */
    PREPARE_VIEW_USERS_PAGE {
        {
            this.command = new FillAdminUsersViewMenuCommand();
        }
    },
    /**
     * The Prepare view orders page.
     */
    PREPARE_VIEW_ORDERS_PAGE {
        {
            this.command = new FillAdminOrdersViewMenuCommand();
        }
    },
    /**
     * The Add product to catalog.
     */
    ADD_PRODUCT_TO_CATALOG {
        {
            this.command = new AddProductToCatalogCommand();
        }
    },
    /**
     * The Change product.
     */
    CHANGE_PRODUCT {
        {
            this.command = new FillChangeProductDataMenuCommand();
        }
    },
    /**
     * The Change product data.
     */
    CHANGE_PRODUCT_DATA {
        {
            this.command = new ChangeProductDataCommand();
        }
    },
    /**
     * The Prepare admin adding page.
     */
    PREPARE_ADMIN_ADDING_PAGE {
        {
            this.command = new FillAdminAddingMenuCommand();
        }
    },
    /**
     * The Register admin.
     */
    REGISTER_ADMIN {
        {
            this.command = new RegisterAdminCommand();
        }
    },
    /**
     * The Find in stock products.
     */
    FIND_IN_STOCK_PRODUCTS {
        {
            this.command = new FindInStockProductsCommand();
        }
    },
    /**
     * The Find out of stock stock products.
     */
    FIND_OUT_OF_STOCK_STOCK_PRODUCTS {
        {
            this.command = new FindOutOfStockProductsCommand();
        }
    },
    /**
     * The Find user.
     */
    FIND_USER {
        {
            this.command = new FindUserCommand();
        }
    },
    /**
     * The Delete user.
     */
    DELETE_USER {
        {
            this.command = new DeleteUserCommand();
        }
    },
    /**
     * The Sort orders by date.
     */
    SORT_ORDERS_BY_DATE {
        {
            this.command = new SortOrdersByDateCommand();
        }
    },
    /**
     * The Sort orders by user login.
     */
    SORT_ORDERS_BY_USER_LOGIN {
        {
            this.command = new SortOrdersByLoginCommand();
        }
    },
    /**
     * The Find order.
     */
    FIND_ORDER {
        {
            this.command = new FindOrderCommand();
        }
    },
    /**
     * The Complete order.
     */
    COMPLETE_ORDER {
        {
            this.command = new CompleteOrderCommand();
        }
    },
    /**
     * The Show products selling statistics.
     */
    SHOW_PRODUCTS_SELLING_STATISTICS {
        {
            this.command = new ShowProductsSellingStatisticsCommand();
        }
    };
    /**
     * The Command.
     */
    CustomCommand command;

    /**
     * Get current command custom command.
     *
     * @return the custom command
     */
    public CustomCommand getCurrentCommand(){
        return command;
    }

    /**
     * Define command custom command.
     *
     * @param requestCommand the request command
     * @return the custom command
     */
    public static CustomCommand defineCommand(String requestCommand){
        CustomCommand command;
        CommandType currentEnum;
        try {
            currentEnum = CommandType.valueOf(requestCommand.toUpperCase());
        } catch (IllegalArgumentException e){
            currentEnum = CommandType.PREPARE_MAIN_CLIENT_PAGE;
        }
        command =currentEnum.getCurrentCommand();
        return command;
    }
}
