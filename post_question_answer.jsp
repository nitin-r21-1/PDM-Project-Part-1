<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%
	
    String nid = request.getParameter("qid");  
    String qpls = request.getParameter("question");   
    String respnse = request.getParameter("response");

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs336project","root", "root");
    Statement st = con.createStatement();
    Statement st2 = con.createStatement();
    ResultSet rs0;
	rs0 = st.executeQuery("select count(*) from `QandA_AsksAnswers`");
	String countUser = "";
	while (rs0.next()){
		countUser = rs0.getString(1);
	}
	int count = Integer.parseInt(String.valueOf(countUser.charAt(0))) + 1;
       
        st2.executeUpdate("UPDATE `QandA_AsksAnswers` SET `answer`='" + respnse + "' WHERE `qid`='" + nid + "'");
        st.executeUpdate("insert into `QandA_AsksAnswers` (qid,question) values (" + count + ",'" + qpls + "')" );
        st3.executeUpdate("SELECT Question FROM `QandA_AsksAnswers` WHERE Question LIKE '% %');
%>