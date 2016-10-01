package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bit.entity.ExerciseEntity;
import com.bit.entity.ProductEntity;
import com.bit.util.DBUtil;

public class ExerciseDAOImpl implements ExerciseDAO {

	private Connection connection;
	
	
	public boolean addExercise(ExerciseEntity exercise) {
		boolean result=false;
		connection = DBUtil.getConnection();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"INSERT INTO exercise_tbl(exercise_id,description,status)"
							+ "VALUES(?,?,?)");
			// parameters starts form 1
			preparedStatement.setString(1, exercise.getExercise_id());
			preparedStatement.setString(2, exercise.getDescription());
			preparedStatement.setInt(3, 1);
			
			
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
	
	
	public List<ExerciseEntity> getAllExercise() {

		connection = null;

		List<ExerciseEntity> exercise_list = new ArrayList<ExerciseEntity>();
		try {
			connection = DBUtil.getConnection();
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM exercise_tbl");

			while (rs.next()) {
				ExerciseEntity exercise = new ExerciseEntity();
				exercise.setExercise_id(rs.getString("exercise_id"));
				exercise.setDescription(rs.getString("description"));
				exercise.setStatus(rs.getInt("status"));
			
				exercise_list.add(exercise);
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

		return exercise_list;
	}
	
	
	public ExerciseEntity getExerciseById(String exerciseId) {
		connection = null;
		ExerciseEntity exercise = new ExerciseEntity();
		try {
			connection = DBUtil.getConnection();
			PreparedStatement p_st = connection.prepareStatement("SELECT * FROM exercise_tbl WHERE exercise_id = ?");
			p_st.setString(1, exerciseId);
			ResultSet rs = p_st.executeQuery();

			while (rs.next()) {

				exercise.setExercise_id(rs.getString("exercise_id"));
				exercise.setDescription(rs.getString("description"));
				exercise.setStatus(rs.getInt("status"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
					// TODO: handle exception
				}
		}

		return exercise;

	}
	
	public boolean deactivateExercise(String exerciseId) {
		connection = null;
		boolean result=false;
		try {
			connection = DBUtil.getConnection();
			String sql = "UPDATE exercise_tbl SET status = 0 WHERE exercise_id = ?";

			PreparedStatement pre_statement = connection.prepareStatement(sql);
			pre_statement.setString(1, exerciseId);
			int res=pre_statement.executeUpdate();

			if(res>0){
				result=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();

			// TODO: handle exception
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
	public boolean activateExercise(String exerciseId) {

		connection = null;
		boolean result=false;
		try {
			connection = DBUtil.getConnection();
			String sql = "UPDATE exercise_tbl SET status = 1 WHERE exercise_id = ?";
			PreparedStatement pre_st = connection.prepareStatement(sql);
			pre_st.setString(1, exerciseId);
			int res=pre_st.executeUpdate();
if(res>0){
	result=true;
}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
		}
		return result;
	}
	
	public boolean updateExercise(ExerciseEntity exercise) {
		Connection con = null;
		boolean res = false;
		try {
			con = DBUtil.getConnection();
			String sql = "UPDATE exercise_tbl SET description=? WHERE exercise_id=?";

			PreparedStatement preparedStatement = con.prepareStatement(sql);
			// Parameters start with 1
			preparedStatement.setString(1, exercise.getDescription());
			preparedStatement.setString(2, exercise.getExercise_id());

			 int temp  = preparedStatement.executeUpdate();
if (temp > 0){
	res = true;
}
			 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		return res;
	}
	
}
