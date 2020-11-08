<%@ include file="makecon.jsp" %>
<%@ page import="java.util.*"%>

<%
String unam=(String)session.getAttribute("UserName");
if(unam==null)
	{
	response.sendRedirect("Logout.jsp");
	}
String s[]=new String[30];
String sr="";
Enumeration em=request.getParameterNames();%>
<%
int i=0;
while(em.hasMoreElements())
{
s[i]=(String)em.nextElement();
if(i==0)
sr="'"+s[i]+"'";
else
sr+=",'"+s[i]+"'";
i++;
}
if(sr.equals(""))
{%>
<jsp:forward page="nsele.html" />
<%}
else
{
System.out.println(sr);
try{ 
PreparedStatement ps;
ResultSet rs=st.executeQuery("select *  from film1 where itemname in("+sr+")");
System.out.println("Statement executed");
out.println("<html><head><style>.LFont {	FONT-WEIGHT: bold; FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: verdana }.formText {	BORDER-RIGHT: #aaaaaa 1px solid; BORDER-TOP: #aaaaaa 1px solid; FONT-SIZE: 11px; BORDER-LEFT: #aaaaaa 1px solid; COLOR: black; BORDER-BOTTOM: #aaaaaa 1px solid; FONT-FAMILY: verdana}</style></head> <body background=ban.GIF  text=red > <form action=Inter.jsp >");

        
while(rs.next())
{
int	t=rs.getInt(1);
	String	t1=rs.getString(2);
	int	t2=rs.getInt(3);
	 ps=con.prepareStatement("insert into cart values(?,?,?)");
ps.setInt(1,t);
ps.setString(2,t1);
ps.setInt(3,t2);

int u=ps.executeUpdate();

}
con.commit();
out.println("<b class=LFONT>Selected Items are placed in the Cart<br><br><br>");
out.println("<input type=submit class=formText value=\"Show Cart\"><br><br>");
out.println("To add more Items to Cart select ur link below<br><br><br>");
        out.println("<TABLE>        <TBODY>        <TR align=middle><TD class=white10><a href=project.html target=_top>home</a></TD></TR></TBODY></TABLE>");
}catch (Exception e)
{
	System.out.println(e);
	%>
	<jsp:forward page="Inselec.html" />
	<%
	}
}
	%>

 
