
<%@ page import="java.io.*"%>
<%@ include file="makecon.jsp" %>
<%!String s;%>
<%s=request.getParameter("administrator").trim();%>
<%!String p;%>
<%p=request.getParameter("pword").trim();%>
<%

String t=" ";
try{
System.out.println("query executed");
ResultSet rs=st.executeQuery("select * from  admin where username='"+s+"' and password='"+p+"'");

if(rs.next()==false)
t="invalid";
else
	{
	String p1=rs.getString("password").trim();
	out.println(p1+"  "+p);
	if (p.equalsIgnoreCase(p1))
		t="valid";
	else
		t="Re-type";
	}
	out.println(t);
if(t.equalsIgnoreCase("invalid"))
{
	%>
	<jsp:forward page="admin.html" />
	<%
}
	else
	{
		if(t.equalsIgnoreCase("valid"))
		{
			%>
	<jsp:forward page="administration.html" />
	<%}
			else
		{%>
			<jsp:forward page="admin.html" />
			<%
		}
	}


}catch(Exception e){ %>
<jsp:forward page="admin.html" />
<%
	}
%>