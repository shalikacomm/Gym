package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.bit.entity.AttendenceEntity;

import com.bit.util.DBUtil;

public class AttendanceDAOImpl implements AttendanceDAO{

	private Connection connection;
	
	public boolean addAttendance(AttendenceEntity come) {
		boolean result=false;
		connection = DBUtil.getConnection();
		java.sql.Date date = getCurrentDatetime();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"INSERT INTO attendance_tbl(attendance_id,user_id,date_entered,date_status)"
							+ "VALUES(?,?,?,?)");
			// parameters starts form 1
			preparedStatement.setString(1, come.getAttendence_id());
			preparedStatement.setString(2, come.getUser_id());
			preparedStatement.setDate(3,date);
			preparedStatement.setInt(4,1);
	
			
		int res=preparedStatement.executeUpdate();
		if(res >0){
			result=true;
		}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

		}
		return result;
	}
	public java.sql.Date getCurrentDatetime() {
		java.util.Date today = new java.util.Date();
		return new java.sql.Date(today.getTime());
	}
	
	
}
