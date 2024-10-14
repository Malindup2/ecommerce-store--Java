package productPackage;

import java.io.File;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;


/**
 * Servlet implementation class insertServlet
 */
@MultipartConfig
@WebServlet("/insertServlet")
public class insertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uploadPath = getServletContext().getRealPath("images");
		Part filePart = request.getPart("itemImage"); // Retrieves <input type="file" name="itemImage">
        String fileName = filePart.getSubmittedFileName();
		
		

		// Create uploads directory if it doesn't exist
        File imageDir = new File(uploadPath);
        if (!imageDir.exists()) {
            imageDir.mkdirs(); 
        }
        
        filePart.write(uploadPath + File.separator + fileName);
		
		String itemName=request.getParameter("itemName");
		String description=request.getParameter("description");
		String price=request.getParameter("price");
		String quantity=request.getParameter("quantity");
		
		
		boolean isTrue;
		
		isTrue=productController.insertData( itemName, description, fileName, price, quantity);
		if(isTrue) {
			String alertMessage="Data insert Successfull";
			response.getWriter().println("<script>alert('"+alertMessage+"');window.location.href='getAllproduct';</script>");
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("wrong.jsp");
			dis2.forward(request, response);
		}
		
	}

}  
