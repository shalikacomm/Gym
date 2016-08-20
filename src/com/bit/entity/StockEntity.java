package com.bit.entity;

public class StockEntity {

	private String product_id,expiary_date,date_added,seriesID;
	private Integer batch_status,batch_no,qty;
	
	
	
	public String getSeriesID() {
		return seriesID;
	}
	public void setSeriesID(String seriesID) {
		this.seriesID = seriesID;
	}
	
	public Integer getQty() {
		return qty;
	}
	public void setQty(Integer qty) {
		this.qty = qty;
	}
	public Integer getBatch_no() {
		return batch_no;
	}
	public Integer setBatch_no(Integer batch_no) {
		return this.batch_no = batch_no;
	}
	public String getProduct_id() {
		return product_id;
	}
	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}
	
	public String getExpiary_date() {
		return expiary_date;
	}
	public void setExpiary_date(String expiary_date) {
		this.expiary_date = expiary_date;
	}
	public String getDate_added() {
		return date_added;
	}
	public void setDate_added(String date_added) {
		this.date_added = date_added;
	}
	public Integer getBatch_status() {
		return batch_status;
	}
	public void setBatch_status(Integer batch_status) {
		this.batch_status = batch_status;
	}
	
	
	
}
