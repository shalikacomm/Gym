package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bit.entity.BasicChartEntity;
import com.bit.entity.ProductEntity;
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
public List<BasicChartEntity> getAllWorkouts() {

	connection = null;

	List<BasicChartEntity> basic_charts = new ArrayList<BasicChartEntity>();
	try {
		connection = DBUtil.getConnection();
		Statement statement = connection.createStatement();
		ResultSet rs = statement.executeQuery("SELECT * FROM workout_charts");

		while (rs.next()) {
			BasicChartEntity charts = new BasicChartEntity();
			charts.setWorkout_id(rs.getString("workout_id"));
			charts.setWorkout_name(rs.getString("workout_name"));
			charts.setDate_created(rs.getString("date_created"));
			charts.setInstructor_name(rs.getString("instructor_name"));
			charts.setStatus(rs.getInt("status"));
			basic_charts.add(charts);
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

	return basic_charts;
}


}
