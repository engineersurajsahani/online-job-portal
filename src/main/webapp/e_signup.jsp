<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" type="text/css" href="css/e_signup.css">
      <style><%@include file="css/e_signup.css"%></style>
    <jsp:include page="navbar.jsp" />
    <title>Registration</title>
</head>
<body>
<form name=e_signup action=e_signup method=post>
    <div class="formcontainer">
       
            <h4>Registration</h4>
<br>
            <label>Full Name</label>
            <input type="text" name="fullname" required>

            <label>Username</label>
            <input type="text" name="username" required>

            <label>Email</label>
            <input type="email" name="email" required>
            
             <label>Gender</label>
            <select name="gender" required>
                <option value="">--Select--</option>
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="other">Other</option>
            </select>
            <label>Phone Number</label>
            <input type="tel" 
                   name="phone"
                   pattern="[0-9]{10}" 
                   maxlength="10" 
                   minlength="10"
                   required
                   placeholder="Enter 10-digit number">
                   
            <label>Password</label>
            <input type="password" name="password" required>

            <label>Confirm Password</label>
            <input type="password" name="cpassword" required>

            <div class="btn-group">
           <button type="submit" value="SUBMIT" name="submit">SUBMIT</button>
           <button type="submit" value="CANCLE" name="submit">CANCEL</button>

            </div>

            <p class="login-link">Already have an account? <a href="e_login.jsp">Log in</a></p>
        
    </div>
    </form>
</body>
</html>
