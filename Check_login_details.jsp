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
   Class.forName("com.mysql.jdbc.Driver");
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs336project","root", "root");
   Statement st1 = con.createStatement();
   Statement st2 = con.createStatement();
   Statement st3 = con.createStatement();
   Statement st4 = con.createStatement();
   
   
   ResultSet rs1, rs2, rs3, rs4;
   rs1 = st1.executeQuery("select * from `User` where `username`='" + user + "' and `password`='" + pwd + "'");
   
   if (rs1.next()) {
       session.setAttribute("user", user); // the username will be stored in the session
       ResultSet rs0;
       rs2 = st2.executeQuery("select id from `User` where `username`='" + user + "'");
       if (rs2.next()) {
           int userId = Integer.parseInt(rs2.getString("id"));
           session.setAttribute("userid", userId);
           rs3 = st3.executeQuery("select id from `Admin` where `id` = " + userId);
           rs4 = st4.executeQuery("select id from `Representative` where `id` = " + userId);
           if (rs3.next()){
               response.sendRedirect("admin.jsp");
           }
           else if (rs4.next()){
               response.sendRedirect("customer_rep.jsp");
           }
           else
               response.sendRedirect("Default_user.jsp");
       }
   } else {
       out.println("Invalid password <a href='Login.jsp'>try again</a>");
   }

   con.close();
%>