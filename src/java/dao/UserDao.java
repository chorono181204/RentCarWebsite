package dao;
import java.sql.Connection;
import java.sql.Date;
import java.util.List;
import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Map;
import util.JDBCConnect;
import util.NumberUtil;
import util.StringUtil;
import util.SecurityUtil;
public class UserDao{
    
    public static void queryNormal(StringBuilder where, Map<String, String[]> params) {
        for(Map.Entry<String, String[]> item : params.entrySet()) {
            String key = item.getKey();
            String value = item.getValue()[0];
            if(!key.startsWith("dob") && !key.equals("page")) {
                if(StringUtil.check(value)) {
                    if(NumberUtil.check(value)) {
                        where.append("AND u." + key + " = " + value + " ");
                    }
                    else {
                        where.append("AND u." + key + " LIKE " + "'%" + value + "%' ");
                    }
                }
            }
        }
    }
    
    public static void querySpecial(StringBuilder where, Map<String, String[]> params) {
        if(params.containsKey("dobFrom") && StringUtil.check(params.get("dobFrom")[0])) {
            where.append("AND u.date_of_bird >= " + "'" + params.get("dobFrom")[0] + "'" + " ");
        }
        if(params.containsKey("dobTo") && StringUtil.check(params.get("dobTo")[0])) {
            where.append("AND u.date_of_bird <= " + "'" + params.get("dobTo")[0] + "'" + " ");
        }
    }
    
