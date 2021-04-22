<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%
	String condition = request.getParameter("condition");
	String author = request.getParameter("author");
	String title = request.getParameter("title");
	String publisher = request.getParameter("publisher");
	String copyright = request.getParameter("copyright");
	String description = request.getParameter("description");
	String textType = (session.getAttribute("tType").toString());
	String price = request.getParameter("price");
	String min_price = request.getParameter("min_price");
	String increment = request.getParameter("increment");
	String closing_date = request.getParameter("closing_date");
	
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs336project","root", "root");
    Statement st = con.createStatement();
    
    ResultSet rs1, rs2;
    
    rs1 = st.executeQuery("select count(*) from `Text_Sells`");
    String countAuction = "";
	while (rs1.next()){
		countAuction = rs1.getString(1);
	}
	int count = Integer.parseInt(String.valueOf(countAuction.charAt(0))) + 1;
	
    int textID = count;
    int auctionID = textID;
	
    if (textType.equals("Book"))
    {
    	String isbn = request.getParameter("isbn");   
        String genre = request.getParameter("genre");
        String cover = request.getParameter("cover");
        
       
        st.executeUpdate("insert into `Text_Sells` (`textID`, `end_id`, `condition`, `author`, `title`, `publisher`, `copyright`, `description`, `textType`) values (" + textID + ", " + (Integer) session.getAttribute("userid") + ", '" + condition + "', '" + author + "', '" + title + "', '" + publisher + "', " + copyright + ", '" + description + "', '" + textType + "')" );
        
        st.executeUpdate("insert into `Book` (`textID`, `isbn`, `genre`, `cover`) values (" + textID + ", '" + isbn + "', '" + genre + "', '" + cover + "')" );
		
        st.executeUpdate("insert into `Auction_Held` (`auctionID`, `textID`, `price`,  `minimum`, `increment`, `current`, `closing`, `closed`) values (" + auctionID + ", " + textID + ", " + price + ", " + min_price + ", " + increment + ", 0, '" + closing_date + "', False)" );

    }
    
    else if (textType.equals("Book"))
    {
    	 String issn = request.getParameter("issn");
    	 String volume = request.getParameter("volume");
    	 String issue = request.getParameter("issue");
    	 
        
    	st.executeUpdate("insert into `Text_Sells` (`textID`, `end_id`, `condition`, `author`, `title`, `publisher`, `copyright`, `description`, `textType`) values (" + textID + ", " + (Integer) session.getAttribute("userid") + ", '" + condition + "', '" + author + "', '" + title + "', '" + publisher + "', " + copyright + ", '" + description + "', '" + textType + "')" );
        
        st.executeUpdate("insert into `Magazine` (`textID`, `issn`, `volume`, `issue`) values (" + textID + ", '" + issn + "', " + volume + ", " + issue + ")" );
        
        st.executeUpdate("insert into `Auction_Held` (`auctionID`, `textID`, `price`,  `minimum`, `increment`, `current`, `closing`, `closed`) values (" + auctionID + ", " + textID + ", " + price + ", " + min_price + ", " + increment + ", 0, '" + closing_date + "', False)" );
	
    }
    
    else if (textType.equals("Book"))
    {
    	String isbn = request.getParameter("isbn");
    	String type = request.getParameter("type");
    	
    	
    	st.executeUpdate("insert into `Text_Sells` (`textID`, `end_id`, `condition`, `author`, `title`, `publisher`, `copyright`, `description`, `textType`) values (" + textID + ", " + (Integer) session.getAttribute("userid") + ", '" + condition + "', '" + author + "', '" + title + "', '" + publisher + "', " + copyright + ", '" + description + "', '" + textType + "')" );
        
        st.executeUpdate("insert into `Reference` (`textID`, `isbn`, `type`) values (" + textID + ", '" + isbn + "', '" + type + "')" );
	
        st.executeUpdate("insert into `Auction_Held` (`auctionID`, `textID`, `price`,  `minimum`, `increment`, `current`, `closing`, `closed`) values (" + auctionID + ", " + textID + ", " + price + ", " + min_price + ", " + increment + ", 0, '" + closing_date + "', False)" );

    }
    
    response.sendRedirect("view_auctions.jsp");
    
  
    
%>