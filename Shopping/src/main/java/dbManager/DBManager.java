package dbManager;
import java.sql.*;
public class DBManager {
	String url="jdbc:mysql://localhost:3306/OnlineSales";
	String uname="root";
	String pass="apcl123456@16";
	
	public Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, uname, pass);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}

}
