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
	rs1 = st1.executeQuery("");
	rs2 = st2.executeQuery("");
%>

<body>
	<h1>Welcome Admin!</h1>
	
	<h2>Here are the sales reports!</h2>
	<br>
	
	<table class ="center" style="width:90%">
		<tr>
		
		<% while (rs1.next() && rs2.next()) {%>
		<tr>
			<td><%= rs1.getString(total) %></td>
		</tr>

    <th>Earnings</th>
			<th>User</th>
		
		<% while (rs1.next() && rs2.next()) {%>
		<tr>
			<td><%= rs1.getString("earnings") %></td>
			<td><%= rs1.getString("user") %></td>
		</tr>
		<% } %>
	</table>
  <!DOCTYPE html>
<html>
<body>

	
	<table class ="center" style="width:90%">
		<tr>
            <h3>Earnings by End-User</h3>
        	<th>User</th>
			<th>Earnings</th>
			
		
		<tr>
      <% while (rs1.next() && rs2.next()) {%>
			<td><%= rs1.getString("user") %></td>
			<td><%= rs1.getString("earnings") %></td>
		</tr>
	
		<% while (rs1.next() && rs2.next()) {%>
		<tr>
			<td><%= rs1.getString("total") %></td>
		</tr>
        
		<% } %>
	</table>
  
    <table style="width:100%">
    <h3>Total Earnings</h3>
  <tr>
    <td>Jill</td>

  </tr>
</table>
</body>
</html>
