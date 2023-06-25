package user;
import java.sql.Connection;
import java.util.UUID;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Cart.CartDao;
import dbManager.DBManager;
public class UserDao {
	DBManager dbm;
	public UserDao() {
		dbm=new DBManager();
	}
	public String generateUserId() {
        return UUID.randomUUID().toString();
    }
	 public String generateCartId() {
	        return UUID.randomUUID().toString();
	    }
	
	public boolean registration(String uname,String mobilenum,String pass,String add,String email) {
		Connection con=dbm.getConnection();
		PreparedStatement st1;
		String theemail=null;
		try {
			st1 = con.prepareStatement("select email from TheUser where email=?");
			st1.setString(1, email);
			ResultSet rs=st1.executeQuery();	
			
			if(rs.next()!=false) {
			theemail=rs.getString(1);
			}
		}

		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}



		if(theemail==null) {



			try {
				String cid=generateCartId();
				String uid=generateUserId();
//				PreparedStatement st2=con.prepareStatement("insert into cart (cartId,userId) values(?,?)");
//				st2.setString(1,cid );
//				st2.setString(2, uid);
//				int count2=st2.executeUpdate();
				PreparedStatement st=con.prepareStatement("insert into TheUser values(?,?,?,?,?,?,?)");
				st.setString(1,uid);
				st.setString(2,uname);
				st.setString(3, mobilenum);
				st.setString(4, pass);
				st.setString(5, add);
				st.setString(6, email);
				st.setString(7, cid);
				
				int count=st.executeUpdate();	
				System.out.println(count+" row/s effected");
				return true;
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			

		}
		return false;


	}


	public User login(String email,String password) {
		Connection con=dbm.getConnection();
		String pass=null,uid=null,uname=null;
		User u=new User();
		try {
			PreparedStatement st=con.prepareStatement("select UserPassword,userId,username from TheUser where email=?");
			st.setString(1, email);
			ResultSet rs=st.executeQuery();
			rs.next();
			pass=rs.getString(1);
			uid=rs.getString(2);
			uname=rs.getString(3);
			u.setPassword(pass);
			u.setUserid(uid);
			u.setName(uname);
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return u;

	}
	
	
	public ArrayList<User> getUserList(){
		Connection con=null;
		ArrayList<User> users=new ArrayList<>();
		
		con=dbm.getConnection();
		try {
			PreparedStatement st=con.prepareStatement("select * from TheUser");
			ResultSet rs=st.executeQuery();
			while(rs.next()) {
				User u=new User();
				u.setUserid(rs.getString(1));
				u.setName(rs.getString(2));
				u.setMobileNumber(rs.getString(3));
				u.setPassword(rs.getString(4));
				u.setAddress(rs.getString(5));
				u.setEmail(rs.getString(6));
				u.setCartId(rs.getString(7));
				users.add(u);
			}
			return users;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return users;

	}
	
	public int increaseQunatity(int oid,int uid,int pid) {
		Connection con=dbm.getConnection();
		try {
			PreparedStatement st=con.prepareStatement("select quantity from orders where orderId=? and userId=? and productId=?");
			st.setInt(1, oid);
			st.setInt(2, uid);
			st.setInt(3, pid);
			ResultSet rs=st.executeQuery();
			rs.next();
			int quantity=rs.getInt(1);
			int newQuantity=quantity+1;
			PreparedStatement st1=con.prepareStatement("update orders set quantity=? where orderId=? and userId=? and productId=? ");
			st1.setInt(1, newQuantity);
			st1.setInt(2, oid);
			st1.setInt(3, uid);
			st1.setInt(4, pid);
			int count=st1.executeUpdate();
			return newQuantity;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
		
		
	}

//		public static void main(String args[]) {
//			UserDao u=new UserDao();
//			boolean bool=u.registration("varalaxmi","9247771270" , "geethu@10", "gavarapalem", "madhurishuju@gmail.com");
//			System.out.println(bool);
//
//		}





}
