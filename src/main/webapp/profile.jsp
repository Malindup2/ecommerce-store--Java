<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="sellerPackage.userModel" %>  <!-- Import the userModel class -->
<%@ page session="true" %>  <!-- Ensure session handling is enabled -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Seller Dashboard</title>

    <!-- Add CSS for styling -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #4c4caf;
            padding: 20px;
            text-align: center;
            color: white;
        }
        .header h1 {
            margin: 0;
        }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            height: 80vh;
        }
        .buttons-container {
            margin-top: 30px;
            display: flex;
            justify-content: center;
            gap: 20px;
        }
        .dashboard-button {
            background-color: #ec911a;
            color: white;
            border: none;
            padding: 15px 30px;
            font-size: 18px;
            cursor: pointer;
            border-radius: 10px;
            transition: background-color 0.3s ease;
        }
        .dashboard-button:hover {
            background-color: #38c449;
        }
    </style>
</head>
<body>

<%  
    // Ensure session exists and the user is logged in
    userModel loggedInUser = (userModel) session.getAttribute("loggedInUser");
    if (loggedInUser == null) {  
        // Redirect to login page if user is not logged in
        response.sendRedirect("login.jsp");
        return;
    }  
%>

<!-- Display header with welcome message -->
<div class="header">
    <h1>Welcome, <%= loggedInUser.getUserName() %></h1>
</div>

<!-- SweetAlert Success Message -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    Swal.fire({
        icon: 'success',
        title: 'Success',
        text: 'Welcome, <%= loggedInUser.getUserName() %>!',
        confirmButtonText: 'OK'
    });
</script>

<!-- Main container for the buttons -->
<div class="container">
    <div class="buttons-container">
    	<img class="addproductLogo" src="images/addproduct.png" width="200px"
						alt="Logo">
        <button class="dashboard-button" onclick="window.location.href='additem.jsp'">Add Listing</button>
        <img class="addproductLogo" src="images/productmanagement.png" width="200px"
						alt="Logo">
		<button class="dashboard-button" onclick="window.location.href='getAllproduct'">Manage Listing</button>
        <img class="addproductLogo" src="images/user.png" width="200px"
						alt="Logo">
        <button class="dashboard-button">view Profile</button>
    </div>
</div>

</body>
</html>