    public static List<User> findAll(Map<String, String[]> params) {       
        JDBCConnect connection = new JDBCConnect(); 
        StringBuilder sql = new StringBuilder("SELECT * FROM rentcar.user u ");
        StringBuilder where = new StringBuilder("WHERE 1 = 1 ");
        queryNormal(where, params);
        querySpecial(where, params);
        sql.append(where);
        List<User> result = new ArrayList<>();
        try(Connection conn =  connection.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql.toString())) {
                while(rs.next()) {
                    User user = new User();
                    Date sqlDate = rs.getDate("date_of_bird");
                    java.util.Date utilDate = new java.util.Date(sqlDate.getTime());
                    SimpleDateFormat simpleFormat = new SimpleDateFormat("dd/MM/yyyy");
                    String formattedDate = simpleFormat.format(utilDate);
                    user.setDate_of_bird(formattedDate);
                    user.setId_user(rs.getLong("id_user"));
                    user.setEmail(rs.getString("email"));            
                    user.setRole(rs.getLong("role"));
                    user.setUsername(rs.getString("username"));
                    user.setName(rs.getString("name"));
                    user.setStatus(rs.getLong("status"));
                    result.add(user);
                }
                return result;
        }
        catch(SQLException e) {
            e.printStackTrace();
            System.out.println("Connect Database Failed");
        }
        return null;
    }
    
    public List<String> findAllRoles() {
        JDBCConnect connection = new JDBCConnect(); 
        String sql = "SELECT role FROM user GROUP BY role ";
        List<String> result = new ArrayList<>();
        try(Connection conn = connection.getConnection();
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql)) {
                while(rs.next()) {
                    result.add(rs.getString("role"));
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
        String sql = "SELECT status FROM user GROUP BY status ";
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
    
    public static User loginAuth(String username,String password){
        try(Connection conn =JDBCConnect.getConnection()){
            String sql=String.format("SELECT * FROM user WHERE username='%s' ",username);
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                Date sqlDate = rs.getDate("date_of_bird");
                java.util.Date utilDate = new java.util.Date(sqlDate.getTime());
                SimpleDateFormat simpleFormat = new SimpleDateFormat("dd/MM/yyyy");
                String formattedDate = simpleFormat.format(utilDate);
                User us  = new User(rs.getLong("id_user"),
                                   rs.getString("username"),
                                   rs.getString("password"),
                                   rs.getString("name"),
                                   formattedDate,
                                   rs.getLong("role"),
                                   rs.getLong("status"),
                                   rs.getString("email")
                                                         );
                if (SecurityUtil.checkPassword(password, us.getPassword())){
                    return us;
                }else{
                    return null;
                }
            }
            return null;
            
        }catch(Exception ex){
            ex.printStackTrace();
        }
        return null;
    }
    public static boolean userExist(String username){
        try(Connection conn=JDBCConnect.getConnection()){
            String sql=String.format("SELECT * FROM user WHERE username='%s' ",username);
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                return true;
            }            
        }catch(Exception ex){
              ex.printStackTrace();
        }
        return false;
    }
     public static boolean emailExist(String email){
        try(Connection conn=JDBCConnect.getConnection()){
            String sql=String.format("SELECT * FROM user WHERE email='%s' ",email);
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                return true;
            }            
        }catch(Exception ex){
              ex.printStackTrace();
        }
        return false;
    }
     public static boolean register(User newUser){
                try(Connection conn=JDBCConnect.getConnection()){
                    String name=newUser.getName();
                    String email=newUser.getEmail();
                    String username=newUser.getUsername();
                    String dob=newUser.getDate_of_bird();
                    String password=SecurityUtil.hashPassword(newUser.getPassword());
            String sql=String.format("INSERT INTO user (username , password , name , date_of_bird,role, email,status)VALUES('%s','%s','%s','%s','%d','%s','%d');",username,password,name,dob,1,email,1);
            PreparedStatement ps=conn.prepareStatement(sql);
           int res =ps.executeUpdate(sql);
           if(res>=1){
               return true;
           }else{
               return false;
           }
        }catch(Exception ex){
              ex.printStackTrace();
        }
        return false;
     }
    public static boolean loginAuthorization(Long id){
        try(Connection conn=JDBCConnect.getConnection()){
            String sql=String.format("SELECT * FROM user WHERE id='%d'",id);
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            User admin=null;
           if(rs.next()){
                admin= new User(rs.getLong("id_user"),
                                  rs.getString("username"),
                                  rs.getString("password"),
                                  rs.getString("name"),
                                  rs.getString("date_of_bird"),
                                  rs.getLong("role"),
                                  rs.getLong("status"));
            }
           if(admin.getRole()==0){
               return true;
           }else{
               return false;
           }
        }catch(Exception ex){
              ex.printStackTrace();
        }
        return false;
    }
     public static boolean updatePassword(String password,String email){
        try(Connection conn=JDBCConnect.getConnection()){
            String sql=String.format("UPDATE user SET password = '%s' WHERE email='%s' ",SecurityUtil.hashPassword(password),email);
            PreparedStatement ps=conn.prepareStatement(sql);
            int res=ps.executeUpdate(sql);
            if(res>=1){
                return true;
            } else{
                return false;
            }           
        }catch(Exception ex){
              ex.printStackTrace();
        }
        return false;
     }

    //insert user
    public void insert(User u) {
        try ( Connection connection = JDBCConnect.getConnection()) {
            String sql = "INSERT INTO user (username, password, name, date_of_bird, role) \n"
                    + "VALUES(?, ?, ?, ?, ?)";
            PreparedStatement st = connection.prepareStatement(sql);

            st.setString(1, u.getUsername());
            st.setString(2, u.getPassword());
            st.setString(3, u.getName());
            st.setString(4, u.getDate());
            st.setLong(5, u.getRole());

            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //tim 1 user khi co id
    public User getUserById(int id) {
        try ( Connection connection = JDBCConnect.getConnection()) {
            String sql = "SELECT * FROM user WHERE id_user = ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                User u = new User(rs.getLong("id_user"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("name"),
                        rs.getString("date_of_bird"),
                        rs.getLong("role"),
                        rs.getLong("status"));
                return u;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    //delete user
    public void delete(int id) {
        User existUser=getUserById(id);
        if(existUser.getRole()!=0){
        try ( Connection connection = JDBCConnect.getConnection()) {
            String sql = "DELETE FROM user WHERE id_user = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        }
    }

    //update user
    public void update(User u) {
        try ( Connection connection = JDBCConnect.getConnection()) {
            String sql = "UPDATE user\n"
                    + "SET username=?, password=?, name=?, date_of_bird=?,role=?,status=?\n"
                    + "WHERE id_user = ?;";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, u.getUsername());
            st.setString(2, u.getPassword());
            st.setString(3, u.getName());
            st.setString(4, u.getDate());
            st.setLong(5, u.getRole());
            st.setLong(6, u.getStatus());
            st.setLong(7, u.getId_user());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public int count() {
        try ( Connection connection = JDBCConnect.getConnection()) {
        int count = 0;
        String sql = "select count(*) from user";
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