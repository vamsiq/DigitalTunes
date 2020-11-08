<%@ include file="makecon.jsp" %>
<%@ page import="java.util.*"%>

<%
String unam=(String)session.getAttribute("UserName");
if(unam==null)
	{
	response.sendRedirect("Logout.jsp");
	}

try{ 
PreparedStatement ps;
ResultSet rs=st.executeQuery("select *  from cart");
System.out.println("Statement executed");
out.println("<html><head><style>.LFont {	FONT-WEIGHT: bold; FONT-SIZE: 10pt; COLOR:  black; FONT-FAMILY: verdana } .formText {	BORDER-RIGHT: #aaaaaa 1px solid; BORDER-TOP: #aaaaaa 1px solid; FONT-SIZE: 11px; BORDER-LEFT: #aaaaaa 1px solid; COLOR: black; BORDER-BOTTOM: #aaaaaa 1px solid; FONT-FAMILY: verdana} .white10 {	FONT-SIZE: 10pt; COLOR: #ffcc00; FONT-FAMILY: Arial, Helvetica,sans-serif}.white10 A:link {	COLOR:  #ffcc00; TEXT-DECORATION: none}.white10 A:visited {	COLOR:#ffcc00; TEXT-DECORATION: none}.white10 A:active {	COLOR:#ffcc00; TEXT-DECORATION: none}.white10 A:hover {	COLOR:red; TEXT-DECORATION: none}</style></head> <body background=ban.GIF> <form action=Cal.jsp ><center> <table border=10>");
out.println("<tr class=LFont> <td> Itemname  </td><td>  Price  </td><td>  Film  </td><td> Quantity  </td></tr>");
int j=1;

while(rs.next())
{
	System.out.println("This is from cart");
String 	t=rs.getString(1);
	int	t1=rs.getInt(2);
	String 	t2=rs.getString(3);
	%>
	
<tr class=LFont >
<td><%=t%></td><td><%=t1%></td><td><%=t2%></td>
<td><center>
			<select name=quan>
			<% for(int i=0;i<=10;i++) {%>
			  <option value="<%=i%>"><%=i%></option><%}%> </center></td></tr>

 <input type="hidden" name="t" value="<%=t%>">
<%
	j++;
}
j=j-1;
out.println("<tr><td colspan=3><center><input  class=formText type=Submit value=\"Order for Items in Cart\"></center></td><td colspan=2><center><input class=formText type=reset value=Reset ></center></td></tr></table><br><br>");
//out.println("<b class=LFont>To Add more  items to Cart click the below link's<br><br><br>");
out.println("</table><input type=hidden name=st value=\""+j+"\"></form></body></html>");
	rs.close();
	st.close();
	con.commit();
	con.close();

	
}catch (Exception e)
{
	e.printStackTrace();
	System.out.println(e);}%>

 
