<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Auctions</title>
		
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
table.center {
  margin-left: auto; 
  margin-right: auto;
}
</style>
</head>

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs336project","root", "root");
	Statement st1 = con.createStatement();
	Statement st2 = con.createStatement();
	ResultSet rs1,rs2;
	search_questions = st1.executeQuery("SELECT QUESTION,ANSWER FROM QANDA_ASKSANSWERS");
	search_by_keyword = st2.executeQuery("SELECT QUESTION,ANSWER FROM QANDA_ASKSANSWERS WHERE LIKE (_keyword)");
	ask_question = st3.executeQuery('INSERT QUESTION INTO QANDA_ASKSANSWERS');
%>

<body>
	<br>
	
	<table class ="center" style="width:90%">
		<tr>
  
    <table style="width:100%">
		<form action="/action_page.php">
			<label for="fname">Ask Question:</label><br>
			<input type="text" id="fname" name="fname" value="John"><br>
			<input type="submit" value="Submit">
		  </form> 
		  <form action="/action_page.php">
			<label for="fname">Search Question:</label><br>
			<input type="text" id="fname" name="fname" value="John"><br>
			<input type="submit" value="Submit">
		  </form> 
  </tr>
</table>
</body>
</html>



