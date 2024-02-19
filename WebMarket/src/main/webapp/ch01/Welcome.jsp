<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">"
<title>Insert title here</title>
</head>
<body>
	<nav class = "navbar navbar-expand navbar-dark bg-dark">
	<div class = "container">
	<div class = "navbar=header">
	<a class = "navbar-brand" href="./welcome.jsp">Home</a>
	</div>
	</div>
	</nav>

	<%! String greeting = "Welcome to WebShopping Mall";
		String tagline = "Welcome to Web Market!"; %>	
	<div class = "jumbotron">
	<div class = "container">
	<h1 class = "display-3">
	<%= greeting %>
	</h1>
	</div>
	</div>
	<main role = "main">
	<div class = "container">
	<div class = "text-center">
	<h3><%= tagline %></h3>
	</div>
	<hr>
	</div>
	</main>
	<footer class = "container">
	<p>&copy; WebMarket</p>
	</footer>
	
	
</body>
</html>