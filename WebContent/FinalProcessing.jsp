<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*" %>

<html>
<head><title> SearchPage(p)</title>
</head>
<body background="background.jpg">

<h2><font color=#bb055E><center>Search Page</center></font></h2>
<br>
<hr color=#bb055E>
<% 
String unam=(String)session.getAttribute("UserName");
if(unam==null)
	{
	response.sendRedirect("Logout.jsp");
	}
request.getSession(true);
   String user=(String)session.getAttribute("UserName");
   System.out.println(user);
   String submit_type = null;
   
   int counter = 0;
  
     String but=request.getParameter("button");
	 
    
	  if (but.equalsIgnoreCase("yes")) { %>
	
	<jsp:forward page="project3.html" />
	<%}%>




	<% if (but.equalsIgnoreCase("no")) {

	%>
	<jsp:forward page="Inter.jsp" />
	<%
	}
		%>
	 
	  
			
