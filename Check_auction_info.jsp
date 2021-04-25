<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*, java.util.Date, java.util.Calendar, java.text.SimpleDateFormat" %>
<%
	String condition = request.getParameter("condition");
	String author = request.getParameter("author");
	String title = request.getParameter("title");
	String publisher = request.getParameter("publisher");
	String copyright = request.getParameter("copyright");
	if (copyright == null || copyright.equals(""))
		copyright = "0";
	String description = request.getParameter("description");
	String textType = (session.getAttribute("tType").toString());
	String price = request.getParameter("price");
	if (price == null || price.equals(""))
		price = "1";
	String min_price = request.getParameter("min_price");
	if (min_price == null || min_price.equals(""))
		min_price = price;
	String increment = request.getParameter("increment");
	if (increment == null || increment.equals(""))
		increment = "1";
	String closing_date = request.getParameter("closing_date");
	if (closing_date == null || closing_date.equals("")){
		Calendar cal = new GregorianCalendar();
		cal.set(Calendar.HOUR_OF_DAY, 23);
		cal.set(Calendar.MINUTE, 59);
		cal.set(Calendar.SECOND, 59);
		cal.set(Calendar.MILLISECOND, 0);
		cal.add(Calendar.DAY_OF_MONTH, 1);
		Date date = cal.getTime();
		SimpleDateFormat formatDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		closing_date = formatDate.format(date);
	}
	
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs336project","root", "root");
    Statement st1 = con.createStatement();
    Statement st2 = con.createStatement();
    Statement st3 = con.createStatement();
    
    ResultSet rs1, rs2;
    
    rs1 = st1.executeQuery("select count(*) from `Text_Sells`");
    String countAuction = "";
	while (rs1.next()){
		countAuction = rs1.getString("count(*)");
	}
	int count = Integer.parseInt(countAuction) + 1;
	
    int textID = count;
    int auctionID = textID;
	
    if (textType.equals("Book"))
    {
    	String isbn = request.getParameter("isbn");   
        String genre = request.getParameter("genre");
        String cover = request.getParameter("cover");
        
       
        st2.executeUpdate("insert into `Text_Sells` (`textID`, `end_id`, `condition`, `author`, `title`, `publisher`, `copyright`, `description`, `textType`) values (" + textID + ", " + (Integer) session.getAttribute("userid") + ", '" + condition + "', '" + author + "', '" + title + "', '" + publisher + "', " + copyright + ", '" + description + "', '" + textType + "')" );
        
        st2.executeUpdate("insert into `Book` (`textID`, `isbn`, `genre`, `cover`) values (" + textID + ", '" + isbn + "', '" + genre + "', '" + cover + "')" );
		
        st2.executeUpdate("insert into `Auction_Held` (`auctionID`, `textID`, `price`,  `minimum`, `increment`, `current`, `closing`, `closed`) values (" + auctionID + ", " + textID + ", " + price + ", " + min_price + ", " + increment + ", 0, '" + closing_date + "', False)" );

    }
    
    else if (textType.equals("Magazine"))
    {
    	 String issn = request.getParameter("issn");
    	 String volume = request.getParameter("volume");
    	 String issue = request.getParameter("issue");
    	 
        
    	st2.executeUpdate("insert into `Text_Sells` (`textID`, `end_id`, `condition`, `author`, `title`, `publisher`, `copyright`, `description`, `textType`) values (" + textID + ", " + (Integer) session.getAttribute("userid") + ", '" + condition + "', '" + author + "', '" + title + "', '" + publisher + "', " + copyright + ", '" + description + "', '" + textType + "')" );
        
        st2.executeUpdate("insert into `Magazine` (`textID`, `issn`, `volume`, `issue`) values (" + textID + ", '" + issn + "', " + volume + ", " + issue + ")" );
        
        st2.executeUpdate("insert into `Auction_Held` (`auctionID`, `textID`, `price`,  `minimum`, `increment`, `current`, `closing`, `closed`) values (" + auctionID + ", " + textID + ", " + price + ", " + min_price + ", " + increment + ", 0, '" + closing_date + "', False)" );
	
    }
    
    else if (textType.equals("Reference"))
    {
    	String isbn = request.getParameter("isbn");
    	String type = request.getParameter("type");
    	
    	
    	st2.executeUpdate("insert into `Text_Sells` (`textID`, `end_id`, `condition`, `author`, `title`, `publisher`, `copyright`, `description`, `textType`) values (" + textID + ", " + (Integer) session.getAttribute("userid") + ", '" + condition + "', '" + author + "', '" + title + "', '" + publisher + "', " + copyright + ", '" + description + "', '" + textType + "')" );
        
        st2.executeUpdate("insert into `Reference` (`textID`, `isbn`, `type`) values (" + textID + ", '" + isbn + "', '" + type + "')" );
	
        st2.executeUpdate("insert into `Auction_Held` (`auctionID`, `textID`, `price`,  `minimum`, `increment`, `current`, `closing`, `closed`) values (" + auctionID + ", " + textID + ", " + price + ", " + min_price + ", " + increment + ", 0, '" + closing_date + "', False)" );

    }
    
    st3.executeUpdate("insert into `History` (`auctionID`, `end_id`, `role`) values (" + auctionID +  ", " + (Integer) session.getAttribute("userid") + ", 'Seller')");
    
    response.sendRedirect("view_auctions.jsp");
    
  
    
%>