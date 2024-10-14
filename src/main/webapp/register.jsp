<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Daraz.lk Register</title>
    <style>
        /* Internal CSS for styling the form */
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .registration-container {
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            width: 400px;
        }

        .registration-container h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .registration-container label {
            font-weight: bold;
            margin-top: 10px;
            display: block;
        }

        .registration-container input[type="text"],
        .registration-container input[type="email"],
        .registration-container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0 20px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .registration-container input[type="submit"] {
            width: 100%;
            padding: 12px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .registration-container input[type="submit"]:hover {
            background-color: #45a049;
        }

        .registration-container p {
            text-align: center;
        }

        .registration-container .error {
            color: red;
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>

<body>

    <div class="registration-container">
        <h2>Register</h2>
        <!-- Registration form -->
        <form action="userInsert" method="POST">
            <label for="username">Username:</label>
            <input type="text" id="username" name="userName" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="gmail" required>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <input type="submit" value="Register">
        </form>

        <p>Already have an account? <a href="login.jsp">Login here</a></p>
    </div>

</body>
</html>
