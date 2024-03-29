package by.matsuk.FinalProjectShop.service.impl;

import by.matsuk.FinalProjectShop.controller.Literal;
import by.matsuk.FinalProjectShop.dao.UserDao;
import by.matsuk.FinalProjectShop.dao.impl.UserDaoImpl;
import by.matsuk.FinalProjectShop.entity.User;
import by.matsuk.FinalProjectShop.entity.UserRole;
import by.matsuk.FinalProjectShop.exception.InteractionException;
import by.matsuk.FinalProjectShop.exception.ServiceException;
import by.matsuk.FinalProjectShop.service.CustomUserService;
import by.matsuk.FinalProjectShop.util.encryptor.impl.PasswordEncryptor;
import by.matsuk.FinalProjectShop.util.locale.LocalizedTextExtractor;
import by.matsuk.FinalProjectShop.util.mail.MailSender;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * The type User service.
 */
public class UserService implements CustomUserService {
    private static final String EMPTY_ROLE = "-";
    private static UserService instance;
    private UserDao userDao;
    private PasswordEncryptor encryptor;

    private UserService(){
        userDao = new UserDaoImpl();
        encryptor = new PasswordEncryptor();
    }

    /**
     * Get instance user service.
     *
     * @return the user service
     */
    public static UserService getInstance(){
        if(instance ==null){
            instance = new UserService();
        }
        return instance;
    }

    public Optional<User> findUserWithLoginAndPassword(String login,String password,Boolean enterAsAdmin) throws ServiceException {
        String encryptedPassword = encryptor.encryptPassword(password);
        Optional<User> result = Optional.empty();
        try {
            List<User> foundUsers = userDao.findUserWithSuchLogin(login);
            if(foundUsers.size() == 0){
                return result;
            }else {
                if(foundUsers.get(0).getPassword().equals(encryptedPassword)){
                    if(!enterAsAdmin){
                        result = Optional.of(foundUsers.get(0));
                        userDao.updateOnlineStatus(login,true);
                        return result;
                    }else {
                        if(foundUsers.get(0).getUserRoleName().equals(UserRole.ADMIN.toString())){
                            result = Optional.of(foundUsers.get(0));
                            userDao.updateOnlineStatus(login,true);
                            return result;
                        }else {
                            return result;
                        }
                    }
                } else {
                    return result;
                }
            }
        } catch (InteractionException e) {
            throw new ServiceException(e.getMessage(),e);
        }
    }
    public Optional<User> findUserWithLogin(String login) throws ServiceException {
        Optional<User> result = Optional.empty();
        try {
            List<User> foundUsers = userDao.findUserWithSuchLogin(login);
            if(foundUsers.size() == 0){
            }else {
                result = Optional.of(foundUsers.get(0));
            }
            return result;
        } catch (InteractionException e) {
            throw new ServiceException(e.getMessage(),e);
        }
    }
    public Optional<User> findUserWithLoginFromAllUsers(String login) throws ServiceException {
        Optional<User> result = Optional.empty();
        try {
            List<User> foundUsers = userDao.findUserFromAllUsersWithSuchLogin(login);
            if(foundUsers.size() == 0){
            }else {
                result = Optional.of(foundUsers.get(0));
            }
            return result;
        } catch (InteractionException e) {
            throw new ServiceException(e.getMessage(),e);
        }
    }
    public boolean checkIfUserIsValidForRegistration(String login, String email) throws ServiceException {
        try {
            List<User> foundUsers = userDao.findUserFromAllUsersWithSuchLogin(login);
            if(foundUsers.size() != 0){
                return false;
            }else {
                foundUsers = userDao.findUserWithSuchEmail(email);
                return foundUsers.size() == 0;
            }
        } catch (InteractionException e) {
            throw new ServiceException(e.getMessage(),e);
        }
    }
    public boolean registerUser(String login,String password, String email) throws ServiceException {
        User userForRegistration = new User(login, email, password,UserRole.CLIENT,true,true);
        try {
            Optional<Long> idOfCreatedUser = Optional.ofNullable(userDao.create(userForRegistration));
            return idOfCreatedUser.isPresent();
        } catch (InteractionException e){
            throw new ServiceException(e.getMessage(),e);
        }
    }

    public boolean registerAdmin(String login,String password, String email) throws ServiceException {
        User userForRegistration = new User(login, email, password,UserRole.ADMIN,true,false);
        try {
            Optional<Long> idOfCreatedUser = Optional.ofNullable(userDao.create(userForRegistration));
            return idOfCreatedUser.isPresent();
        } catch (InteractionException e){
            throw new ServiceException(e.getMessage(),e);
        }
    }

    public void sendMessageAboutSuccessFullRegistrationOnUserEmail(String login, String email,String currentLocale){
        String finalRegistrationMessage = login+", "+ LocalizedTextExtractor.getInstance().getText(currentLocale, "SUCCESSFUL_REG_EMAIL_BODY");
        MailSender.getInstance().send(email, Literal.SUCCESSFUL_REG_EMAIL_HEADER,finalRegistrationMessage);
    }
    public void setUserStatusNotOnlineInDb(String login) throws ServiceException {
        try {
            userDao.updateOnlineStatus(login,false);
        } catch (InteractionException e) {
            throw new ServiceException(e.getMessage(),e);
        }
    }

    public void setUserNewLogin(String login,String newLogin) throws ServiceException {
        try {
            userDao.updateLogin(login,newLogin);
        } catch (InteractionException e) {
            throw new ServiceException(e.getMessage(),e);
        }
    }

    public void setUserNewPassword(String login,String newPassword) throws ServiceException {
        try {
            userDao.updatePassword(login, newPassword);
        } catch (InteractionException e) {
            throw new ServiceException(e.getMessage(),e);
        }
    }

    public List<User> findAllUsers() throws ServiceException {
        List<User> users = new ArrayList<>();
        try {
            users = userDao.findAllActiveUsers();
            return users;
        } catch (InteractionException e) {
            throw new ServiceException(e.getMessage(),e);
        }
    }

    public List<User> findActiveUsersFromDbByParams(String login,String email,String role,Boolean status) throws ServiceException {
        List<User> allUsers = findAllUsers();
        List<User> requiredUsers = new ArrayList<>();
        int counter = 0;
        while (counter < allUsers.size()){
            if(((allUsers.get(counter).getLogin().contains(login) && login.length()>3) || login.isBlank()) &&
                    ((allUsers.get(counter).getEmail().contains(email) && email.length()>3) || email.isBlank()) &&
                    (allUsers.get(counter).getUserRoleName().toLowerCase().equals(role) || role.equals(EMPTY_ROLE))) {
                if(status == null) {
                    requiredUsers.add(allUsers.get(counter));
                } else if(allUsers.get(counter).isOnline() == status){
                    requiredUsers.add(allUsers.get(counter));
                }
            }
            counter++;
        }
        return requiredUsers;
    }

    public boolean deleteUser(String login) throws ServiceException {
        try {
            List<User> user = userDao.findUserFromAllUsersWithSuchLogin(login);
            if(user.size() != 0) {
                if(!user.get(0).isOnline()) {
                    return userDao.updateActivationStatus(login,false);
                } else {
                    return false;
                }
            } else {
                return false;
            }
        } catch (InteractionException e){
            throw new ServiceException(e.getMessage(),e);
        }
    }
}