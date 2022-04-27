package by.matsuk.FinalProjectShop.controller.listener;

import by.matsuk.FinalProjectShop.pool.CustomConnectionPool;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;

/**
 * The type Context listener.
 */
@WebListener
public class ContextListener implements ServletContextListener {

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        CustomConnectionPool.getInstance().destroyPool();
    }
}