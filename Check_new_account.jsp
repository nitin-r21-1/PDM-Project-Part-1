<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<%
	
    String user = request.getParameter("username");
    String pwd = request.getParameter("password");
    if (user == null || user.equals("") || pwd == null || pwd.equals("")){
    	response.sendRedirect("Create_account.jsp");
    }
    else{
    	String firstname = request.getParameter("first_name");
    	String lastname = request.getParameter("last_name");
    	String email = request.getParameter("email");
    	String address = request.getParameter("address");
		String usid = request.getParameter("uid");
    	Class.forName("com.mysql.jdbc.Driver");
    	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs336project","root", "root");
    	Statement st1 = con.createStatement();
    	Statement st2 = con.createStatement();
    	Statement st3 = con.createStatement();
    	Statement st4 = con.createStatement();
    	Statement st5 = con.createStatement();
		Statement st6 = con.createStatement();
    	ResultSet rs1, rs2;
    	rs1 = st1.executeQuery("select * from `User` where `username`='" + user +"'");
    	int count = 0;
    	if (rs1.next()) {
    		out.println("Username is already taken. <a href='Create_account.jsp'>try again</a>");
    	} else {
    		rs2 = st2.executeQuery("select count(*) from `User`");
    		while (rs2.next()){
    			count = Integer.parseInt(rs2.getString("count(*)")) + 1;
    		}
        	st3.executeUpdate("insert into `User` (`id`, `username`, `password`, `first_name`, `last_name`, `email`, `address`) values (" + count + ", '" + user + "', '" + pwd + "', '" + firstname + "', '" + lastname + "', '" + email + "', '" + address + "')" );
        	st4.executeUpdate("insert into `End_User` (`id`) values (" + count + ")");
    		session.setAttribute("user", user); // the username will be stored in the session
    		session.setAttribute("userid", count);
    		st6.executeUpdate("insert into `Representative` (`id`) values (" + usid + ")");
    		String newMessage = "Thank you for creating an account with Bid-a-Text!";
    		st5.executeUpdate("insert into `Sends_Alert` (`end_id`, auctionID, `message`) values (" + count + ", 1, '" + newMessage + "')");
    		
			con.close();

        	response.sendRedirect("Default_user.jsp");
    	}
    }
		
%>