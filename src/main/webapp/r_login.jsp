<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/e_login.css">
    <jsp:include page="navbar.jsp" />  
    <title>Recruiter Login</title>
</head>
<body>
<form name=r_login action=r_login method=post>
    <div class="formcontainer">
        
            <h2> Recruiter Login</h2>

            <div>
                <label for="username">Email</label>
                <input id="username" name="username" type="text" placeholder="Enter Email" required>
            </div>

            <div>
                <label for="password">Password</label>
                <input id="password" name="password" type="password" placeholder="Enter password" required>
            </div>
	<div class="button-container">
            <button class="primary-btn" type="submit" name="submit" value="Login">Login</button>
            <p>Don’t have an account ?<a href="r_signup.jsp">Register</a></p>
            
    </div>     
       
    </div>
    </form>
</body>
</html>
