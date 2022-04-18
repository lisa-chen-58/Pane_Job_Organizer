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
		<h5>Dashboard for ${userLogin.firstName}</h5>
		<p>
			<a href="/pane/welcome">Welcome Page</a> |  
			<a href="/pane/addjob">Add Job Opportunity</a> |  
			<a href="/">Sign Out</a>
		</p>
	</div>
	<hr>
	<div class="container">

			<table class="table table-hover">
				<thead>
					<tr>
						<th>Adjustments</th>
						<th>Stage of Interview</th>
						<th>Next Follow Up</th>
						<th>Job Title</th>
						<th>Company</th>
						<th>Area of Expertise</th>
						<th>Salary</th>
						<th>Date Applied</th>
						<th>Excitement Level</th>
						<th>Location</th>
						<th>Contact Information</th>
						<th>Job Description</th>
						<th>Notable Benefits</th>
						<th>Additional Notes</th>
					
					</tr>	
				</thead>
				<tbody>
					<!-- MAP THROUGH ALL ITERATIONS OF USERS' SAVED JOB PANES-->
					<c:forEach var="job" items="${allJobs}">
						<tr>
							<c:if test="${job.user.id==userLogin.id}">			
								<td>
									<a href="/pane/edit/${job.id}">Edit</a>
									<a href="/pane/delete/${job.id}">Delete</a>
								</td>
								<td>${job.stageOfInterview}</td>
								<td>${job.nextFollowUp}</td>
								<td>
									<a href="/pane/detail/${job.id}">
										${job.jobTitle}
									</a>
								</td>
								<td>${job.company}</td>
								<td>${job.areaOfExpertise}</td>
								<td>${job.salary}</td>
								<td>${job.dateApplied}</td>
								<td>${job.excitementLevel}</td>
								<td>${job.location}</td>
								<td>${job.contactInformation}</td>
								<td>${job.jobDescription }</td>
								<td>${job.notableBenefits}</td>
								<td>${job.additionalNotes}</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	
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
	
	<div class="d-flex justify-content-center align-items-center">
			
			<div class="content text-center polaroid">
				<img 
					src="../views/img/2011-austria-tunnel-of-windows.jpg" 
					alt="austria-tunnel-of-windows"			
					class="polaroid-sizing"			
	
				/>
				<div class="container">
					<p>Austria 2011 - LC</p>
				</div>
			</div>
			<div class="content text-center polaroid">
				<img 
					src="../views/img/2011-ireland-modern2.jpg" 
					alt="ireland-modern2"
					class="polaroid-sizing"			
				/>
				<div class="container">
					<p>Ireland 2011 - LC</p>
				</div>
			</div>
		</div>
</body>
</html>