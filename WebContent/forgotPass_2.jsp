<%@ page import="java.sql.*" %>
<%
String unam=(String)session.getAttribute("UserName");
if(unam==null)
	{
	response.sendRedirect("Logout.jsp");
	}

	 String memid=request.getParameter("memid").trim();
	 String type=request.getParameter("forgotPassType").trim();
	 String answer=request.getParameter("forgotPassAns").trim();
		
		try{
			Class.forName("com.mysql.jdbc.Driver");  
		 	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/digitaltunes","root","root"); 
			System.out.println("in hello user forgotpassword");
			PreparedStatement pst=con.prepareStatement("select password from registration where username=? and type =?   and  answer=?");
			pst.setString(1,memid);
			pst.setString(2,type);
			pst.setString(3,answer);
			ResultSet rst=pst.executeQuery();

			if(rst.next())
			{
			System.out.println("u r in rs1.next()");
			String pass1=rst.getString(1);
			out.println("<html><body  background=ban.GIF alink=blue vlink=red link=blue><h3><center><br><br><br><br><br><br>Result Of the Transaction<br><br><table><tr><td><font size=4>U r password is</font></td></tr><tr><td><font color=blue size=6>"+pass1+"</font></td></tr></table></center>");
			}
			else
			{
				out.println("<html><body  background=ban.GIF alink=blue vlink=red link=blue><h3><center><br>Result Of the Transaction<br><br>U have choosen wrong information	<br>Try again<a href=forgot.html>Try</a></center>");
			}
			System.out.println("after while");
			
		}catch(Exception e){
				System.out.println(e);
				out.println("<html><body  background=ban.GIF alink=blue vlink=red link=blue><center><br><br><br><br><br><br><p class=title>Result Of the Transaction<br><br><table><tr><td>Error Occurred</td></tr></table></center></p>");	
		}
				%>