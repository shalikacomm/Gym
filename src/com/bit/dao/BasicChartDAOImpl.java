package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import com.bit.entity.BasicChartEntity;
import com.bit.entity.SheduleDetailEntity;
import com.bit.entity.SheduleEntitiy;
import com.bit.util.DBUtil;

public class BasicChartDAOImpl implements BasicChartDAO {
	
	private Connection connection;
	
	public boolean addBasicCharts(BasicChartEntity workout) {
		connection = DBUtil.getConnection();
		java.sql.Date date = getCurrentDatetime();
		boolean result = false;

		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("INSERT INTO workout_charts  values (?,?, ?,?,?)");
			preparedStatement.setString(1, workout.getWorkout_id());
			preparedStatement.setString(2, workout.getWorkout_name());
			preparedStatement.setDate(3, date);
			preparedStatement.setString(4, workout.getInstructor_name());
			preparedStatement.setInt(5,1);
			
			System.out.println("date : " + date);
			
			
			int res = preparedStatement.executeUpdate();
if (res >0){
	result = true;
}
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
		return result;
	}

public java.sql.Date getCurrentDatetime() {
	java.util.Date today = new java.util.Date();
	return new java.sql.Date(today.getTime());
}
		

public void addBasicChartDetails(BasicChartEntity chartDetails) {
	connection = DBUtil.getConnection();

	try {
		PreparedStatement preparedStatement = connection
				.prepareStatement("INSERT INTO workout_chart_detail  values (?, ?, ?, ?)");
		preparedStatement.setString(1, chartDetails.getWorkout_id());
		preparedStatement.setString(2, chartDetails.getExercise_id());
		preparedStatement.setInt(3, chartDetails.getSets_per_rep());
		preparedStatement.setInt(4, chartDetails.getNo_of_reps());

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
