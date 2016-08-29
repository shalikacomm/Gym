package com.bit.entity;

public class MemberPaymentEntity {
	
	
	private String member_id,active_period,paid_date;
	private Double additional_payments,amount,total_subs;
	
	
	
	public Double getTotal_subs() {
		return total_subs;
	}
	public void setTotal_subs(Double total_subs) {
		this.total_subs = total_subs;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getActive_period() {
		return active_period;
	}
	public void setActive_period(String active_period) {
		this.active_period = active_period;
	}
	public String getPaid_date() {
		return paid_date;
	}
	public void setPaid_date(String paid_date) {
		this.paid_date = paid_date;
	}
	public Double getAdditional_payments() {
		return additional_payments;
	}
	public void setAdditional_payments(Double additional_payments) {
		this.additional_payments = additional_payments;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
}
