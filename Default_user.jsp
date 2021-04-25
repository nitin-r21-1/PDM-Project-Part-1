<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Home</title>
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
</style>
</head>
<body>
	<h1>Welcome to Bid-A-Text, <%=session.getAttribute("user") %>!</h1>
	<a href="Logout.jsp">Log out</a>
	<h2>Would you like to...</h2>
	
	
	<h2>Sell a Text!</h2>
	<form action= "Sell_text.jsp" method = "GET">
	
	
		<label for="textType">What type of text would you like to sell?</label>

		<select name="textType" id="textType">
  			<option value="Book">Book</option>
  			<option value="Magazine">Magazine</option>
  			<option value="Reference">Reference</option>
		</select> 
	
		<input type="submit" value = "Sell text">
	</form>
	
	<br>
	<h2>Bid a Text!</h2>
	<p> View all ongoing auctions. </p>
	<form action= "view_auctions.jsp" method = "GET">
		<input type="submit" value = "View Auctions">
	</form>

	<br>
	
	<form action= "search_auctions.jsp" method = "GET">
		<input type="submit" value = "Search Auctions">
	</form>
	
	<h2>See your alerts!</h2> 
<% 
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs336project","root", "root");
	Statement st1 = con.createStatement();
	Statement st2 = con.createStatement();
	
	ResultSet rs1,rs2;
	rs1 = st1.executeQuery("select * from `Sends_Alert` where `end_id` = " + (Integer) session.getAttribute("userid"));
	while (rs1.next()){ %>
	
	<p>~ <%= rs1.getString("message") %> </p>
	 
<%  } %>
	
	<h2>Your Questions, Our Answers</h2>	
<%
	rs2 = st2.executeQuery("select * from `QandA_AsksAnswers` where `end_id` = " + (Integer) session.getAttribute("userid"));
%>

<table style="width:20%">
<tr>
	<th>Question</th>
	<th>Answer</th>
</tr>

<% while (rs2.next()) {%>
<tr>
	<td><%= rs2.getString("question") %></td>
	<td><%= rs2.getString("answer") %></td>
</tr>
<% } %>
</table>

<form action= "Check_question.jsp" method = "Post"> 
	   Question: <input type = "text" name= "question"/> <br/>
	<input type="submit" value = "Ask" /> 
</form>

</body>
</html>