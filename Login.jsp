<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Login</title>
</head>
<body>
	<h1>Welcome to Bid-a-Text!</h1>
	
	<h2 style="color:blue;"> Login to your account</h2>
	<br>
	
	<form action="Check_login_details.jsp" method="POST">
       Username: <input type="text" name="username"/> <br/>
       Password:<input type="password" name="password"/> <br/>
	   <input type="submit" value="Sign in"/>
	</form>
	
	<form action= "Create_account.jsp" method = "GET">
		<input type="submit" value = "Create Account">
	</form>
</body>
</html>