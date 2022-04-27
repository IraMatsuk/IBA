package by.matsuk.FinalProjectShop.entity;

/**
 * The type User.
 */
public class User extends CustomEntity {
    private Long userId;
    private String login;
    private String email;
    private String password;
    private UserRole userRole;
    private boolean isActive;
    private boolean isOnline;

    /**
     * Instantiates a new User.
     *
     * @param userId   the user id
     * @param login    the login
     * @param email    the email
     * @param password the password
     * @param userRole the user role
     * @param isActive the is active
     * @param isOnline the is online
     */
    public User(Long userId, String login, String email, String password, UserRole userRole, boolean isActive, boolean isOnline) {
        this.userId = userId;
        this.login = login;
        this.email = email;
        this.password = password;
        this.userRole = userRole;
        this.isActive = isActive;
        this.isOnline = isOnline;
    }

    public User(String login, String email, String password, UserRole userRole, boolean isActive, boolean isOnline) {
        this.login = login;
        this.email = email;
        this.password = password;
        this.userRole = userRole;
        this.isActive = isActive;
        this.isOnline = isOnline;
    }

    /**
     * Instantiates a new User.
     *
     * @param login    the login
     * @param email    the email
     * @param isActive the is active
     */
    public User(String login, String email, boolean isActive) {
        this.login = login;
        this.email = email;
        this.isActive = isActive;
    }

    /**
     * Instantiates a new User.
     *
     * @param userId   the user id
     * @param login    the login
     * @param email    the email
     * @param isActive the is active
     */
    public User(Long userId, String login, String email, boolean isActive) {
        this.login = login;
        this.email = email;
        this.isActive = isActive;
        this.userId = userId;
    }

    /**
     * Instantiates a new User.
     *
     * @param userId the user id
     * @param login  the login
     * @param email  the email
     */
    public User(Long userId, String login, String email) {
        this.login = login;
        this.email = email;
        this.userId = userId;
    }

    /**
     * Gets user id.
     *
     * @return the user id
     */
    public Long getUserId() {
        return userId;
    }

    /**
     * Sets user id.
     *
     * @param userId the user id
     */
    public void setUserId(Long userId) {
        this.userId = userId;
    }

    /**
     * Gets email.
     *
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * Sets email.
     *
     * @param email the email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Gets password.
     *
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * Sets password.
     *
     * @param password the password
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * Gets user role id.
     *
     * @return the user role id
     */
    public int getUserRoleId() {
        return userRole.ordinal();
    }

    /**
     * Gets user role name.
     *
     * @return the user role name
     */
    public String getUserRoleName() {
        return userRole.toString();
    }

    /**
     * Sets user role.
     *
     * @param userRole the user role
     */
    public void setUserRole(UserRole userRole) {
        this.userRole = userRole;
    }

    /**
     * Is active boolean.
     *
     * @return the boolean
     */
    public boolean isActive() {
        return isActive;
    }

    /**
     * Sets active status.
     *
     * @param active the active
     */
    public void setActiveStatus(boolean active) {
        isActive = active;
    }

    /**
     * Is online boolean.
     *
     * @return the boolean
     */
    public boolean isOnline() {
        return isOnline;
    }

    /**
     * Sets online status.
     *
     * @param online the online
     */
    public void setOnlineStatus(boolean online) {
        isOnline = online;
    }

    /**
     * Instantiates a new User.
     */
    public User(){
    }


    /**
     * Gets login.
     *
     * @return the login
     */
    public String getLogin() {
        return login;
    }

    /**
     * Sets login.
     *
     * @param login the login
     */
    public void setLogin(String login) {
        this.login = login;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        User user = (User) o;

        if (isActive != user.isActive) return false;
        if (isOnline != user.isOnline) return false;
        if (userId != null ? !userId.equals(user.userId) : user.userId != null) return false;
        if (login != null ? !login.equals(user.login) : user.login != null) return false;
        if (email != null ? !email.equals(user.email) : user.email != null) return false;
        if (password != null ? !password.equals(user.password) : user.password != null) return false;
        return userRole == user.userRole;
    }

    @Override
    public int hashCode() {
        int result = userId != null ? userId.hashCode() : 0;
        result = 31 * result + (login != null ? login.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (password != null ? password.hashCode() : 0);
        result = 31 * result + (userRole != null ? userRole.hashCode() : 0);
        result = 31 * result + (isActive ? 1 : 0);
        result = 31 * result + (isOnline ? 1 : 0);
        return result;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("User{");
        sb.append("userId=").append(userId);
        sb.append(", login='").append(login).append('\'');
        sb.append(", email='").append(email).append('\'');
        sb.append(", password='").append(password).append('\'');
        sb.append(", userRole=").append(userRole);
        sb.append(", isActive=").append(isActive);
        sb.append(", isOnline=").append(isOnline);
        sb.append('}');
        return sb.toString();
    }
}
