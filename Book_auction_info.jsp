<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%




	String condition = request.getParameter("condition");
	String author = request.getParameter("author");
	String title = request.getParameter("title");
	String publisher = request.getParameter("publisher");
	String copyright = request.getParameter("copyright");
	String description = request.getParameter("description");
	
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs336project","root", "root");
    Statement st = con.createStatement();
    
    ResultSet rs1, rs2;
    
    rs1 = st.executeQuery("select count(*) from `Auction_Held`");
    String countAuction = "";
	while (rs1.next()){
		countAuction = rs1.getString(1);
	}
	int count = Integer.parseInt(String.valueOf(countAuction.charAt(0))) + 1;
    
    if ((request.getParameter("textType").equals("Book")))
    {
    	String isbn = request.getParameter("isbn");   
        String genre = request.getParameter("genre");
        String cover = request.getParameter("cover");
        
       
        st.executeUpdate("insert into `Text_Sells` (`textID`, `end_id`, `condition`, `author`, `title`, `publisher`, `copyright`, `description`) values (" + count + ", '" + textID + "', '" + end_id + "', '" + condition + "', '" + author + "', '" + title + "', '" + publisher + "', '" + copyright + "', '" + description + "')" );
        
        st.executeUpdate("insert into `Book` (`textID`, `isbn`, `genre`, `cover`) values (" + count + ", '" + textID + "', '" + isbn + "', '" + genre + "', '" + cover + "')" );


    }
    
    else if ((request.getParameter("textType").equals("Magazine")))
    {
    	 String issn = request.getParameter("issn");
    	 String volume = request.getParameter("volume");
    	 String issue = request.getParameter("issue");
    	 
        
    	st.executeUpdate("insert into `Text_Sells` (`textID`, `end_id`, `condition`, `author`, `title`, `publisher`, `copyright`, `description`) values (" + count + ", '" + textID + "', '" + end_id + "', '" + condition + "', '" + author + "', '" + title + "', '" + publisher + "', '" + copyright + "', '" + description + "')" );
        
        st.executeUpdate("insert into `Magazine` (`textID`, `issn`, `volume`, `issue`) values (" + count + ", '" + textID + "', '" + issn + "', '" + volume + "', '" + issue + "')" );

	
    }
    
    else if ((request.getParameter("textType").equals("Reference")))
    {
    	String isbn = request.getParameter("isbn");
    	String type = request.getParameter("type");
    	
    	
        st.executeUpdate("insert into `Text_Sells` (`textID`, `end_id`, `condition`, `author`, `title`, `publisher`, `copyright`, `description`) values (" + count + ", '" + textID + "', '" + end_id + "', '" + condition + "', '" + author + "', '" + title + "', '" + publisher + "', '" + copyright + "', '" + description + "')" );
        
        st.executeUpdate("insert into `Reference` (`textID`, `referenceISBN`, `type`) values (" + count + ", '" + textID + "', '" + referenceISBN + "', '" + type + "')" );


    }
    
  
    
%>