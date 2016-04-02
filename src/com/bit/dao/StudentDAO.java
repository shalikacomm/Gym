package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bit.entity.StudentEntity;
import com.bit.util.DBUtil;

public class StudentDAO {

	public boolean addStudent(StudentEntity entity) {
		boolean rs = false;
		PreparedStatement st = null;
		Connection con = null;

		try {
			con = DBUtil.getConnection();

			String sql = "INSERT INTO student_tbl VALUES (?,?,?)";
			st = con.prepareStatement(sql);

			st.setInt(1, entity.getSt_id());
			st.setString(2, entity.getSt_name());
			st.setString(3, entity.getEmail());

			int result = st.executeUpdate();
			if (result > 0) {
				rs = true;
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
		return rs;
	}

	public List<StudentEntity> getAllStudents() {
		Connection con = null;

		List<StudentEntity> st_list = new ArrayList<StudentEntity>();
		try {

			con = DBUtil.getConnection();
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM student_tbl");

			while (rs.next()) {
				StudentEntity st_entity = new StudentEntity();
				st_entity.setSt_id(rs.getInt("st_id"));
				st_entity.setSt_name(rs.getString("st_name"));
				st_entity.setEmail(rs.getString("email"));

				st_list.add(st_entity);

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

		return st_list;
	}

}
