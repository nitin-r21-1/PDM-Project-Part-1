<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Create Auction</title>
</head>
<body>

	<%= session.getAttribute("userid") %> <br/>
	<form action="Check_auction_info.jsp" method="POST">
                <% if ((request.getParameter("textType") == null)){ %>
                <a href="Default_user.jsp">Please Select Text Type</a>
                <% } %>
        
                <%	if ((request.getParameter("textType").equals("Book"))){ %>
                        ISBN: <input type = "text" name= "isbn"/> <br/>
                        Genre: <input type = "text" name= "genre"/> <br/>
                        Condition: <select name="cover" id="cover">
  				<option value="Hardcover">Hardcover</option>
  				<option value="Paperback">Paperback</option>
  				<option value="Loose Leaf">Loose Leaf</option>
			</select> <br/>	
                <%} else if ((request.getParameter("textType").equals("Magazine"))){ %>
                        ISSN: <input type = "text" name= "issn"/> <br/>
                        Volume: <input type = "text" name= "volume"/> <br/>
                        Issue: <input type = "text" name= "issue"/> <br/>
                <%} else if ((request.getParameter("textType").equals("Reference"))){ %>
                        ISBN: <input type = "text" name= "isbn"/> <br/>
                        Type: <input type = "text" name= "type"/> <br/>
                <% } String tType = request.getParameter("textType"); session.setAttribute("tType", tType);%>
        	Condition: <select name="condition" id="condition">
  			<option value="New">New</option>
  			<option value="Mint">Mint</option>
  			<option value="Used">Used</option>
		</select> <br/>		
                Author: <input type="text" name="author"/> <br/>
                Title:<input type="text" name="title"/> <br/>
                Publisher: <input type = "text" name= "publisher"/> <br/>
                Copyright: <input type = "text" name= "copyright"/> <br/>
                Description: <input type = "text" name= "description"/> <br/>
                Enter Auction Information: <br/>
                        
                Starting Price: <input type = "text" name= "price" /> <br/>
                Minimum Price Sold: <input type = "text" name= "min_price" /> <br/>
                Minimum Bid Increment: <input type = 'text' name="increment" /> <br/>
                Closing Date and Time: <input type = "datetime" name= "closing_date" /> <br/>
                (YYYY-MM-DD HH:MM:SS) <br/>
               <input type="submit" value="Create Text Auction"/>
        </form>
	
</body>
</html>