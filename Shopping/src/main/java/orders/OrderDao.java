package orders;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.UUID;

import dbManager.DBManager;
import product.Product;
public class OrderDao {

	DBManager dbm;
	public OrderDao() {
		dbm=new DBManager();
	}

	public String generateOrderId() {
		return UUID.randomUUID().toString();
	}

	public  LocalDate getCurrentDate() {
		return LocalDate.now();
	}


	public String orderStatus(int orderId,int pid,int uid) {
		Connection con=dbm.getConnection();
		PreparedStatement st;
		String status=null;
		try {
			st = con.prepareStatement("select orderStatus from orders where orderId=? and userId=? and productId=?");
			st.setInt(1, orderId);
			st.setInt(2, uid);
			st.setInt(3, pid);
			ResultSet rs=st.executeQuery();
			rs.next();
			status=rs.getString(1);
			return status;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return status;

	}
	public ArrayList<Product> getOrderListforUser(String uid){
		Connection con=null;
		ArrayList<Product> products=new ArrayList<>();
		con=dbm.getConnection();

		try {
			PreparedStatement st=con.prepareStatement("select productId from orders where userId=?");
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
		} 
		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;

	}
	public ArrayList<orders> getOrderList(){
		Connection con=null;
		ArrayList<orders> orders=new ArrayList<>();
		con=dbm.getConnection();

		try {
			PreparedStatement st=con.prepareStatement("select * from orders");
			ResultSet rs=st.executeQuery();
			while(rs.next()) {
				orders o=new orders();
				o.setOrderId(rs.getInt(1));
				o.setUserId(rs.getInt(2));
				o.setProductId(rs.getInt(3));
				o.setOrderStatus(rs.getString(4));
				o.setOrderprice(rs.getInt(5));
				o.setOrderdate(rs.getString(6));
				orders.add(o);

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orders;


	}
	public int orderTotal(int oid) {
		Connection con=dbm.getConnection();
		PreparedStatement st;
		int orderTotal=0;
		try {
			st=con.prepareStatement("select orderPrice from orders where orderId=?");
			st.setInt(1, oid);
			ResultSet rs=st.executeQuery();

			while(rs.next()) {
				orderTotal=orderTotal+rs.getInt(1);

			}
			return orderTotal;

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return orderTotal;

	}


	public void placeOrder(String oid,String uid,String pid) {
		Connection con=dbm.getConnection();
		PreparedStatement st,st1;
		try {
			st=con.prepareStatement("select price from product where productId=?");
			st.setString(1, pid);
			ResultSet rs=st.executeQuery();
			rs.next();
			String price=rs.getString(1);
			st1=con.prepareStatement("insert into orders (orderId,userId,productId,orderPrice,orderDate) values(?,?,?,?,?)");
			st1.setString(1, oid);
			st1.setString(2, uid);
			st1.setString(3, pid);
			st1.setString(4, price);
			st1.setString(5, getCurrentDate().toString());
			int count=st1.executeUpdate();


		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	public String cancelOrder(int orderId,int userId,int productId) {
		Connection con=dbm.getConnection();
		try {
			PreparedStatement st=con.prepareStatement("update orders set orderStatus=? where orderId=? and userId=? and productId=?");
			st.setString(1, "cancelled");
			st.setInt(2, orderId);
			st.setInt(3, userId);
			st.setInt(4, productId);
			int count=st.executeUpdate();
			return "cancelled";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}


	public String orderId(String uid,String pid) {
		Connection con=dbm.getConnection();
		String oid=null;
		try {
			PreparedStatement st=con.prepareStatement("select orderId from orders where userId=? and productId=? ");
			st.setString(1, uid);
			st.setString(2, pid);
			ResultSet rs=st.executeQuery();
			rs.next();
			oid=rs.getString(1);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return oid;

	}



//		public static void main(String args[]) {
//			OrderDao o=new OrderDao();
//			//o.placeOrder("shrfwhiewoi878978", "3cdd71c3-ea93-4e56-a0c6-a800c9440f7b", "3b80d04b-c56d-42c9-ad61-e0101526817f");
//			System.out.println(o.orderId("3cdd71c3-ea93-4e56-a0c6-a800c9440f7b", "3b80d04b-c56d-42c9-ad61-e0101526817f"));
//		}

}
