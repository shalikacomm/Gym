package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bit.entity.FeeEntity;
import com.bit.entity.ProductEntity;
import com.bit.util.DBUtil;

public class FeeDAOImpl implements FeeDAO {

	private Connection connection;

	public boolean addFee(FeeEntity feePay) {
		boolean result=false;
		connection = DBUtil.getConnection();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"INSERT INTO fee_tbl(fee_id,fee,status)"
							+ "VALUES(?,?,?)");
			// parameters starts form 1
			preparedStatement.setString(1, feePay.getFee_id());
			preparedStatement.setDouble(2, feePay.getFee());
			preparedStatement.setInt(3, 1);
		
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
	
	
	public List<FeeEntity> getAllFees() {

		connection = null;

		List<FeeEntity> fee_list = new ArrayList<FeeEntity>();
		try {
			connection = DBUtil.getConnection();
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM fee_tbl");

			while (rs.next()) {
				FeeEntity fee = new FeeEntity();
				fee.setFee_id(rs.getString("fee_id"));
				fee.setFee(rs.getDouble("fee"));
				fee.setStatus(rs.getInt("status"));
			
				
				fee_list.add(fee);
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

		return fee_list;
	}
	
	public void updateFee(FeeEntity fee) {
		Connection con = null;
		try {
			con = DBUtil.getConnection();
			String sql = "UPDATE fee_tbl SET fee=?,WHERE fee_id=?";

			PreparedStatement preparedStatement = con.prepareStatement(sql);
			// Parameters start with 1
			preparedStatement.setDouble(1, fee.getFee());
			preparedStatement.setString(5, fee.getFee_id());

			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}
	
	
}
