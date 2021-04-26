<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%
    String auction = request.getParameter("aucid");
    String uid = request.getParameter("id");  
    String bid = request.getParameter("bidid");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs336project","root", "root");
    Statement st1 = con.createStatement();
    Statement st2 = con.createStatement();
    Statement st3 = con.createStatement();
    ResultSet rs0;
	String countUser = "";
       
        st2.executeUpdate("UPDATE `Bid_PlacesIn` SET `auctionID`='', `end_id`='', `value`='', `upper_limit`='', `increment`='', `placement`='' WHERE `bid_num`='" + bid + "'");
        st1.executeUpdate("UPDATE `User` SET `username`='', `password`='', `first_name`='', `last_name`='', `email`='', `address`='' WHERE `id`='" + uid + "'");
        st3.executeUpdate("UPDATE `Auction_Held` SET `auctionID`='', `textID`='', `price`='', `minimum`='', `increment`='', `current`='', `closing`='', `closed`='',`winner`='' WHERE `auctionID`='" + auction + "'");
%>
