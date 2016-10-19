package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.bit.entity.MemberDetailEntity;
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

	
	
}
