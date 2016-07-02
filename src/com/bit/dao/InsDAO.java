package com.bit.dao;

import java.util.List;

import com.bit.entity.InsEntity;



public interface InsDAO {

	
	public List<InsEntity> getAllInstructors();
	
	public InsEntity getUserById(String ins_id);
}
