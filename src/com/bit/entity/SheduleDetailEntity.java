package com.bit.entity;

public class SheduleDetailEntity {

	private String shedule_id,exercise_id;
	private int sets_per_rep,no_of_rep;
	
	
	
	public String getShedule_id() {
		return shedule_id;
	}
	public void setShedule_id(String shedule_id) {
		this.shedule_id = shedule_id;
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
	public int getNo_of_rep() {
		return no_of_rep;
	}
	public void setNo_of_rep(int no_of_rep) {
		this.no_of_rep = no_of_rep;
	}
	
	
}
