<%@ include file="makecon.jsp" %>
<%@page import="java.io.*"%>

<%!String s;%>
<%s=request.getParameter("txt1");%>

<%!String s1;%>
<%s1=request.getParameter("pw1");%>


<%

try{
  
PreparedStatement pt=con.prepareStatement("insert into admin values(?,?)");
pt.setString(1,s);
pt.setString(2,s1);

int i=pt.executeUpdate();
System.out.println(i);
if (i>0)
{
out.println("<body  background=ban.GIF alink=blue vlink=red link=pink><center><h2>U Have Successfully Registered U r name.");
out.println("<br><br><br>User Name:<font color=blue>  "+s+"</font>");
out.println("<br>Password :<font color=blue>  "+s1+"</font>");
out.println("<a href=Add.html>GoBack.</a></h2></center>");
}
else
	{
	 out.println("<body  background=ban.GIF alink=blue vlink=red link=pink><center><h2>Error Occurred Due to the insertion of Admin Registration<br>");
     out.println("<a href=Add.html>GoBack.</a></h2></center>");

	}


}catch(Exception e)
{
	System.out.println(e);
 out.println("<center><h2>Error Occurred Due to the insertion of Admin Registration <br>");
 out.println("<a href=Add.html>Go back.</a></h2></center>");
}

%>
