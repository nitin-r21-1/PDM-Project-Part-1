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
    Statement st = con.createStatement();
    Statement st2 = con.createStatement();
    Statement st3 = con.createStatement();
    ResultSet rs;
    ResultSet rs1, rs2;
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
        	rs1 = st2.executeQuery("select * from `Admin` where `id`='" + userId + "'"); 
        	rs2 = st3.executeQuery("select * from `Representative` where `id`='" + userId + "'");
        	if (rs1.next()) {
            	response.sendRedirect("admin.jsp");
            	
                } 
        	else if(rs2.next()) {response.sendRedirect("customer_rep.jsp");}
        	else{response.sendRedirect("Default_user.jsp");}
            out.println("welcome " + user);
            out.println("<a href='Logout.jsp'>Log out</a>");
            
        }
        
    	
    } else {
        out.println("Invalid password <a href='Login.jsp'>try again</a>");
    }
%>