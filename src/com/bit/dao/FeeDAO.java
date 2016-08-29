package com.bit.dao;

import java.util.List;

import com.bit.entity.FeeEntity;


public interface FeeDAO {

	
	public boolean addFee(FeeEntity feePay) ;
	
	
	public void updateFee(FeeEntity fee) ;
	
	public List<FeeEntity> getAllFees() ;
}
