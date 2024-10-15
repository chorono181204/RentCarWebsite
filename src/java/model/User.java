/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;

/**
 *
 * @author Hacom
 */
public class User {
    private int id_user, role, status;
    private String  name, username, password,email;
    private String date_of_bird;

    public User() {
    }

    public User(int id_user, String username, String password, String name, String date_of_bird, int role, int status) {
        this.id_user = id_user;
        this.username = username;
        this.password = password;
        this.name = name;
        this.date_of_bird = date_of_bird;
        this.role = role;
        this.status = status;
    }

    public User(String name, String username, String password, String email, String date_of_bird) {
        this.name = name;
        this.username = username;
        this.password = password;
        this.email = email;
        this.date_of_bird = date_of_bird;
    }
    

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
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