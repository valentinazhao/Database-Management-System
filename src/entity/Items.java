package entity; 
//商品类,实体类 
public class Items { 
	private String id; // 商品编号 
	private String name; // 商品名称 
//	private String city; // 产地 
	private float price; // 价格 
	private int number; // 库存 
//	private String picture; // 商品图片 
	public String getId() { 
		return id; 
	} 
	public void setId(String id) { 
		this.id = id; 
	} 
	public String getName() { 
		return name; 
	} 
	public void setName(String name) { 
		this.name = name; 
		} 
//	public String getCity() { return city; } 
//	public void setCity(String city) { this.city = city; }
	public float getPrice() { 
		return price; 
	} 
	public void setPrice(float price) { 
		this.price = price; 
	} 
	public int getNumber() { 
		return number; 
	} 
	public void setNumber(int number) { 
		this.number = number; 
	} 
//	public String getPicture() { return picture; } 
//	public void setPicture(String picture) { this.picture = picture; } 
}