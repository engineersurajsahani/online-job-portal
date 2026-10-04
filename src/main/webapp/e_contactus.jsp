<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/contact.css">
<style><%@include file="css/e_contactus.css"%></style>
<jsp:include page="navbar.jsp" />
<title>CONTACT US</title>
</head>
<body>
<form name=e_contactus action=e_contactus method=post>
    <div class="mydiv">
        <h2>Contact Us</h2>


        <label >Name</label>
        <input type="text"  name="username" required >

        
        <label >Contact Number</label>
             <input type="tel" 
                   name="contact"
                   pattern="[0-9]{10}" 
                   maxlength="10" 
                   minlength="10"
                   required
                   placeholder="Enter 10-digit number">
                          
        <label >Email</label>
        <input type="email" name="email"required >
        
       <label >Message</label>
        <input type="text" name="Message" required >
        
        <button type="submit" value="SUBMIT"  name="submit">SUBMIT</button>
         <button type="submit" value="CANCLE"  name="submit">CANCEL</button>
    </div>
</form>
</body>
</html>