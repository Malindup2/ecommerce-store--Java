package productPackage;

public class productModel {
	
	private int itemNo;
	private String  itemName;
	private String description;
	private String itemImage;
	private String price;
	private String quantity;
	
	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getItemImage() {
		return itemImage;
	}

	public void setItemImage(String itemImage) {
		this.itemImage = itemImage;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getQuantity() {
		return quantity;
	}

	public void setQuantity(String quantity) {
		this.quantity = quantity;
	}

	public productModel(int itemNo, String itemName, String description, String itemImage,String price, String quantity) {
		super();
		this.itemNo = itemNo;
		this.itemName = itemName;
		this.description = description;
		this.itemImage=itemImage;
		this.price = price;
		this.quantity = quantity;
	}

	
	
}
