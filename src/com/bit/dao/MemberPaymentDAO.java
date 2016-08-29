package com.bit.dao;

import java.util.List;

import com.bit.entity.MemberPaymentEntity;
import com.bit.entity.UserEntity;

public interface MemberPaymentDAO {

	
	public UserEntity getMemberStatus(String userID);
	
	public List <MemberPaymentEntity> getMemberSubs(String userID);
}