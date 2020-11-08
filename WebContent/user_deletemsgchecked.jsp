<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
String unam=(String)session.getAttribute("UserName");
if(unam==null)
	{
	response.sendRedirect("Logout.jsp");
	}
String[] msgs=request.getParameterValues("from");
System.out.println(msgs.length);
try	{
	Class.forName("com.mysql.jdbc.Driver");  
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/digitaltunes","root","root"); 
	Statement stmt=con.createStatement();
	for(int i=0;i<msgs.length;i++) stmt.executeUpdate("delete from user_inbox where mid='"+msgs[i]+"'");
	response.sendRedirect("user_inbox.jsp");
} catch(Exception e) {
		out.println("<center><h2>Failed To Delete Items Due to The Error <BR>"+e);
}
%>
<center><h4><a href="admin_inbox.jsp">Back To Inbox</a></h4>

