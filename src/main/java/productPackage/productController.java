package productPackage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class productController {
	
	//connect DB
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	//data insert function
	static boolean insertData(String itemName,String description,String itemImage,String price,String quantity) {
		
		 isSuccess=false;
		try {
			
			//DB connection call
			con=DBconnection.getConnection();
			stmt=con.createStatement();
			
			//SQl Query
			String sql="insert into product values(0,'"+itemName+"','"+description+"','"+itemImage+"','"+price+"','"+quantity+"')";
			int rs=stmt.executeUpdate(sql);
			if(rs>0) {
				isSuccess=true;
			}else {
				isSuccess=false;
			}
				
		}catch(Exception e) {
			 e.printStackTrace();
		}
		return isSuccess;
	}
	
	public static List<productModel> getById (String itemNO){
		int convertedID=Integer.parseInt(itemNO);
		
		ArrayList<productModel> product=new ArrayList<>();
		
		try {
			con=DBconnection.getConnection();
			String sql="select * from product where itemNo'"+convertedID+"'";
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				int itemNo=rs.getInt(1);
				String itemName=rs.getNString(2);
				String description=rs.getNString(3);
				String itemImage=rs.getNString(4);
				String price=rs.getNString(5);
				String quantity=rs.getNString(6);
				
				productModel pm = new productModel (itemNo,itemName,description,itemImage,price,quantity);
				product.add(pm);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return product;
	}
	
	
	//getAll
	public static List<productModel> getById (){
		
		ArrayList<productModel> products = new ArrayList<>();
		
		try {
			con=DBconnection.getConnection();
			String sql="select * from product";
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				int itemNo=rs.getInt(1);
				String itemName=rs.getNString(2);
				String description=rs.getNString(3);
				String itemImage=rs.getNString(4);
				String price=rs.getNString(5);
				String quantity=rs.getNString(6);
				
				productModel pm = new productModel(itemNo,itemName,description,itemImage,price,quantity);
				products.add(pm);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return products;
	}
	
	
	//update data
	public static boolean updateProduct(String itemNo,String itemName,String description,String itemImage,String price,String quantity) {
		
		try {
			
			con=DBconnection.getConnection();
			stmt=con.createStatement();
			
			String sql = "UPDATE product set itemName='"+itemName+"',description='"+description+"',itemImage='"+itemImage+"',price='"+price+"',quantity='"+quantity+"' WHERE itemNo='" +itemNo + "'";

	    
	        
			int rs=stmt.executeUpdate(sql);
			if(rs>0) {
				isSuccess=true;
			}else {
				isSuccess=false;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		
		return isSuccess;
	}
	
	
	
	//delete
		public static boolean deleteProduct(String itemNo) {
		int convID=Integer.parseInt(itemNo);
		
		try {
			
		con=DBconnection.getConnection();
		stmt=con.createStatement();
		String sql="delete from product where itemNo='"+convID+"'";
		int rs=stmt.executeUpdate(sql);
		
		if(rs>0) {
			
			isSuccess=true;
		}else {
			isSuccess=false;
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return isSuccess;
	}
		
		
		
	/*//retrevedata
		public static List<product> getAllItems() {
		    List<product> products = new ArrayList<>();
		    
		    try (Connection con = DBconnection.getConnection(); 
		         Statement stmt = con.createStatement();
		         ResultSet rs = stmt.executeQuery("SELECT * FROM product")) {

		        while (rs.next()) {
		            int itemNo = rs.getInt(1);
		            String itemName = rs.getString(2);
		            String description = rs.getString(3);
		            String itemImage = rs.getString(4);
		            String price = rs.getString(5);
		            String quantity = rs.getString(6);

		            product item = new product(itemNo, itemName, description, itemImage, price, quantity);
		            products.add(item);
		        }
		    } catch (Exception e) {
		        e.printStackTrace();
		    }

		    return products;
		}
*/
	
}
