package com.bit.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.bit.entity.InvoiceEntity;
import com.bit.entity.InvoiceProductEntity;
import com.bit.entity.ProductEntity;
import com.bit.util.DBUtil;
import com.mysql.fabric.xmlrpc.base.Member;

public class InvoiceDAOImpl implements InvoiceDAO{

	private Connection connection;
	
	public void addSellerDetails(InvoiceEntity invoice) {
		connection = DBUtil.getConnection();
		java.sql.Date date = getCurrentDatetime();
	
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"INSERT INTO invoice_tbl  values (?, ?, ?, ?,?, ?,?,?,?,?,?,?,?,?)");
			preparedStatement.setString(1, invoice.getInvoice_id());
			preparedStatement.setString(2, invoice.getCustomer_name());
			preparedStatement.setString(3, invoice.getEmail());
			preparedStatement.setDouble(4, invoice.getDiscount());
			preparedStatement.setDouble(5, invoice.getVat());
			preparedStatement.setDouble(6, invoice.getInvoiced_total());
			preparedStatement.setString(7, invoice.getPayment_type());
			preparedStatement.setString(8, invoice.getbank_name());
			preparedStatement.setString(9, invoice.getCard_type());
			preparedStatement.setDouble(10, invoice.getTotal_subscription());
			preparedStatement.setInt(11, invoice.getF4());
			preparedStatement.setInt(12, invoice.getL4());
			preparedStatement.setDouble(13, invoice.getTotal());
			System.out.println("date : "+ date);
			preparedStatement.setDate(14, date);
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	
	
	public java.sql.Date getCurrentDatetime() {
	    java.util.Date today = new java.util.Date();
	    return new java.sql.Date(today.getTime());
	}


	public void addInvoiceProduct(InvoiceProductEntity productSell) {
		connection = DBUtil.getConnection();

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"INSERT INTO invoice_product_tbl  values (?, ?, ?, ?)");
			preparedStatement.setString(1, productSell.getInvoice_id());
			preparedStatement.setString(2, productSell.getProduct_id());
			preparedStatement.setDouble(3, productSell.getQty());
			preparedStatement.setDouble(4, productSell.getItem_total());
			
			
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	
	
	public List<InvoiceEntity> getInvoiceList() {
		connection = DBUtil.getConnection();
		List<InvoiceEntity> invoices = new ArrayList<InvoiceEntity>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM invoice_tbl");
			while(rs.next()){
				
				InvoiceEntity invoice  = new InvoiceEntity();
				invoice.setInvoice_id(rs.getString("invoice_id"));
				invoice.setCustomer_name(rs.getString("customer_name"));
				invoice.setPayment_type(rs.getString("payment_type"));
				invoice.setCustomer_name(rs.getString("customer_name"));
				invoice.setDate(rs.getString("transaction_date"));
				
				invoices.add(invoice);
				
			}
			
		

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return invoices;
	}
	
	


	public ProductEntity getStockById(String productId) {
		connection = null;
		ProductEntity product = new ProductEntity();
		try {
			connection = DBUtil.getConnection();
			PreparedStatement p_st = connection.prepareStatement("SELECT stock FROM product_tbl WHERE product_id = ?");
			p_st.setString(1, productId);
			ResultSet rs = p_st.executeQuery();

			while (rs.next()) {

				product.setStock(rs.getFloat("stock"));
			
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
					// TODO: handle exception
				}
		}

		return product;

	}
	
	
	
	
}
