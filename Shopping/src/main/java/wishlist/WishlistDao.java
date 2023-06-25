package wishlist;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbManager.DBManager;
import product.Product;

public class WishlistDao {
	DBManager dbm;
	public WishlistDao() {
		dbm=new DBManager();

	}
	public void AddTOWishlist(String uid,String pid) {
		Connection con=dbm.getConnection();
		try {
			PreparedStatement st=con.prepareStatement("insert into wishlist values(?,?)");
			st.setString(1, uid);
			st.setString(2, pid);
			int count=st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		


	}
	public ArrayList<Product> productList(String uid){
		Connection con=dbm.getConnection();
		ArrayList<Product> products=new ArrayList<>();
		try {
			PreparedStatement st=con.prepareStatement("select productid from wishlist where userId=?");
			st.setString(1, uid);
			ResultSet rs=st.executeQuery();
			while(rs.next()) {
				Product p=new Product();
				String pid=rs.getString(1);
				p.setProductid(pid);
				PreparedStatement st1=con.prepareStatement("select productname,price,img from product where productid=?");
				st1.setString(1, pid);
				ResultSet rs1=st1.executeQuery();
				if(rs1.next()) {
					String P_name=rs1.getString(1);
					p.setProductName(P_name);
					p.setPrice(rs1.getString(2));
					p.setImage(rs1.getString(3));
					products.add(p);

				}


			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return products;
		
		
	}
	
	public void removeFromWishlist(String uid,String pid) {
		Connection con=dbm.getConnection();
		try {
			PreparedStatement st=con.prepareStatement("delete from wishlist where userid=? and productid=?");
			st.setString(1, uid);
			st.setString(2, pid);
			int count=st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
	
	
	
	public static void main(String args[]) {
		WishlistDao w=new WishlistDao();
		//w.AddTOWishlist("3cdd71c3-ea93-4e56-a0c6-a800c9440f7b", "3b80d04b-c56d-42c9-ad61-e0101526817f");
		System.out.println(w.productList("3cdd71c3-ea93-4e56-a0c6-a800c9440f7b"));
		w.removeFromWishlist("3cdd71c3-ea93-4e56-a0c6-a800c9440f7b", "3b80d04b-c56d-42c9-ad61-e0101526817f");


	}
	
	
}
