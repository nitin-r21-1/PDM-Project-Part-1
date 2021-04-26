<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%
    String nid = request.getParameter("did");
    String nid = request.getParameter("did");  
    String bid = request.getParameter("bidid");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs336project","root", "root");
    Statement st1 = con.createStatement();
    Statement st2 = con.createStatement();
    ResultSet rs0;
	rs0 = st.executeQuery("select count(*) from `QandA_AsksAnswers`");
	String countUser = "";
	while (rs0.next()){
		countUser = rs0.getString(1);
	}
	int count = Integer.parseInt(String.valueOf(countUser.charAt(0))) + 1;
       
        st2.executeUpdate("UPDATE `Bid_PlacesIn` SET `auctionID`='', `end_id`='', `value`='', `upper_limit`='', `increment`='', `placement`='' WHERE `bid_num`='" + nid + "'");
        st1.executeUpdate("UPDATE `User` SET `id`='', `username`='', `password`='', `first_name`='', `last_name`='', `email`='', `address`='' WHERE `qid`='" + nid + "'");
        st3.executeUpdate("UPDATE `Auction_Held` SET `auctionID`='', `textID`='', `price`='', `minimum`='', `increment`='', `current`='', `closing`='', `closed`='',`winner`='' WHERE `qid`='" + nid + "'");
%>