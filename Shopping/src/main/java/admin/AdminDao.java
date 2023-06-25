package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

import dbManager.DBManager;
import user.User;
import admin.Admin;
public class AdminDao {
	DBManager dbm;
	
	public AdminDao() {
		dbm=new DBManager();
	}
	public String generateAdminId() {
        return UUID.randomUUID().toString();
    }
	public String generateProductId() {
        return UUID.randomUUID().toString();
    }
	public boolean aregistration(String email,String adminPassword) {
		Connection con=dbm.getConnection();
		try {
			
			PreparedStatement st=con.prepareStatement("select userId,userName from theUser where email=?");
			st.setString(1, email);
			ResultSet rs=st.executeQuery();
			rs.next();
			String uid=rs.getString(1);
			//System.out.println(uid);
			String uname=rs.getString(2);
			//System.out.println(uname);
			PreparedStatement st1=con.prepareStatement("insert into theadmin values(?,?,?,?,?)");
			st1.setString(1, uid);
			st1.setString(2, uname);
			st1.setString(3, email);
			st1.setString(4, adminPassword);
			st1.setString(5, generateAdminId());
			int count=st1.executeUpdate();
			return true;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
		
	}
	
	
	public Admin login(String email,String password) {
		Connection con=dbm.getConnection();
		String pass=null,aid=null,aname=null;
		Admin a=new Admin();
		try {
			PreparedStatement st=con.prepareStatement("select AdminPassword,adminId,adminname from Theadmin where email=?");
			st.setString(1, email);
			ResultSet rs=st.executeQuery();
			rs.next();
			pass=rs.getString(1);
			aid=rs.getString(2);
			aname=rs.getString(3);
			a.setAdminName(aname);
			a.setAdminPassword(pass);
			a.setAdminId(aid);
			
			return a;
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return a;

	}
	public void add(String category_name,String productName,String description,String price,String inventory,String img) {
		Connection con=dbm.getConnection();	
		try {
			PreparedStatement st1=con.prepareStatement("select categoryId from category where category_name=?");
			st1.setString(1, category_name);
			ResultSet rs=st1.executeQuery();
			rs.next();
			String categoryId=rs.getString(1);
			PreparedStatement st=con.prepareStatement("insert into product values(?,?,?,?,?,?,?)");
			st.setString(1,generateProductId());
			st.setString(2,categoryId);
			st.setString(3, productName);
			st.setString(4, description);
			st.setString(5, price);
			st.setString(6, inventory);
			st.setString(7, img);
			int count=st.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void delete(String productId) {
		Connection con=dbm.getConnection();	
		try {
			PreparedStatement st=con.prepareStatement("delete from product where productId=?");
			st.setString(1, productId);
			int count=st.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	public void setInventory(String productId,String status) {
		Connection con=dbm.getConnection();
		try {
			PreparedStatement st=con.prepareStatement("update product set inventory=? where productId=?");
			st.setString(1, status);
			st.setString(2, productId);
			int count=st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
//	public static void main(String args[]) {
//		AdminDao a=new AdminDao();
//		Admin admin=a.login("madhurishuju@gmail.com", "vara@13");
//		System.out.println(admin.getAdminName());
//		
//	}

}
