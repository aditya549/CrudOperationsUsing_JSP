<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.sound.midi.Soundbank"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<h1 style="text-align: center"><u>Update page</u></h1>
<form action="UpdateServlet" method="post">
<%
int id=Integer.parseInt(request.getParameter("id"));
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","reddy","reddy");
PreparedStatement pst=con.prepareStatement("select * from crud where id=?");
pst.setInt(1, id);
ResultSet rs=pst.executeQuery();
while(rs.next()){
%>
<pre style="text-align: center;">
User Name:<input type="text" name="uname" value="<%=rs.getString("ename")%>"><br><br>
Password :<input type="text" name="pass" value="<%=rs.getString("password")%>"><br><br>
Email    :<input type="text" name="email" value="<%=rs.getString("email")%>"><br><br>
id       :<input type="text" name="id" value="<%=rs.getInt("id")%>" readonly="readonly"><br><br>
<input type="submit" value="Register">
<%
}
}
catch(Exception e){
	System.out.println(e);
}
%>
</pre>
</form>
</body>
</html>