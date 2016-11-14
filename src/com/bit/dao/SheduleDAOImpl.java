package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bit.entity.ExerciseEntity;
import com.bit.entity.InvoiceEntity;
import com.bit.entity.InvoiceProductEntity;
import com.bit.entity.ProductEntity;
import com.bit.entity.SheduleDetailEntity;
import com.bit.entity.SheduleEntitiy;
import com.bit.entity.StockEntity;
import com.bit.entity.WorkoutDetailEntity;
import com.bit.entity.WorkoutEntity;
import com.bit.util.DBUtil;

public class SheduleDAOImpl implements SheduleDAO {
	
	private Connection connection;
	
	public void addShedule(SheduleEntitiy shedule) {
		connection = DBUtil.getConnection();
		java.sql.Date date = getCurrentDatetime();

		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("INSERT INTO shedule_tbl  values (?,?, ?,?,?,?)");
			preparedStatement.setString(1, shedule.getShedule_id());
			preparedStatement.setString(2, shedule.getUser_id());
			preparedStatement.setDate(3, date);
			preparedStatement.setString(4, shedule.getInstructor_name());
			preparedStatement.setInt(5, shedule.getWorkout_no());
			preparedStatement.setInt(6,1);
			
			System.out.println("date : " + date);
			
			
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

public java.sql.Date getCurrentDatetime() {
	java.util.Date today = new java.util.Date();
	return new java.sql.Date(today.getTime());
}

	public List<ExerciseEntity> getActiveExercise() {

		connection = null;

		List<ExerciseEntity> exercsie_list = new ArrayList<ExerciseEntity>();
		try {
			connection = DBUtil.getConnection();
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM exercise_tbl WHERE status = 1");

			while (rs.next()) {
				ExerciseEntity exercise = new ExerciseEntity();
				exercise.setExercise_id(rs.getString("exercise_id"));
				exercise.setDescription(rs.getString("description"));
				exercise.setStatus(rs.getInt("status"));
				exercsie_list.add(exercise);
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

		return exercsie_list;
	}
	
	
	public void addSheduleDetails(SheduleDetailEntity sheduleDetails) {
		connection = DBUtil.getConnection();

		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("INSERT INTO shedule_detail_tbl  values (?, ?, ?, ?)");
			preparedStatement.setString(1, sheduleDetails.getShedule_id());
			preparedStatement.setString(2, sheduleDetails.getExercise_id());
			preparedStatement.setInt(3, sheduleDetails.getSets_per_rep());
			preparedStatement.setInt(4, sheduleDetails.getNo_of_rep());

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
	
	public SheduleEntitiy getMaxSheduleById(String userID) {
		connection = null;
		SheduleEntitiy workout = new SheduleEntitiy();

		try {
			connection = DBUtil.getConnection();
			PreparedStatement p_st = connection
					.prepareStatement("SELECT MAX(workout_no) FROM shedule_tbl WHERE user_id = ?");
			p_st.setString(1, userID);
			ResultSet rs = p_st.executeQuery();
			while (rs.next()) {
				workout.setWorkout_no(rs.getInt("MAX(workout_no)"));
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

		return workout;

	}
	
	public List<SheduleEntitiy> getAllShedules() {

		connection = null;

		List<SheduleEntitiy> shedule_list = new ArrayList<SheduleEntitiy>();
		try {
			connection = DBUtil.getConnection();
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM shedule_tbl");

			while (rs.next()) {
				SheduleEntitiy shedule = new SheduleEntitiy();
				shedule.setShedule_id(rs.getString("shedule_id"));
				shedule.setUser_id(rs.getString("user_id"));
				shedule.setDate_created(rs.getString("date_created"));
				shedule.setInstructor_name(rs.getString("instructor_name"));
				shedule.setWorkout_no(rs.getInt("workout_no"));
				shedule.setStatus(rs.getInt("status"));
				
				shedule_list.add(shedule);
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

		return shedule_list;
	}
	
	public List<WorkoutEntity> getWorkoutList() {
		
		connection = null;
		
		List<WorkoutEntity> workout_list = new ArrayList<WorkoutEntity>();
		try {
			connection = DBUtil.getConnection();
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM workout_charts");
			
			while (rs.next()) {
				WorkoutEntity workout = new WorkoutEntity();
				workout.setWorkout_id(rs.getString("workout_id"));
				workout.setWorkout_name(rs.getString("workout_name"));
				workout.setDate_created(rs.getDate("date_created"));
				workout.setInstructor_name(rs.getString("instructor_name"));
				workout.setStatus(rs.getInt("status"));
								
				workout_list.add(workout);
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
		
		return workout_list;
	}
	public List<WorkoutDetailEntity> getOneWorkout(String workout_id) {
		
		connection = null;
		
		List<WorkoutDetailEntity> workout_list = new ArrayList<WorkoutDetailEntity>();
		try {
			connection = DBUtil.getConnection();
			PreparedStatement preStmt = connection.prepareStatement(" SELECT "
    +"  workout_chart_detail.`workout_id` AS workout_chart_detail_workout_id,"
    +" workout_chart_detail.`exercise_id` AS workout_chart_detail_exercise_id,"
    +" workout_chart_detail.`sets_per_rep` AS workout_chart_detail_sets_per_rep,"
    +" workout_chart_detail.`no_of_reps` AS workout_chart_detail_no_of_reps,"
    +" exercise_tbl.`exercise_id` AS exercise_tbl_exercise_id,"
    +" exercise_tbl.`description` AS exercise_tbl_description"
    +" FROM"
    +" `exercise_tbl` exercise_tbl INNER JOIN `workout_chart_detail` workout_chart_detail ON exercise_tbl.`exercise_id` = workout_chart_detail.`exercise_id`"
    +" WHERE"
    +" workout_chart_detail.`workout_id`=?");
			preStmt.setString(1, workout_id);
			ResultSet rs = preStmt.executeQuery();
			
				
			while (rs.next()) {
				WorkoutDetailEntity workout = new WorkoutDetailEntity();
				workout.setWorkout_id(rs.getString("workout_chart_detail_workout_id"));
				workout.setWorkout_name(rs.getString("exercise_tbl_description"));
				workout.setExercise_id(rs.getString("workout_chart_detail_exercise_id"));
				workout.setSets_per_rep(rs.getInt("workout_chart_detail_sets_per_rep"));
				workout.setNo_of_reps(rs.getInt("workout_chart_detail_no_of_reps"));
							
				workout_list.add(workout);
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
		
		return workout_list;
	}
	
	public boolean deactivateShedule(String shedule_id) {
		connection = null;
		boolean result=false;
		try {
			connection = DBUtil.getConnection();
			String sql = "UPDATE shedule_tbl SET status = 0 WHERE shedule_id = ?";

			PreparedStatement pre_statement = connection.prepareStatement(sql);
			pre_statement.setString(1, shedule_id);
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
	
	public boolean activateShedule(String shedule_id) {

		connection = null;
		boolean result=false;
		try {
			connection = DBUtil.getConnection();
			String sql = "UPDATE shedule_tbl SET status = 1 WHERE shedule_id = ?";
			PreparedStatement pre_st = connection.prepareStatement(sql);
			pre_st.setString(1, shedule_id);
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

}
