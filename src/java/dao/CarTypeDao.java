/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.CarType;
import util.JDBCConnect;

/**
 *
 * @author developer
 */
public class CarTypeDao {
    public List<CarType> findAllTypes() {
        JDBCConnect connection = new JDBCConnect(); 
        String sql = "SELECT * FROM cartype ";
        List<CarType> result = new ArrayList<>();
        try(Connection conn = connection.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)) {
                while(rs.next()) {
                    CarType carType = new CarType();
                    carType.setType(rs.getString("type"));
                    carType.setId(rs.getLong("id"));
                    result.add(carType);
                }
                return result;
        }
        catch(SQLException e) {
            e.printStackTrace();
            System.out.println("Connect Database Failed");
        }
        return null;
    }
}
