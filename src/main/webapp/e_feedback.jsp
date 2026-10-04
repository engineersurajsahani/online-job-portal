<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
     <link rel="stylesheet" type="text/css" href="css/e_feedback.css">
<style><%@include file="css/e_feedback.css"%></style>
<jsp:include page="e_navbar.jsp" />
    <title>Feedback</title>
    <link rel="stylesheet" type="text/css" href="e_feedback.css">
</head>
<body>
<form name=e_feedback action=e_feedback method=post>
  <div class="container">
    <h2>Online Job Portal Feedback</h2>

    
 
        <label>Name</label>
        <input type="text" name="name" placeholder="Enter your name" required>

        <label>Email</label>
        <input type="email" name="email" placeholder="Enter your email" required>

        <label>Rating</label>
        <select  name="rating"required>
            <option value="">-- Select --</option>
            <option>Excellent</option>
            <option>Good</option>
            <option>Average</option>
            <option>Poor</option>
        </select>

        <label>Feedback</label>
        <textarea rows="4" name="feedback" placeholder="Write your feedback" required></textarea>

       <button type="submit" value="submit" name="submit">SUBMIT</button>
  </div>
</form>
</body>
</html>
