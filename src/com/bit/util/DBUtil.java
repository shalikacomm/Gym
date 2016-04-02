package com.bit.util;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBUtil {

	public static Connection getConnection() {
        Connection conn = null;       
       
        try {
    		Class.forName("com.mysql.jdbc.Driver");
    	} catch (ClassNotFoundException e) {
    		System.out.println("Where is your MySQL JDBC Driver?");
    		e.printStackTrace();
    	}
        try{
       conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/emp","root","test$123");
            
        }catch(SQLException  e){
        	e.printStackTrace();
        }
        return conn;
        }	
}
