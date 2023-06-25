package Cart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dbManager.DBManager;
import product.Product;
public class CartDao {
	DBManager dbm ;
	public CartDao() {
		
		dbm=new DBManager();
		
	}
	
	
	
	
	
	public void addTocart(String PID,String uid) {
		Connection con=dbm.getConnection();
	//	System.out.println(con);
		try {
			PreparedStatement st1=con.prepareStatement("select cartId from theuser where userId=?");
			st1.setString(1,uid);
			ResultSet rs1=st1.executeQuery();
			rs1.next();
			String mycid=rs1.getString(1);
			//System.out.println(mycid);
//			PreparedStatement st=con.prepareStatement("select productId from cart where cartId=? and userID=?");
//			st.setString(1, mycid);
//			st.setString(2, uid);
//			ResultSet rs=st.executeQuery();
//			rs.next();
//			String pid=rs.getString(1);
//			System.out.println(pid);
//			if(pid.equals("0")) {
//				PreparedStatement st3=con.prepareStatement("update cart set productId=? where cartId=? and userId=? ");
//				System.out.println("if");
//				st3.setString(1, PID);
//				st3.setString(2, mycid);
//				st3.setString(3, uid);
//				int count=st3.executeUpdate();
//				System.out.println(count);
//				System.out.println("if beloow");
//	
//				
//			}else {
				PreparedStatement st2=con.prepareStatement("insert into cart values(?,?,?)");
				//System.out.println("else");
				st2.setString(1, mycid);
				st2.setString(2, uid);
				st2.setString(3, PID);	
				int count1=st2.executeUpdate();
		//	}
			
			
					
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	public void remove(String PID,String uid) {
		
		Connection con=dbm.getConnection();

		PreparedStatement st1,st2;
		try {
			st2=con.prepareStatement("select cartId from theuser where userId=?");
			st2.setString(1, uid);
			ResultSet rs=st2.executeQuery();
			rs.next();
			String cid=rs.getString(1);
			st1=con.prepareStatement("delete from cart where cartId=? and productId=? ");
			st1.setString(1, cid);
			st1.setString(2, PID);
			int count=st1.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
public ArrayList<Product> getCartItems(String uid) {
		
		Connection con=dbm.getConnection();
		ArrayList<Product> productlist=new ArrayList<>();


		PreparedStatement st2,st3;
		try {

			st2=con.prepareStatement("select productId from cart where UserId=?");
			st2.setString(1, uid);
			ResultSet rs=st2.executeQuery();
			while(rs.next()) {
				String productId=rs.getString(1);
				st3=con.prepareStatement("select productname,price,img from product where productId=?");
				st3.setString(1, productId);
				Product p=new Product();
				ResultSet rs3=st3.executeQuery();
				if(rs3.next()) {
					p.setProductid(productId);
					p.setProductName(rs3.getString(1));
					p.setPrice(rs3.getString(2));
					p.setImage(rs3.getString(3));
					productlist.add(p);
				}
				
				
			}
			
			
			return productlist;
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return productlist;
		
	}
	
	
//	public static void main(String args[]) {
//		CartDao c=new CartDao();
//		ArrayList<Product> items=c.getCartItems("3cdd71c3-ea93-4e56-a0c6-a800c9440f7b");
//		System.out.println(items);
//		
//	}


}

