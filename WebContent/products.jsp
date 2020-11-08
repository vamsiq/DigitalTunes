<%@ include file="makecon.jsp" %>
<%@ page import="java.util.*"%>
<%String s[]=new String[30];
String sr="";
Enumeration em=request.getParameterNames();%>
<%
String unam=(String)session.getAttribute("UserName");
if(unam==null)
	{
	response.sendRedirect("Logout.jsp");
	}
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
out.println(sr);
try{ 
ResultSet rs=st.executeQuery("select *  from film1 where itemname in("+sr+")");
System.out.println("Statement executed");
out.println("<html><head> <body> <form action=order.jsp >");
PreparedStatement ps=null;
ps=con.prepareStatement("insert into cart values(?,?,?)");
while(rs.next())
{
int itc=rs.getInt(1);
String its=rs.getString(2);
int itp=rs.getInt(3);
ps.setInt(1,itc);
ps.setString(2,its);
ps.setInt(3,itp);
int v=ps.executeUpdate();
}
out.println("Selected items are add to Cart");
out.println("Want to add to Cart some more elements........<a href=project3.html>Click</a>");

out.println("<tr><td><input type=Submit value=Order></td></tr>");


}catch (Exception e)
{
%>
<jsp:forward page="invsele.html" />
<%
out.println(e);

}

%>


 
