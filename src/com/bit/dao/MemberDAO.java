package com.bit.dao;

import java.util.List;

import com.bit.entity.InvoiceEntity;
import com.bit.entity.MemberEntity;
import com.bit.entity.MemberPaymentEntity;
import com.bit.entity.UserEntity;

public interface MemberDAO {

	public void addMember(MemberEntity member);

	public void updateMember(MemberEntity member);

	public List<MemberEntity> getAllMembers();
	
	public List<UserEntity> getAllUsersbyMember();

	public MemberEntity getMemberById(String memberId);

	public void activate(String memberId);

	public void deactivate(String memberId);

	public void updateImage(String user_id,String user_path);
	
	public String getImagePath(String user_id);
	
	

	
}
