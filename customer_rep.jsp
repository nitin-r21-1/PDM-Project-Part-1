<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Auctions</title>
		
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
table.center {
  margin-left: auto; 
  margin-right: auto;
}
</style>
</head>

<%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs336project","root", "root");
	Statement st1 = con.createStatement();
	Statement st2 = con.createStatement();
	ResultSet rs1,rs2;
	answer_questions = st1.executeQuery("INSERT ANSWER INTO QANDA_ASKSANSWERS");
	modify_accounts = st2.executeQuery('INSERT ACCDID INTO ACCOUNTS');
	delete_account = st3.executeQuery('DELETE ACCID FROM ACCOUNTS');
	modify_auction = st2.executeQuery('INSERT ACCDID INTO ACCOUNTS');
	delete_auction = st3.executeQuery('DELETE ACCID FROM ACCOUNTS');
%>

<body>
	<h1>Welcome Customer Rep!</h1>
	
	<h2>Here are your functions</h2>
	<br>
	
	<table class ="center" style="width:90%">
		<h3>          </h3>
		
		<% while (rs1.next() && rs2.next()) {%>
		<tr>
			<td><%= rs1.getString("earnings") %></td>
			<td><%= rs1.getString("user") %></td>
		</tr>

    <th>Answer Questions</th>
			<th>User</th>
		
		<% while (rs1.next() && rs2.next()) {%>
		<tr>
			<td><%= rs1.getString("questions") %></td>

		</tr>

		
	
	
	</table>
  
    <form action="Check_login_details.jsp" method="POST">
		QuestionID: <input type="text" name="id"/> <br/>
		Response: <input type="text" name="response"/> <br/>
		
		<input type="submit" value="Answer Question"/>
	 </form>

  </tr>
</table>
</body>
</html>
