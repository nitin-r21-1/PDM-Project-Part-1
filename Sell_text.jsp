<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Create Auction</title>
</head>
<body>

<%
    if ((session.getAttribute("texts").equals("Book"))) {
    
    
%>
<form action="Book_auction_info.jsp" method="POST">
       ISBN: <input type = "text" name= "isbn"/> <br/>
       Genre: <input type = "text" name= "genre"/> <br/>
       Cover: <input type = "text" name= "cover"/> <br/>
       Condition: <input type = "text" name= "condition"/> <br/>		
       Author: <input type="text" name="author"/> <br/>
       Title:<input type="text" name="title"/> <br/>
       Publisher: <input type = "text" name= "publisher"/> <br/>
       Copyright: <input type = "text" name= "copyright"/> <br/>
       Description: <input type = "text" name= "description"/> <br/>
	   <input type="submit" value="Create Book Auction"/>
	</form>
	
<%}
%>


	
	
	
</body>
</html>