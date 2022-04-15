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
<title>Welcome!</title>

<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="../views/main.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script type="text/javascript" src="js/app.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="text-center">
		<h1>Pane</h1>
		<h5>"If you fell down yesterday, stand up today." --H.G. Wells</h5>
		<p>
			<a href="/pane/dashboard">Dashboard</a> | 
			<a href="/pane/addjob">Add Job Opportunity</a> | 
			<a href="/">Sign Out</a>
		</p>
		<div>
			<h3>Welcome ${userLogin.firstName} ${userLogin.lastName}</h3>
			<hr>
			<h1 class="d-flex flex-column align-items-center">Insert Image</h1>
		</div>
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