package com.bit.entity;

public class InvoiceProductEntity {

	private String invoice_id,product_id;

	private double item_total,qty;
	
	
	public String getInvoice_id() {
		return invoice_id;
	}
	public void setInvoice_id(String invoice_id) {
		this.invoice_id = invoice_id;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	public double getQty() {
		return qty;
	}
	public void setQty(double qty) {
		this.qty = qty;
	}
	public double getItem_total() {
		return item_total;
	}
	public void setItem_total(double item_total) {
		this.item_total = item_total;
	}
	
	
}
