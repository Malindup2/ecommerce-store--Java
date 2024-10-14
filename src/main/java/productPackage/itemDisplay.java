package productPackage;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/itemDisplay")
public class itemDisplay extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
    	
    	
    	
    	
        List<productModel> allproducts = productController.getById(); 

        

        request.setAttribute("allproducts", allproducts);
        
        RequestDispatcher dispatcher=request.getRequestDispatcher("home.jsp");
        
        System.out.println("Forwarding to home.jsp");
        
		dispatcher.forward(request, response);
		
		 System.out.println("Forwarding to home.jsp");
		
            }
    
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request,response);
		}
    
}
