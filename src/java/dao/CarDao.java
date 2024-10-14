
package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.Car;
import util.JDBCConnect;
import util.NumberUtil;
import util.StringUtil;

public class CarDao {
    
    public static void queryNormal(StringBuilder where, Map<String, String[]> params) {
        for(Map.Entry<String, String[]> item : params.entrySet()) {
            String key = item.getKey();
            String value = item.getValue()[0];
            if(!key.startsWith("price") && !key.equals("page") && !key.equals("car_name")) {
                if(StringUtil.check(value)) {
                    if(NumberUtil.check(value)) {
                        where.append("AND c." + key + " = " + value + " ");
                    }
                    else {
                        where.append("AND c." + key + " LIKE " + "'%" + value + "%' ");
                    }
                }
            }
        }
    }
    
    public static void querySpecial(StringBuilder where, Map<String, String[]> params) {
        if(params.containsKey("priceFrom") && StringUtil.check(params.get("priceFrom")[0])) {
            where.append("AND c.price >= " + params.get("priceFrom")[0] + " ");
        }
        if(params.containsKey("priceTo") && StringUtil.check(params.get("priceTo")[0])) {
            where.append("AND c.price <= " + params.get("priceTo")[0] + " ");
        }
        if(params.containsKey("car_name") && StringUtil.check(params.get("car_name")[0])) {
            String tmp[] = params.get("car_name")[0].split("\\s+");
            List<String> a = new ArrayList<>();
            for(String s : tmp) {
                a.add(s);
            }
            String res = "";
            for(int i = 0; i < a.size(); i++) {
                res += "LIKE '%" + a.get(i) + "%' ";
                if(i != a.size() - 1) {
                    res += "OR c.car_name ";
                }
            }
            where.append("AND c.car_name " + res + " ");
        }
    }
    
    public static void joinTable(StringBuilder sql, Map<String, String[]> params) {
        if(params.containsKey("districtId") && StringUtil.check(params.get("districtId")[0])) {
            sql.append("INNER JOIN district ON c.disitrict_id = district.id ");
        }
        if(params.containsKey("carBrandId") && StringUtil.check(params.get("carBrandId")[0])) {
            sql.append("INNER JOIN carbrand ON c.car_brand_id = carbrand.id ");
        }
        if(params.containsKey("carTypeId") && StringUtil.check(params.get("carTypeId")[0])) {
            sql.append("INNER JOIN cartype ON c.car_type_id = cartype.id ");
        }
    }
    
    public List<Car> findAll(Map<String, String[]> params) {
        JDBCConnect connection = new JDBCConnect(); 
        StringBuilder sql = new StringBuilder("SELECT c.id_car, c.car_name, c.car_brand_id, c.price, c.img FROM car c ");
        StringBuilder where = new StringBuilder("WHERE 1 = 1 ");
        queryNormal(where, params);
        querySpecial(where, params);
        joinTable(sql, params);
        sql.append(where);
        List<Car> result = new ArrayList<>();
        try(Connection conn =  connection.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql.toString())) {
                while(rs.next()) {
                    Car car = new Car();
                    car.setId(rs.getLong("id_car"));
                    car.setName(rs.getString("car_name"));
                    car.setCarBrandId(rs.getLong("car_brand_id"));
                    car.setPrice(rs.getLong("price"));
                    car.setImage(rs.getString("img"));
                    result.add(car);
                }
                return result;
        }
        catch(SQLException e) {
            e.printStackTrace();
            System.out.println("Connect Database Failed");
        }
        return null;
    }
    
    public List<String> findAllColors() {
        JDBCConnect connection = new JDBCConnect(); 
        String sql = "SELECT color FROM car GROUP BY color ";
        List<String> result = new ArrayList<>();
        try(Connection conn = connection.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)) {
                while(rs.next()) {
                    result.add(rs.getString("color"));
                }
                return result;
        }
        catch(SQLException e) {
            e.printStackTrace();
            System.out.println("Connect Database Failed");
        }
        return null;
    }
    
    public List<String> findAllTransmission() {
        JDBCConnect connection = new JDBCConnect(); 
        String sql = "SELECT transmission FROM car GROUP BY transmission ";
        List<String> result = new ArrayList<>();
        try(Connection conn = connection.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)) {
                while(rs.next()) {
                    result.add(rs.getString("transmission"));
                }
                return result;
        }
        catch(SQLException e) {
            e.printStackTrace();
            System.out.println("Connect Database Failed");
        }
        return null;
    }
    
    public List<Long> findAllSeats() {
        JDBCConnect connection = new JDBCConnect(); 
        String sql = "SELECT seats FROM car GROUP BY seats ORDER BY seats";
        List<Long> result = new ArrayList<>();
        try(Connection conn = connection.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)) {
                while(rs.next()) {
                    result.add(rs.getLong("seats"));
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
