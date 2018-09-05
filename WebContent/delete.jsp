 <%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Page</title>
</head>
<body>
<%
int id=Integer.parseInt(request.getParameter("id"));
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","reddy","reddy");
PreparedStatement pst=con.prepareStatement("delete from crud where id=?");
pst.setInt(1, id);
int i=pst.executeUpdate();
if(i==1){
	out.println("Student with id " +id+ " Record Deleted");
	RequestDispatcher rd=request.getRequestDispatcher("fetch.jsp");
	rd.include(request,response);
}else
{
	out.println("Student with id " +id+ " Record Not Deleted");
	response.sendRedirect("index.jsp");
}
}
catch(Exception e){
	System.out.println(e);
}
%>
</body>
</html>