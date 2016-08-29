package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.bit.entity.InvoiceEntity;
import com.bit.entity.MemberPaymentEntity;
import com.bit.entity.UserEntity;
import com.bit.util.DBUtil;

public class MemberPaymentDAOImpl implements MemberPaymentDAO {
	private Connection connection;
	
	public UserEntity getMemberStatus(String userID) {
		connection = DBUtil.getConnection();
		UserEntity member = new UserEntity();
	        try {
	            PreparedStatement preStmt = connection.prepareStatement("SELECT status FROM user_tbl WHERE user_id = ?");
	            preStmt.setString(1, userID);
	            ResultSet rs = preStmt.executeQuery();
	            
	            if (rs.next()) {
	            	
	            	member.setStatus(rs.getInt("status"));
	            	
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
			return member;
	}
	
	
	public List <MemberPaymentEntity> getMemberSubs(String userID) {
		connection = DBUtil.getConnection();
		List<MemberPaymentEntity> memberSubs = new ArrayList<MemberPaymentEntity>();
	
		try {
			PreparedStatement preStmt = connection.prepareStatement("SELECT * FROM emp.invoice_tbl where user_id=? AND payment_type ='subs' AND sub_status ='0'");
			preStmt.setString(1, userID);
			ResultSet rs = preStmt.executeQuery();
			
			while (rs.next()) {
				MemberPaymentEntity memberSub = new MemberPaymentEntity();
				memberSub.setAdditional_payments(rs.getDouble("invoiced_total"));
				
				
				memberSubs.add(memberSub);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return memberSubs;
	}
	
	
}
