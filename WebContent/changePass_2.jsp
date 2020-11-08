<link  rel="stylesheet" type="text/css"  href="style1.css">

<%@ page import="java.sql.*" %>
<html><body  bgcolor="#E0DDC2" >
<%
String unam=(String)session.getAttribute("UserName");
if(unam==null)
	{
	response.sendRedirect("Logout.jsp");
	}
	 String memid=request.getParameter("memid").trim();
	 String pass1=request.getParameter("opass").trim();
	 String pass2=request.getParameter("npass").trim();
	 	try{
	 		Class.forName("com.mysql.jdbc.Driver");  
		 	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/digitaltunes","root","root");  
			System.out.println("in hello user Chengepassword");
			PreparedStatement pst1=con.prepareStatement("update registration set password=? where username=? and password=? ");
			pst1.setString(1,pass2);
			pst1.setString(2,memid);
			pst1.setString(3,pass1);
			int n2=pst1.executeUpdate();
			String s2=null;
			if(n2>0)
				s2="ya";
			else
				s2="no";
			if(s2.equalsIgnoreCase("ya"))
			{
			out.println("<html><body  background=ban.GIF alink=blue vlink=red link=blue><h3><center><br><br><br><br><br><br>Result Of the Transaction<br><br><table><tr><td>Password Changed Successfully</td></tr><tr><td align=cneter><a href=./login.html>Back to HomePage</a> </td></tr> </table></center></h3></body> ");
			}
			else
			{
				out.println("<html><body  background=ban.GIF alink=blue vlink=red link=blue><center><br><br><br><br><br><br><p class=title>Result Of the Transaction<br><br><table><tr><td>Error Occurred</td></tr></table></center></p>");
			}
			System.out.println("after while");
	}catch(Exception e){
	out.println("<html><body  background=ban.GIF alink=blue vlink=red link=blue><center><br><br><br><br><br><br><p class=title>Result Of the Transaction<br><br><table><tr><td>Error Occurred</td></tr></table></center></p>");	
		}

%>
	


