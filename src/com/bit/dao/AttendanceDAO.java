package com.bit.dao;

import java.util.List;

import com.bit.entity.AttendenceEntity;
import com.bit.entity.CalenderEntity;

public interface AttendanceDAO {

	public boolean addAttendance(AttendenceEntity come) ;
	
	public List<CalenderEntity> getAttendanceUser(String user_id) ;
}
