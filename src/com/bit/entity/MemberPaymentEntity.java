package com.bit.entity;

import java.sql.Date;

public class MemberPaymentEntity {
	
	
	private String member_id,card_type,bank_name,payment_id,user_id,payment_type,first_name;
		private Double additional_payments,fee_amount,total_subs,monthly_fee,discount;
	private Integer first4,last4;
	private Date active_period,paid_date;
	
	
	public String getFirst_name() {
		return first_name;
	}
	public String getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(String payment_id) {
		this.payment_id = payment_id;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getPayment_type() {
		return payment_type;
	}
	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	
	public Integer getFirst4() {
		return first4;
	}
	public void setFirst4(Integer first4) {
		this.first4 = first4;
	}
	public Integer getLast4() {
		return last4;
	}
	public void setLast4(Integer last4) {
		this.last4 = last4;
	}
	public String getBank_name() {
		return bank_name;
	}
	public void setBank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	public String getCard_type() {
		return card_type;
	}
	public void setCard_type(String card_type) {
		this.card_type = card_type;
	}

	public Double getMonthly_fee() {
		return monthly_fee;
	}
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
		this.discount = discount;
	}
	public void setMonthly_fee(Double monthly_fee) {
		this.monthly_fee = monthly_fee;
	}
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
	
	public Date getActive_period() {
		return active_period;
	}
	public void setActive_period(Date active_period) {
		this.active_period = active_period;
	}
	public Date getPaid_date() {
		return paid_date;
	}
	public void setPaid_date(Date paid_date) {
		this.paid_date = paid_date;
	}
	public Double getAdditional_payments() {
		return additional_payments;
	}
	
	public void setAdditional_payments(Double additional_payments) {
		this.additional_payments = additional_payments;
	}
	public Double getFee_amount() {
		return fee_amount;
	}
	public void setFee_amount(Double fee_amount) {
		this.fee_amount = fee_amount;
	}

}
