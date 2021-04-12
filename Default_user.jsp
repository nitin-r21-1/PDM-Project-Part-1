<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Home</title>
</head>
<body>
	<h1>Welcome <%=session.getAttribute("user") %></h1>
	<h2>Sell a text or browse all our current auctions.</h2>
	
	
	
	<form action= "Sell_text.jsp" method = "GET">
	
	
		<label for="textType">What type of text would you like to sell?</label>

		<select name="textType" id="textType">
			  <option value="Book">Book</option>
			  <option value="Magazine">Magazine</option>
			  <option value="Reference">Reference</option>
		</select> 
	
		<input type="submit" value = "Sell text">
	</form>
	
	
	<br>
	
	
	<form action= "View_auctions.jsp" method = "GET">
		<input type="submit" value = "View Auctions">
	</form>
	
	
</body>
</html>