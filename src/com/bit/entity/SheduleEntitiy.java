package com.bit.entity;

public class SheduleEntitiy {

	private String shedule_id,user_id,date_created,instructor_name,goal_type,first_name,email;
	private int workout_no,status;
	
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getShedule_id() {
		return shedule_id;
	}
	public void setShedule_id(String shedule_id) {
		this.shedule_id = shedule_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getDate_created() {
		return date_created;
	}
	public void setDate_created(String date_created) {
		this.date_created = date_created;
	}
	public String getInstructor_name() {
		return instructor_name;
	}
	public void setInstructor_name(String instructor_name) {
		this.instructor_name = instructor_name;
	}
	public String getGoal_type() {
		return goal_type;
	}
	public void setGoal_type(String goal_type) {
		this.goal_type = goal_type;
	}
	public int getWorkout_no() {
		return workout_no;
	}
	public void setWorkout_no(int workout_no) {
		this.workout_no = workout_no;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
