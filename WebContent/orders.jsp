<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="ban.GIF">
<%
String unam=(String)session.getAttribute("UserName");
if(unam==null)
	{
	response.sendRedirect("Logout.jsp");
	}
String on=request.getParameter("orno");
String or=request.getParameter("ordes");
String am=request.getParameter("amount");
String d1=request.getParameter("date1");
String uname = (String)session.getAttribute("UserName");

try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/digitaltunes","root","root");
	Statement ps=con.createStatement();
	ResultSet rs=ps.executeQuery("select * from forder where userid='"+uname+"'");
	while(rs.next())
	{
		out.println(rs.getString(1)+" " +rs.getString(2)+" "+rs.getString(3)+" "+rs.getString(4));
		%>
		<br><br>
		<%
	} 
	
}
catch(Exception e)
{
e.printStackTrace();	
}
%>
</body>
</html>