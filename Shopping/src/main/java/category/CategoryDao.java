package category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.UUID;

import dbManager.DBManager;
import user.User;
public class CategoryDao {
	DBManager dbm;
	public CategoryDao() {
		dbm=new DBManager();
		
	}
	public String generateCategoryId() {
        return UUID.randomUUID().toString();
    }
	public void setCategory(String Category_name,String desc) {
		Connection con=dbm.getConnection();
		try {
			PreparedStatement st=con.prepareStatement("insert into category values(?,?,?)");
			st.setString(1, generateCategoryId());
			st.setString(2, desc);
			st.setString(3, Category_name);
			int count=st.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
	public ArrayList<Category> getCategoryList(){
		Connection con=null;
		ArrayList<Category> category=new ArrayList<>();
		
		con=dbm.getConnection();
		try {
			PreparedStatement st=con.prepareStatement("select * from category");
			ResultSet rs=st.executeQuery();
			while(rs.next()) {
				Category c=new Category();
				c.setCategoryId(rs.getString(1));
				c.setCategory_Desc(rs.getString(2));
				c.setCategory_name(rs.getString(3));
				category.add(c);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return category;
		

	}
	
	
	
	

}
