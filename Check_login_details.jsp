<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%
    String user = request.getParameter("username");   
    String pwd = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs336project","root", "root");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from `User` where `username`='" + user + "' and `password`='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("user", user); // the username will be stored in the session
        ResultSet rs0;
        rs0 = st.executeQuery("select id from `User` where `username`='" + user + "'");
        String userIds = "";
        if (rs0.next()) {
        	userIds = rs0.getString(1);
        	int userId = Integer.parseInt(String.valueOf(userIds.charAt(0)));
        	session.setAttribute("userid", userId);
        }
        out.println("welcome " + user);
        out.println("<a href='Logout.jsp'>Log out</a>");
        response.sendRedirect("Default_user.jsp");
    } else {
        out.println("Invalid password <a href='Login.jsp'>try again</a>");
    }
%>