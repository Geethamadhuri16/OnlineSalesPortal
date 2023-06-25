package product;

public class Product {
	private String productid;
	private String categoryid;
	private String productName;
	private String description;
	private String price;
	private String image;
	
	
	public String getImage() {
		return image;
	}
	@Override
	public String toString() {
		return "Product [productid=" + productid + ", categoryid=" + categoryid + ", productName=" + productName
				+ ", description=" + description + ", price=" + price + ", image=" + image + ", inventory=" + inventory
				+ "]";
	}
	public void setImage(String image) {
		this.image = image;
	}
	private String inventory;
	public String getProductid() {
		return productid;
	}
	public void setProductid(String productid) {
		this.productid = productid;
	}
	public String getCategoryid() {
		return categoryid;
	}
	public void setCategoryid(String categoryid) {
		this.categoryid = categoryid;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getInventory() {
		return inventory;
	}
	public void setInventory(String inventory) {
		this.inventory = inventory;
	}
	
	

}
