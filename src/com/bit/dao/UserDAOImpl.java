package com.bit.dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.bouncycastle.util.encoders.Hex;

import com.bit.entity.MemberPaymentEntity;
import com.bit.entity.UserEntity;
import com.bit.util.DBUtil;
import com.bit.util.Methods;

public class UserDAOImpl implements UserDAO {

	private Connection connection;

	@Override
	public boolean addUser(UserEntity user) {
		boolean result=false;
		connection = DBUtil.getConnection();
		Methods method=new Methods();
		String randomCode=method.RandomCode();
		
		try {
		byte[] temp = randomCode.getBytes();  // convert password to byte 

        MessageDigest md = MessageDigest.getInstance("SHA-256");
        md.update(temp);

        byte[] hash = md.digest(); // digest the password
        String encrypt = new String(Hex.encode(hash));//Hex.encode(svPass);
		
		
			PreparedStatement preparedStatement = connection.prepareStatement(
					"INSERT INTO user_tbl(user_id,first_name,last_name,nic,email,password,gender,address,role,dob,marital_status,mobile_number,status)"
							+ " values (?, ?, ?, ?,?, ?, ?, ?,?, ?, ?, ?,? )");
			// Parameters start with 1
			preparedStatement.setString(1, user.getUser_id());
			preparedStatement.setString(2, user.getFirst_name());
			preparedStatement.setString(3, user.getLast_name());
			preparedStatement.setString(4, user.getNic());
			preparedStatement.setString(5, user.getEmail());
			preparedStatement.setString(6, encrypt);
			preparedStatement.setString(7, user.getGender());
			preparedStatement.setString(8, user.getAddress());
			preparedStatement.setString(9, user.getRole());
			preparedStatement.setDate(10, user.getDob());
			preparedStatement.setInt(11, user.getMarital_status());
			preparedStatement.setInt(12, user.getMobile_number());
			preparedStatement.setInt(13, 3);
			
			int val=preparedStatement.executeUpdate();
			
			PreparedStatement preparedStatement2 = connection.prepareStatement(
					"INSERT INTO image_tbl(user_id,image_path)"
							+ " values (?, ?)");
			// Parameters start with 1
			preparedStatement2.setString(1, user.getUser_id());
			preparedStatement2.setString(2, "none");
			preparedStatement2.executeUpdate();
			if(val>0){
				 System.out.println("User Added");
	                String MsgBody = "Hi " + user.getFirst_name() + ", \n \n Please follow the Username and Code for login to the System"
	                        + "\n \n Username: " + user.getNic() + " \n Password: " + randomCode + " \n \n After that you can enter new password. "
	                        + " \n \n Thanks you, \n System Administrator, \n Fit & Fun Health club";
	                result = method.sendMail(user.getEmail(), "User Registration for Fit & Fun Health club", MsgBody);
				result=true;
			}
		} catch (NoSuchAlgorithmException ex) {
			ex.printStackTrace();
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
		return result;

	}

	@Override
	public boolean updateUser(UserEntity user) {
		Connection con = null;
		boolean res = false;
		try {
			con = DBUtil.getConnection();
			String sql = "UPDATE user_tbl SET first_name=?,last_name=? ,dob=?,nic=?,email=?,gender=?,marital_status=?,address=?,mobile_number=?,role=? WHERE user_id=?";

			PreparedStatement preparedStatement = con.prepareStatement(sql);
			// Parameters start with 1
			
			preparedStatement.setString(1, user.getFirst_name());
			preparedStatement.setString(2, user.getLast_name());
			preparedStatement.setDate(3, user.getDob());
			preparedStatement.setString(4, user.getNic());
			preparedStatement.setString(5, user.getEmail());
			preparedStatement.setString(6, user.getGender());
			preparedStatement.setInt(7, user.getMarital_status());
			preparedStatement.setString(8, user.getAddress());
			preparedStatement.setInt(9, user.getMobile_number());
			preparedStatement.setString(10, user.getRole());
			preparedStatement.setString(11, user.getUser_id());
		
				
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
	                user.setMobile_number(rs.getInt("mobile_number"));
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
	public List<UserEntity>getAllActiveUsers() {
		connection = DBUtil.getConnection();
		List<UserEntity> users = new ArrayList<UserEntity>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from user_tbl WHERE status =1");
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
				user.setMobile_number(rs.getInt("mobile_number"));
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
	
	public List<UserEntity>getAllActiveMemberUsers() {
		connection = DBUtil.getConnection();
		List<UserEntity> users = new ArrayList<UserEntity>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from user_tbl WHERE status =1 AND role='member'");
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
				user.setMobile_number(rs.getInt("mobile_number"));
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
	
	public List<UserEntity>getAllMemberUsers() {
		connection = DBUtil.getConnection();
		List<UserEntity> users = new ArrayList<UserEntity>();
		try {
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("select * from user_tbl WHERE role='member'");
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
				user.setMobile_number(rs.getInt("mobile_number"));
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
		Connection con = null;
    	UserEntity user = new UserEntity();
        try {
        	con=DBUtil.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM user_tbl WHERE user_id=?");
            preparedStatement.setString(1, userId);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
            	 user.setUser_id(rs.getString("user_id"));
	                user.setFirst_name(rs.getString("first_name"));
	                user.setLast_name(rs.getString("last_name"));
	                user.setEmail(rs.getString("email"));
	                user.setGender(rs.getString("gender"));
	                user.setNic(rs.getString("nic"));
	                user.setDob(rs.getDate("dob"));
	                user.setMarital_status(rs.getInt("marital_status"));
	                user.setAddress(rs.getString("address"));
	                user.setMobile_number(rs.getInt("mobile_number"));
	                user.setRole(rs.getString("role"));
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

        return user;
	}
	public UserEntity getUserByNIC(String nic) {
		Connection con = null;
		UserEntity user = new UserEntity();
		try {
			con=DBUtil.getConnection();
			PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM user_tbl WHERE nic=?");
			preparedStatement.setString(1, nic);
			ResultSet rs = preparedStatement.executeQuery();
			
			if (rs.next()) {
				user.setUser_id(rs.getString("user_id"));
				user.setFirst_name(rs.getString("first_name"));
				user.setLast_name(rs.getString("last_name"));
				user.setEmail(rs.getString("email"));
				user.setGender(rs.getString("gender"));
				user.setNic(rs.getString("nic"));
				user.setDob(rs.getDate("dob"));
				user.setMarital_status(rs.getInt("marital_status"));
				user.setAddress(rs.getString("address"));
				user.setMobile_number(rs.getInt("mobile_number"));
				user.setRole(rs.getString("role"));
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
		
		return user;
	}
	
	public boolean getUserStatus(String userId) {
		Connection con = null;
    	UserEntity user = new UserEntity();
    	boolean status = false;
        try {
        	con=DBUtil.getConnection();
            PreparedStatement preparedStatement = con.prepareStatement("SELECT status FROM user_tbl WHERE user_id=?");
            preparedStatement.setString(1, userId);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
            	
	                user.setStatus(rs.getInt("status"));
	              
            }
           
            if (user.getStatus()== 1){
            	status = true; 
            }else{
            	status = false;
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

        return status;
	}


	@Override
	public boolean activate(String userId) {
    	Connection con = null;
    	boolean result = false;
    	try {
    		con=DBUtil.getConnection();
    		String sql="UPDATE user_tbl SET status=1 WHERE user_id=?";
    		
    		PreparedStatement preparedStatement = con.prepareStatement(sql);
    		// Parameters start with 1
    		preparedStatement.setString(1, userId);
    		int res = preparedStatement.executeUpdate();
    		
    		if(res > 0){
    			result = true;
    		}else{
    			result = false;
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
    	return result;
	}

	@Override
	public boolean deactivateUser(String user_id) {
		connection = null;
		boolean result=false;
		try {
			connection = DBUtil.getConnection();
			String sql = "UPDATE user_tbl SET status = 0 WHERE user_id = ?";

			PreparedStatement pre_statement = connection.prepareStatement(sql);
			pre_statement.setString(1, user_id);
			int res=pre_statement.executeUpdate();

			if(res>0){
				result=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();

			// TODO: handle exception
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
		return result;
	}
	
	public boolean  deactivateExpiredMembers() {
		connection = null;
		boolean result=false;
		UserDAO dao = new UserDAOImpl();
		MemberPaymentDAO dao_pay = new MemberPaymentDAOImpl();
		java.sql.Date date = getCurrentDatetime();
		
		
		try {
			connection = DBUtil.getConnection();
			List<UserEntity> users = dao.getAllActiveMemberUsers();
			for(int i=0; i< users.size(); i++){
				String person = users.get(i).getUser_id();
				MemberPaymentEntity lastDate = dao_pay.getLastActiveDate(person);
				
			/*	if(date.compareTo(lastDate)>0){
	                System.out.println("Date1 is after Date2");
				}
			*/
			String sql = "UPDATE user_tbl SET status = 0 WHERE user_id = ?";

			PreparedStatement pre_statement = connection.prepareStatement(sql);
		//	pre_statement.setString(1, );
			int res=pre_statement.executeUpdate();
		
			if(res>0){
				result=true;
			}
			}
			} catch (SQLException e) {
			e.printStackTrace();

			// TODO: handle exception
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
		return result;
		
	}
	public java.sql.Date getCurrentDatetime() {
		java.util.Date today = new java.util.Date();
		return new java.sql.Date(today.getTime());
	}
	

	public UserEntity resetPassword(String email) {
		Connection con = null;
    	UserEntity user = new UserEntity();
        try {
        	con=DBUtil.getConnection();
        	Methods method=new Methods();
    		String randomCode=method.RandomCode();
    		
    		
    		byte[] temp = randomCode.getBytes();  // convert password to byte 

            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(temp);

            byte[] hash = md.digest(); // digest the password
            String encrypt = new String(Hex.encode(hash));//Hex.encode(svPass);
        	
            PreparedStatement preparedStatement = con.prepareStatement("SELECT * FROM emp.user_tbl WHERE email= ?");
            preparedStatement.setString(1, email);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
            	 user.setUser_id(rs.getString("user_id"));
            	 user.setFirst_name(rs.getString("first_name"));
            	 user.setNic(rs.getString("nic"));
            	 
            }
            System.out.println("User Pw reseted");
            System.out.println("User Pw reseted :" +user.getNic());
            String MsgBody = "Hi " + user.getFirst_name() + ", \n \n Please follow the Username and Code for login to the System"
                    + "\n \n Username: " + user.getNic() + " \n Password: " + randomCode + " \n \n After that you can enter new password. "
                    + " \n \n Thanks you, \n System Administrator, \n Fit & Fun Health club";
            method.sendMail(email, "User Registration for Fit & Fun Health club", MsgBody); 
            
            String sql = "UPDATE user_tbl SET status=3, password =? WHERE user_id = ?";
            PreparedStatement pre_statement = con.prepareStatement(sql);
            pre_statement.setString(1,encrypt);
            pre_statement.setString(2,user.getUser_id());
            pre_statement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
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

        return user;
	}
	
	public UserEntity ChangePassword(UserEntity passDetails) {
		Connection con = null;
    	    try {
        	con=DBUtil.getConnection();
        	String username = passDetails.getNic();
    		String password = passDetails.getPassword();
    		UserEntity userData = getUserByNIC(username);
    		
    		
    		byte[] temp = password.getBytes();  // convert password to byte 

            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(temp);

            byte[] hash = md.digest(); // digest the password
            String encrypt = new String(Hex.encode(hash));//Hex.encode(svPass);
        	
            PreparedStatement preparedStatement = con.prepareStatement("UPDATE user_tbl SET password=?,status=? WHERE user_id=?");
            
            preparedStatement.setString(1,encrypt);
            preparedStatement.setInt(2,1);
            preparedStatement.setString(3, userData.getUser_id());
           int res= preparedStatement.executeUpdate();
     if(res>0){
            System.out.println("change password succefully");
     }else{
         System.out.println("change password failed");
     }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
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

        return passDetails;
	}

	  public UserEntity login(UserEntity loginUsers) {
		  Connection conn = null;
		  ResultSet rs = null;
	        try { // preparing some objects for connection 
	            Statement stmt = null;
	            String username = loginUsers.getNic();//get User Name from the Login Controller
	            String password = loginUsers.getPassword(); //get Password from the Login Controller

	            MessageDigest md = MessageDigest.getInstance("SHA-256");
	            byte[] temp = password.getBytes(); // convert password to byte 
	            md.update(temp);
	            byte[] svPass = md.digest();
	            String hash_value = new String(Hex.encode(svPass));// digest the password
	            
	            String searchQuery = "SELECT * from user_tbl where nic='" + username
	                    + "' AND password='" + hash_value + "'";
	            try {
	                conn = DBUtil.getConnection(); // Connect to the database
	                stmt = conn.createStatement();
	                rs = stmt.executeQuery(searchQuery);
	                boolean more = rs.next();
	                if (!more) {// if user does not exist set the isValid variable to false
	                    loginUsers.setValid(false);
	                } else if (more) {// if user exists set the isValid variable to true
	                    loginUsers.setUser_id(rs.getString("user_id"));
	                    loginUsers.setFirst_name(rs.getString("first_name"));
	                    loginUsers.setLast_name(rs.getString("last_name"));
	                    loginUsers.setRole(rs.getString("role"));
	                    loginUsers.setStatus(rs.getInt("status"));
	                    loginUsers.setValid(true);
	                    
	                }
	            } catch (SQLException ex) {
	                ex.printStackTrace();
	            } // some exception handling
	            finally {
	                if (rs != null) {
	                    try {
	                        rs.close();
	                    } catch (Exception e) {
	                        e.printStackTrace();
	                    }
	                    rs = null;
	                }
	                if (stmt != null) {
	                    try {
	                        stmt.close();
	                    } catch (Exception e) {
	                        e.printStackTrace();
	                    }
	                    stmt = null;
	                }
	                if (conn != null) {
	                    try {
	                        conn.close();
	                    } catch (Exception e) {
	                        e.printStackTrace();
	                    }
	                    conn = null;
	                }
	            }
	        } catch (NoSuchAlgorithmException ex) {
	            ex.printStackTrace();
	        }
	        return loginUsers;
	    }
}
