<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%
	
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    String firstname = request.getParameter("first_name");
    String lastname = request.getParameter("last_name");
    String email = request.getParameter("email");
    String address = request.getParameter("address");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs336project","root", "root");
    Statement st = con.createStatement();
    
    ResultSet rs1;
    rs1 = st.executeQuery("select * from `User` where `username`='" + userid +"'");
    if (rs1.next()) {
    	out.println("Username is already taken. <a href='login.jsp'>try again</a>");
    } else {
    	ResultSet rs0, rs2;
    	rs0 = st.executeQuery("select count(*) from `User`");
    	String countUser = "";
    	while (rs0.next()){
    		countUser = rs0.getString(1);
    	}
    	int count = Integer.parseInt(String.valueOf(countUser.charAt(0))) + 1;
        st.executeUpdate("insert into `User` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `address`) values (" + count + ", '" + userid + "', '" + pwd + "', '" + firstname + "', '" + lastname + "', '" + email + "', '" + address + "')" );
    	session.setAttribute("user", userid); // the username will be stored in the session
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("Default_customer.jsp");
    }
%>