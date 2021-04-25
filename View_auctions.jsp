<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
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
	Statement st11 = con.createStatement();
	Statement st12 = con.createStatement();
	Statement st13 = con.createStatement();
	
	ResultSet rs1,rs2, rs3, rs4, rs5, rs6, rs7, rs8, rs9, rs10;
	
	rs3 = st3.executeQuery("select * from `Auction_Held` where `closed` = False");
	
	String auctionID, closingDate;
	
	while(rs3.next())
	{
		
		 auctionID = rs3.getString("auctionID");
		
		 closingDate = rs3.getString("closing");
		
		
		SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date1 = formatDate.parse(closingDate);
		Date currDate = new Date();  
		if(date1.compareTo(currDate) < 0)
		{
			st4.executeUpdate("update `Auction_Held` set `closed` = true where auctionID = " + auctionID);
			
			rs9 = st12.executeQuery("select end_id from `Text_Sells` where `textID` = " + auctionID);
			rs9.next();
			String sellerID = rs9.getString("end_id");
			
			rs7 = st9.executeQuery("select `title`, `textType` from `Text_Sells` where `textID` = " + auctionID);
				rs7.next();
				String textType = rs7.getString("textType");
				String title = rs7.getString("title");
		
			//set winner here? auction is closed, find max bid/current if current is max
			rs10 = st13.executeQuery("select count(*) from `Bid_PlacesIn` where `auctionID` = " + auctionID);
			rs10.next();
			int bidCount = Integer.parseInt(rs10.getString("count(*)"));
			
			rs5 = st5.executeQuery("select `end_id`, max(value) from `Bid_PlacesIn` where `auctionID` = " + auctionID );
			rs6 = st6.executeQuery("select `minimum` from `Auction_Held` where `auctionID` = " + auctionID );
			if (rs5.next() && rs6.next() && (bidCount > 0) ){
				int maxValue = Integer.parseInt(rs5.getString("max(value)"));
				int min = Integer.parseInt(rs6.getString("minimum"));
				String endID = rs5.getString("end_id");
				rs8 = st11.executeQuery("select `username` from `User` where id = " + endID);
				rs8.next();
				String username = rs8.getString("username");
				if(maxValue>min)
				{
					st7.executeUpdate("update `Auction_Held` set winner = " + endID + " where `auctionID` = " + auctionID);
					st8.executeUpdate("insert into `Earnings` (`end_id`, `textID`, `auctionID`, `type`, `price`) values (" + sellerID + ", " + auctionID + ", " + auctionID + ", '" + textType + "', " + maxValue + ")" );
					String send_alert = "Congrats " +username + " you won the auction for " + title + " with a bid of " + maxValue;
					st10.executeUpdate("insert into `Sends_Alert` (`end_id`, `auctionID`, `message`) values (" + endID + ", " + auctionID + ", '" + send_alert + "')" );
				}
			}
			else{
				
			st8.executeUpdate("insert into `Earnings` (`end_id`, `textID`, `auctionID`, `type`, `price`) values (" + sellerID + ", " + auctionID + ", " + auctionID + ", '" + textType + "', " + 0 + ")" );
			}
		}
	}
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