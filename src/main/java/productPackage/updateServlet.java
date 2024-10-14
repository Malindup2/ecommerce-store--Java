package productPackage;

import java.io.IOException;
import java.util.*;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/updateServlet")
public class updateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String itemNo=request.getParameter("itemNo");
		String itemName=request.getParameter("itemName");
		String description=request.getParameter("description");
		String itemImage=request.getParameter("itemImage");
		String price=request.getParameter("price");
		String quantity=request.getParameter("quantity");
		
		boolean isTrue;
		
		 int ItemNo = Integer.parseInt(itemNo); 
		 
		isTrue = productController.updateProduct(itemNo,itemName,description,itemImage,price,quantity);
		
		if(isTrue) {
			
			List<productModel> productDetails=productController.getById(itemNo);
			request.setAttribute("productDetails", productDetails);
			
			//String alertMessage="Data Updated Successfully";
			
			response.sendRedirect("getAllproduct?success=true");
			//response.getWriter().println("<script>alert('"+alertMessage+"');window.location.href='getAllproduct';</script>");
			
		}else {
			
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			
			dis2.forward(request, response);
		}
	}

}
