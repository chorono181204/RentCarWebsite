/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import com.mysql.cj.xdevapi.PreparableStatement;
import com.mysql.cj.xdevapi.Result;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Car;
import util.JDBCConnect;

/**
 *
 * @author pc
 */
public class CarDao {

    public List<Car> getAll() {
        try ( Connection connection = JDBCConnect.getConnection()) {
            List<Car> list = new ArrayList<>();
            String sql = "SELECT * FROM rentcar.car;";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Car c = new Car(rs.getInt("id_car"),
                        rs.getString("car_name"),
                        rs.getInt("seats"),
                        rs.getString("fuel"),
                        rs.getString("transmission"),
                        rs.getInt("luggage"),
                        rs.getString("img"),
                        rs.getString("description"),
                        rs.getInt("rate"),
                        rs.getInt("status"),
                        rs.getString("color"),
                        rs.getInt("price"),
                        rs.getInt("year_of_manufacture"),
                        rs.getString("current_address"),
                        rs.getInt("car_type_id"),
                        rs.getInt("car_brand_id"),
                        rs.getInt("rent_id"),
                        rs.getInt("district_id"));
                list.add(c);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //insert car
    public void insert(Car u) {
        try ( Connection connection = JDBCConnect.getConnection()) {
            String sql = "INSERT INTO car (car_name, seats, fuel, transmission, luggage, img, description, rate, status, color, price, year_of_manufacture, current_address, car_type_id, car_brand_id, rent_id, district_id) \n"
                    + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, u.getCar_name());
            st.setInt(2, u.getSeats());
            st.setString(3, u.getFuel());
            st.setString(4, u.getTransmission());
            st.setInt(5, u.getLuggage());
            st.setString(6, u.getImg());
            st.setString(7, u.getDescription());
            st.setInt(8, u.getRate());
            st.setInt(9, u.getStatus());
            st.setString(10, u.getColor());
            st.setInt(11, u.getPrice());
            st.setInt(12, u.getYear_of_manufacture());
            st.setString(13, u.getCurrent_address());
            st.setInt(14, u.getCar_type_id());
            st.setInt(15, u.getCar_brand_id());
            st.setInt(16, u.getRent_id());
            st.setInt(17, u.getDistrict_id());

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //tim 1 car khi co id
    public Car getCarById(int id) {
        try ( Connection connection = JDBCConnect.getConnection()) {
            String sql = "SELECT * FROM car WHERE id_car = ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Car c = new Car(rs.getInt("id_car"),
                        rs.getString("car_name"),
                        rs.getInt("seats"),
                        rs.getString("fuel"),
                        rs.getString("transmission"),
                        rs.getInt("luggage"),
                        rs.getString("img"),
                        rs.getString("description"),
                        rs.getInt("rate"),
                        rs.getInt("status"),
                        rs.getString("color"),
                        rs.getInt("price"),
                        rs.getInt("year_of_manufacture"),
                        rs.getString("current_address"),
                        rs.getInt("car_type_id"),
                        rs.getInt("car_brand_id"),
                        rs.getInt("rent_id"),
                        rs.getInt("district_id"));
                return c;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //delete car
    public void delete(int id) {
        try ( Connection connection = JDBCConnect.getConnection()) {
            String sql = "DELETE FROM car WHERE id_car = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //update car
    public void update(Car u) {
        try ( Connection connection = JDBCConnect.getConnection()) {
            String sql = "UPDATE car\n"
                    + "SET car_name=?, seats=?, fuel=?, transmission=?, luggage=?,img=?, description=?, rate=?, status=?, color=?, price=?, year_of_manufacture=?, current_address=?, car_type_id=?, car_brand_id=?, rent_id=?, district_id=?\n"
                    + "WHERE id_car = ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getCar_name());
            st.setInt(2, u.getSeats());
            st.setString(3, u.getFuel());
            st.setString(4, u.getTransmission());
            st.setInt(5, u.getLuggage());
            st.setString(6, u.getImg());
            st.setString(7, u.getDescription());
            st.setInt(8, u.getRate());
            st.setInt(9, u.getStatus());
            st.setString(10, u.getColor());
            st.setInt(11, u.getPrice());
            st.setInt(12, u.getYear_of_manufacture());
            st.setString(13, u.getCurrent_address());
            st.setInt(14, u.getCar_type_id());
            st.setInt(15, u.getCar_brand_id());
            st.setInt(16, u.getRent_id());
            st.setInt(17, u.getDistrict_id());
            st.setInt(18, u.getId_car());

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int count() {
        try ( Connection connection = JDBCConnect.getConnection()) {
            int count = 0;
            String sql = "select count(*) from car";
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
        CarDao c = new CarDao();
        List<Car> list = c.getAll();
        if (list.isEmpty()) {
            System.out.println("No cars found in the database.");
        } else {
            for (Car x : list) {
                System.out.println(x.getImg());
            }
        }
    }
}
