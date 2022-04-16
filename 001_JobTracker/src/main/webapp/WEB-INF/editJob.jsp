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
<title>Add Job</title>

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
	<div>
		<div class="text-center top-container header" id="myHeader">
			<h1>Pane</h1>
			<h5>Add Job Pane for ${userLogin.firstName}</h5>
			<p>
				<a href="/pane/dashboard">Dashboard</a> | 
				<a href="/">Sign Out</a>
			</p>
		</div>
		<div class="p-4 mx-5 content">
			<form:form class="d-flex justify-content-center text-center" action="/pane/create" method="post" modelAttribute="addJob">
				<div>	
				     <!-- userId -->
  					<form:input type="hidden" value="${userLogin.id}" path="user"/>    
					
					<div class="form-group card-body">
						<form:label path="excitementLevel">
							Excitement Level 
							<br>
							(must be between 1 and 10):
							</form:label>
						<form:errors class="text-danger" path="excitementLevel"/>
						<form:input class="form-control" path="excitementLevel"/>
					</div>
					<div class="form-group card-body">
						<form:label path="company">Company:</form:label>
						<form:errors class="text-danger" path="company"/>
						<form:input class="form-control" path="company"/>
					</div>
					<div class="form-group card-body">
						<form:label path="contactInformation">Contact Information:</form:label>
						<form:errors class="text-danger" path="contactInformation"/>
					    <br>
					    <form:textarea class="form-control" path = "contactInformation" rows = "5" cols = "30" />
					</div>
					<div class="form-group card-body">
						<form:label path="dateApplied">Date Applied:</form:label>
						<form:errors class="text-danger" path="dateApplied"/>
						<form:input type="date" class="form-control" path="dateApplied"/>
					</div>
					<div class="form-group card-body">
						<form:label path="nextFollowUp">Next Follow Up:</form:label>
						<form:errors class="text-danger" path="nextFollowUp"/>
						<form:input type="date" class="form-control" path="nextFollowUp"/>
					</div>
					<div class="form-group card-body">
						<form:label path="stageOfInterview">Stage of Interview:</form:label>
						<form:errors class="text-danger" path="stageOfInterview"/>
						<form:input class="form-control" path="stageOfInterview"/>
					</div>
					<div class="form-group card-body">
						<form:label path="jobTitle">Job Title:</form:label>
						<form:errors class="text-danger" path="jobTitle"/>
						<form:input class="form-control" path="jobTitle"/>
					</div>
					<div class="form-group card-body">
						<form:label path="areaOfExpertise">Area of Expertise:</form:label>
						<form:errors class="text-danger" path="areaOfExpertise"/>
						<form:input class="form-control" path="areaOfExpertise"/>
					</div>
				</div>
				<div>
					<br>
					<div class="form-group card-body">
						<form:label path="salary">Salary:</form:label>
						<form:errors class="text-danger" path="salary"/>
						<form:input type="float" class="form-control" path="salary"/>
					</div>

					<div class="form-group card-body">					
						<form:label path="location">Location:</form:label>
						<form:errors class="text-danger" path="location"/>
						
						<%-- <form:input class="form-control" path="location"/> --%>
					
						<form:select class="form-control" path="location" name="location">
							<option value="unknown">Unknown</option>
							<option value="inPerson">In Person</option>
							<option value="hybrid">Hybrid</option>
							<option value="remote">Remote</option>
						</form:select>
						
					</div>
					<div class="form-group card-body">
						<form:label path="jobDescription">Job Description:</form:label>
						<form:errors class="text-danger" path="jobDescription"/>
						<br>
					    <form:textarea class="form-control" path = "jobDescription" rows = "5" cols = "30" />
					</div>
					<div class="form-group card-body">
						<form:label path="notableBenefits">Notable Benefits:</form:label>
						<form:errors class="text-danger" path="notableBenefits"/>
						<br>
					    <form:textarea class="form-control" path = "contactInformation" rows = "5" cols = "30" />
					</div>
					<div class="form-group card-body">
						<form:label path="additionalNotes">Additional Notes:</form:label>
						<form:errors class="text-danger" path="additionalNotes"/>
						<br>
					    <form:textarea class="form-control" path = "contactInformation" rows = "5" cols = "30" />
					</div>
					<input class="form-group btn btn-warning" type="submit" value="Submit"/>

				</div>

			</form:form>
		</div>
	</div>


</body>
</html>