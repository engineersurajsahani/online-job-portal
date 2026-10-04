<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/r_signup.css">
<style><%@include file="css/r_signup.css"%></style>
<title>RECRUITER SIGNUP</title>
</head>
<body>
<form name=r_signup action=r_signup method=post>
    <div class="mydiv">
        <h2>Recruiter Signup</h2>

        
        <label >Full Name</label>
        <input type="text"  name="fullname" required="required" >

        <label >Company Name</label>
        <input type="text"  name="companyname"  required="required">

        <label >Email</label>
        <input type="email" name="email" required="required" >

        
        <label >Password</label>
        <input type="password" name="password" required="required" >

      
        <label >Confirm Password</label>
        <input type="password"  name="cpassword" required="required" >

       
        <label >Gender</label>
        <select  name="gender" >
            <option value="">--Select--</option>
            <option value="male">Male</option>
            <option value="female">Female</option>
            <option value="other">Other</option>
        </select>

       
        <label >Phone Number</label>
        <input type="tel"  name="phone" required="required" >

        <div class="btn-group">
           <button type="submit" value="SUBMIT" name="submit">SUBMIT</button>
           <button type="submit" value="CANCLE" name="submit">CANCEL</button>
         </div>
          <p class="login-link">Already have an account? <a href="e_login.jsp">Log in</a></p>
    </div>
</form>

</body>
</html>