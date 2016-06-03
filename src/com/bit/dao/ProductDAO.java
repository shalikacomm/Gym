package com.bit.dao;

import java.util.List;

import com.bit.entity.ProductEntity;

public interface ProductDAO {

	public void addProduct(ProductEntity product);

	public List<ProductEntity> getAllProducts(); 
	
	public ProductEntity getProductById(String productId);
	
	 public void updateProduct(ProductEntity product);
	 
	 public void  deactivateProduct(String prd_id);
	 
	 public void activateProduct(String prd_id);
	 
	 
}
