<<<<<<< HEAD
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
=======

>>>>>>> 0fdb072da8f87c83bff302dc4b870339562d09e5
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
<<<<<<< HEAD
/**
 *
 * @author Hacom
 */

public class JDBCConnect {
        static final String DB_URL = "jdbc:mysql://localhost:3306/rentcar";
	static final String USER = "root";
	static final String PASS = "123456";
        public final static String DRIVER = "com.mysql.cj.jdbc.Driver";
	public static Connection getConnection() {
		 Connection conn = null;
        try {
            System.out.println("Hello from DBConfig.driver " + DRIVER);
            Class.forName(DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            System.out.println("connected successfully");
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return conn;    
	}
        
=======
import java.util.logging.Level;
import java.util.logging.Logger;

public class JDBCConnect {
    static final String DB_URL = "jdbc:mysql://localhost:3306/RentCar";
    static final String USER = "root";
    static final String PASS = "123456";

	public static Connection getConnection() {
   
		Connection conn = null;
		try {   
                        Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
		} catch (SQLException e) {
			e.printStackTrace();
                        System.out.println("Connect Database Failed");
		} catch (ClassNotFoundException ex) {
            Logger.getLogger(JDBCConnect.class.getName()).log(Level.SEVERE, null, ex);
        }
		return conn;
	}
>>>>>>> 0fdb072da8f87c83bff302dc4b870339562d09e5
}
