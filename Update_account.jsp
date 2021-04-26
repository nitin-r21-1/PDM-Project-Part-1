<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%--if (rs2.next()) {
                	userIds = rs0.getString(1);
                	int userId = Integer.parseInt(String.valueOf(userIds.charAt(0)));
                	session.setAttribute("userid", userId);
                	response.sendRedirect("customer_rep.jsp");
          rs2 = st.executeQuery("select * from `Representative` r, 'User' u where `id`='" + id + "'")    
           rs1 = st2.executeQuery("select 'id' from `Admin` where `id`='" + userId + "'"); 
              	if (rs1.next()) {
            	AdminIds = rs0.getString(1);
            	int Adminid = Integer.parseInt(String.valueOf(AdminIds.charAt(0)));
            	session.setAttribute("adminid", Adminid);
            	response.sendRedirect("admin.jsp");
            	
                } 
   --%>
<%
    String user = request.getParameter("username");   
    String pwd = request.getParameter("password");
    String fn = request.getParameter("first_name");
    String ln = request.getParameter("last_name");
    String el = request.getParameter("email");
    String ad = request.getParameter("address");
    String nid = request.getParameter("id");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs336project","root", "root");
    Statement st = con.createStatement();
    ResultSet rs;
    st.executeUpdate("UPDATE `User` SET `username`='" + user + "', `password`='" + pwd + "', `first_name`='" + fn + "', `last_name`='" + ln + "', `email`='" + el + "', `address`='" + ad + "' WHERE `id`='" + nid + "'");
  
   
%>