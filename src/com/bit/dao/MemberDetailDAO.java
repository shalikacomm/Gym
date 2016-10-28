package com.bit.dao;

import java.util.List;

import com.bit.entity.MemberDetailEntity;

public interface MemberDetailDAO {
	public void addMemberDetail(MemberDetailEntity member);
	public List<MemberDetailEntity>getprogress(String user_id);
}
