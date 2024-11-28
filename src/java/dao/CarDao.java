
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
            if(!key.startsWith("year") && !key.startsWith("price") && !key.equals("page") && !key.equals("car_name")) {
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
        if(params.containsKey("yearFrom") && StringUtil.check(params.get("yearFrom")[0])) {
            where.append("AND c.year_of_manufacture >= " + params.get("yearFrom")[0] + " ");
        }
        if(params.containsKey("yearTo") && StringUtil.check(params.get("yearTo")[0])) {
            where.append("AND c.year_of_manufacture <= " + params.get("yearTo")[0] + " ");
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
                    car.setId_car(rs.getLong("id_car"));
                    car.setCar_name(rs.getString("car_name"));
                    car.setCar_brand_id(rs.getLong("car_brand_id"));
                    car.setPrice(rs.getLong("price"));
                    car.setImg(rs.getString("img"));
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
    
    public List<Long> findAllLuggage() {
        JDBCConnect connection = new JDBCConnect(); 
        String sql = "SELECT luggage FROM car GROUP BY luggage ORDER BY luggage";
        List<Long> result = new ArrayList<>();
        try(Connection conn = connection.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)) {
                while(rs.next()) {
                    result.add(rs.getLong("luggage"));
                }
                return result;
        }
        catch(SQLException e) {
            e.printStackTrace();
            System.out.println("Connect Database Failed");
        }
        return null;
    }


    public List<Car> adminFindAll(Map<String, String[]> params) {
        JDBCConnect connection = new JDBCConnect(); 
        StringBuilder sql = new StringBuilder("SELECT c.id_car, c.car_name, c.price, c.description, c.year_of_manufacture, c.current_address FROM rentcar.car c ");
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
                    car.setId_car(rs.getLong("id_car"));
                    car.setCar_name(rs.getString("car_name"));
                    car.setPrice(rs.getLong("price"));
                    car.setDescription(rs.getString("description"));
                    car.setYear_of_manufacture(rs.getLong("year_of_manufacture"));
                    car.setCurrent_address(rs.getString("current_address"));
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

    //insert car
    public void insert(Car u) {
        try ( Connection connection = JDBCConnect.getConnection()) {
            String sql = "INSERT INTO car (car_name, seats, fuel, transmission, luggage, img, description, rate, status, color, price, year_of_manufacture, current_address, car_type_id, car_brand_id, district_id) \n"
                    + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, u.getCar_name());
            st.setLong(2, u.getSeats());
            st.setString(3, u.getFuel());
            st.setString(4, u.getTransmission());
            st.setLong(5, u.getLuggage());
            st.setString(6, u.getImg());
            st.setString(7, u.getDescription());
            st.setLong(8, u.getRate());
            st.setLong(9, u.getStatus());
            st.setString(10, u.getColor());
            st.setLong(11, u.getPrice());
            st.setLong(12, u.getYear_of_manufacture());
            st.setString(13, u.getCurrent_address());
            st.setLong(14, u.getCar_type_id());
            st.setLong(15, u.getCar_brand_id());
            st.setLong(16, u.getDistrict_id());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //tim 1 car khi co id
    public Car getCarById(long id) {
        try ( Connection connection = JDBCConnect.getConnection()) {
            String sql = "SELECT * FROM car WHERE id_car = ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setLong(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Car c = new Car(rs.getString("car_name"),
                        rs.getString("fuel"),
                        rs.getString("transmission"),
                        rs.getString("img"),
                        rs.getString("description"),
                        rs.getString("color"),
                        rs.getString("current_address"),
                        rs.getLong("id_car"),
                        rs.getLong("seats"),
                        rs.getLong("luggage"),
                        rs.getLong("rate"),
                        rs.getLong("status"),
                        rs.getLong("price"),
                        rs.getLong("year_of_manufacture"),
                        rs.getLong("car_type_id"),
                        rs.getLong("car_brand_id"),                      
                        rs.getLong("district_id"));
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
                    + "SET car_name=?, seats=?, fuel=?, transmission=?, luggage=?,img=?, description=?, rate=?, status=?, color=?, price=?, year_of_manufacture=?, current_address=?, car_type_id=?, car_brand_id=?, district_id=?\n"
                    + "WHERE id_car = ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getCar_name());
            st.setLong(2, u.getSeats());
            st.setString(3, u.getFuel());
            st.setString(4, u.getTransmission());
            st.setLong(5, u.getLuggage());
            st.setString(6, u.getImg());
            st.setString(7, u.getDescription());
            st.setLong(8, u.getRate());
            st.setLong(9, u.getStatus());
            st.setString(10, u.getColor());
            st.setLong(11, u.getPrice());
            st.setLong(12, u.getYear_of_manufacture());
            st.setString(13, u.getCurrent_address());
            st.setLong(14, u.getCar_type_id());
            st.setLong(15, u.getCar_brand_id());
            st.setLong(16, u.getDistrict_id());
            st.setLong(17, u.getId_car());
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
    public List<Car> getAllByTypeAndBrand(long type_id,long brand_id){
        try ( Connection connection = JDBCConnect.getConnection()) {
            List<Car> list = new ArrayList<>();
            String sql = "SELECT * FROM rentcar.car WHERE car_type_id = " +type_id+" AND car_brand_id = "+brand_id+" ;";
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Car c = new Car(rs.getString("car_name"),
                        rs.getString("fuel"),
                        rs.getString("transmission"),
                        rs.getString("img"),
                        rs.getString("description"),
                        rs.getString("color"),
                        rs.getString("current_address"),
                        rs.getLong("id_car"),
                        rs.getLong("seats"),
                        rs.getLong("luggage"),
                        rs.getLong("rate"),
                        rs.getLong("status"),
                        rs.getLong("price"),
                        rs.getLong("year_of_manufacture"),
                        rs.getLong("car_type_id"),
                        rs.getLong("car_brand_id"),
                        rs.getLong("district_id"));
                list.add(c);
            }
            return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    public void updateStatus(long id_car){
         try ( Connection connection = JDBCConnect.getConnection()) {
           
            String sql = "UPDATE rentcar.car SET status = '1' WHERE id_car = "+id_car+" ;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}
