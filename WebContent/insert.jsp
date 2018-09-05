<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1 style="text-align: center"><u>Registration page</u></h1>
<form action="RegisterServlet" method="post">
<pre style="text-align: center;">
User Name:<input type="text" name="uname"><br><br>
Password :<input type="text" name="pass"><br><br>
Email    :<input type="text" name="email"><br><br>
id       :<input type="text" name="id"><br><br>
<input type="submit" value="Register">
</pre>
</form>

<form action="index.jsp">
<pre style="text-align: center;">
<input type="submit" value="Cancel Registration">
</form>
</pre>
</body>
</html>