package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bit.entity.ProductEntity;
import com.bit.entity.SystemSettingEntity;
import com.bit.util.DBUtil;

public class SystemSettingDAOImpl  implements SystemSettingDAO{
	
	private Connection connection;
	
	public List<SystemSettingEntity> getAllSettings() {

		connection = null;

		List<SystemSettingEntity> set_list = new ArrayList<SystemSettingEntity>();
		try {
			connection = DBUtil.getConnection();
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM system_set_tbl");

			while (rs.next()) {
				SystemSettingEntity set = new SystemSettingEntity();
				set.setSet_id(rs.getString("set_id"));
				set.setDescription(rs.getString("description"));
				set.setValue(rs.getDouble("value"));
				set_list.add(set);
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

		return set_list;
	}
	
	
	public SystemSettingEntity getSetById(String setID) {
		connection = null;
		SystemSettingEntity set = new SystemSettingEntity();
		try {
			connection = DBUtil.getConnection();
			PreparedStatement p_st = connection.prepareStatement("SELECT * FROM system_set_tbl WHERE set_id = ?");
			p_st.setString(1, setID);
			ResultSet rs = p_st.executeQuery();

			while (rs.next()) {

				set.setSet_id(rs.getString("set_id"));
				set.setDescription(rs.getString("description"));
				set.setValue(rs.getDouble("value"));
	
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

		return set;

	}
	
	

	public boolean updateSettings(SystemSettingEntity setting) {
		Connection con = null;
		boolean res = false;
		try {
			con = DBUtil.getConnection();
			String sql = "UPDATE system_set_tbl SET value=? WHERE set_id=?";

			PreparedStatement preparedStatement = con.prepareStatement(sql);
			// Parameters start with 1
			preparedStatement.setDouble(1, setting.getValue());
			preparedStatement.setString(2, setting.getSet_id());

			 int temp  = preparedStatement.executeUpdate();
if (temp > 0){
	res = true;
}
			 
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
		return res;
	}


}
