package com.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import com.bit.entity.InstructorEntity;
import com.bit.entity.ProductEntity;
import com.bit.util.DBUtil;

public class ProductDAOImpl implements ProductDAO {

	private Connection connection;

	public boolean addProduct(ProductEntity product) {
		boolean result=false;
		connection = DBUtil.getConnection();
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(
					"INSERT INTO product_tbl(product_id,description,purchase_price,selling_price,reorder_level,stock,measuring_unit,status)"
							+ "VALUES(?,?,?,?,?,?,?,?)");
			// parameters starts form 1
			preparedStatement.setString(1, product.getProductID());
			preparedStatement.setString(2, product.getDescription());
			preparedStatement.setFloat(3, product.getPurchasePrice());
			preparedStatement.setFloat(4, product.getSellingPrice());
			preparedStatement.setInt(5, product.getReorderLevel());
			preparedStatement.setFloat(6, 0);
			preparedStatement.setString(7, product.getMeasuringUnit());
			preparedStatement.setInt(8, 1);
			
		int res=preparedStatement.executeUpdate();
		if(res >0){
			result=true;
		}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}

		}
		return result;
	}

	public List<ProductEntity> getAllProducts() {

		connection = null;

		List<ProductEntity> prd_list = new ArrayList<ProductEntity>();
		try {
			connection = DBUtil.getConnection();
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM product_tbl");

			while (rs.next()) {
				ProductEntity product = new ProductEntity();
				product.setProductID(rs.getString("product_id"));
				product.setDescription(rs.getString("description"));
				product.setPurchasePrice(rs.getFloat("purchase_price"));
				product.setSellingPrice(rs.getFloat("selling_price"));
				product.setReorderLevel(rs.getInt("reorder_level"));
				 product.setStock(rs.getFloat("stock"));
				product.setMeasuringUnit(rs.getString("measuring_unit"));
				product.setStatus(rs.getInt("status"));
				prd_list.add(product);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return prd_list;
	}

	
	public List<ProductEntity> getActiveProducts() {

		connection = null;

		List<ProductEntity> prd_list = new ArrayList<ProductEntity>();
		try {
			connection = DBUtil.getConnection();
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM product_tbl WHERE status = 1");

			while (rs.next()) {
				ProductEntity product = new ProductEntity();
				product.setProductID(rs.getString("product_id"));
				product.setDescription(rs.getString("description"));
				product.setPurchasePrice(rs.getFloat("purchase_price"));
				product.setSellingPrice(rs.getFloat("selling_price"));
				product.setReorderLevel(rs.getInt("reorder_level"));
				 product.setStock(rs.getFloat("stock"));
				product.setMeasuringUnit(rs.getString("measuring_unit"));
				product.setStatus(rs.getInt("status"));
				prd_list.add(product);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return prd_list;
	}
	
	
	public ProductEntity getProductById(String productId) {
		connection = null;
		ProductEntity product = new ProductEntity();
		try {
			connection = DBUtil.getConnection();
			PreparedStatement p_st = connection.prepareStatement("SELECT * FROM product_tbl WHERE product_id = ?");
			p_st.setString(1, productId);
			ResultSet rs = p_st.executeQuery();

			while (rs.next()) {

				product.setProductID(rs.getString("product_id"));
				product.setDescription(rs.getString("description"));
				product.setPurchasePrice(rs.getFloat("purchase_price"));
				product.setSellingPrice(rs.getFloat("selling_price"));
				product.setReorderLevel(rs.getInt("reorder_level"));
				product.setStock(rs.getFloat("stock"));
				product.setMeasuringUnit(rs.getString("measuring_unit"));
				product.setStatus(rs.getInt("status"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// TODO: handle exception
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
					// TODO: handle exception
				}
		}

		return product;

	}

	public boolean updateProduct(ProductEntity product) {
		Connection con = null;
		boolean res = false;
		try {
			con = DBUtil.getConnection();
			String sql = "UPDATE product_tbl SET description=?,purchase_price=? ,selling_price=?,reorder_level=?,measuring_unit=? WHERE product_id=?";

			PreparedStatement preparedStatement = con.prepareStatement(sql);
			// Parameters start with 1
			preparedStatement.setString(1, product.getDescription());
			preparedStatement.setFloat(2, product.getPurchasePrice());
			preparedStatement.setFloat(3, product.getSellingPrice());
			preparedStatement.setInt(4, product.getReorderLevel());
			preparedStatement.setString(5, product.getMeasuringUnit());
			preparedStatement.setString(6, product.getProductID());

			 int temp  = preparedStatement.executeUpdate();
if (temp > 0){
	res = true;
}
			 
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		return res;
	}

	public boolean deactivateProduct(String prd_id) {
		connection = null;
		boolean result=false;
		try {
			connection = DBUtil.getConnection();
			String sql = "UPDATE product_tbl SET status = 0 WHERE product_id = ?";

			PreparedStatement pre_statement = connection.prepareStatement(sql);
			pre_statement.setString(1, prd_id);
			int res=pre_statement.executeUpdate();

			if(res>0){
				result=true;
			}
		} catch (SQLException e) {
			e.printStackTrace();

			// TODO: handle exception
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}
		return result;

	}

	public boolean activateProduct(String prd_id) {

		connection = null;
		boolean result=false;
		try {
			connection = DBUtil.getConnection();
			String sql = "UPDATE product_tbl SET status = 1 WHERE product_id = ?";
			PreparedStatement pre_st = connection.prepareStatement(sql);
			pre_st.setString(1, prd_id);
			int res=pre_st.executeUpdate();
if(res>0){
	result=true;
}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException e2) {
					e2.printStackTrace();
				}
		}
		return result;
	}
	
	public List<ProductEntity> lowQuantityWarning() {

		connection = null;

		List<ProductEntity> prd_list = new ArrayList<ProductEntity>();
		try {
			connection = DBUtil.getConnection();
			Statement statement = connection.createStatement();
			ResultSet rs = statement.executeQuery("SELECT * FROM product_tbl WHERE status = 1 AND reorder_level > stock");

			while (rs.next()) {
				ProductEntity product = new ProductEntity();
				product.setProductID(rs.getString("product_id"));
				product.setDescription(rs.getString("description"));
				product.setPurchasePrice(rs.getFloat("purchase_price"));
				product.setSellingPrice(rs.getFloat("selling_price"));
				product.setReorderLevel(rs.getInt("reorder_level"));
				 product.setStock(rs.getFloat("stock"));
				product.setMeasuringUnit(rs.getString("measuring_unit"));
				product.setStatus(rs.getInt("status"));
				prd_list.add(product);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (connection != null)
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}

		return prd_list;
	}
	

}
