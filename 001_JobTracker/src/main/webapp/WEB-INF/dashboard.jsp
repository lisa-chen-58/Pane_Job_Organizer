<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8" import="java.util.Date" %>

<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"  %>

<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true"  %>
    
<!-- Formatting (dates) --> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>

<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="../views/main.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script type="text/javascript" src="js/app.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

<!-- Script for cool header! -->
<script>
	window.onscroll = function() {myFunction()};
	
	var header = document.getElementById("myHeader");
	var sticky = header.offsetTop;
	
	function myFunction() {
	  if (window.pageYOffset > sticky) {
	    header.classList.add("sticky");
	  } else {
	    header.classList.remove("sticky");
	  }
	}
</script>


</head>
<body>
	<div class="text-center top-container header" id="myHeader">
		<h1>Pane</h1>
		<h5>Dashboard for ${userLogin.firstName}</h5>
		<p>
			<a href="/pane/addjob">Add Job Opportunity</a> |  
			<a href="/">Sign Out</a>
		</p>
	</div>
	<h1 class="text-center content">Insert Card thing</h1>	
	<hr>
	<table class="table table-striped">
		<thead>
			<tr>
				<th>Company</th>
				<th>Contact Information</th>
				<th>Date Applied</th>
				<th>Next Follow-Up</th>
				<th>Stage of Interview</th>
				<th>Job Title</th>
				<th>Area of Expertise</th>
				<th>Salary</th>
				<th>Location</th>
				<th>Salary</th>
				<th>Location</th>
				<th>Job Description</th>
			</tr>	
		</thead>
		<tbody>
			<!-- MAP THIS -->
			<c:forEach var="job" items="${allJobs}">
				<tr>
					<td>${job.company}</td>
					<td>${job.contactInformation}</td>
					<td>${job.dateApplied}</td>
					<td>${job.nextFollowUp}</td>
					<td>${job.stageOfInterview}</td>
					<td>${jobTitle}</td>
					<td>${job.areaOfExpertise}</td>
					<td>${job.salary}</td>
					<td>${job.location}</td>
					<td>${job.jobDescription }</td>
					<td>${notableBenefits}</td>
					<td>${additionalNotes}</td>
					<td>${excitementLevel}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<!-- Script for cool header! -->
	<script>
		window.onscroll = function() {myFunction()};
		
		var header = document.getElementById("myHeader");
		var sticky = header.offsetTop;
		
		function myFunction() {
		  if (window.pageYOffset > sticky) {
		    header.classList.add("sticky");
		  } else {
		    header.classList.remove("sticky");
		  }
		}
	</script>
</body>
</html>