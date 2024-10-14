/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import com.mysql.cj.xdevapi.Result;
import java.sql.Connection;
import java.sql.Date;
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
                User u = new User(rs.getInt("id_user"),
                                  rs.getString("username"),
                                  rs.getString("password"),
                                  rs.getString("name"),
                                  rs.getString("date_of_bird"),
                                  rs.getInt("role"),
                                  rs.getInt("status"));
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
                return  new User(rs.getInt("id_user"),
                                  rs.getString("username"),
                                  rs.getString("password"),
                                  rs.getString("name"),
                                  rs.getString("date_of_bird"),
                                  rs.getInt("role"),
                                  rs.getInt("status"));
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
    public static boolean loginAuthorization(int id){
        try(Connection conn=JDBCConnect.getConnection()){
            String sql=String.format("SELECT * FROM user WHERE id='%d'",id);
            PreparedStatement ps=conn.prepareStatement(sql);
            ResultSet rs=ps.executeQuery();
            User admin=null;
           if(rs.next()){
                admin= new User(rs.getInt("id_user"),
                                  rs.getString("username"),
                                  rs.getString("password"),
                                  rs.getString("name"),
                                  rs.getString("date_of_bird"),
                                  rs.getInt("role"),
                                  rs.getInt("status"));
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
}
//INSERT INTO `rentcar`.`user` (`username`, `password`, `name`, `date_of_bird`, `role`, `email`) VALUES ('thang123', '12345678', 'vt', '11-11-2000', '0', 'vndt181204@gmail.com');
//UPDATE `rentcar`.`user` SET `password` = 'wwwww' WHERE (`id_user` = '8');