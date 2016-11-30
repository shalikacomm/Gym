package com.bit.entity;

import java.sql.Date;

public class ReportEntity {

	private Date start_date,end_date;
	private String subscription,suppliment;
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getSubscription() {
		return subscription;
	}
	public void setSubscription(String subscription) {
		this.subscription = subscription;
	}
	public String getSuppliment() {
		return suppliment;
	}
	public void setSuppliment(String suppliment) {
		this.suppliment = suppliment;
	}
	
	
}
