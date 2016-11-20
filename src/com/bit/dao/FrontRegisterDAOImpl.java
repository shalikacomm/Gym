package com.bit.dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.bouncycastle.util.encoders.Hex;

import com.bit.entity.UserEntity;
import com.bit.util.DBUtil;
import com.bit.util.Methods;

public class FrontRegisterDAOImpl implements FrontRegisterDAO{
	
	private Connection connection;

	@Override
	public boolean addUserFront(UserEntity user) {
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
			preparedStatement.setInt(13, 2);
			
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


}
