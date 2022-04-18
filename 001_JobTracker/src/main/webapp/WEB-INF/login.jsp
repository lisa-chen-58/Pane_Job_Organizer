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
<title>Login and Register</title>

<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="../views/css/main.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script type="text/javascript" src="js/app.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>



</head>
<body>

	<div class="top-container header text-center" id="myHeader">
		<h1>Pane</h1>
		<hr>
		<h5>A job search can be the window to a new opportunity... or a pain</h5>
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
		<div class="yt-5 pt-5">
		
			<div class="content d-flex text-center justify-content-center">
	
				<div class="p-4 mx-5 blurred-box">
					<h1>Register</h1>
					<form:form action="/register" method="post" modelAttribute="newUser">
		
						<div class="form-group card-body">
							<form:label path="firstName">First Name:</form:label>
							<form:errors class="text-danger" path="firstName"/>
							<form:input class="form-control" path="firstName"/>
						</div>
						<div class="form-group card-body">
							<form:label path="lastName">Last Name:</form:label>
							<form:errors class="text-danger" path="lastName"/>
							<form:input class="form-control" path="lastName"/>
						</div>
		
						<div class="form-group card-body">
							<form:label path="username">Username:</form:label>
							<form:errors class="text-danger" path="username"/>
							<form:input class="form-control" path="username"/>
						</div>
						<div class="form-group card-body">
							<form:label path="email">Email:</form:label>
							<form:errors class="text-danger" path="email"/>
							<form:input class="form-control" path="email"/>
						</div>
						<div class="form-group card-body">
							<form:label path="password">Password:</form:label>
							<form:errors class="text-danger" path="password"/>
							<form:input type="password" class="form-control" path="password"/>
						</div>
						<div class="form-group card-body">
							<form:label path="confirm">Confirm Password:</form:label>
							<form:errors class="text-danger" path="confirm"/>
							<form:input type="password" class="form-control" path="confirm"/>
						</div>
						<input type="submit" value="Submit"/>
					
					</form:form>
				</div>
				<div class="p-4 mx-5 blurred-box">
					<h1>Login</h1>
					<form:form action="/login" method="post" modelAttribute="newLogin">
		
						<div class="form-group card-body">
							<form:label path="username">Username:</form:label>
							<form:errors class="text-danger" path="username"/>
							<form:input class="form-control" path="username"/>
						</div>
						<div class="form-group card-body">
							<form:label path="password">Password:</form:label>
							<form:errors class="text-danger" path="password"/>
							<form:input type="password" class="form-control" path="password"/>
						</div>
						<input type="submit" value="Submit"/>
					
					</form:form>
				</div>
		
			</div>
		</div>
</body>
</html>



