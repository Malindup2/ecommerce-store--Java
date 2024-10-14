package sellerPackage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import productPackage.DBconnection;

public class userController {
	
	//connect DB
		private static boolean isSuccess;
		private static Connection con = null;
		private static Statement stmt = null;
		private static ResultSet rs = null;
		
		//data insert function
		static boolean insertData(int userId,String userName,String gmail,String password) {
			
			 isSuccess=false;
			try {
				
				//DB connection call
				con=DBconnection.getConnection();
				stmt=con.createStatement();
				
				//SQl Query
				String sql="insert into user values(0,'"+userName+"','"+gmail+"','"+password+"')";
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
		
		///loginValidate
		public static List<userModel> loginvalidate (String userName,String gmail,String password){
			
			ArrayList<userModel> user=new ArrayList<>();
			
			try {
				con=DBconnection.getConnection();
				stmt=con.createStatement();
				String sql = "SELECT * FROM user WHERE userName = '" + userName + "' AND password = '" + password + "'";
				 rs=stmt.executeQuery(sql);
				
				if(rs.next()) {
					
					int userID=rs.getInt(1);
					String UserName=rs.getString(2);
					String  Gmail=rs.getString(3);
					String Password=rs.getString(4);
					
					userModel usr=new userModel (userID,UserName,Gmail,Password);
					user.add(usr);
					
				}
				
			}catch(Exception e) {
				
				e.printStackTrace();
			}
			
			return user;
		}

}
