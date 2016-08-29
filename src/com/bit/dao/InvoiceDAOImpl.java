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
import com.bit.entity.StockEntity;
import com.bit.util.DBUtil;

public class InvoiceDAOImpl implements InvoiceDAO {

	private Connection connection;

	public void addSellerDetails(InvoiceEntity invoice) {
		connection = DBUtil.getConnection();
		java.sql.Date date = getCurrentDatetime();

		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("INSERT INTO invoice_tbl  values (?,?, ?, ?, ?,?, ?,?,?,?,?,?,?,?,?,?)");
			preparedStatement.setString(1, invoice.getInvoice_id());
			preparedStatement.setString(2, invoice.getUser_id());
			preparedStatement.setString(3, invoice.getCustomer_name());
			preparedStatement.setString(4, invoice.getEmail());
			preparedStatement.setDouble(5, invoice.getDiscount());
			preparedStatement.setDouble(6, invoice.getVat());
			preparedStatement.setDouble(7, invoice.getInvoiced_total());
			preparedStatement.setString(8, invoice.getPayment_type());
			preparedStatement.setString(9, invoice.getbank_name());
			preparedStatement.setString(10, invoice.getCard_type());
			preparedStatement.setDouble(11, invoice.getTotal_subscription());
			preparedStatement.setInt(12, invoice.getF4());
			preparedStatement.setInt(13, invoice.getL4());
			preparedStatement.setDouble(14, invoice.getTotal());
			System.out.println("date : " + date);
			preparedStatement.setDate(15, date);
			preparedStatement.setInt(16, invoice.getSub_status());
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
			PreparedStatement preparedStatement = connection
					.prepareStatement("INSERT INTO invoice_product_tbl  values (?, ?, ?, ?)");
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
			while (rs.next()) {

				InvoiceEntity invoice = new InvoiceEntity();
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

	public StockEntity getMinExpBatch(String productId) {
		connection = null;
		StockEntity stkEnt=new StockEntity();
		try {
			connection = DBUtil.getConnection();
			PreparedStatement p_st = connection.prepareStatement(
					"SELECT Min(expiary_date),qty,series_id FROM batch_tbl WHERE product_id = ? and status = 1");
			p_st.setString(1, productId);
			ResultSet rs = p_st.executeQuery();

			while (rs.next()) {
				System.out.println();
				 stkEnt.setQty(rs.getFloat("qty"));
				 stkEnt.setSeriesID(rs.getString("series_id"));
				// product.setStock(rs.getFloat("stock"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		} 

		return stkEnt;

	}

	public float updateBatchQty(String productId, float qty) {
		connection = DBUtil.getConnection();
		ProductEntity product = new ProductEntity();
		StockDAO stk=new StockDAOImpl();
		float current_qty = 0;
		StockEntity stkEnt= getMinExpBatch(productId);
		float minExpQty =stkEnt.getQty();
		current_qty = minExpQty - qty;
		System.out.println("CURRENT1="+current_qty);
		if (current_qty < 0) {

			try {
				PreparedStatement last = connection.prepareStatement(
						"UPDATE batch_tbl SET qty= 0 ,status=0 WHERE product_id = '" + productId + "' AND series_id = '"+stkEnt.getSeriesID()+"'");
				last.executeUpdate();
				stk.updateFullStock(productId);
				StockEntity stkEnt2= getMinExpBatch(productId);

				float minExpQty2 =stkEnt2.getQty() ;
				float current_qty2 = minExpQty2 + current_qty;
				System.out.println("CURRENT2="+current_qty2);

				PreparedStatement last2 = connection.prepareStatement("UPDATE batch_tbl SET qty= " + current_qty2
						+ "  WHERE product_id = '" + productId + "' series_id='"+stkEnt.getSeriesID()+"'");
				last2.executeUpdate();
				stk.updateFullStock(productId);

			} catch (SQLException e) {
				e.printStackTrace();
			}
		} else {

			try {
				PreparedStatement last = connection.prepareStatement("UPDATE batch_tbl SET qty= " + current_qty
						+ "  WHERE product_id = '" + productId + "' AND series_id='"+stkEnt.getSeriesID()+"'");
				last.executeUpdate();
				stk.updateFullStock(productId);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		try {
			PreparedStatement p_st = connection.prepareStatement(
					"SELECT qty FROM emp.batch_tbl WHERE product_id=? AND status=1 order by expiary_date limit 1");
			p_st.setString(1, productId);
			ResultSet rs = p_st.executeQuery();

			while (rs.next()) {
				
				qty = rs.getFloat("qty");
				System.out.println(qty);
				// product.setStock(rs.getFloat("stock"));

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

		return qty;

	}

}
