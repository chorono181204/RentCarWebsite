
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import model.Contact;
import model.Rentinfor;
import util.JDBCConnect;
import util.NumberUtil;
import util.StringUtil;
public class RentinforDao {

    public static void queryNormal(StringBuilder where, Map<String, String[]> params) {
        for(Map.Entry<String, String[]> item : params.entrySet()) {
            String key = item.getKey();
            String value = item.getValue()[0];
            if(!key.endsWith("from") && !key.endsWith("to") && !key.equals("page")) {
                if(StringUtil.check(value)) {
                    if(NumberUtil.check(value)) {
                        where.append("AND r." + key + " = " + value + " ");
                    }
                    else {
                        where.append("AND r." + key + " LIKE " + "'%" + value + "%' ");
                    }
                }
            }
        }
    }
    
    public static void querySpecial(StringBuilder where, Map<String, String[]> params) {
        if(params.containsKey("pick_up_from") && StringUtil.check(params.get("pick_up_from")[0])) {
            where.append("AND r.pick_up_date >= " + "'" + params.get("pick_up_from")[0] + "'" + " ");
        }
        if(params.containsKey("pick_up_to") && StringUtil.check(params.get("pick_up_to")[0])) {
            where.append("AND r.pick_up_date <= " + "'" + params.get("pick_up_to")[0] + "'" + " ");
        }
        if(params.containsKey("pick_off_from") && StringUtil.check(params.get("pick_off_from")[0])) {
            where.append("AND r.pick_off_date >= " + "'" + params.get("pick_off_from")[0] + "'" + " ");
        }
        if(params.containsKey("pick_off_to") && StringUtil.check(params.get("pick_off_to")[0])) {
            where.append("AND r.pick_off_date <= " + "'" + params.get("pick_off_to")[0] + "'" + " ");
        }
    }
    
    public static void joinTable(StringBuilder sql, Map<String, String[]> params) {
        if(params.containsKey("id_user") && StringUtil.check(params.get("id_user")[0])) {
            sql.append("INNER JOIN user ON r.id_user = user.id_user ");
        }
        if(params.containsKey("id_car") && StringUtil.check(params.get("id_car")[0])) {
            sql.append("INNER JOIN car ON r.id_car = car.id_car ");
        }
    }
    
    public static List<Rentinfor> findAll(Map<String, String[]> params) {       
        JDBCConnect connection = new JDBCConnect(); 
        StringBuilder sql = new StringBuilder("SELECT r.* FROM rentinfor r ");
        StringBuilder where = new StringBuilder("WHERE 1 = 1 ");
        queryNormal(where, params);
        querySpecial(where, params);
        joinTable(sql, params);
        sql.append(where);
        List<Rentinfor> result = new ArrayList<>();
        try(Connection conn =  connection.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql.toString())) {
                while(rs.next()) {
                    Rentinfor rentInfor = new Rentinfor();
                    Date sqlPickUpDate = rs.getDate("pick_up_date");
                    Date sqlPickOffDate = rs.getDate("pick_off_date");
                    java.util.Date utilPickUpDate = new java.util.Date(sqlPickUpDate.getTime());
                    java.util.Date utilPickOffDate = new java.util.Date(sqlPickOffDate.getTime());
                    SimpleDateFormat simpleFormat = new SimpleDateFormat("dd/MM/yyyy");
                    String formattedPickUpDate = simpleFormat.format(utilPickUpDate);
                    String formattedPickOffDate = simpleFormat.format(utilPickOffDate);
                    rentInfor.setRent_id(rs.getLong("rent_id"));
                    rentInfor.setPick_up_date(formattedPickUpDate);
                    rentInfor.setPick_off_date(formattedPickOffDate);
                    rentInfor.setCustomer_name(rs.getString("customer_name"));
                    rentInfor.setCustomer_note(rs.getString("customer_note"));
                    rentInfor.setPhone(rs.getString("phone"));
                    rentInfor.setEmail(rs.getString("email"));
                    rentInfor.setId_car(rs.getLong("id_car"));
                    rentInfor.setId_user(rs.getLong("id_user"));
                    rentInfor.setPick_up_location(rs.getString("pick_up_location"));
                    rentInfor.setPick_off_location(rs.getString("pick_off_location"));
                    rentInfor.setPick_time(rs.getString("pick_time"));
                    rentInfor.setStatus(rs.getLong("status"));
                    result.add(rentInfor);
                }
                return result;
        }
        catch(SQLException e) {
            e.printStackTrace();
            System.out.println("Connect Database Failed");
        }
        return null;
    }

    public List<Long> findAllStatus() {
        JDBCConnect connection = new JDBCConnect(); 
        String sql = "SELECT status FROM contact GROUP BY status ";
        List<Long> result = new ArrayList<>();
        try(Connection conn = connection.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)) {
                while(rs.next()) {
                    result.add(rs.getLong("status"));
                }
                return result;
        }
        catch(SQLException e) {
            e.printStackTrace();
            System.out.println("Connect Database Failed");
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
