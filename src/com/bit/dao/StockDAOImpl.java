package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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
			if(rowCount >0){
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
