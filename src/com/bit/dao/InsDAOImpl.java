package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bit.entity.InsEntity;
import com.bit.entity.UserEntity;
import com.bit.util.DBUtil;

public class InsDAOImpl implements InsDAO{

	private Connection connection;
	
	
		public List<InsEntity> getAllInstructors() {
		connection = DBUtil.getConnection();
		  List<InsEntity> insarray = new ArrayList<InsEntity>();
	        try {
	            Statement statement = connection.createStatement();
	            ResultSet rs = statement.executeQuery("select * from instructor_tbl");
	            while (rs.next()) {
	            	InsEntity instructor = new InsEntity();
	            	
	            	instructor.setIns_id(rs.getString("ins_id"));
	            	instructor.setIns_name(rs.getString("ins_name"));
	            	instructor.setIns_email(rs.getString("ins_email"));
	            	
	            
	            	
	            	insarray.add(instructor);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
			return insarray;
	}
		
		public InsEntity getUserById(String ins_id) {
			connection = null;
	    	InsEntity instructor = new InsEntity();
	        try {
	        	connection=DBUtil.getConnection();
	            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM instructor_tbl WHERE ins_id=?");
	            preparedStatement.setString(1, ins_id);
	            ResultSet rs = preparedStatement.executeQuery();

	            if (rs.next()) {
	            	instructor.setIns_id(rs.getString("ins_id"));
	            	instructor.setIns_name(rs.getString("ins_name"));
	            	instructor.setIns_email(rs.getString("ins_email"));
	          
		               
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }finally {
				if (connection != null) {
					try {
						connection.close();
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}

	        return instructor;
		}

}
