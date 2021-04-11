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
	
	
	
	<form action= "Create_auction.jsp" method = "GET">
		<input type="submit" value = "Create Auction">
	</form>
	
	<form action= "View_auctions.jsp" method = "GET">
		<input type="submit" value = "View Auctions">
	</form>
	
	
</body>
</html>