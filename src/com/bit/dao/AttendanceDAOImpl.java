package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bit.entity.AttendenceEntity;
import com.bit.entity.CalenderEntity;
import com.bit.entity.WorkoutEntity;
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
	
public List<CalenderEntity> getAttendanceUser(String user_id) {
		
		connection = null;
		
		List<CalenderEntity> calender_list = new ArrayList<CalenderEntity>();
		try {
			connection = DBUtil.getConnection();
			 PreparedStatement preStmt = connection.prepareStatement("SELECT * FROM emp.attendance_tbl WHERE user_id=?");
	            preStmt.setString(1, user_id);
	            ResultSet rs = preStmt.executeQuery();
		
			while (rs.next()) {
				CalenderEntity calender = new CalenderEntity();
				calender.setId(rs.getString("attendance_id"));
				calender.setTitle(rs.getString("user_id"));
				calender.setStart(rs.getDate("date_entered"));
				calender.setEnd(rs.getDate("date_entered"));
				calender.setAllday(false);
				
				calender_list.add(calender);
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
		
		return calender_list;
	}
	
	
}
