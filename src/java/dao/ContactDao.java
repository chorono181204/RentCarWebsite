/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Contact;
import util.JDBCConnect;

/**
 *
 * @author pc
 */
public class ContactDao {

    public List<Contact> getAll() {
        try ( Connection connection = util.JDBCConnect.getConnection()) {
            List<Contact> list = new ArrayList<>();
            String sql = "SELECT * FROM rentcar.contact;";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Contact c = new Contact(rs.getLong("id"),
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getString("subject"),
                        rs.getString("message"),
                        rs.getLong("status"),
                        rs.getString("time_sent")
                );
                list.add(c);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //insert contact
    public void insert(Contact u) {
        try ( Connection connection = util.JDBCConnect.getConnection()) {
            String sql = "INSERT INTO contact (username, email, subject, message, status, time_sent) \n"
                    + "VALUES(?, ?, ?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, u.getUsername());
            st.setString(2, u.getEmail());
            st.setString(3, u.getSubject());
            st.setString(4, u.getMessage());
            st.setLong(5, u.getStatus());
            st.setString(6, u.getTime_sent());

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //tim 1 contact khi co id
    public Contact getContactById(int id) {
        try ( Connection connection = util.JDBCConnect.getConnection()) {
            String sql = "SELECT * FROM contact WHERE id = ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Contact u = new Contact(rs.getLong("id"),
                        rs.getString("username"),
                        rs.getString("email"),
                        rs.getString("subject"),
                        rs.getString("message"),
                        rs.getLong("status"),
                        rs.getString("time_sent"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //delete Contact
    public void delete(int id) {
        try ( Connection connection = util.JDBCConnect.getConnection()) {
            String sql = "DELETE FROM contact WHERE id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //update Contact
    public void update(Contact u) {
        try ( Connection connection = util.JDBCConnect.getConnection()) {
            String sql = "UPDATE contact\n"
                    + "SET username=?, email=?, subject=?, message=?,status=?,time_sent=?\n"
                    + "WHERE id = ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getUsername());
            st.setString(2, u.getEmail());
            st.setString(3, u.getSubject());
            st.setString(4, u.getMessage());
            st.setLong(5, u.getStatus());
            st.setString(6, u.getTime_sent());
            st.setLong(7, u.getId());

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int count() {
        try ( Connection connection = util.JDBCConnect.getConnection()) {
            int count = 0;
            String sql = "select count(*) from contact";
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

    public static void main(String[] args) {
        ContactDao c = new ContactDao();
        List<Contact> list = c.getAll();
        for (Contact x : list) {
            System.out.println(x);
        }
    }
}
