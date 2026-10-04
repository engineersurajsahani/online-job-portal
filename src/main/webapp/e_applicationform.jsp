<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
   <jsp:include page="e_navbar.jsp"/>
    <title>Job Application Form</title>
    <link rel="stylesheet" type="text/css" href="css/e_applicationform.css">
</head>
<body>
<div class="container">
    <h2>Job Application Form</h2>
    <form name="e_applicationform" action="e_applicationform" method="post">
        <label>Full Name</label>
        <input type="text"
               name="fullname"
               placeholder="Enter full name"
               pattern="[A-Za-z ]{3,}"
               title="Only letters allowed (minimum 3 characters)"
               required>
        <label>Email</label>
        <input type="email"
               name="email"
               placeholder="Enter email address"
               required>
        <label>Mobile Number</label>
        <input type="tel"
               name="mobile"
               placeholder="Enter 10-digit mobile number"
               pattern="[0-9]{10}"
               maxlength="10"
               required>
        <label>Qualification</label>
        <input type="text"
               name="qualification"
               placeholder="Enter qualification"
               required>
        <label>Experience</label>
        <select name="experience" required>
            <option value="">-- Select --</option>
            <option>Fresher</option>
            <option>1-2 Years</option>
            <option>3-5 Years</option>
            <option>More than 5 Years</option>
        </select> 
        <label>Skills</label>
        <textarea name="skills"
                  rows="3"
                  placeholder="Enter your skills"
                  required></textarea>
        <label>Expected Salary</label>
        <input type="text"
               name="salary"
               placeholder="e.g. 4 LPA">
        <div class="btn-group">
            <button type="submit" class="btn apply" name="submit" value="Apply">Apply</button>
            <button type="reset" class="btn cancel" name="submit" value="Apply">Cancel</button>
        </div>
    </form>
</div>
</body>
</html>
