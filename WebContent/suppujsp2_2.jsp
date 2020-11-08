<%@ include file="makecon.jsp" %>
<%@page import="java.io.*" session="true"%>
<%!String s;%>
<%s=request.getParameter("username").trim();%>
<%!String p;%>
<%p=request.getParameter("password").trim();%>
<%

String t="";
try{
ResultSet rs=st.executeQuery("select * from registration where username='"+s+"'");
out.println(s+" "+p);
out.println("query executed");
if(rs.next()==false)
t="invalid";
else
	{
	String p1=rs.getString("password").trim();
	if (p1.equalsIgnoreCase(p))
		{
		t="valid";
		 }
	else
		t="Re-type";
	}
if(t.equalsIgnoreCase("invalid"))
{
	%>
	<jsp:forward page="login.html"  />
	<%
}
	else
	{
		if(t.equalsIgnoreCase("valid"))
		{
			session.setAttribute("UserName",s);
			%>
	<jsp:forward page="project.html"  />
	<%}
			else
		{%>
			<jsp:forward page="login.html" />
			<%
		}
	}


}
catch (Exception e)
{
	out.println(e);
	}
%>


