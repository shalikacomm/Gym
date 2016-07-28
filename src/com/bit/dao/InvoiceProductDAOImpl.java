package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.bit.entity.InvoiceProductEntity;
import com.bit.util.DBUtil;

public class InvoiceProductDAOImpl implements InvoiceProductDAO {

	private Connection connection;
	
	public boolean addInvoiceProduct(InvoiceProductEntity in_product) {
		boolean result=false;
		connection = DBUtil.getConnection();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"INSERT INTO invoice_product_tbl(invoice_id,product_id,qty,item_total)"
							+ "VALUES(?,?,?,?)");
			// parameters starts form 1
			preparedStatement.setString(1, in_product.getInvoice_id());
			preparedStatement.setString(2, in_product.getProduct_id());
			preparedStatement.setDouble(3, in_product.getQty());
			preparedStatement.setDouble(4, in_product.getItem_total());
		
			
		int res=preparedStatement.executeUpdate();
		if(res >0){
			result=true;
		}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

		}
		return result;
	}
}
