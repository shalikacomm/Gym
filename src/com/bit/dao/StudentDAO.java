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

			st.setString(1, entity.getSt_id());
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
				st_entity.setSt_id(rs.getString("st_id"));
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

    public StudentEntity getUserById(String st_Id) {
    	Connection con = null;
    	StudentEntity student = new StudentEntity();
        try {
        	con=DBUtil.getConnection();
            PreparedStatement preparedStatement = con.
                    prepareStatement("SELECT * FROM student_tbl WHERE st_id=?");
            preparedStatement.setString(1, st_Id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
            	student.setSt_id(rs.getString("st_id"));
            	student.setSt_name(rs.getString("st_name"));
            	student.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

        return student;
    }
    public void updateStudent(StudentEntity student) {
    	Connection con = null;
        try {
        	con=DBUtil.getConnection();
        	String sql="UPDATE student_tbl SET st_name=?,email=? WHERE st_id=?";
            
        	PreparedStatement preparedStatement = con.prepareStatement(sql);
            // Parameters start with 1
            preparedStatement.setString(1, student.getSt_name());
            preparedStatement.setString(2, student.getEmail());
            preparedStatement.setString(3, student.getSt_id());
      
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
