package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bit.entity.ProductEntity;
import com.bit.entity.StockEntity;
import com.bit.util.DBUtil;

public class StockDAOImpl implements StockDAO {

	private Connection connection;
	
	
	public boolean addStock(StockEntity stock) {
		boolean result=false;
		connection = DBUtil.getConnection();
		
		java.sql.Date date = getCurrentDatetime();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"INSERT INTO batch_tbl(series_id,product_id,batch_no,expiary_date,qty,date_added,status)"
							+ "VALUES(?,?,?,?,?,?,?)");
			// parameters starts form 1
			preparedStatement.setString(1, stock.getSeriesID());
			preparedStatement.setString(2, stock.getProduct_id());
			preparedStatement.setInt(3, stock.getBatch_no());
			preparedStatement.setString(4, stock.getExpiary_date());
			preparedStatement.setFloat(5, stock.getQty());
			preparedStatement.setDate(6, date);
			System.out.println(date);
			preparedStatement.setInt(7,1 );
		
			
		int res=preparedStatement.executeUpdate();
		if(res >0){
			result=true;
			updateFullStock(stock.getProduct_id());
			
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
	
	// here add all product items update it in to product_tbl stock
	public boolean updateFullStock(String productId) {
		connection = null;
		StockEntity stock = new StockEntity();
		try {
			connection = DBUtil.getConnection();
			PreparedStatement p_st = connection.prepareStatement("SELECT qty From batch_tbl WHERE product_id = ?");
			p_st.setString(1, productId);
			ResultSet rs = p_st.executeQuery();
float total = 0;
			while (rs.next()) {

			total += rs.getFloat("qty");
			
			}
			PreparedStatement last = connection.prepareStatement("UPDATE product_tbl SET stock= "+total+" WHERE product_id = '"+productId+"'");
			last.executeUpdate();
			System.out.println(total);
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

		return true;

	}
	
	

	public java.sql.Date getCurrentDatetime() {
	    java.util.Date today = new java.util.Date();
	    return new java.sql.Date(today.getTime());
	}

	public List<StockEntity> getStockDates(String productId) {
		connection = DBUtil.getConnection();
		List<StockEntity> dates = new ArrayList<StockEntity>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement
					.executeQuery("SELECT expiary_date FROM batch_tbl WHERE product_id = '" + productId + "'");

			while (rs.next()) {
				// =?
				StockEntity date = new StockEntity();
				date.setExpiary_date(rs.getString("expiary_date"));

				dates.add(date);

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
		return dates;
	}

	public StockEntity getMaxBatchById(String productId) {
		connection = null;
		StockEntity batch = new StockEntity();

		try {
			connection = DBUtil.getConnection();
			PreparedStatement p_st = connection
					.prepareStatement("SELECT MAX(batch_no) FROM batch_tbl WHERE product_id = ?");
			p_st.setString(1, productId);
			ResultSet rs = p_st.executeQuery();
			while (rs.next()) {
				batch.setBatch_no(rs.getInt("MAX(batch_no)"));
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

		return batch;

	}

	public boolean checkProductId(String productId) {
		boolean result=false;
		connection = null;
		StockEntity product = new StockEntity();

		try {
			connection = DBUtil.getConnection();
			PreparedStatement p_st = connection
					.prepareStatement("SELECT product_id FROM batch_tbl WHERE product_id = ?");
			p_st.setString(1, productId);
			ResultSet rs = p_st.executeQuery();
			rs.last(); 
			int rowCount = rs.getRow();
			System.out.println("COUNT:"+rowCount);
			if(rowCount >=0){
				result=true;
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

		return result;

	}

}
