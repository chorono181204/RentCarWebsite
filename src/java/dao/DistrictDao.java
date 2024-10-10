
package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.District;
import util.JDBCConnect;

public class DistrictDao {
    public List<District> findAllDistricts() {
        JDBCConnect connection = new JDBCConnect(); 
        String sql = "SELECT * FROM district ";
        List<District> result = new ArrayList<>();
        try(Connection conn = connection.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)) {
                while(rs.next()) {
                    District district = new District();
                    district.setName(rs.getString("district_name"));
                    district.setId(rs.getLong("district_id"));
                    result.add(district);
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
