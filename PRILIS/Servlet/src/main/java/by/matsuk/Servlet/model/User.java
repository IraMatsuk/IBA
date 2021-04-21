package by.matsuk.Servlet.model;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private int id;
    private String login;
    private byte[] passw;
    public User(String name, byte[] password) {
        this.login = name;
        this.passw = password;
    }
}
/*@Data
public class User {
    private int id;
    private String login;
    private String passw;
    public User(int id, String login, String passw) {
        this.id = id;
        this.login = login;
        this.passw = passw;
    }
    public User() {
    }

    public User(String name, String password) {
        this.login = name;
        this.passw = password;
    }

    public void setId(int id) {
        this.id = id;
    }
    public void setLogin(String login) {
        this.login = login;
    }
    public void setPassw(String passw) {
        this.passw = passw;
    }
    public int getId() {
        return id;
    }
    public String getLogin() {
        return login;
    }
    public String getPassw() {
        return passw;
    }
    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", login='" + login + '\'' +
                ", passw='" + passw + '\'' +
                '}';
    }
}*/

