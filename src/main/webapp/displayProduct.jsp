<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Daraz.lk</title>
</head>
<body>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Daraz.lk Seller Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 10px;
            padding: 70px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
            box-shadow: 0 4px 8px rgba(0.2, 0.2, 0.2, 0.2);
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 20px;
            text-align: center;
        }
        th {
            background-color: #ff7806;
            color: #fffbfb;
        }
        td img {
            width: 100px;
            height: 100px;
        }
        .btn {
            padding: 8px 12px;
            margin: 5px;
            cursor: pointer;
            border: none;
            color: white;
            border-radius: 4px;
            text-decoration: none;
            background-color: #4567ff;
        }
        .btn-update {
            background-color: #3744fb;
            text-decoration: none;
        }
        .btn-delete {
            background-color: #e64742;
            text-decoration: none;
        }
        .btn:hover {
            opacity: 0.9;
        }
        
        .btn-add {
    background-color: #28a745; /* Green color for add button */
    display: block; /* Display as a block to take full width */
    margin: 0 auto; /* Center the button */
    width: 100px; 
    align-items:flex-end;
    cursor: pointer;
    text-decoration: none;/* Set a specific width */
}
        
    </style>
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

    <h2>Seller Dash board</h2>
    <p></p>
    
    <a href="additem.jsp" class="btn btn-add">Add Product</a><p></p>
    <a href="itemDisplay" class="btn btn-add">>Home page</a> 
    
	<p></p>
	
    <table>
        <thead>
            <tr>
                <th>Item No</th>
                <th>Item Name</th>
                <th>Description</th>
                <th>Item Image</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Operator</th>
            </tr>
        </thead>
        <tbody>
            <!-- Sample data row from database (replace with dynamic data) -->
            <c:forEach var="product" items="${allproducts}">
            <tr>
                <td>${product.itemNo}</td>
                <td>${product.itemName}</td>
                <td>${product.description}</td>
                <td><img src="${pageContext.request.contextPath}/images/${product.itemImage}" alt="Uploaded Image" width="100" height="100" />
				</td>
                <td>${product.price}</td>
                <td>${product.quantity}</td>
                <td>
                  <a href="update.jsp?itemNo=${product.itemNo}&itemName=${product.itemName}&description=${product.description}&itemImage=${product.itemImage}&price=${product.price}&quantity=${product.quantity}" class="btn btn-edit">Update</a>
                  <a href="deleteServlet?itemNo=${product.itemNo}" class="btn btn-delete">Delete</a>
         
                </td>
            </tr>
            </c:forEach>
            <!-- Add more rows here dynamically from your back end/database -->
        </tbody>
    </table>
    
  
  
    
    <% 
    // "updateSuccess" attribute is set to true
    Boolean updateSuccess = (Boolean) request.getAttribute("updateSuccess");
    if (updateSuccess != null && updateSuccess) {
%>
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Success',
            text: 'Item updated successfully!',
            confirmButtonText: 'OK'
        });
    </script>
<% 
    }
%>






<%
//deletealert

 Boolean deleteSuccess = (Boolean) request.getAttribute("deleteSuccess");
    if (deleteSuccess != null && deleteSuccess) {
%>
    <script>
        Swal.fire({
            icon: 'success',
            title: 'Success',
            text: 'Item deleted successfully!',
            confirmButtonText: 'OK'
        });
    </script>
<%
    }
%>


</body>
</html>


</body>
</html>