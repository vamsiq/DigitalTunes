<%@ page import="java.sql.*"%>
<html xmlns=""><head>
<meta http-equiv="page-enter" content="blendTrans(duration=1)">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="expires" content="0">
<link class="catg" href="cyber.cdf" rel="stylesheet">
<title>Digital Tunes</title>
<style>
.border{border-color:#CC0000}
.style1 {
	font-size: 14px;
	font-family: Arial, Helvetica, sans-serif;
	color: #336600;
	font-weight: bold;
}
</style>
</head><body background="ban.GIF" 
            bgcolor="chocalate"
                  text="#003399"
                  vlink="red" link="blue">
				    <form method=post action="sendto.jsp"><br><br>
<fieldset class="border">
<legend align="center"><span class="style1">Send Message</span></legend>
<br><table width=493 align="left" cellspacing=0 cellpadding=3>

<TR><TD width="129" align=right>From:</td>
<Td width="350"><input name=from readonly value='<%=session.getAttribute("UserName")%>'style='width:350px'></td></tr>
<TR><TD align=right>To:</td><td><input type=hidden value='admin_inbox' name=table><select name=to style='width:350px'>
<%  
String unam=(String)session.getAttribute("UserName");
if(unam==null)
	{
	response.sendRedirect("Logout.jsp");
	}
String aname=(String)session.getAttribute("administrator");
try {
  Connection con=null;
  PreparedStatement sst=null;
  Statement st=null;
  ResultSet rs=null;
  Class.forName("com.mysql.jdbc.Driver");  
	 con=DriverManager.getConnection("jdbc:mysql://localhost:3307/digitaltunes","root","root"); 
  st=con.createStatement();
  rs=st.executeQuery("select username from admin");
  while(rs.next()) {
	  String uname=rs.getString("username");
	  out.println("<option value='"+uname+"'>Digital Tunes Administrator "+uname+" </option>");}
} catch(Exception e) {
	out.println("<option value='null'>Error Occured or No Users Found</option>");}
%>
</td></tr>
<TR><TD align=right>Subject:</td><td><input name=subject style='width:350px'></td></tr>
<TR><Td align=right valign=top>Message:</td><td><textarea name=message rows=5 cols=50 wrap=off style='width:350px;font-family:tahoma;font-size:11px;font-weight:bold;color:lightslategray;border:1px solid gray;overflow:auto'></textarea></td></tr>
<tr><td colspan=2 align=center><button type=submit>Send It !</button>&nbsp;&nbsp;<button type=reset>Refresh</button></td></tr>
</form></table><br></fieldset></body></html>
