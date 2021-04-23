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
	//rs1 = st1.executeQuery("select `textID`, `title`, `author`, `condition`, `textType` from `Text_Sells`");
	//rs2 = st2.executeQuery("select `price`, `current`, `closing` from `Auction_Held` where `closed` = False");
	rs1 = st1.executeQuery("select * from `Text_Sells`");
	rs2 = st2.executeQuery("select * from `Auction_Held` where `closed` = False");
%>

<body>
	<h1>Bid-a-Text!</h1>
	
	<h2>Ongoing Auctions</h2>
	<br>
	
	<table class ="center" style="width:90%">
		<tr>
			<th>Type</th>
			<th>Title</th>
			<th>Author</th>
			<th>Condition</th>
			<th>Price</th>
			<th>Current Bid</th>
			<th>Closing</th>
		</tr>
		
		<% while (rs1.next() && rs2.next()) {%>
		<tr>
			<td><%= rs1.getString("textType") %></td>
			<td> <a href=product_details.jsp?id=<%= rs1.getString("textID") %>> <%= rs1.getString("title") %> </a></td>
			<td><%= rs1.getString("author") %></td>
			<td><%= rs1.getString("condition") %></td>
			<td>$<%= rs2.getString("price") %></td>
			<td>$<%= rs2.getString("current") %></td>
			<td><%= rs2.getString("closing") %></td>
		</tr>
		<% } %>
	</table>
</body>
</html>