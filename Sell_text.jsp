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

	<form action="Book_auction_info.jsp" method="POST">
        <% 	if ((request.getParameter("textType") == null)){ %>
                <a href="Default_user.jsp">Please Select Text Type</a>
        <% } %>
        
        <%	if ((request.getParameter("textType").equals("Book"))){ %>
                ISBN: <input type = "text" name= "isbn"/> <br/>
                   Genre: <input type = "text" name= "genre"/> <br/>
                   Cover: <input type = "text" name= "cover"/> <br/>
        <%} else if ((request.getParameter("textType").equals("Magazine"))){ %>
                ISSN: <input type = "text" name= "issn"/> <br/>
                Volume: <input type = "text" name= "volume"/> <br/>
                Issue: <input type = "text" name= "issue"/> <br/>
        <%} else if ((request.getParameter("textType").equals("Reference"))){ %>
                ISBN: <input type = "text" name= "referenceISBN"/> <br/>
                   Type: <input type = "text" name= "type"/> <br/>
        <% } %>
        
               Condition: <input type = "text" name= "condition"/> <br/>		
               Author: <input type="text" name="author"/> <br/>
               Title:<input type="text" name="title"/> <br/>
               Publisher: <input type = "text" name= "publisher"/> <br/>
               Copyright: <input type = "text" name= "copyright"/> <br/>
               Description: <input type = "text" name= "description"/> <br/>
               Starting Price: <input type = "text" name= "price" /> <br/>
               Minimum Price: <input type = "text" name= "min_price" /> <br/>
               Closing Date: <input type = "datetime" name= "closing_date" /> <br/>
               <input type="submit" value="Create Book Auction"/>
            </form>
	
</body>
</html>