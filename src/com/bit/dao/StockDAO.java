package com.bit.dao;

import java.util.List;

import com.bit.entity.StockEntity;

public interface StockDAO {

	
	public List<StockEntity> getStockDates(String productId);
	
	public StockEntity getMaxBatchById(String productId) ;
	
	public boolean checkProductId(String productId);
}
