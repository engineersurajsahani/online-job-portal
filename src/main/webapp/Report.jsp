<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reports Dashboard</title>
 <jsp:include page="a_navbar.jsp"/>

<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="css/Report.css">
</head>
<body>

<form action="View_report.jsp" method="post">

<div class="report-container">

    <!-- Normal Reports Section -->
 
        <h2>Normal Reports</h2>   
           <div class="report-card">     
        <div class="btn-group">
      

      
            <input type="submit" name="submit" value="User List" class="report-btn">
            <input type="submit" name="submit" value="Recruiter List" class="report-btn">
            <input type="submit" name="submit" value="Job List" class="report-btn">
            <input type="submit" name="submit" value="Category List" class="report-btn">
           
            
            
        	
             <input type="submit" name="submit" value="Applay List" class="report-btn">
            <input type="submit" name="submit" value="Feedback List" class="report-btn" name="submit">
          
            
            </div>
        </div>
    </div>

    <!-- ID Wise Reports Section -->
   
        <div class="report-container">

    <!-- Normal Reports Section -->
 
        <h2>Id Wise Reports</h2> 
       
           <div class="report-card">   
         
        <div class="btn-group">
      
   			<input type="text" placeholder="Enter Id" name="id">    
      
            <input type="submit"  name="submit" value="ID User List" class="report-btn">
            <input type="submit"  name="submit" value="ID Recruiter List" class="report-btn">
            <input type="submit"  name="submit" value="ID Job List" class="report-btn">
            <input type="submit"  name="submit" value="ID Applay List" class="report-btn">
           
            
            </div>
        </div>
    </div>
       
        <!-- ID Wise Reports Section -->
   
        <div class="report-container">

    <!-- Normal Reports Section -->
 
        <h2>Date Reports</h2> 
       
           <div class="report-card">   
         
        <div class="btn-group">
      
   			<input type="text" placeholder="Enter date" name="date">    
      
            <input type="submit"  name="submit" value="Date Applay List" class="report-btn">
            <input type="submit"  name="submit" value="Date Feedback List" class="report-btn">

           
            
            </div>
        </div>
    </div>
       

</form>

</body>
</html>
