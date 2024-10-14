<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Seller Dashboard for - Listing update </title>
<link rel="stylesheet" href="admin-styles.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<style>

	*,
*::before,
*::after{
    box-sizing: border-box;
}

body{
    margin: 0;
}

html{
    display: contents;
    font-family: 'Ubuntu', sans-serif;
    box-sizing: border-box;
    margin: 0 0 0 0 ;
    padding: 0;
    background-image: url('adminbg2.jpg');
    background-repeat: no-repeat;
    background-size: cover;
}

.admin-nav{
    background-color: rgb(0, 0, 67);
    padding: 4px;
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: space-between; /* Center horizontally */
}

h1,h3{
    color: white;
} 

.title{
    font-size: 2em;
    margin: 0.125em 0;
}

.logout{
    
    margin:10px 0;
    margin-right: 40px;
    background-color:  rgb(28, 28, 75);
    padding: 8px 12px;
    border-radius: 12px;
    font-size:16pt;
}

.buttons{
    display: flex;
}

.btn-primary.custom-green-btn {
        background-color: #28a745; /* Green color */
        border-color: #28a745;     /* Matching green border */
    }

.logo{
    margin-left: 30px;
}
	
</style>

<body>
<%
	String itemNo=request.getParameter("itemNo");
	String itemName=request.getParameter("itemName");
	String description=request.getParameter("description");
	String itemImage=request.getParameter("itemImage");
	String price=request.getParameter("price");
	String quantity=request.getParameter("quantity");

%>



<%
    // Check if "success" parameter is present
    String success = request.getParameter("success");
    if (success != null && success.equals("true")) {
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






	<nav>
		<div class="admin-nav">
			<div class="logo">
	            <img class="logo" src="images/logo.jpg" alt="profImage" height="40px">
	
			</div>
			<h1 class="title">Seller Dashboard</h1>
			<h2>Update item</h2>
			<div class="nav-links">
				<h3 class="logout">Logout</h3>
			</div>
		</div>
	</nav>
	
	
	<div class="container" style="width:700px; margin-top:80px;">

    <form class="add-items-form" action="updateServlet" method="post" id="items_form">
        <fieldset>
            <!-- Form Name -->
			<legend class="mt-5" style="font-family: 'Ubuntu'">Add Items</legend>
			
			<!-- Item Name input -->
			
			<div class="form-group">
			
				
			    <label for="itemNo">Item No</label>
			    <input type="text" name="itemNo" value="<%=itemNo%>" class="form-control" id="itemNo" readonly>
			    
			    <span id="itemNameError" class="text-danger"></span>
			</div>
			
			<div class="form-group">
			
				
			    <label for="itemName">Item Name</label>
			    <input type="text" name="itemName" value="<%=itemName%>" class="form-control" id="itemName" placeholder="Item Name">
			    <span id="itemNameError" class="text-danger"></span>
			</div>
			
			<!-- Description input -->
			<div class="form-group">
			    <label for="description">Description</label>
			    <input type="text" name="description" value="<%=description%>"  class="form-control" id="description" placeholder="Description">
			    <span id="descriptionError" class="text-danger"></span>
			</div>
			
			<!-- Image input -->
			<div class="form-group">
			    <label for="itemImage">Image</label>
			    <input type="file" name="itemImage" value="<%=itemImage%>" class="form-control-file" id="itemImage" accept="image/jpeg, image/png, image/jpg">
			</div>
			
			<!-- Add an empty image element to display the selected image -->
			<img id="selectedImage" src="#" alt="Selected Image" style="max-width: 300px; display: none;">
			
			<!-- JavaScript for itemImage validation -->
			<script>
			    // Get the file input element
			    var itemImageInput = document.getElementById("itemImage");
			
			    // Get the image element
			    var selectedImage = document.getElementById("selectedImage");
			
			    // Add an event listener to the file input element
			    itemImageInput.addEventListener("change", function () {
			        var file = itemImageInput.files[0];
			
			        if (file) {
			            // Create a FileReader object
			            var reader = new FileReader();
			
			            // Set an event listener to update the selected image when the file is loaded
			            reader.onload = function (e) {
			                selectedImage.src = e.target.result;
			                selectedImage.style.display = "block"; // Show the selected image
			            };
			
			            // Read the selected file as a data URL
			            reader.readAsDataURL(file);
			        } else {
			            // If no file is selected, hide the selected image
			            selectedImage.style.display = "none";
			        }
			    });
			</script>
			
			<!-- Price input -->
			<div class="form-group">
			    <label for "price">Price</label>
			    <input type="text" name="price" value="<%=price%>"class="form-control" id="price" placeholder="Price">
			    <span id="priceError" class="text-danger"></span>
			</div>
			
			<!-- JavaScript for form validation -->
			<script>
			    var form = document.querySelector(".add-items-form");
			    var itemNameInput = document.getElementById("itemName");
			    var descriptionInput = document.getElementById("description");
			    var priceInput = document.getElementById("price");
			
			    form.addEventListener("submit", function (event) {
			        var isValid = true;
			
			        // Clear previous error messages
			        document.getElementById("itemNameError").textContent = "";
			        document.getElementById("descriptionError").textContent = "";
			        document.getElementById("priceError").textContent = "";
			
			        // Validate item name
			        if (itemNameInput.value.trim() === "") {
			            isValid = false;
			            document.getElementById("itemNameError").textContent = "Item name is required";
			        }
			
			        // Validate description
			        if (descriptionInput.value.trim() === "") {
			            isValid = false;
			            document.getElementById("descriptionError").textContent = "Description is required";
			        }
			
			        // Validate price (numeric and positive)
			        var price = parseFloat(priceInput.value);
			        if (isNaN(price) || price <= 0) {
			            isValid = false;
			            document.getElementById("priceError").textContent = "Price must be a positive number";
			        }
			
			        if (!isValid) {
			            event.preventDefault(); // Prevent form submission if there are validation errors
			        }
			    });
			</script>
				
				<div class="form-group">
			    <label for "quantity">Quantity</label>
			    <input type="text" name="quantity" value="<%=quantity%>"class="form-control" id="price" placeholder="quantity">
			    <span id="priceError" class="text-danger"></span>
			</div>
	
            <!-- Button -->
            <div class="form-group">
                <button type="button" class="btn btn-secondary" onclick="history.back();">Back</button>
                <button type="submit" class="btn btn-success upload">Update</button>
            </div>
        </fieldset>
    </form>
</div>



</body>
</html>
















