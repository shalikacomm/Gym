package com.bit.entity;

public class InvoiceEntity {

	private String invoice_id,customer_name,email,payment_type,card_type,bank_name,date,user_id,idfor;
	private Double discount,invoiced_total,vat,total_subscription,total;
	private Integer f4,l4,sub_status;
	
	
	public Integer getSub_status() {
		return sub_status;
	}
	public void setSub_status(Integer sub_status) {
		this.sub_status = sub_status;
	}
	public String getIdfor() {
		return idfor;
	}
	public void setIdfor(String idfor) {
		this.idfor = idfor;
	}
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	
	public Integer getF4() {
		return f4;
	}
	public void setF4(Integer f4) {
		this.f4 = f4;
	}
	public Integer getL4() {
		return l4;
	}
	public void setL4(Integer l4) {
		this.l4 = l4;
	}
	public Double getInvoiced_total() {
		return invoiced_total;
	}
	public String getCard_type() {
		return card_type;
	}
	public void setCard_type(String card_type) {
		this.card_type = card_type;
	}
	public void setInvoiced_total(Double invoiced_total) {
		this.invoiced_total = invoiced_total;
	}
	public void setTotal_subscription(Double total_subscription) {
		this.total_subscription = total_subscription;
	}
	public Double getTotal_subscription() {
		return total_subscription;
	}
	public String getPayment_type() {
		return payment_type;
	}
	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}

	public String getbank_name() {
		return bank_name;
	}
	public void setbank_name(String bank_name) {
		this.bank_name = bank_name;
	}
	
	public Double getVat() {
		return vat;
	}
	public void setVat(Double vat) {
		this.vat = vat;
	}
	public String getInvoice_id() {
		return invoice_id;
	}
	public void setInvoice_id(String invoice_id) {
		this.invoice_id = invoice_id;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
		this.discount = discount;
	}
	
	
}
