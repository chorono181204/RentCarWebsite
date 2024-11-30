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
import util.JDBCConnect;
import util.NumberUtil;
import util.StringUtil;

public class ContactDao {

    public static void queryNormal(StringBuilder where, Map<String, String[]> params) {
        for(Map.Entry<String, String[]> item : params.entrySet()) {
            String key = item.getKey();
            String value = item.getValue()[0];
            if(!key.startsWith("sent") && !key.equals("page")) {
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
        if(params.containsKey("sentFrom") && StringUtil.check(params.get("sentFrom")[0])) {
            where.append("AND c.time_sent >= " + "'" + params.get("sentFrom")[0] + "'" + " ");
        }
        if(params.containsKey("sentTo") && StringUtil.check(params.get("sentTo")[0])) {
            where.append("AND c.time_sent <= " + "'" + params.get("sentTo")[0] + "'" + " ");
        }
    }
    
    public static List<Contact> findAll(Map<String, String[]> params) {       
        JDBCConnect connection = new JDBCConnect(); 
        StringBuilder sql = new StringBuilder("SELECT * FROM rentcar.contact c ");
        StringBuilder where = new StringBuilder("WHERE 1 = 1 ");
        queryNormal(where, params);
        querySpecial(where, params);
        sql.append(where);
        List<Contact> result = new ArrayList<>();
        try(Connection conn =  connection.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql.toString())) {
                while(rs.next()) {
                    Contact contact = new Contact();
                    Date sqlDate = rs.getDate("time_sent");
                    java.util.Date utilDate = new java.util.Date(sqlDate.getTime());
                    SimpleDateFormat simpleFormat = new SimpleDateFormat("dd/MM/yyyy");
                    String formattedDate = simpleFormat.format(utilDate);
                    contact.setTime_sent(formattedDate);
                    contact.setId(rs.getLong("id"));
                    contact.setUsername(rs.getString("username"));
                    contact.setEmail(rs.getString("email"));
                    contact.setSubject(rs.getString("subject"));
                    contact.setMessage(rs.getString("message"));
                    contact.setStatus(rs.getLong("status"));
                    result.add(contact);
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

}
