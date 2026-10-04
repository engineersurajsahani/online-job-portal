<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Apply Job</title>

    <link rel="stylesheet" type="text/css" href="css/e_apply_job.css">

    <jsp:include page="e_navbar.jsp"/>
</head>

<body>
<form name="e_apply_job" action="e_apply_job" method="post" >

    <div class="mydiv">
        <h1>Apply Job</h1>

        <label>Name</label>
        <input type="text"
               name="name"
               placeholder="Enter full name"
               pattern="[A-Za-z ]{3,}"
               title="Only letters allowed (min 3 characters)"
               required>

        <label>Mobile Number</label>
        <input type="tel"
               name="mobile"
               placeholder="Enter 10-digit mobile number"
               pattern="[0-9]{10}"
               maxlength="10"
               required>

        <label>Email</label>
        <input type="email"
               name="email"
               placeholder="Enter email address"
               required>

        <label>Job Title</label>
        <input type="text"
               name="jobtitle"
               placeholder="Enter job title"
               required>

        <label>Company</label>
        <input type="text"
               name="company"
               placeholder="Enter company name"
               required>

       
        <label>Resume</label>
        <input type="file"
               name="resume"
               accept=".pdf"
               required>
               
        <input type="submit" value="Apply Now"   name="submit">
        <input type="reset" value="Cancel"  name="submit">
    </div>

</form>
</body>
</html>
