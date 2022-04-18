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
<link rel="stylesheet" href="../views/css/main.css"/>

<!-- For any Bootstrap that uses JS or jQuery-->
<script type="text/javascript" src="js/app.js"></script>
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="text-center top-container header" id="myHeader">
		<h1>Pane</h1>
		<h4>"If you fell down yesterday, stand up today." --H.G. Wells</h4>
		<p>
			<a href="/pane/dashboard">Dashboard</a> | 
			<a href="/pane/addjob">Add Job Opportunity</a> | 
			<a href="/">Sign Out</a>
		</p>			
		<h3>Welcome ${userLogin.firstName} ${userLogin.lastName}</h3>
	</div>
	
	<hr>
	
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
	
	
	
	
	
	<!--  
 .--.    .    .--.  .--. .   . .-. .---..    
:       / \   |   ):    :|   |(   )|    |    
|      /___\  |--' |    ||   | `-. |--- |    
:     /     \ |  \ :    ;:   ;(   )|    |    
 `--''       `'   ` `--'  `-'  `-' '---''---'

 -->
	<div class="container">
	  <br>
	  <div id="myCarousel" class="carousel slide" data-ride="carousel">
	    <!-- Indicators -->
	    <ol class="carousel-indicators">
	      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
	      <li data-target="#myCarousel" data-slide-to="1"></li>
	      <li data-target="#myCarousel" data-slide-to="2"></li>
	      <li data-target="#myCarousel" data-slide-to="3"></li>
	      <li data-target="#myCarousel" data-slide-to="4"></li>
	    </ol>
	
	    <!-- Wrapper for slides -->
	    <div class="carousel-inner" role="listbox">
	
	      <div class="item active">
	        <img src="../views/img/2011-scotland-blair-castle.jpg" alt="ireland-cathedral" width="460" height="345">
	        <div class="carousel-caption">
	          <h3>Blair Castle, Ireland 2011 - L.Chen</h3>
	        </div>
	      </div>
	      
	      <div class="item">
	        <img src="../views/img/2011-austria-pastel.jpg" alt="austria-pastel" width="460" height="345">
	        <div class="carousel-caption">
	          <h3>Austria 2011 - L.Chen</h3>
	        </div>
	      </div>
	
	      <div class="item">
	        <img src="../views/img/2011-st-andrews.jpg" alt="st-andrews" width="460" height="345">
	        <div class="carousel-caption">
	          <h3>St. Andrews, Scotland 2011 - L.Chen</h3>
          	</div>
	      </div>
	    
	      <div class="item">
	        <img src="../views/img/2011-ireland-modern1.jpg" alt="2011-austria-stained-glass" width="460" height="345">
	        <div class="carousel-caption">
	          <h3>Ireland 2011 - L.Chen</h3>
	        </div>
	      </div>
	
	      <div class="item">
	        <img src="../views/img/2011-ireland-cathedral.jpg" alt="ireland-cathedral" width="460" height="345">
	        <div class="carousel-caption">
	          <h3>Ireland 2011 - L. Chen</h3>
	        </div>
	      </div>
	    </div>
	
	    <!-- Left and right controls -->
	    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
	      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
	      <span class="sr-only">Previous</span>
	    </a>
	    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
	      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
	      <span class="sr-only">Next</span>
	    </a>
	  </div>
	</div>

</body>
</html>