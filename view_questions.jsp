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
	rs1 = st1.executeQuery("select * from `QandA_AsksAnswers`");
%>

<body>
	<h1>Here is the Q/A section!</h1>
	<br>
	
	<table class ="center" style="width:90%">
		<tr>
			<th>Qid</th>
			<th>Question</th>
			<th>Answer</th>
		</tr>
		
		<% while (rs1.next()) {%>
		<tr>
			<td><%= rs1.getString("QID") %></td>
			<td><%= rs1.getString("Question") %></td>
			<td><%= rs1.getString("Answer") %></td>
		</tr>
		<% } con.close();%>
	</table>
</body>
</html>
