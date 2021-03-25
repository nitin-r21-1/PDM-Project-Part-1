<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Create Account</title>
</head>
<body>
	<h1>Welcome to Bid-a-Text!</h1>
	
	<h2 style="color:blue;"> Create an account</h2>
	<br>
	
	<form action="Check_new_account.jsp" method="POST">
       First Name: <input type = "text" name= "first_name"/> <br/>
       Last Name: <input type = "text" name= "last_name"/> <br/>
       Email: <input type = "text" name= "email"/> <br/>
       Address: <input type = "text" name= "address"/> <br/>		
       Username: <input type="text" name="username"/> <br/>
       Password:<input type="password" name="password"/> <br/>
	   <input type="submit" value="Create Account"/>
	</form>
	
	<form action= "Login.jsp" method = "GET">
		<input type="submit" value = "Sign in">
	</form>
</body>
</html>