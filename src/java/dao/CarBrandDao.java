
package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.CarBrand;
import util.JDBCConnect;

public class CarBrandDao {
    public CarBrand findNameById(Long id) {
        String sql = "SELECT name FROM carbrand WHERE id = " + id + " ";
        JDBCConnect connection = new JDBCConnect();
        CarBrand carBrand = new CarBrand();
        try(Connection conn = connection.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);){
                while(rs.next()) {
                    carBrand.setName(rs.getString("name"));
                }
        }
        catch(Exception e) {
            e.printStackTrace();
            System.out.println("Connect database failed");
        }
        return carBrand;
    }
    
    public List<CarBrand> findAllBrands() {
        JDBCConnect connection = new JDBCConnect(); 
        String sql = "SELECT * FROM carbrand ";
        List<CarBrand> result = new ArrayList<>();
        try(Connection conn = connection.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)) {
                while(rs.next()) {
                    CarBrand carBrand = new CarBrand();
                    carBrand.setName(rs.getString("name"));
                    carBrand.setId(rs.getLong("id"));
                    result.add(carBrand);
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
