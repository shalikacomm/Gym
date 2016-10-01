package com.bit.dao;

import java.util.List;

import com.bit.entity.ProductEntity;

public interface ProductDAO {

	public boolean addProduct(ProductEntity product);

	public List<ProductEntity> getAllProducts(); 
	
	public ProductEntity getProductById(String productId);
	
	public boolean updateProduct(ProductEntity product) ;
	 
	 public boolean  deactivateProduct(String prd_id);
	 
	 public boolean activateProduct(String prd_id);
	 
	 public List<ProductEntity> getActiveProducts();
	 
	 public List<ProductEntity> lowQuantityWarning();
}
