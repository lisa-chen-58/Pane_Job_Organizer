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
		<h5>"If you fell down yesterday, stand up today." --H.G. Wells</h5>
		<p>
			<a href="/pane/dashboard">Dashboard</a> | 
			<a href="/pane/addjob">Add Job Opportunity</a> | 
			<a href="/">Sign Out</a>
		</p>			
		<h3>Welcome ${userLogin.firstName} ${userLogin.lastName}</h3>
	</div>
	
	<hr>
	
	
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
	    </ol>
	
	    <!-- Wrapper for slides -->
	    <div class="carousel-inner" role="listbox">
	
	      <div class="item active">
	        <img src="../views/img/2011-austria-tunnel-of-windows.jpg" alt="austria-tunnel-of-windows" width="460" height="345">
	        <div class="carousel-caption">
	          <h3>Austria 2011</h3>
	        </div>
	      </div>
	
	      <div class="item">
	        <img src="i../views/img/2011-st-andrews.jpg" alt="st-andrews" width="460" height="345">
	        <div class="carousel-caption">
	          <h3>St. Andrews 2011</h3>
          	</div>
	      </div>
	    
	      <div class="item">
	        <img src="../views/img/2011-austria-stained-glass.jpg" alt="2011-austria-stained-glass" width="460" height="345">
	        <div class="carousel-caption">
	          <h3>Flowers</h3>
	          <p>Beautiful flowers in Kolymbari, Crete.</p>
	        </div>
	      </div>
	
	      <div class="item">
	        <img src="img_flower2.jpg" alt="Flower" width="460" height="345">
	        <div class="carousel-caption">
	          <h3>Flowers</h3>
	          <p>Beautiful flowers in Kolymbari, Crete.</p>
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

	
	
	
	
	
	
	
	
	
	
	
	
	<!-- 
	<div class="d-flex justify-content-center align-items-center">
		<div class="content text-center polaroid">
			<img 
				src="../views/img/2011-austria-windowtunnel.jpg" 
				alt="austria-windowtunnel"			
				class="polaroid-sizing"			

			/>
			<div class="container">
				<p>Austria 2011 - LC</p>
			</div>
		</div>
		<div class="content text-center polaroid">
			<img 
				src="../views/img/2011-st-andrews.jpg" 
				alt="st-andrews"			
				class="polaroid-sizing"			

			/>
			<div class="container">
				<p>St. Andrews 2011 - LC</p>
			</div>
		</div>
		<div class="content text-center polaroid">
			<img 
				src="../views/img/2011-austria-stained-glass.jpg" 
				alt="austria-stained-glass"
				class="polaroid-sizing"			
			/>
			<div class="container">
				<p>Austria 2011 - LC</p>
			</div>
		</div>
	</div>
	<div class="d-flex justify-content-center align-items-center">
		<div class="content text-center polaroid">
			<img 
				src="../views/img/2011-ireland-cathedral.jpg" 
				alt="ireland-cathedral"			
				class="polaroid-sizing"			

			/>
			<div class="container">
				<p>Ireland 2011 - L.Chen</p>
			</div>
		</div>
		<div class="content text-center polaroid">
			<img 
				src="../views/img/2011-scotland-blair-castle.jpg" 
				alt="scotland-blair-castle"			
				class="polaroid-sizing"			

			/>
			<div class="container">
				<p>Blair Castle, Scotland 2011 - LC</p>
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
	<div class="d-flex justify-content-center align-items-center">
		<div class="content text-center polaroid">
			<img 
				src="../views/img/2011-austria-pastel.jpg" 
				alt="austria-pastel"
				class="polaroid-sizing"			

			/>
			<div class="container">
				<p>Austria 2011 - L.Chen</p>
			</div>
		</div>
		<div class="content text-center polaroid">
			<img 
				src="../views/img/2011-ireland-modern1.jpg" 
				alt="ireland-modern1"			
				class="polaroid-sizing"			

			/>
			<div class="container">
				<p>Ireland 2011 - LC</p>
			</div>
		</div>
	</div>
 -->
	
	
	
	
	
	
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