package sellerPackage;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("userName");  
        String password = request.getParameter("password");

        try {
            List<userModel> userlogin = userController.loginvalidate(userName, userName, password);
            request.setAttribute("userlogin", userlogin);

            if (userlogin != null && !userlogin.isEmpty()) {
                // Set session attributes to maintain logged-in state
                HttpSession session = request.getSession();
                session.setAttribute("loggedInUser", userlogin.get(0)); 
                
                // Redirect to profile.jsp after login
                response.sendRedirect("profile.jsp");
            
           
            } else {
                // Failed login, forward to the login page with error
                request.setAttribute("loginError", "Login failed, please try again!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

