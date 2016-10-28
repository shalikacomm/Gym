package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bit.entity.InvoiceEntity;
import com.bit.entity.MemberDetailEntity;
import com.bit.entity.ProductEntity;
import com.bit.entity.StockEntity;
import com.bit.entity.UserEntity;
import com.bit.util.DBUtil;

public class MemberDetailDAOImpl implements MemberDetailDAO {
	private Connection connection;

	@Override
	public void addMemberDetail(MemberDetailEntity member) {
		connection = DBUtil.getConnection();

		java.sql.Date date = getCurrentDatetime();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"INSERT INTO member_detail_tbl  values (?, ?, ?, ?,?, ?, ?, ?,?, ?, ?, ?,? )");
			preparedStatement.setString(1, member.getDetail_id());
			preparedStatement.setString(2, member.getUser_id());
			preparedStatement.setDouble(3, member.getHeight());
			preparedStatement.setDouble(4, member.getWeight());
			preparedStatement.setDouble(5, member.getBmi());
			preparedStatement.setDouble(6, member.getGoal_weight());
			preparedStatement.setDouble(7, member.getChest());
			preparedStatement.setDouble(8, member.getHip());
			preparedStatement.setDouble(9, member.getShoulder_length());
			preparedStatement.setDouble(10, member.getThigh());
			preparedStatement.setDouble(11, member.getBicep());
			preparedStatement.setDate(12, date);
			preparedStatement.setInt(13, 1);

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

	public List<MemberDetailEntity>getprogress(String user_id) {
		connection = DBUtil.getConnection();
		List<MemberDetailEntity> list = new ArrayList<MemberDetailEntity>();
		try {
			PreparedStatement p_st = connection.prepareStatement("SELECT *  FROM member_detail_tbl WHERE user_id = ?");
			p_st.setString(1, user_id);
			ResultSet rs = p_st.executeQuery();
			while (rs.next()) {
				MemberDetailEntity details = new MemberDetailEntity();
				details.setHeight(rs.getDouble("height"));
				details.setWeight(rs.getDouble("weight"));
				details.setGoal_weight(rs.getDouble("goal_weight"));
				details.setChest(rs.getDouble("chest"));
				details.setHip(rs.getDouble("hip"));
				details.setShoulder_length(rs.getDouble("shoulder_length"));
				details.setThigh(rs.getDouble("thigh"));
				details.setBicep(rs.getDouble("bicep"));
				details.setDate_added(rs.getString("date_added"));
				list.add(details);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	
	
	
	
	
/*	public MemberDetailEntity getprogress(String user_id) {
		connection = null;
		MemberDetailEntity details=new MemberDetailEntity();
		try {
			connection = DBUtil.getConnection();
			PreparedStatement p_st = connection.prepareStatement(
					"SELECT *  FROM member_detail_tbl WHERE user_id = ?");
			p_st.setString(1, user_id);
			ResultSet rs = p_st.executeQuery();

			while (rs.next()) {
				details.setHeight(rs.getDouble("height"));
				details.setWeight(rs.getDouble("weight"));
				details.setGoal_weight(rs.getDouble("goal_weight"));
				details.setChest(rs.getDouble("chest"));
				details.setHip(rs.getDouble("hip"));
				details.setShoulder_length(rs.getDouble("shoulder_length"));
				details.setThigh(rs.getDouble("thigh"));
				details.setBicep(rs.getDouble("bicep"));
				details.setDate_added(rs.getString("date_added"));
				// product.setStock(rs.getFloat("stock"));

			}
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		} 

		return details;

	}*/
	
}


