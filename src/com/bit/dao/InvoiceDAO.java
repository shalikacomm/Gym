package com.bit.dao;

import java.util.List;

import com.bit.entity.InvoiceEntity;
import com.bit.entity.InvoiceProductEntity;
import com.bit.entity.ProductEntity;
import com.bit.entity.StockEntity;

public interface InvoiceDAO{

	public void addInvoiceProduct(InvoiceProductEntity invoice);
	public void addSellerDetails(InvoiceEntity invoice);
	public ProductEntity getStockById(String productId);
	public List<InvoiceEntity> getInvoiceList();
	public StockEntity getMinExpBatch(String productId);
	public float updateBatchQty(String productId, float qty) ;
}
