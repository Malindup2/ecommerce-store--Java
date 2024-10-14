package sellerPackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sellerPackage.userController;


@WebServlet("/userInsert")
public class userInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userName=request.getParameter("userName");
		String gmail=request.getParameter("gmail");
		String password=request.getParameter("password");
		
		
		
		boolean isTrue;
		
		isTrue=userController.insertData(0, userName, gmail, password);
		if(isTrue) {
			String alertMessage="Registration Successfull";
			response.getWriter().println("<script>alert('"+alertMessage+"');window.location.href='login.jsp';</script>");
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
	   
	    }

	}

}
