package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bit.entity.InstructorEntity;
import com.bit.util.DBUtil;

public class InstructorDAO {

	private Connection con;
	
	public boolean addInstructor(InstructorEntity entity) {
		boolean rs = false;
		PreparedStatement st = null;
		con = null;

		try {
			con = DBUtil.getConnection();

			String sql = "INSERT INTO instructor_tbl VALUES (?,?,?,?)";
			st = con.prepareStatement(sql);

			st.setString(1, entity.getIns_id());
			st.setString(2, entity.getIns_name());
			st.setString(3, entity.getIns_email());
			st.setInt(4, 1);
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

	public List<InstructorEntity> getAllInstructors() {
		con = null;

		List<InstructorEntity> ins_list = new ArrayList<InstructorEntity>();
		try {

			con = DBUtil.getConnection();
			Statement statement = con.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM instructor_tbl");

			while (rs.next()) {
				InstructorEntity ins_entity = new InstructorEntity();
				ins_entity.setIns_id(rs.getString("ins_id"));
				ins_entity.setIns_name(rs.getString("ins_name"));
				ins_entity.setIns_email(rs.getString("ins_email"));
				ins_entity.setStatus(rs.getInt("status"));
				ins_list.add(ins_entity);

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

		return ins_list;
	}

    public InstructorEntity getInstructorById(String ins_id) {
    	con = null;
    	InstructorEntity instructor = new InstructorEntity();
        try {
        	con=DBUtil.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM instructor_tbl WHERE ins_id=?");
            preparedStatement.setString(1, ins_id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
            	instructor.setIns_id(rs.getString("ins_id"));
            	instructor.setIns_name(rs.getString("ins_name"));            	
            	instructor.setIns_email(rs.getString("ins_email"));
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

        return instructor;
    }
    public void updateInstructor(InstructorEntity instructor) {
    	con = null;
        try {
        	con=DBUtil.getConnection();
        	String sql="UPDATE instructor_tbl SET ins_name=?,ins_email=? WHERE ins_id=?";
            
        	PreparedStatement preparedStatement = con.prepareStatement(sql);
            // Parameters start with 1
            preparedStatement.setString(1, instructor.getIns_name());
            preparedStatement.setString(2, instructor.getIns_email());
            preparedStatement.setString(3, instructor.getIns_id());
      
            preparedStatement.executeUpdate();

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
    }
    public void deactiveInstructor(String ins_id) {
    	con = null;
        try {
        	con=DBUtil.getConnection();
        	String sql="UPDATE instructor_tbl SET status=0 WHERE ins_id=?";
            
        	PreparedStatement preparedStatement = con.prepareStatement(sql);
            // Parameters start with 1
            preparedStatement.setString(1, ins_id);
            preparedStatement.executeUpdate();

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
    }
    public void activeInstructor(String ins_id) {
     con = null;
    	try {
    		con=DBUtil.getConnection();
    		String sql="UPDATE instructor_tbl SET status=1 WHERE ins_id=?";
    		
    		PreparedStatement preparedStatement = con.prepareStatement(sql);
    		// Parameters start with 1
    		preparedStatement.setString(1, ins_id);
    		preparedStatement.executeUpdate();
    		
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
    }
}
