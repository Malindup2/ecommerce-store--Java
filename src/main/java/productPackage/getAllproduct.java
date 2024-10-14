package productPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/getAllproduct")
public class getAllproduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List <productModel> allproducts= productController.getById();
		request.setAttribute("allproducts", allproducts);
		
		
        String success = request.getParameter("success");
        String delete = request.getParameter("delete");

        if (success != null) {
            request.setAttribute("updateSuccess", true); // Pass the success flag to JSP
        }
        if (delete != null) {
            request.setAttribute("deleteSuccess", true); // Pass the delete flag to JSP
        }
		
		
		
		RequestDispatcher dispatcher=request.getRequestDispatcher("displayProduct.jsp");
		
		dispatcher.forward(request, response);
		
		

	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request,response);
	}

}
