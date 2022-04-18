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
<title>Show Job</title>

<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />

<!-- for Boostrap CSS specifically for the table -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>  

<!-- YOUR own local CSS -->
<link rel="stylesheet" href="../views/css/main.css"/>

<!-- For any Bootstrap that uses JS or jQuery-->
<script type="text/javascript" src="js/app.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>


</head>
<body>
	<div class="text-center top-container header" id="myHeader">
		<h1>Pane</h1>
		<h5>Show Job Pane for ${userLogin.firstName}</h5>
		<p>
			<a href="/pane/welcome">Welcome Page</a> |  
			<a href="/pane/dashboard">Dashboard</a> |  
			<a href="/pane/addjob">Add Job Opportunity</a> |  
			<a href="/">Sign Out</a>
		</p>
	</div>
	<hr>
	<div class="content container">
	
		<c:choose>
			<c:when test="${showJob.user.id==userLogin.id}">
				<!-- TABLE -->
		
				<table class="table table-hover">
					<tbody>
						<tr>
							<th>Stage of Interview:</th>
							<td>${showJob.stageOfInterview}</td>
						</tr>
						<tr>
							<th>Next Follow Up:</th>
							<td>${showJob.nextFollowUp}</td>
						</tr>
						<tr>
							<th>Job Title:</th>
							<td>${showJob.jobTitle}</td>
						</tr>
						<tr>
							<th>Company:</th>
							<td>${showJob.company}</td>
						</tr>
						<tr>
							<th>Salary:</th>
							<td>${showJob.salary}</td>
						</tr>
						<tr>
							<th>Date Applied:</th>
							<td>${showJob.dateApplied}</td>
						</tr>				
						<tr>
							<th>Excitement Level:</th>
							<td>${showJob.excitementLevel}</td>
						</tr>				
						<tr>
							<th>Location:</th>
							<td>${showJob.location}</td>
						</tr>				
						<tr>
							<th>Contact Information:</th>
							<td>${showJob.contactInformation}</td>
						</tr>				
						<tr>
							<th>Job Description:</th>
							<td>${showJob.jobDescription}</td>
						</tr>				
						<tr>
							<th>Notable Benefits:</th>
							<td>${showJob.notableBenefits}</td>
						</tr>				
						<tr>
							<th>Additional Notes:</th>
							<td>${showJob.additionalNotes}</td>
						</tr>
					</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<h3>You are not authorized to view this page</h3>
			</c:otherwise>
		</c:choose>
			
			
	</div>
	
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