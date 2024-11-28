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
import model.Rentinfor;
import util.JDBCConnect;

/**
 *
 * @author pc
 */
public class RentinforDao {

    public List<Rentinfor> getAll() {
        try ( Connection connection = util.JDBCConnect.getConnection()) {
            List<Rentinfor> list = new ArrayList<>();
            String sql = "SELECT * FROM rentcar.rentinfor;";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Rentinfor c = new Rentinfor(
                        rs.getInt("rent_id"),
                        rs.getString("customer_name"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("customer_note"),
                        rs.getString("pick_up_date"),
                        rs.getString("pick_off_date"),
                        rs.getString("pick_up_location"),
                        rs.getString("pick_off_location"),
                        rs.getInt("id_user"),
                        rs.getString("pick_time"),
                        rs.getInt("status"),
                        rs.getInt("id_car")                       
                );
                list.add(c);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //insert rentinfor
    public void insert(Rentinfor u) {
        try ( Connection connection = util.JDBCConnect.getConnection()) {
            String sql = "INSERT INTO rentinfor (customer_name, phone, email, customer_note, pick_up_date, pick_off_date, pick_up_location, pick_off_location, id_user, pick_time, status,id_car) \n"
                    + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, u.getCustomer_name());
            st.setString(2, u.getPhone());
            st.setString(3, u.getEmail());
            st.setString(4, u.getCustomer_note());
            st.setString(5, u.getPick_up_date());
            st.setString(6, u.getPick_off_date());
            st.setString(7, u.getPick_up_location());
            st.setString(8, u.getPick_off_location());
            st.setLong(9, u.getId_user());
            st.setString(10, u.getPick_time());
            st.setLong(11, u.getStatus());
            st.setLong(12, u.getId_car());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //tim 1 rentinfor khi co id
    public Rentinfor getRentinforById(int id) {
        try ( Connection connection = util.JDBCConnect.getConnection()) {
            String sql = "SELECT * FROM rentinfor WHERE rent_id = ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Rentinfor u = new Rentinfor(
                        rs.getInt("rent_id"),
                        rs.getString("customer_name"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("customer_note"),
                        rs.getString("pick_up_date"),
                        rs.getString("pick_off_date"),
                        rs.getString("pick_up_location"),
                        rs.getString("pick_off_location"),
                        rs.getInt("id_user"),
                        rs.getString("pick_time"),
                        rs.getInt("status"),
                        rs.getInt("id_car")                       
                );
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //delete Rentinfor
    public void delete(int id) {
        try ( Connection connection = util.JDBCConnect.getConnection()) {
            String sql = "DELETE FROM rentinfor WHERE rent_id = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //update Rentinfor
    public void update(Rentinfor u) {
        try ( Connection connection = util.JDBCConnect.getConnection()) {
            String sql = "UPDATE rentinfor\n"
                    + "SET customer_name=?, phone=?, customer_note=?,pick_up_date=?,pick_off_date=?, pick_up_location=?, pick_off_location=?,pick_time=?,status=? ,id_car=?\n"
                    + "WHERE rent_id = "+u.getRent_id()+" ;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getCustomer_name());
            st.setString(2, u.getPhone());
            st.setString(3, u.getCustomer_note());
            st.setString(4, u.getPick_up_date());
            st.setString(5, u.getPick_off_date());
            st.setString(6, u.getPick_up_location());
            st.setString(7, u.getPick_off_location());
            st.setString(8, u.getPick_time());
            st.setLong(9, u.getStatus());
            st.setLong(10, u.getId_car());
          
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int count() {
        try ( Connection connection = util.JDBCConnect.getConnection()) {
            int count = 0;
            String sql = "select count(*) from rentinfor";
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
    public int countByUser(long id_user){
          try ( Connection connection = util.JDBCConnect.getConnection()) {
            int count = 0;
            String sql = "select count(*) from rentinfor where id_user = "+id_user+" ;";
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
    public List<Rentinfor> getAllByUser(long id_user) {
        try ( Connection connection = util.JDBCConnect.getConnection()) {
            List<Rentinfor> list = new ArrayList<>();
            String sql = "SELECT * FROM rentcar.rentinfor WHERE id_user = "+id_user+" ;";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Rentinfor c = new Rentinfor(
                        rs.getInt("rent_id"),
                        rs.getString("customer_name"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("customer_note"),
                        rs.getString("pick_up_date"),
                        rs.getString("pick_off_date"),
                        rs.getString("pick_up_location"),
                        rs.getString("pick_off_location"),
                        rs.getInt("id_user"),
                        rs.getString("pick_time"),
                        rs.getInt("status"),
                        rs.getInt("id_car")                       
                );
                list.add(c);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}
