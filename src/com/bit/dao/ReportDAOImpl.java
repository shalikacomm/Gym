package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.bit.entity.ReportEntity;
import com.bit.entity.SheduleEntitiy;
import com.bit.util.DBUtil;

public class ReportDAOImpl implements ReportDAO {

	private Connection connection;
	
	
	public void getIncomeReport(ReportEntity report) {
		connection = DBUtil.getConnection();
		
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("INSERT INTO shedule_tbl  values (?,?, ?,?,?,?)");
			
			preparedStatement.setInt(6,1);
			
		
			
			
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
}
