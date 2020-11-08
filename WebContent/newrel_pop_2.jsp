
<%String unam=(String)session.getAttribute("UserName");
if(unam==null)
{
response.sendRedirect("Logout.jsp");
} %>
<html>
<head>
<style>.LFont {	FONT-WEIGHT: bold; FONT-SIZE: 10pt; COLOR:  black; FONT-FAMILY: verdana } .formText {	BORDER-RIGHT: #aaaaaa 1px solid; BORDER-TOP: #aaaaaa 1px solid; FONT-SIZE: 11px; BORDER-LEFT: #aaaaaa 1px solid; COLOR: pink; BORDER-BOTTOM: #aaaaaa 1px solid; FONT-FAMILY: verdana} .white10 {	FONT-SIZE: 10pt; COLOR: #ffcc00; FONT-FAMILY: Arial, Helvetica,sans-serif}.white10 A:link {	COLOR:  #ffcc00; TEXT-DECORATION: none}.white10 A:visited {	COLOR:#ffcc00; TEXT-DECORATION: none}.white10 A:active {	COLOR:#ffcc00; TEXT-DECORATION: none}.white10 A:hover {	COLOR:red; TEXT-DECORATION: none}
</style>
</head> 
<body background=ban.GIF> 
<CENTER><h1>ONLINESHOPPING-E- Music World</H1><BR>
<CENTER><H2>SELECTING FILMS</H2>
<%

String s1=request.getParameter("pop");
String s=request.getParameter("region");
String s2=request.getParameter("a");

if(s2.equalsIgnoreCase("film"))
{
String t="";
if(s.equals("USA"))
t="$";
if(s.equals("INDIA"))
t="Rs.";
if(s.equals("EUROPE"))
t="@";
if(s1.equalsIgnoreCase("Old POP"))
{
out.println("<form action=MorePop.jsp><TABLE border=0> <TR><TD align=center> <img src=OP.JPG align=center width=100 height=100></img></TD> <TD align=center><img src=OP1.JPG align=center width=100 height=100></img></TD><TD align=center><img src=OP2.JPG align=center width=100 height=100></img></TD></TR> <TR><TD><input type=checkbox name=opop1>"+t+":175/-</TD><TD><input type=checkbox name=opop2>"+t+":180/-</TD><TD><input type=checkbox name=opop3>"+t+":185/-</TD> <TD><INPUT TYPE=submit VALUE=SUBMIT></TD></TR></TABLE></form></body></html>");
}
if(s1.equalsIgnoreCase("New POP"))
{
out.println("<form action=MorePop.jsp><TABLE border=0> <TR><TD align=center> <img src=NP.JPG align=center width=100 height=100></img></TD> <TD align=center><img src=NP1.JPG align=center width=100 height=100></img></TD><TD align=center><img src=NP2.JPG align=center width=100 height=100></img></TD></TR> <TR><TD><input type=checkbox name=npop1>"+t+":200/-</TD><TD><input type=checkbox name=npop2>"+t+":210/-</TD><TD><input type=checkbox name=npop3>"+t+":200/-</TD> <TD><INPUT TYPE=submit VALUE=SUBMIT></TD></TR></TABLE></form></body></html>");
}
}
else
if(s2.equalsIgnoreCase("price"))
{%>
<jsp:include page="price.html" />
<%
}
else
if(s2.equalsIgnoreCase("cat"))
{%>
<jsp:forward page="cat.html" />
<%
}
else
if(s2.equalsIgnoreCase("singer"))
{%>
<jsp:include page="singer.html" />
<%
}
%>

</html>