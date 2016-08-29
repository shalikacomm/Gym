package com.bit.dao;

import java.util.List;

import com.bit.entity.SystemSettingEntity;

public interface SystemSettingDAO {

	
	public List<SystemSettingEntity> getAllSettings() ;
	
	public SystemSettingEntity getSetById(String setID);
	
	public boolean updateSettings(SystemSettingEntity setting);
}
