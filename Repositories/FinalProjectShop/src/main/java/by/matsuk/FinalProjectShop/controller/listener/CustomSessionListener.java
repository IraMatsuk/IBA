package by.matsuk.FinalProjectShop.controller.listener;

import by.matsuk.FinalProjectShop.exception.ServiceException;
import by.matsuk.FinalProjectShop.service.impl.UserService;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

/**
 * The type Custom session listener.
 */
@WebListener
public class CustomSessionListener implements HttpSessionListener {
    private static Logger logger = LogManager.getLogger();
    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        try {
            UserService.getInstance().setUserStatusNotOnlineInDb(String.valueOf(se.getSession().getAttribute("login")));
        } catch (ServiceException e) {
            logger.error(e.getMessage());
        }
    }
}
