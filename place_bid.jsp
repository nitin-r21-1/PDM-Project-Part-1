<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Place Bid</title>
</head>

<body>
<%
	String auctionID = session.getAttribute("auction").toString();
	String end_id = session.getAttribute("userid").toString();
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs336project","root", "Swig2!6500");
	Statement st1 = con.createStatement();
	Statement st2 = con.createStatement();
	Statement st3 = con.createStatement();
	Statement st4 = con.createStatement();
	Statement st5 = con.createStatement();
	Statement st6 = con.createStatement();
	Statement st7 = con.createStatement();
	Statement st8 = con.createStatement();
	Statement st9 = con.createStatement();
	
	ResultSet rs1, rs2, rs3, rs4, rs5, rs6;
	
	rs1 = st1.executeQuery("select `auctionID`, `current`, `price`, `increment` from `Auction_Held` where `auctionID` = " + auctionID );
	rs1.next();
	String currentBid = rs1.getString("current");
	int curr = Integer.parseInt(currentBid);
	String initPrice = rs1.getString("price");
	int price = Integer.parseInt(initPrice);
	
	String value = request.getParameter("value");
	int val = Integer.parseInt(value);
	
	String sellerIncrementS = rs1.getString("increment");
	int sellerIncrement = Integer.parseInt(sellerIncrementS);
	
    
    if (val <= curr){
%>
    	<p> The bid value you entered is not greater than the current highest bid. </p>
    	<a href=product_details.jsp> Try Again </a>
<% } else if (val <= price)  {%>
		<p> The bid value you entered is not greater than the price posted. </p>
    	<a href=product_details.jsp> Try Again </a>
<% }
    else if (val <= curr + sellerIncrement)  {%>
	<p> The bid value you entered is not greater than the price plus the seller increment posted. </p>
	<a href=product_details.jsp> Try Again </a>
<% }

	else {
	rs2 = st2.executeQuery("select count(*) from `Bid_PlacesIn`");
	rs2.next();
	String countS = rs2.getString("count(*)");
	int count = Integer.parseInt(countS);
	int bid_num = 0;
	String bid_numS = "";
	
	if (count <= 0){
		bid_num = 1;
		bid_numS = String.valueOf(bid_num);
	}
	else{
		rs3 = st3.executeQuery("select max(bid_num) from `Bid_PlacesIn`");
		rs3.next();
		bid_numS = rs3.getString("max(bid_num)");
		bid_num = Integer.parseInt(bid_numS);
		bid_num++;
	}
	
	String increment = request.getParameter("increment");
	if (increment == null || increment.equals(""))
		increment = "0";
    String upper_limit = request.getParameter("upper_limit");
    if (upper_limit == null || upper_limit.equals(""))
    	upper_limit = "0";
	Date date = new Date();
	SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String placement = formatDate.format(date);
%>
	
	<p> Current:  <%=currentBid %>  </p>
	
	<h1> Bid Placed </h1>
	<p> Bid ID: <%= bid_numS %> </p>
	<p> Auction ID:  <%=auctionID %>  </p>
	<p> Your Bid:  $<%=value %>  </p>
	<p> Spending Limit $<%=upper_limit %> </p>
	<p> Increment $<%=increment %> </p>
	<p> Placement <%=placement %> </p>
	
<% 
	rs4 = st9.executeQuery("select `bid_num` from `Bid_PlacesIn` where `end_id` = " + end_id + " and `auctionID` = " + auctionID);
	if (rs4.next()){
		bid_num = Integer.parseInt(rs4.getString("bid_num"));
		st4.executeUpdate("update `Bid_PlacesIn` set `value` = "+ value + ", `upper_limit` = " + upper_limit + ", `increment` = " + increment + ", `placement` = '" + placement + "' where `bid_num` = " + bid_num);
	}
	else{
		st4.executeUpdate("insert into `Bid_PlacesIn` (`bid_num`, `auctionID`, `end_id`, `value`, `upper_limit`, `increment`, `placement`) values (" + bid_num + ", " + auctionID + ", " + end_id + ", " + value + ", " + upper_limit + ", " + increment + ", '" + placement + "')" );
	}
	st4.executeUpdate("update `Auction_Held` set `current` = " + value + " where auctionID = " + auctionID);
	
	String lastBidder = end_id;
	int currVal = val;
	
	rs5 = st5.executeQuery("select *  from `Bid_PlacesIn` where `auctionID` = " + auctionID );
	rs5.next();
	
	
	List<String[]> usersWithAutoBid = new ArrayList<String[]>();
	
	while(rs5.next())
	{
		String[] autoBid = {rs5.getString("end_id"), rs5.getString("increment"), rs5.getString("upper_limit")};
		if(Integer.parseInt(autoBid[1])==0 || autoBid[1]==null || autoBid[1].isEmpty() || Integer.parseInt(autoBid[2])==0 || autoBid[2]==null || autoBid[2].isEmpty())
		{
			continue;
		}
		usersWithAutoBid.add(autoBid);
	}
	
	
	while(usersWithAutoBid.size() > 0) 
	{
		
		for(int i = 0; i < usersWithAutoBid.size(); i++) 
		{
			String currUserID = usersWithAutoBid.get(i)[0];
			if(currUserID.equals(lastBidder)){
				continue;
			}
			
			rs6 = st6.executeQuery("select bid_num from `Bid_PlacesIn` where `end_id` = " + currUserID + " and `auctionID` = " + auctionID);
			rs6.next();
			int bidnum = Integer.parseInt(rs6.getString("bid_num"));
			
			int currIncrement = Integer.parseInt(usersWithAutoBid.get(i)[1]);
			int currLimit = Integer.parseInt(usersWithAutoBid.get(i)[2]);
			
			int newBid = currIncrement + currVal;
			
			if(newBid > currLimit)
			{
				usersWithAutoBid.remove(i);
			}
			
			else
			{
				st7.executeUpdate("update `Bid_PlacesIn` set `value` = " + newBid + " where bid_num = " + bidnum);
				
				lastBidder = currUserID;
				currVal = newBid;
			}
			
		}
		
		if(usersWithAutoBid.size() == 1) {
			break;
		}
	}
	st8.executeUpdate("update `Auction_Held` set `current` = " + currVal + " where auctionID = " + auctionID);
	
	con.close();

} %>

	<b> Thank You!</b>
	<a href=view_auctions.jsp> Continue Shopping </a>

	
</body>
</html>