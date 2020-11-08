<%@ include file="makecon.jsp" %>
<%@page import="java.io.*"%>

<%!String s;%>
<%s=request.getParameter("fname");%>

<%!String s1;%>
<%s1=request.getParameter("lname");%>

<%!String s2;%>
<%s2=request.getParameter("uname");%>

<%!String s3;%>
<%s3=request.getParameter("pword");%>

<%!String s4;%>
<%s4=request.getParameter("hno");%>

<%!String s5;%>
<%s5=request.getParameter("str");%>

<%!String s6;%>
<%s6=request.getParameter("city");%>

<%!String s7;%>
<%s7=request.getParameter("state");%>

<%!String s8;%>
<%s8=request.getParameter("ctr");%>

<%!int i9;%>
<%i9=Integer.parseInt(request.getParameter("pin"));%>

<%!long i10;%>
<%i10=Long.parseLong(request.getParameter("phno"));%>

<%!String s11;%>
<%s11=request.getParameter("eid");
System.out.println(s11);%>

<%!String s12;%>
<%s12=request.getParameter("que");%>

<%!String s13;%>
<%s13=request.getParameter("ans");%>

<%

out.println("<html><body background=ban.gif>");
String add=s4+s5+s6+s7+s8;
try{
  
PreparedStatement pt=con.prepareStatement("insert into registration values(?,?,?,?,?,?,?,?,?,?)");
pt.setString(1,s);
pt.setString(2,s1);
pt.setString(3,s2);
pt.setString(4,s3);
pt.setString(5,add);
pt.setInt(6,i9);
pt.setLong(7,i10);
pt.setString(8,s11);
pt.setString(9,s12);
pt.setString(10,s13);
int i=pt.executeUpdate();
System.out.println(i);
if (i>0)
{
out.println("<body  background=ban.GIF alink=blue vlink=red link=pink><center><h2>U Have Successfully Registered U r name.");
out.println("<br><br><br>User Name:<font color=blue>  "+s2+"</font>");
out.println("<br>Password :<font color=blue>  "+s3+"</font>");
out.println("<br><br><a href=login.html>Do u want to Login</a></h2></center>");
}
else
	{
	 out.println("<body  background=ban.GIF alink=blue vlink=red link=pink><center><h2>Error Occurred Due to the insertion of User Registration<br>");
     out.println("<a href=sup2.html>User Registration.</a></h2></center>");

	}


}catch(Exception e)
{
	System.out.println(e);
 out.println("<center><h2>Error Occurred Due to the insertion of User Registration <br>");
 out.println("<a href=sup2.html>User Registration.</a></h2></center>");
}

%>
