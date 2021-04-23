<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Details</title>

<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
</style>
</head>

<body>
<%
    String auctionID = request.getParameter("id");
	session.setAttribute("auction", auctionID);
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs336project","root", "Swig2!6500");
	Statement st1 = con.createStatement();
	Statement st2 = con.createStatement();
	Statement st3 = con.createStatement();
	Statement st4 = con.createStatement();
	Statement st5 = con.createStatement();

	ResultSet rs1, rs2, rs3, rs4, rs5;
	rs1 = st1.executeQuery("select * from `Text_Sells` where textID = " + auctionID);
	rs1.next();
	
	String textType = rs1.getString("textType");
	if (textType.equals("Book")){
		rs2 = st2.executeQuery("select * from `Book` where textID = " + auctionID);
	}
	else if (textType.equals("Magazine")){
		rs2 = st2.executeQuery("select * from `Magazine` where textID = " + auctionID);
	}
	else{
		rs2 = st2.executeQuery("select * from `Reference` where textID = " + auctionID);
	}
	rs2.next();
%>
<h1> <%= rs1.getString("title") %> </h1>
<h2> <%= rs1.getString("author") %> </h2> <hr/> 

<p> Description: <%= rs1.getString("description") %> </p>

<h3> Product Details</h3> <hr/> 

<p> Publisher: <%= rs1.getString("publisher") %> </p>
<p> Copyright: <%= rs1.getString("copyright") %></p>
<p> Type: <%= rs1.getString("textType") %></p>

<%if (textType.equals("Book")){%>
	<p> ISBN: <%= rs2.getString("isbn") %> </p>
	<p> Genre: <%= rs2.getString("genre") %></p>
	<p> Cover: <%= rs2.getString("cover") %></p>
<%}else if (textType.equals("Magazine")){	%>
	<p> ISSN: <%= rs2.getString("issn") %> </p>
	<p> Volume: <%= rs2.getString("volume") %></p>
	<p> ISSUE: <%= rs2.getString("issue") %></p>

<%}else if (textType.equals("Reference")){%>
	<p> ISBN: <%= rs2.getString("isbn") %> </p>
	<p> Type: <%= rs2.getString("type") %></p>
	
<% } %>

<h3> Auction Info </h3>  <hr/>

<% rs3 = st3.executeQuery("select * from `Auction_Held` where auctionID = " + auctionID); rs3.next(); %>
<p> Initial Price: $ <%= rs3.getString("price") %> </p>
<p> Current Bid: $ <%= rs3.getString("current") %></p>
<p> Closing: <%= rs3.getString("closing") %> </p> <br/>

<form action= "place_bid.jsp" method = "Post"> 
	   Your Bid: <input type = "text" name= "value"/> <br/>
	   Automatic Options: <br/>
       Increment: <input type = "text" name= "increment"/> <br/>
       Spending Limit: <input type = "text" name= "upper_limit"/> <br/>
	<input type="submit" value = "Place Bid" /> 
</form>

<h3> Bids Placed </h3> 
<% rs4 = st4.executeQuery("select * from `Bid_PlacesIn` where auctionID = " + auctionID);%>

<table style="width:20%">
		<tr>
			<th>User</th>
			<th>Value</th>
			<th>Time</th>
		</tr>
		
		<% while (rs4.next()) {%>
		<tr>
			<!-- <td> <a href=product_details.jsp?id=<%= rs1.getString("textID") %>> <%= rs1.getString("title") %> </a></td> -->
			<%  String uid = rs4.getString("end_id");
				rs5 = st5.executeQuery("Select username from `User` where id = " + uid ); rs5.next();%>
			<td><%= rs5.getString("username") %></td>
			<td><%= rs4.getString("value") %></td>
			<td><%= rs4.getString("placement") %></td>
		</tr>
		<% } %>
	</table>

</body>
</html>