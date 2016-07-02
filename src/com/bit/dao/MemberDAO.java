package com.bit.dao;

import java.util.List;

import com.bit.entity.MemberEntity;
import com.bit.entity.UserEntity;

public interface MemberDAO {

	public void addMember(MemberEntity member);

	public void updateMember(MemberEntity member);

	public List<MemberEntity> getAllMembers();
	
	public List<UserEntity> getAllUsersbyMember();

	public MemberEntity getMemberById(String memberId);

	public void activate(String memberId);

	public void deactivate(String memberId);
}
