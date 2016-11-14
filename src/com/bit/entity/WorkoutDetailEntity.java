package com.bit.entity;

public class WorkoutDetailEntity {
	
	private String workout_id,exercise_id,workout_name;
	private int sets_per_rep,no_of_reps;
	
	
	public String getWorkout_name() {
		return workout_name;
	}
	public void setWorkout_name(String workout_name) {
		this.workout_name = workout_name;
	}
	public String getWorkout_id() {
		return workout_id;
	}
	public void setWorkout_id(String workout_id) {
		this.workout_id = workout_id;
	}
	public String getExercise_id() {
		return exercise_id;
	}
	public void setExercise_id(String exercise_id) {
		this.exercise_id = exercise_id;
	}
	public int getSets_per_rep() {
		return sets_per_rep;
	}
	public void setSets_per_rep(int sets_per_rep) {
		this.sets_per_rep = sets_per_rep;
	}
	public int getNo_of_reps() {
		return no_of_reps;
	}
	public void setNo_of_reps(int no_of_reps) {
		this.no_of_reps = no_of_reps;
	}
	
	

}
