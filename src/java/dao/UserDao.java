/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.JDBCConnect;

/**
 *
 * @author Hacom
 */
public class UserDao {

    public List<User> getAll() {
        try ( Connection connection = JDBCConnect.getConnection()) {
            List<User> list = new ArrayList<>();
            String sql = "SELECT * FROM rentcar.user;";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User u = new User(rs.getInt("id_user"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("name"),
                        rs.getString("date_of_bird"),
                        rs.getInt("role"),
                        rs.getInt("status"));
                list.add(u);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //insert user
    public void insert(User u) {
        try ( Connection connection = JDBCConnect.getConnection()) {
            String sql = "INSERT INTO user (username, password, name, date_of_bird, role) \n"
                    + "VALUES(?, ?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, u.getUsername());
            st.setString(2, u.getPassword());
            st.setString(3, u.getName());
            st.setString(4, u.getDate());
            st.setInt(5, u.getRole());

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //tim 1 user khi co id
    public User getUserById(int id) {
        try ( Connection connection = JDBCConnect.getConnection()) {
            String sql = "SELECT * FROM user WHERE id_user = ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getInt("id_user"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("name"),
                        rs.getString("date_of_bird"),
                        rs.getInt("role"),
                        rs.getInt("status"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //delete user
    public void delete(int id) {
        try ( Connection connection = JDBCConnect.getConnection()) {
            String sql = "DELETE FROM user WHERE id_user = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //update user
    public void update(User u) {
        try ( Connection connection = JDBCConnect.getConnection()) {
            String sql = "UPDATE user\n"
                    + "SET username=?, password=?, name=?, date_of_bird=?,role=?,status=?\n"
                    + "WHERE id_user = ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getUsername());
            st.setString(2, u.getPassword());
            st.setString(3, u.getName());
            st.setString(4, u.getDate());
            st.setInt(5, u.getRole());
            st.setInt(6, u.getStatus());
            st.setInt(7, u.getId_user());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int count() {
        try ( Connection connection = JDBCConnect.getConnection()) {
        int count = 0;
        String sql = "select count(*) from user";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                count = rs.getInt(1); // Lấy kết quả của COUNT
            }
            return count;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return 0;
    }

//    public String getUser(int id) {
//        String user = "";
//        String sql = "SELECT * FROM user WHERE id_user = ?;";
//        try {
//            PreparedStatement st = connection.prepareStatement(sql);
//            st.setInt(1, id);
//            ResultSet rs = st.executeQuery();
//            if (rs.next()) {
//                user = rs.getString(1);
//            }
//        } catch (SQLException e) {
//            System.out.println(e);
//        }
//        return user;
//    }
    public static void main(String[] args) {
        UserDao c = new UserDao();
        List<User> list = c.getAll();
        for (User x : list) {
            System.out.println(x);
        }
    }
}
