<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.* "%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
String unam=(String)session.getAttribute("UserName");
if(unam==null)
	{
	response.sendRedirect("Logout.jsp");
	}
String u1=request.getParameter("un");
String c2=request.getParameter("op");
String c3=request.getParameter("np");
try{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/digitaltunes","root","root");
	PreparedStatement ps=con.prepareStatement("update admin set password=? where username=? and password=?");
	ps.setString(1,c3);
	ps.setString(2,u1);
	ps.setString(3,c2);
	int n=ps.executeUpdate();
	if(n>0)
	{
		out.println("password updated");
		%>
		<jsp:forward page="administration.html"/>
		<% 
	}
	else{
		 out.println("not updated");
		}
	
}
catch(Exception e)
{
e.printStackTrace();
}
%>
</body>
</html>