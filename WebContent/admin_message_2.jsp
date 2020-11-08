<%@ page import="java.sql.*"%>
<html xmlns=""><head>
<meta http-equiv="page-enter" content="blendTrans(duration=1)">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<title>e-Music World</title>
<style>
.border{border-color:#CC0000}
.style1 {
	color: #336600;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	font-weight: bold;
}
</style>
<body background="ban.GIF" 
            bgcolor="chocalate"
                  text="#003399"
                  vlink="red" link="blue"><BR><BR>
<fieldset class="border">
<legend align="center"><span class="style1">Send Message</span></legend>
<br><table width=554 align=center cellspacing=0 cellpadding=3>
  <form method=post action="sendto.jsp">
<TR><TD width="129" align=right>From:</td>
<Td width="411"><input name=from readonly value='Administrator'style='width:350px'></td></tr>
<TR><TD align=right>To:</td><td><input type=hidden value='user_inbox' name=table><select name=to style='width:350px'>
<% 
String unam=(String)session.getAttribute("UserName");
if(unam==null)
	{
	response.sendRedirect("Logout.jsp");
	}
try {
  Connection con=null;
  PreparedStatement sst=null;
  Statement st=null;
  ResultSet rs=null;
	Class.forName("com.mysql.jdbc.Driver");  
 	 con=DriverManager.getConnection("jdbc:mysql://localhost:3307/digitaltunes","root","root");  
  st=con.createStatement();
  rs=st.executeQuery("select username from registration");
  while(rs.next()) {
	  String uname=rs.getString("username");
	  out.println("<option value='"+uname+"'>"+uname+"</option>");}
} catch(Exception e) {
	out.println("<option value='null'>Error Occured or No Users Found</option>");}
%>
</td></tr>
<TR><TD align=right>Subject:</td><td><input name=subject style='width:350px'></td></tr>
<TR><Td align=right valign=top>Message:</td><td><textarea name=message rows=5 cols=50 wrap=off style='width:350px;font-family:tahoma;font-size:11px;font-weight:bold;color:lightslategray;border:1px solid gray;overflow:auto'></textarea></td></tr>
<tr><td colspan=2 align=center><input  type=submit value=Send It !>&nbsp;&nbsp;<input  type=reset value=Refresh></td></tr>
</form></table></fieldset></body></html>
