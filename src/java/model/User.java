
package model;

public class User {
    private long id_user, role, status;
    private String  name, username, password,email;
    private String date_of_bird;

    public User() {
    }

    public User(long id_user, String username, String password, String name, String date_of_bird, long role, long status) {
        this.id_user = id_user;
        this.username = username;
        this.password = password;
        this.name = name;
        this.date_of_bird = date_of_bird;
        this.role = role;
        this.status = status;
    }
    public User(long id_user, String username, String password, String name, String date_of_bird, long role, long status,String email) {
        this.id_user = id_user;
        this.username = username;
        this.password = password;
        this.name = name;
        this.date_of_bird = date_of_bird;
        this.role = role;
        this.status = status;
        this.email=email;
    }
    public User(String name, String username, String password, String email, String date_of_bird) {
        this.name = name;
        this.username = username;
        this.password = password;
        this.email = email;
        this.date_of_bird = date_of_bird;
    }
    public long getId_user() {
        return id_user;
    }

    public void setId_user(long id_user) {
        this.id_user = id_user;
    }

    public long getRole() {
        return role;
    }

    public void setRole(long role) {
        this.role = role;
    }

    public long getStatus() {
        return status;
    }

    public void setStatus(long status) {
        this.status = status;
    }

    public String getDate() {
        return date_of_bird;
    }

    public void setDate(String date) {
        this.date_of_bird = date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDate_of_bird() {
        return date_of_bird;
    }

    public void setDate_of_bird(String date_of_bird) {
        this.date_of_bird = date_of_bird;
    }

    @Override
    public String toString() {
        return id_user + " " + username + " " + password + " " + name + " " + date_of_bird + " " + role + " " + status;
    }
    
    
}