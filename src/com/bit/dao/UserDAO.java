package com.bit.dao;

import java.util.List;

import com.bit.entity.MemberPaymentEntity;
import com.bit.entity.UserEntity;

public interface UserDAO {

	public boolean addUser(UserEntity user);

	public List<UserEntity> getAllUsers();

	public UserEntity getUserById(String userId);

	public boolean activate(String userId);

	public boolean deactivateUser(String user_id);
	
	public UserEntity login(UserEntity loginUsers);
	
	public List<UserEntity>getAllActiveUsers() ;
	
	public List<UserEntity>getAllActiveMemberUsers() ;
	
	public UserEntity resetPassword(String email);
	
	public boolean getUserStatus(String userId);
	
	public boolean updateUser(UserEntity user);
	
	public List<UserEntity>getAllMemberUsers();
	
	public UserEntity ChangePassword(UserEntity passDetails);
	
	// public boolean deactivateExpiredMembers() ;
	
	
}
