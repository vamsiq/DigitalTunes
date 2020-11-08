<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deleted</title>
</head>
<body>
<% 
String did=request.getParameter("Un1");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/digitaltunes","root","root");
	PreparedStatement ps=con.prepareStatement("delete from registration where username=?");
	ps.setString(1,did);
	int n=ps.executeUpdate();
	if(n>0){
		out.println("deleted successfully");
		%>
		<a href="administration.html">Go BAck To Home Page</a>
		<a href="manage.html">delete User</a>
		<%
	}
	else{
		
		out.println("records not found");
	}
	ps.close();
	con.close();

	
	
}
catch(Exception e)
{
e.printStackTrace();	
}
%>
</body>
</html>