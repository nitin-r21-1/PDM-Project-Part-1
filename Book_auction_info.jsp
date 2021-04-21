<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%
	
    String isbn = request.getParameter("isbn");   
    String genre = request.getParameter("genre");
    String cover = request.getParameter("cover");
    String issn = request.getParameter("issn");
    String volume = request.getParameter("volume");
    String issue = request.getParameter("issue");
    String referenceISBN = request.getParameter("referenceISBN");
    String type = request.getParameter("type");
    String condition = request.getParameter("condition");
    String author = request.getParameter("author");
    String title = request.getParameter("title");
    String publisher = request.getParameter("publisher");
    String copyright = request.getParameter("copyright");
    String description = request.getParameter("description");
    
    
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs336project","root", "root");
    Statement st = con.createStatement();
    
    ResultSet rs1;
    if ((request.getParameter("textType").equals("Book")))
    {
    	rs1 = st.executeQuery("select * from `User` where `username`='" + userid +"'");
    }
    
    else if ((request.getParameter("textType").equals("Magazine")))
    {
    	
    }
    
    else if ((request.getParameter("textType").equals("Reference")))
    {
    	
    }
    
  
    }
%>