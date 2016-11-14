package com.bit.entity;

import java.sql.Date;

public class WorkoutEntity {

	private String workout_id,workout_name,instructor_name;
	private Date date_created;
	private int status;
	
	public String getWorkout_id() {
		return workout_id;
	}
	public void setWorkout_id(String workout_id) {
		this.workout_id = workout_id;
	}
	public String getWorkout_name() {
		return workout_name;
	}
	public void setWorkout_name(String workout_name) {
		this.workout_name = workout_name;
	}
	public String getInstructor_name() {
		return instructor_name;
	}
	public void setInstructor_name(String instructor_name) {
		this.instructor_name = instructor_name;
	}
	public Date getDate_created() {
		return date_created;
	}
	public void setDate_created(Date date_created) {
		this.date_created = date_created;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	
	
}
