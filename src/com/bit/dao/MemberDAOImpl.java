package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.bit.entity.MemberEntity;
import com.bit.entity.MemberPaymentEntity;
import com.bit.entity.UserEntity;
import com.bit.util.DBUtil;

public class MemberDAOImpl implements MemberDAO {
	private Connection connection;

	@Override
	public void addMember(MemberEntity member) {
		connection = DBUtil.getConnection();

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"INSERT INTO member_tbl  values (?, ?, ?, ?,?, ?, ?, ?,?, ?, ?, ?,? )");
			preparedStatement.setString(1, member.getMember_id());
			preparedStatement.setString(2, member.getUser_id());
			preparedStatement.setString(3, member.getImg_path());
			preparedStatement.setDouble(4, member.getHeight());
			preparedStatement.setDouble(5, member.getWeight());
			preparedStatement.setDouble(6, member.getBmi());
			preparedStatement.setDouble(7, member.getGoal_weight());
			preparedStatement.setDouble(8, member.getChest());
			preparedStatement.setDouble(9, member.getHip());
			preparedStatement.setDouble(10, member.getShoulder_length());
			preparedStatement.setDouble(11, member.getThigh());
			preparedStatement.setDouble(12, member.getBicep());
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

	@Override
	public void updateMember(MemberEntity member) {
	 	Connection con = null;
        try {
        	con=DBUtil.getConnection();
        	String sql="UPDATE member_tbl SET user_id=?,height=?,weight=?,bmi=?,goal_weight=?,bicep=?,chest=?,hip=?,thigh=?,shoulder_length=?"
        			+ ",img_path=? WHERE member_id=?";
            
        	PreparedStatement preparedStatement = con.prepareStatement(sql);
            // Parameters start with 1
            preparedStatement.setString(1, member.getUser_id());
            preparedStatement.setDouble(2, member.getHeight());
            preparedStatement.setDouble(3, member.getWeight());
            preparedStatement.setDouble(4, member.getBmi());
            preparedStatement.setDouble(5, member.getGoal_weight());
            preparedStatement.setDouble(6, member.getBicep());
            preparedStatement.setDouble(7, member.getChest());
            preparedStatement.setDouble(8, member.getHip());
            preparedStatement.setDouble(9, member.getThigh());
            preparedStatement.setDouble(10, member.getShoulder_length());
            preparedStatement.setString(11, member.getImg_path());
            preparedStatement.setString(12, member.getMember_id());
      
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

	@Override
	public List<MemberEntity> getAllMembers() {
		connection = DBUtil.getConnection();
		  List<MemberEntity> members = new ArrayList<MemberEntity>();
	        try {
	            Statement statement = connection.createStatement();
	            ResultSet rs = statement.executeQuery("select * from member_tbl");
	            while (rs.next()) {
	            	MemberEntity member = new MemberEntity();
	            	
	            	member.setUser_id(rs.getString("user_id"));
	            	member.setMember_id(rs.getString("member_id"));
	            	member.setImg_path(rs.getString("img_path"));
	            	member.setHeight(rs.getDouble("height"));
	            	member.setWeight(rs.getDouble("weight"));
	            	member.setBmi(rs.getDouble("bmi"));
	            	member.setGoal_weight(rs.getDouble("goal_weight"));
	            	member.setChest(rs.getDouble("chest"));
	            	member.setHip(rs.getDouble("hip"));
	            	member.setShoulder_length(rs.getDouble("shoulder_length"));
	            	member.setThigh(rs.getDouble("thigh"));
	            	member.setBicep(rs.getDouble("bicep"));
	            	member.setStatus(rs.getInt("status"));
	            	
	                members.add(member);
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
			return members;
	}
	

	@Override
	public MemberEntity getMemberById(String memberId) {
		connection = DBUtil.getConnection();
		MemberEntity member = new MemberEntity();
	        try {
	            PreparedStatement preStmt = connection.prepareStatement("select * from member_tbl where member_id=?");
	            preStmt.setString(1, memberId);
	            ResultSet rs = preStmt.executeQuery();
	            
	            if (rs.next()) {
	            	
	            	member.setUser_id(rs.getString("user_id"));
	            	member.setMember_id(rs.getString("member_id"));
	            	member.setImg_path(rs.getString("img_path"));
	            	member.setHeight(rs.getDouble("height"));
	            	member.setWeight(rs.getDouble("weight"));
	            	member.setBmi(rs.getDouble("bmi"));
	            	member.setGoal_weight(rs.getDouble("goal_weight"));
	            	member.setChest(rs.getDouble("chest"));
	            	member.setHip(rs.getDouble("hip"));
	            	member.setShoulder_length(rs.getDouble("shoulder_length"));
	            	member.setThigh(rs.getDouble("thigh"));
	            	member.setBicep(rs.getDouble("bicep"));
	            	member.setStatus(rs.getInt("status"));
	            	
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
			return member;
	}
	
	

	

	@Override
	public void activate(String memberId) {
    	Connection con = null;
    	try {
    		con=DBUtil.getConnection();
    		String sql="UPDATE member_tbl SET status=1 WHERE member_id=?";
    		
    		PreparedStatement preparedStatement = con.prepareStatement(sql);
    		// Parameters start with 1
    		preparedStatement.setString(1, memberId);
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

	@Override
	public void deactivate(String memberId) {
	  	Connection con = null;
    	try {
    		con=DBUtil.getConnection();
    		String sql="UPDATE member_tbl SET status=0 WHERE member_id=?";
    		
    		PreparedStatement preparedStatement = con.prepareStatement(sql);
    		// Parameters start with 1
    		preparedStatement.setString(1, memberId);
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

	@Override
	public List<UserEntity> getAllUsersbyMember() {
		Connection connection = DBUtil.getConnection();
		List<UserEntity> users = new ArrayList<UserEntity>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM user_tbl WHERE role='member'");
			while (rs.next()) {
				UserEntity user = new UserEntity();
				user.setUser_id(rs.getString("user_id"));
				user.setFirst_name(rs.getString("first_name"));
				user.setLast_name(rs.getString("last_name"));
				user.setEmail(rs.getString("email"));
				user.setStatus(rs.getInt("status"));
				user.setNic(rs.getString("nic"));
				users.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return users;
	}

}
