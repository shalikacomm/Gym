package com.bit.dao;

import java.util.List;

import com.bit.entity.BasicChartEntity;

public interface BasicChartDAO {
	public boolean addBasicCharts(BasicChartEntity workout);
	public void addBasicChartDetails(BasicChartEntity chartDetails) ;
	public List<BasicChartEntity> getAllWorkouts() ;
}
