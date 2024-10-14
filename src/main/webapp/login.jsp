<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Seller Login - Daraz.lk</title>
    <style>
        /* Internal CSS for styling the login form */
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-container {
            background-color: white;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            width: 350px;
        }

        .login-container h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .login-container label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .login-container input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #4b6af7;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .login-container input[type="submit"]:hover {
            background-color: #fa9d32;
        }

        .login-container .forgot-password {
            text-align: center;
            margin-top: 10px;
        }

        .login-container .forgot-password a {
            color: #ff1111;
            text-decoration: none;
        }

        .login-container .forgot-password a:hover {
            text-decoration: underline;
        }
    </style>
    
    
    <!-- Include SweetAlert2 from CDN -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

    <!-- Login Form -->
    <div class="login-container">
        <h2>Login</h2>
        <form action="loginServlet" method="POST">
            <label for="username">Username:</label>
            <input type="text" id="username" name="userName" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <input type="submit" value="Login">
        </form>

        <div class="forgot-password">
            <p>Need to sign in? <a href="register.jsp">Sign In</a></p>
        </div>
    </div>
    
    
    
    <!-- SweetAlert2 for login error -->
   <%  
    String loginError = (String) request.getAttribute("loginError");  
    if (loginError != null) {  
%>
    <script>
        Swal.fire({
            icon: 'error',
            title: 'Oops...',
            text: '<%= loginError %>',
            confirmButtonColor: '#30d681',
            confirmButtonText: 'Try Again'
        });
    </script>
<%  
    }  
%>
    
    
    

</body>
</html>
