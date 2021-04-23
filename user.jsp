



String question = request.getParameter("question");

<body>

	
	<table class ="center" style="width:90%">
		<tr>
            <h3>Questions</h3>
			
		
		<tr>
      <% while (rs1.next() && rs2.next()) {%>
			<td><%= rs1.getString("user") %></td>
			<td><%= rs1.getString("earnings") %></td>
		</tr>
	
		<% while (rs1.next() && rs2.next()) {%>
		<tr>
			<td><%= rs1.getString("total") %></td>
		</tr>
        
		<% } %>
	</table>
  
    <table style="width:100%">
    <h3>Total Earnings</h3>
  <tr>
    <td>Jill</td>

  </tr>
</table>
</body>