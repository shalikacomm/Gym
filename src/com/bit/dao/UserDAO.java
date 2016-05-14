package com.bit.dao;

import java.util.List;

import com.bit.entity.UserEntity;

public interface UserDAO {

	public void addUser(UserEntity user);

	public void updateUser(UserEntity user);

	public List<UserEntity> getAllUsers();

	public UserEntity getUserById(String userId);

	public void activate(String userId);

	public void deactivate(String userId);
}
