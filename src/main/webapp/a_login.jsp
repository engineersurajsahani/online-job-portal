<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
        <jsp:include page="navbar.jsp" />    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/e_login.css">
    <title>Admin Login</title>
</head>
<body>
<form name=a_login action=a_login method=post>
    <div class="formcontainer">
        
            <h2> Admin Login</h2>

            <div>
                <label for="username">Username</label>
                <input id="username" name="username" type="text" placeholder="Enter username" required>
            </div>

            <div>
                <label for="password">Password</label>
                <input id="password" name="password" type="password" placeholder="Enter password" required>
            </div>
	<div class="button-container">
            <button class="primary-btn" type="submit" name="submit" value="Login">Login</button>
            
    </div>     
       
    </div>
    </form>
</body>
</html>
