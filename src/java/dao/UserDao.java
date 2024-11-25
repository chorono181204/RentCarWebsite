package dao;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.JDBCConnect;

/**
 *
 * @author Hacom
 */
public class UserDao{
    
    public static List<User> getAll() {       
        try(  Connection conn =JDBCConnect.getConnection()) { 
            List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM rentcar.user ;";
            PreparedStatement st = conn.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                User u = new User(rs.getLong("id_user"),
                                  rs.getString("username"),
                                  rs.getString("password"),
                                  rs.getString("name"),
                                  rs.getString("date_of_bird"),
                                  rs.getLong("role"),
                                  rs.getLong("status"));
                list.add(u);
            }
             return list;
        } catch (SQLException e) {
            System.out.println(e);
        }
       return null;
    }
    public static User loginAuth(String username,String password){
        try(Connection conn =JDBCConnect.getConnection()){
            String sql=String.format("SELECT * FROM user WHERE username='%s' AND password='%s'",username,password);
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            if(rs.next()){
                return  new User(rs.getLong("id_user"),
                                  rs.getString("username"),
                                  rs.getString("password"),
                                  rs.getString("name"),
                                  rs.getString("date_of_bird"),
                                  rs.getLong("role"),
                                  rs.getLong("status"));
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
                    String password=newUser.getPassword();
            String sql=String.format("INSERT INTO user (username , password , name , date_of_bird,role, email)VALUES('%s','%s','%s','%s','%d','%s');",username,password,name,dob,1,email);
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
            String sql=String.format("UPDATE user SET password = '%s' WHERE email='%s' ",password,email);
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
        try ( Connection connection = JDBCConnect.getConnection()) {
            String sql = "DELETE FROM user WHERE id_user = ?";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
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