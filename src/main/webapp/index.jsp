<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>JobFinder - Online Job Portal</title>
    <jsp:include page="navbar.jsp" />
    <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link rel="stylesheet" href="css/index.css">
</head>
<body>
<form name=index action=index method=post>
<div class="slider">
    <div class="slides">
        <img src="images/job1.jpg" alt="Image 1">
        <img src="images/display3.jpg" alt="Image 2">
        <img src="images/frount.jpg.jpg" alt="Image 3">
        <img src="images/frount1.jpg" alt="Image 4">
    </div>
</div>

<section id="companies" class="container section small">
    <h2>Top Companies Hiring</h2>
    <div class="companies-row">
        <img src="images/tcs.jpg" alt="company 1">
        <img src="images/reliance.jpg" alt="company 2">
        <img src="images/sbi.jpg" alt="company 3">
        <img src="images/icici.jpg" alt="company 1">
        <img src="images/teaching.jpg" alt="company 2">
        <img src="images/sugar1.jpg" alt="company 3">
    </div>
</section>
<footer class="site-footer" id="contact">
<div class="footer">
    <div class="container footer-inner">
    <div class="row">
            <div class="col-sm-4">
        <div class="col">
            <h2>About JobFinder</h2>
            <p>A job finder description is a clear, simple explanation of a job, written from the perspective of the employer, that details a job's duties, responsibilities, required skills, and necessary qualifications.</p>
        </div>
        </div>
        
            <div class="col-sm-4">
        <div class="col">
            <h2>Quick Links</h2>
            <ul>
                <li><a href="#jobs">Jobs</a></li>
                <li><a href="#companies">Companies</a></li>
                <li><a href="#privacy.jsp">Privacy</a></li>
            </ul>
        </div>
        </div>
        <div class="col-sm-4">
        <div class="col">
            <h2>Contact</h2>
            <p>support@jobfinder.example</p>
            <p>+91 98765 43210</p>
        </div>
    </div>
    </div>
    </div>
    <div class="copyright">
        © <%= java.time.Year.now() %> JobFinder — All rights reserved.
    </div>
    </div>
</footer>
<script>
const toggle = document.querySelector('.menu-toggle');
const nav = document.querySelector('.main-nav');
if(toggle && nav){
    toggle.addEventListener('click', ()=> nav.classList.toggle('open'));
}
</script>
</form>
</body>
</html>
