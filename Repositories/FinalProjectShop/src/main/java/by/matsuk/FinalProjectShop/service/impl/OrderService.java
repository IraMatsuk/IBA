package by.matsuk.FinalProjectShop.service.impl;

import by.matsuk.FinalProjectShop.controller.Literal;
import by.matsuk.FinalProjectShop.dao.OrderDao;
import by.matsuk.FinalProjectShop.dao.impl.OrderDaoImpl;
import by.matsuk.FinalProjectShop.entity.CompleteOrder;
import by.matsuk.FinalProjectShop.entity.ComponentOrder;
import by.matsuk.FinalProjectShop.entity.User;
import by.matsuk.FinalProjectShop.exception.InteractionException;
import by.matsuk.FinalProjectShop.exception.ServiceException;
import by.matsuk.FinalProjectShop.service.CustomOrderService;
import by.matsuk.FinalProjectShop.util.locale.LocalizedTextExtractor;
import by.matsuk.FinalProjectShop.util.mail.MailSender;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * The type Order service.
 */
public class OrderService implements CustomOrderService {
    private static OrderService instance;
    private static Logger logger = LogManager.getLogger();
    private OrderDao orderDao;

    private OrderService(){
        orderDao =new OrderDaoImpl();
    }

    /**
     * Gets instance.
     *
     * @return the instance
     */
    public static OrderService getInstance() {
        if(instance == null){
            instance = new OrderService();
        }
        return instance;
    }

    public void makeOrderAndSendNotificationMessageOnUserEmail(List<ComponentOrder> componentOrders, String userLogin, String currentLocale) throws ServiceException {
        LocalDate currentDate = LocalDate.now();
        User currentUser = null;
        UserService userService = UserService.getInstance();
        Optional<User> foundUser = userService.findUserWithLoginFromAllUsers(userLogin);
        if(foundUser.isPresent()) {
            currentUser = foundUser.get();
            CompleteOrder completeOrder = new CompleteOrder(currentDate,currentUser,false,componentOrders);
            try {
                orderDao.create(completeOrder);
                String completedOrderNotificationMessage = currentUser.getLogin()+", "+ LocalizedTextExtractor.getInstance().getText(currentLocale, "SUCCESSFUL_ORDER_EMAIL_BODY");
                MailSender.getInstance().send(currentUser.getEmail(), Literal.SUCCESSFUL_REG_EMAIL_HEADER,completedOrderNotificationMessage);
            } catch (InteractionException e) {
                throw new ServiceException(e.getMessage(),e);
            }
        }
    }

    public List<CompleteOrder> findAllOrdersFromDb() throws ServiceException {
        List<CompleteOrder> completeOrders = new ArrayList<>();
        try {
            completeOrders = orderDao.findAll();
            return completeOrders;
        } catch (InteractionException e) {
            throw new ServiceException(e.getMessage(),e);
        }
    }

    public List<CompleteOrder> findAllOrdersFromDbAndSortByDate() throws ServiceException {
        List<CompleteOrder> completeOrders = new ArrayList<>();
        try {
            completeOrders = orderDao.findAllCompletedOrdersAndSortByDate();
            return completeOrders;
        } catch (InteractionException e) {
            throw new ServiceException(e.getMessage(),e);
        }
    }

    public List<CompleteOrder> findAllOrdersFromDbAndSortByLogin() throws ServiceException {
        List<CompleteOrder> completeOrders = new ArrayList<>();
        try {
            completeOrders = orderDao.findAllCompletedOrdersAndSortByUserLogin();
            return completeOrders;
        } catch (InteractionException e) {
            throw new ServiceException(e.getMessage(),e);
        }
    }

    public List<CompleteOrder> findOrdersFromDbByParams(String login,LocalDate startDate,LocalDate endDate,Boolean status) throws ServiceException {
        List<CompleteOrder> allOrders = findAllOrdersFromDb();
        List<CompleteOrder> requiredOrders = new ArrayList<>();
        int counter = 0;
        while (counter < allOrders.size()){
            if(((allOrders.get(counter).getUser().getLogin().contains(login) && login.length()>3) || login.isBlank()) &&
                    allOrders.get(counter).getCompleteOrderDate().isAfter(startDate) &&
                    allOrders.get(counter).getCompleteOrderDate().isBefore(endDate)) {
                if(status == null) {
                    requiredOrders.add(allOrders.get(counter));
                } else if(allOrders.get(counter).isCompleted() == status){
                    requiredOrders.add(allOrders.get(counter));
                }
            }
            counter++;
        }
        return requiredOrders;
    }

    public boolean completeOrder(Long orderId) throws ServiceException {
        try {
            List<CompleteOrder> order = orderDao.findOrdersById(orderId);
            if(order.size() != 0) {
                if(order.get(0).isCompleted()) {
                    return false;
                } else {
                    if(orderDao.updateCompleteOrderStatus(true,orderId)) {
                        return true;
                    } else {
                        return false;
                    }
                }
            } else {
                return false;
            }
        } catch (InteractionException e) {
            throw  new ServiceException(e.getMessage(),e);
        }
    }
}