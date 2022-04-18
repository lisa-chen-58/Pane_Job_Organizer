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

<!-- for Bootstrap CSS specifically for the table -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>  

<!-- YOUR own local CSS -->
<link rel="stylesheet" href="../views/css/main.css"/>

<!-- For any Bootstrap that uses JS or jQuery-->
<script type="text/javascript" src="js/app.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>


</head>
<body>
<!-- 
.   .    .    .       ..--.     .    .--. 
|\  |   / \    \     / |   )   / \   |   )
| \ |  /___\    \   /  |--:   /___\  |--' 
|  \| /     \    \ /   |   ) /     \ |  \ 
'   ''       `    '    '--' '       `'   `
https://getbootstrap.com/docs/4.0/components/navbar/
 -->
 	<div class="blurred-box text-center " id="myHeader">
		<div class="p-1 blurred-box d-flex justify-content-between align-items-center">
			
			<p class="navbar-brand">
				<strong>Dashboard for ${userLogin.firstName} ${userLogin.lastName}</strong>
			</p>
			<p class="navbar-brand">
				<em>If you get a job making stationery, you won't be going anywhere.</em>
			</p>
		</div>	 
	 	<div class="mb-3 text-center">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
			  <a class="navbar-brand" href="/pane/welcome">PANE</a>
			  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
			    <span class="navbar-toggler-icon"></span>
			  </button>
			  <div class="collapse navbar-collapse" id="navbarNav">
			    <ul class="navbar-nav">
			      <li class="m-1 nav-item">
			        <a class="nav-link disabled" href="/pane/dashboard">DASHBOARD
		        	</a>
			      </li>
			      <li class="m-1 nav-item">
			        <a class="nav-link" href="/pane/addjob">ADD JOB PANE</a>
			      </li>
			      <li class="m-1 nav-item">
			        <a class="nav-link" href="/">SIGN OUT</a>
			      </li>
			    </ul>
			  </div>
			</nav>
		</div>
	</div>
	
	
	<div class="container">

			<table class="table table-hover">
				<thead>
					<tr>
						<th>Modify</th>
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
						<th>Delete</th>
					
					</tr>	
				</thead>
				<tbody>
					<!-- MAP THROUGH ALL ITERATIONS OF USERS' SAVED JOB PANES-->
					<c:forEach var="job" items="${allJobs}">
						<tr>
							<c:if test="${job.user.id==userLogin.id}">			
								<td>
									<a href="/pane/edit/${job.id}">Edit</a>
								</td>
								<td>${job.stageOfInterview}</td>
								<td>
									<fmt:formatDate value="${job.nextFollowUp}" type="date" pattern="MM/dd/yyyy"/>
								</td>
								<td>
									<a href="/pane/detail/${job.id}">
										${job.jobTitle}
									</a>
								</td>
								<td>${job.company}</td>
								<td>${job.areaOfExpertise}</td>
								<td>
									<fmt:formatNumber value = "${job.salary}" type = "currency"/>
								</td>
								<td>
									<fmt:formatDate value="${job.dateApplied}" type="date" pattern="MM/dd/yyyy"/>
								</td>
								<td>${job.excitementLevel}</td>
								<td>${job.location}</td>
								<td>${job.contactInformation}</td>
								<td>${job.jobDescription }</td>
								<td>${job.notableBenefits}</td>
								<td>${job.additionalNotes}</td>
								<td>
									<a href="/pane/delete/${job.id}">Delete</a>
								</td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
	
	</div>

<!-- 
.---.--.--.   ..---..--.      .   ..---.    .    .--. .---..--. 
|      |   \ / |    |   :     |   ||       / \   |   :|    |   )
|---   |    /  |--- |   |     |---||---   /___\  |   ||--- |--' 
|      |   / \ |    |   ;     |   ||     /     \ |   ;|    |  \ 
'    --'--'   ''---''--'      '   ''---''       `'--' '---''   `
 -->
 
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