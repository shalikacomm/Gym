package com.bit.entity;

public class AttendenceEntity {

	private String attendence_id,user_id,date_attended;
	private int date_status;
	
	public String getAttendence_id() {
		return attendence_id;
	}
	public void setAttendence_id(String attendence_id) {
		this.attendence_id = attendence_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getDate_attended() {
		return date_attended;
	}
	public void setDate_attended(String date_attended) {
		this.date_attended = date_attended;
	}
	public int getDate_status() {
		return date_status;
	}
	public void setDate_status(int date_status) {
		this.date_status = date_status;
	}
	
	
}
