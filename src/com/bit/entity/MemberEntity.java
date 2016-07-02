package com.bit.entity;

public class MemberEntity {
 
	private String member_id,user_id,img_path;
	
	private double height,weight,bmi,goal_weight,chest,hip,shoulder_length,thigh,bicep;
	
	private int status;

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getImg_path() {
		return img_path;
	}

	public void setImg_path(String img_path) {
		this.img_path = img_path;
	}

	public double getHeight() {
		return height;
	}

	public void setHeight(double height) {
		this.height = height;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public double getBmi() {
		return bmi;
	}

	public void setBmi(double bmi) {
		this.bmi = bmi;
	}

	public double getGoal_weight() {
		return goal_weight;
	}

	public void setGoal_weight(double goal_weight) {
		this.goal_weight = goal_weight;
	}

	public double getChest() {
		return chest;
	}

	public void setChest(double chest) {
		this.chest = chest;
	}

	public double getHip() {
		return hip;
	}

	public void setHip(double hip) {
		this.hip = hip;
	}

	public double getShoulder_length() {
		return shoulder_length;
	}

	public void setShoulder_length(double shoulder_length) {
		this.shoulder_length = shoulder_length;
	}

	public double getThigh() {
		return thigh;
	}

	public void setThigh(double thigh) {
		this.thigh = thigh;
	}

	public double getBicep() {
		return bicep;
	}

	public void setBicep(double bicep) {
		this.bicep = bicep;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
}
