<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Customer Page</title>
</head>
<body>
	<h1>Welcome, create a auction or view all current auctions</h1>
	
	
	
	<form action= "Sell_Text.jsp" method = "GET">
	
	
	<label for="texts">Choose a text:</label>

	<select name="texts" id="texts">
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