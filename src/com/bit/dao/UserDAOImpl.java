package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bit.entity.UserEntity;
import com.bit.util.DBUtil;

public class UserDAOImpl implements UserDAO {

	private Connection connection;

	@Override
	public void addUser(UserEntity user) {
		connection = DBUtil.getConnection();

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"INSERT INTO user_tbl(user_id,first_name,last_name,nic,email,password,gender,address,role,dob,marital_status,mobile_number,status)"
							+ " values (?, ?, ?, ?,?, ?, ?, ?,?, ?, ?, ?,? )");
			// Parameters start with 1
			preparedStatement.setString(1, user.getUser_id());
			preparedStatement.setString(2, user.getFirst_name());
			preparedStatement.setString(3, user.getLast_name());
			preparedStatement.setString(4, user.getNic());
			preparedStatement.setString(5, user.getEmail());
			preparedStatement.setString(6, user.getPassword());
			preparedStatement.setString(7, user.getGender());
			preparedStatement.setString(8, user.getAddress());
			preparedStatement.setString(9, user.getRole());
			preparedStatement.setDate(10, user.getDob());
			preparedStatement.setInt(11, user.getMarital_status());
			preparedStatement.setString(12, user.getMobile_number());
			preparedStatement.setInt(13, user.getStatus());
			preparedStatement.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			if(connection != null){
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

	}

	@Override
	public void updateUser(UserEntity user) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<UserEntity>getAllUsers() {
		connection = DBUtil.getConnection();
		  List<UserEntity> users = new ArrayList<UserEntity>();
	        try {
	            Statement statement = connection.createStatement();
	            ResultSet rs = statement.executeQuery("select * from user_tbl");
	            while (rs.next()) {
	            	UserEntity user = new UserEntity();
	                user.setUser_id(rs.getString("user_id"));
	                user.setFirst_name(rs.getString("first_name"));
	                user.setLast_name(rs.getString("last_name"));
	                user.setDob(rs.getDate("dob"));
	                user.setEmail(rs.getString("email"));
	                user.setPassword(rs.getString("password"));
	                user.setGender(rs.getString("gender"));
	                user.setAddress(rs.getString("address"));
	                user.setMarital_status(rs.getInt("marital_status"));
	                user.setMobile_number(rs.getString("mobile_number"));
	                user.setRole(rs.getString("role"));
	                user.setStatus(rs.getInt("status"));
	                user.setNic(rs.getString("nic"));
	                users.add(user);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
			return users;

	}

	@Override
	public UserEntity getUserById(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void activate(String userId) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deactivate(String userId) {
		// TODO Auto-generated method stub

	}

}
