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
	answer_questions = st1.executeQuery("INSERT ANSWER, rep_id INTO QANDA_ASKSANSWERS");
	modify_accounts = st2.executeQuery('INSERT ACCID INTO ACCOUNTS');
	delete_account = st3.executeQuery('DELETE ACCID FROM ACCOUNTS');
	modify_auction = st2.executeQuery('INSERT Auction_ID INTO ACCOUNT');
	delete_auction = st3.executeQuery('DELETE AUction_ID FROM Auction');
%>

<body>
	<h1>Welcome Customer Rep!</h1>
	<br>
	
    <form action="Check_login_details.jsp" method="POST">
		QuestionID: <input type="text" name="id"/> <br/>
		Response: <input type="text" name="response"/> <br/>
		
		<input type="submit" value="Answer Question"/>
	 </form>
	 <form action="/action_page.php">
		<label for="fname">Delete Account (Users):</label><br>
		<input type="text" id="fname" name="fname" value="John"><br>
		<input type="submit" value="Submit">
	 </form> 
	 <form action="/action_page.php">
		<label for="fname">Modify Account (Users):</label><br>
		<input type="text" id="fname" name="fname" value="John"><br>
		<input type="submit" value="Submit">
	 </form>
	 <form action="/action_page.php">
		<label for="fname">Remove Bid:</label><br>
		<input type="text" id="fname" name="fname" value="John"><br>
		<input type="submit" value="Submit">
	 </form> 
	 <form action="/action_page.php">
		<label for="fname">Remove Auction:</label><br>
		<input type="text" id="fname" name="fname" value="John"><br>
		<input type="submit" value="Submit">
	 </form> 
  </tr>
</table>
</body>
</html>
