package com.bit.dao;

import java.sql.Connection;
import java.sql.Date;
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
	
	
	public MemberPaymentEntity getLastActiveDate(String userID) {
		connection = DBUtil.getConnection();
		MemberPaymentEntity lastDate = new MemberPaymentEntity();
	        try {
	            PreparedStatement preStmt = connection.prepareStatement("SELECT MAX(active_period) FROM member_payment_tbl WHERE user_id =?");
	            preStmt.setString(1, userID);
	            ResultSet rs = preStmt.executeQuery();
	            
	            if (rs.next()) {
	            	
	            	lastDate.setActive_period(rs.getDate("MAX(active_period)"));
	            	
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }finally {
				if (connection != null)
					try {
						connection.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}

			}
			return lastDate;
	}
	/*public MemberPaymentEntity getLastActiveTimeMember(String user_id) {
		Connection con = null;
    	MemberPaymentEntity paid_detail = new MemberPaymentEntity();
    	
        try {
        	con=DBUtil.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement("SELECT MAX(active_period) FROM member_payment_tbl WHERE user_id = ?");
            preparedStatement.setString(1, user_id);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
            
            	paid_detail.setActive_period(rs.getString(" MAX(active_period)"));
	              
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

        return paid_detail;
	}*/
	
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
	        }finally {
				if (connection != null)
					try {
						connection.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}

			}
			return member;
	}
	
	public MemberPaymentEntity getMonthlyFee() {
		connection = DBUtil.getConnection();
		MemberPaymentEntity fee = new MemberPaymentEntity();
	        try {
	            PreparedStatement preStmt = connection.prepareStatement("SELECT value FROM emp.system_set_tbl WHERE description = 'monthly_fee'");
	            ResultSet rs = preStmt.executeQuery();
	            
	            if (rs.next()) {
	            	
	            	fee.setMonthly_fee(rs.getDouble("value"));
	            	
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }finally {
				if (connection != null)
					try {
						connection.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}

			}
			return fee;
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
		finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

		}
		return memberSubs;
	}
	
	
	public boolean addFeeDetails(MemberPaymentEntity feePay) {
		boolean pay_res =false;
		int res = 0;
		connection = DBUtil.getConnection();
		java.sql.Date date = getCurrentDatetime();

		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("INSERT INTO member_payment_tbl  values (?,?, ?, ?, ?,?, ?,?,?,?,?,?)");
			preparedStatement.setString(1, feePay.getPayment_id());
			preparedStatement.setString(2, feePay.getUser_id());
			preparedStatement.setDate(3, feePay.getActive_period());
			preparedStatement.setDouble(4, feePay.getAdditional_payments());
			preparedStatement.setDouble(5, feePay.getTotal_subs());
			preparedStatement.setDouble(6, feePay.getDiscount());
			preparedStatement.setDate(7, date);
			preparedStatement.setString(8, feePay.getPayment_type());
			preparedStatement.setString(9, feePay.getBank_name());
			preparedStatement.setString(10, feePay.getCard_type());
			preparedStatement.setInt(11, feePay.getFirst4());
			preparedStatement.setInt(12, feePay.getLast4());
			res = preparedStatement.executeUpdate();
			if(res>0){
				pay_res = true;
			}

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
		return pay_res;
	}

	public java.sql.Date getCurrentDatetime() {
		java.util.Date today = new java.util.Date();
		return new java.sql.Date(today.getTime());
	}
	
}
