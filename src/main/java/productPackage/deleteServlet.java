package productPackage;

import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the itemNo from the query parameter
        String itemNo = request.getParameter("itemNo");

        if (itemNo != null && !itemNo.isEmpty()) {
            boolean isTrue = productController.deleteProduct(itemNo);
            if (isTrue) {
                String alertMessage = "Data Deletion Successful";
                // Respond with a success message and redirect
                response.getWriter().println("<script>alert('" + alertMessage + "');" +
                    "window.location.href='getAllproduct'</script>");
            } else {
                List<productModel> productDetails = productController.getById(itemNo);
                request.setAttribute("productDetails", productDetails);
                // Forward to error page
                RequestDispatcher dispatcher = request.getRequestDispatcher("wrong.jsp");
                dispatcher.forward(request, response);
            }
        } else {
            response.getWriter().println("<script>alert('Item number is missing');" +
                "window.location.href='getAllproduct'</script>");
        }
    }
    
   
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);  
    }
}
