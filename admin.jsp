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
	Statement st3 = con.createStatement();
	Statement st4 = con.createStatement();
	Statement st5 = con.createStatement();
	Statement st6 = con.createStatement();
	Statement st7 = con.createStatement();
	Statement st8 = con.createStatement();
	Statement st9 = con.createStatement();
	Statement st10 = con.createStatement();
	ResultSet total, booksales, magsales, refsales, allsales, mostcommon, salesbyitem, bestbuyer;
	total = st2.executeQuery("select sum(price) from `Earnings`");
	booksales = st3.executeQuery("select sum(price) from `Earnings` where type='Book'");
	magsales = st4.executeQuery("select sum(price) from `Earnings` where type='Magazine'");
	refsales = st5.executeQuery("select sum(price) from `Earnings` where type='Reference'");
	allsales = st6.executeQuery("select end_id, sum(price) from `Earnings` group by end_id");
	mostcommon = st7.executeQuery("SELECT title, COUNT(*) FROM text_sells GROUP BY title ORDER BY COUNT(*) DESC LIMIT 5");
	salesbyitem = st8.executeQuery("select * from `Earnings` order by textID");
	bestbuyer = st9.executeQuery("SELECT winner, sum(price) from Auction_held group by winner");
	total.next();
	String totalprice = total.getString("sum(price)");
	booksales.next();
	String bookearnings = booksales.getString("sum(price)");
	magsales.next();
	String magearnings = magsales.getString("sum(price)");
	refsales.next();
	String refearnings = refsales.getString("sum(price)");
	%>
	<%--
	
	bestbuyer = st1.executeQuery("SELECT end_user from history WHERE role=buyer AND sum(price)=(select max(price) from history group by end_user)");
	bestseller = st3.executeQuery(" ");
	per_typebook = st2.executeQuery("SELECT sum(price) FROM Auction_held a, text_sells t, book b WHERE book b");
	per_typemagazine = st2.executeQuery("SELECT sum(price) FROM Auction_held a, text_sells t, magazine m WHERE magazine m");
	per_typereference = st2.executeQuery("SELECT sum(price) FROM Auction_held a, text_sells t, reference r WHERE reference");
	per_end_user = st2.executeQuery("SELECT end_id, sum(price) FROM earnings GROUP BY end_user");
	createrep_1 = st2.executeQuery("INSERT actid, first_name, last_name, email, address, username, password INTO ACCOUNT");
	createrep_2 = st2.executeQuery("INSERT rep_id, actid INTO Representative");
--%>
<body>
    <% %>
	<h1>Welcome Admin!</h1>
	
	<h2>Here are the sales reports!</h2>
	<br>


	
	<table class ="center" style="width:90%">
		<tr>
            <h3>Earnings by End-User</h3>
        	<th>User</th>
			<th>Earnings</th>
			<% while (allsales.next()) {%>
		<tr>
			<td><%= allsales.getString("end_id") %></td>
			<td><%= allsales.getString("sum(price)") %></td>
		</tr>
		<% } %>
		</tr>
	</table>
  
    <table style="width:100%">
    <h3>Total Earnings</h3>
  <tr>

			<p>$<%= totalprice %> </p>


  </tr>
</table>
<table style="width:100%">
    <h3>Earnings Per Item</h3>
  <tr>
       <th>ItemID</th>
		<th>Earnings</th>
	<% while (salesbyitem.next()) {%>
		<tr>
		    
			<td><%= salesbyitem.getString("textID") %></td>
			<td><%= salesbyitem.getString("price") %></td>
		</tr>
		<% } %>
		</tr>

  </tr>
</table>
<table style="width:100%">
    <h3>Earnings Per Item Type</h3>
  <tr>
		<tr>
			<h4>Book</h4>
			<p> $<%= bookearnings %></p>
			<h4>Magazine</h4>
			<p> $<%= magearnings %></p>
			<h4>Reference</h4>
			<p> $<%= refearnings %></p>
		</tr>

  </tr>
</table>
<table style="width:100%">
    <h3>Best Buyer</h3>
  <tr>
       <th>BuyerID</th>
		<th>Amount Spent</th>
	<% while (bestbuyer.next()) {%>
		<tr>
		    
			<td><%= bestbuyer.getString("winner") %></td>
			<td><%= bestbuyer.getString("sum(price)") %></td>
		</tr>
		<% } %>
		</tr>
</table>
<table style="width:100%">
    <h3>Best Selling Items</h3>
  <tr>
     <th>Title:</th><th>Number Sold:</th>
	<% while (mostcommon.next()) {%>
	    
		<tr>
			<td><%= mostcommon.getString("title") %></td>
			<td><%= mostcommon.getString("COUNT(*)") %></td>
		</tr>
		<% } %>
		</tr>

  </tr>
</table>
	<form action="Check_new_account.jsp" method="POST">
		<h3><label for="fname">Create Account (Customer Rep):</label></h3><br>
	   Id: <input type = "text" name= "uid"/> <br/>
       First Name: <input type = "text" name= "first_name"/> <br/>
       Last Name: <input type = "text" name= "last_name"/> <br/>
       Email: <input type = "text" name= "email"/> <br/>
       Address: <input type = "text" name= "address"/> <br/>		
       Username: <input type="text" name="username"/> <br/>
       Password:<input type="password" name="password"/> <br/>
	   <input type="submit" value="Create Account"/>
	</form>
	 </form> 
<form>





    
</form>



</body>
</html>
