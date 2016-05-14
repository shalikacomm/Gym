package com.bit.entity;

public class InstructorEntity {


	private String ins_id;
	private String ins_name;
	private String ins_email;
	private int status;
	
	
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getIns_id() {
		return ins_id;
	}
	public void setIns_id(String ins_id) {
		this.ins_id = ins_id;
	}
	public String getIns_name() {
		return ins_name;
	}
	public void setIns_name(String ins_name) {
		this.ins_name = ins_name;
	}
	public String getIns_email() {
		return ins_email;
	}
	public void setIns_email(String ins_email) {
		this.ins_email = ins_email;
	}
	
	
	
}
