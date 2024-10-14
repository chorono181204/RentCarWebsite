/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
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
        
}
