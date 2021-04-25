<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%
    String question = request.getParameter("question");
    if (question == null || question.equals("")){
    	response.sendRedirect("Default_user.jsp");
    }
    
    Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs336project","root", "Swig2!6500");
	Statement st1 = con.createStatement();
	Statement st2 = con.createStatement(); 
	
	ResultSet rs1;
	rs1 = st1.executeQuery("select count(*) from `QandA_AsksAnswers`");
	rs1.next();
	int count = Integer.parseInt(rs1.getString("count(*)")) + 1;
	
	st2.executeUpdate("Insert into `QandA_AsksAnswers` (`qid`, `question`, `answer`, `end_id`) values (" + count + ", '" + question + "', '', " + (Integer) session.getAttribute("userid") + ")");
	response.sendRedirect("Default_user.jsp");
 %>