<%@page import="javax.sound.midi.Soundbank"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1 style="text-align: center"><u>User Details</u></h1>
<table align="center" border="2">
<th>Name</th>
<th>Password</th>
<th>Email</th>
<th>Id</th>
<th>To Do's</th>
<%
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","reddy","reddy");
PreparedStatement pst=con.prepareStatement("select * from crud");
ResultSet rs=pst.executeQuery();
while(rs.next()){ %>
	<tr>
	<td><%=rs.getString("ename") %></td>
	<td><%=rs.getString("password") %></td>
	<td><%=rs.getString("email") %></td>
	<td><%=rs.getInt("id") %></td>
	<td><a href="edit.jsp?id=<%=rs.getInt("id")%>">Edit</a><a href="delete.jsp?id=<%=rs.getInt("id")%>">Delete</a></td>
	</tr>
<% 	
}
}
catch(Exception e){
	System.out.println(e);
}
%>
</table>
<pre style="text-align: center"><a href="index.jsp">Home</a></pre>
</body>
</html>