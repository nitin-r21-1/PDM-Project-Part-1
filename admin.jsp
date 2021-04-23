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
	bestbuyer = st1.executeQuery("SELECT END_ID FROM HISTORY H, AUCTION A,Where H.ROLE = BUYER,H.AUCTIONID = A.AUCTIONID");
	total = st2.executeQuery("SELECT sum(price) FROM earnings");
	bestseller = st3.executeQuery("");
	per_typebook = st4.executeQuery("SELECT sum(price) FROM book");
	per_typemagazine = st5.executeQuery("SELECT sum(price) FROM magazine");
	per_typereference = st2.executeQuery("SELECT sum(price) FROM reference");
	per_end_user = st2.executeQuery("SELECT sum(price) FROM earnings GROUP BY end_user");
	createrep_1 = st2.executeQuery("INSERT actid, first_name, last_name, email, address, username, password INTO ACCOUNT");
	createrep_2 = st2.executeQuery("INSERT rep_id, actid INTO Representative");
	rs10 = st2.executeQuery("");
	rs11 = st2.executeQuery("");
	rs12 = st2.executeQuery("");

<body>
	<h1>Welcome Admin!</h1>
	
	<h2>Here are the sales reports!</h2>
	<br>


	
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
    <td></td>

  </tr>
</table>
</body>
</html>
