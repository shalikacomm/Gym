package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.bit.entity.InvoiceEntity;
import com.bit.entity.InvoiceProductEntity;
import com.bit.util.DBUtil;

public class InvoiceDAOImpl implements InvoiceDAO{

	private Connection connection;
	
	public void addInvoice(InvoiceEntity invoice) {
		connection = DBUtil.getConnection();

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"INSERT INTO invoice_tbl  values (?, ?, ?, ?,?, ?)");
			preparedStatement.setString(1, invoice.getInvoice_id());
			preparedStatement.setString(2, invoice.getCustomer_name());
			preparedStatement.setString(3, invoice.getEmail());
			preparedStatement.setDouble(4, invoice.getDiscount());
			preparedStatement.setDouble(5, invoice.getVat());
			preparedStatement.setDouble(6, invoice.getTotal());
			
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
	
}
