package product;
import java.sql.Connection;
import product.Product;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbManager.DBManager;
public class ProductDao {
	DBManager dbm;
	
	public ProductDao() {
		dbm=new DBManager();
	}
	
	public ArrayList<Product> getProductList(){
		Connection con=dbm.getConnection();
		ArrayList<Product> productList=new ArrayList<>();
		try {
			PreparedStatement st=con.prepareStatement("select * from product");
			ResultSet rs=st.executeQuery();
			while(rs.next()) {
				Product p=new Product();
				p.setProductid(rs.getString(1));
				p.setCategoryid(rs.getString(2));
				p.setProductName(rs.getString(3));
				p.setDescription(rs.getString(4));
				p.setPrice(rs.getString(5));
				p.setInventory(rs.getString(6));
				p.setImage(rs.getString(7));
				productList.add(p);
			}
			return productList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return productList;
	}
	
	
	public ArrayList<Product> displayByCategory(String CategoryId) {
		Connection con=dbm.getConnection();
		ArrayList<Product> productList=new ArrayList<>();
		try {
			PreparedStatement st=con.prepareStatement("select * from product where categoryId=?");
			st.setString(1, CategoryId);
			ResultSet rs=st.executeQuery();
			while(rs.next()) {
				Product p=new Product();
				p.setProductid(rs.getString(1));
				p.setCategoryid(rs.getString(2));
				p.setProductName(rs.getString(3));
				p.setDescription(rs.getString(4));
				p.setPrice(rs.getString(5));
				p.setInventory(rs.getString(6));
				p.setImage(rs.getString(7));
				productList.add(p);
			}
			return productList;
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return productList;
		
	}
	
	
//	public static void main(String args[]) {
//		ProductDao p=new ProductDao();
//		ArrayList<Product> pro=p.getProductList();
//		while(!pro.isEmpty()) {
//			Product p1=pro.remove(0);
//			System.out.println(p1);
//		}
//		//System.out.println(pro);
//		
//	}
	
	

	
	
	

}

