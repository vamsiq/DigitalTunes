<%@ page session="true"%>
<%@ include file="makecon.jsp" %>
<% String s=request.getParameter("PRICE");
int i=Integer.parseInt(s.substring(0,3).trim());
int j=Integer.parseInt(s.substring(4,7).trim());
	String user=(String)session.getAttribute("UserName");
	System.out.println(user);
int ct=0;
String itemname=null;
String film=null,cat=null;
int price=0;
%>

<html><head>
<style>.LFont {	FONT-WEIGHT: bold; FONT-SIZE: 10pt; COLOR: black; FONT-FAMILY: verdana } .formText {	BORDER-RIGHT: #aaaaaa 1px solid; BORDER-TOP: #aaaaaa 1px solid; FONT-SIZE: 11px; BORDER-LEFT: #aaaaaa 1px solid; COLOR: black; BORDER-BOTTOM: #aaaaaa 1px solid; FONT-FAMILY: verdana} .white10 {	FONT-SIZE: 10pt; COLOR: #ffcc00; FONT-FAMILY: Arial, Helvetica,sans-serif}.white10 A:link {	COLOR:  #ffcc00; TEXT-DECORATION: none}.white10 A:visited {	COLOR:#ffcc00; TEXT-DECORATION: none}.white10 A:active {	COLOR:#ffcc00; TEXT-DECORATION: none}.white10 A:hover {	COLOR:red; TEXT-DECORATION: none}</style>
</head> 
<body background="ban.GIF"> <center> 
<br><br>

<table  border=10 >
<tr class="Lfont">
<font  color=#bb055e>
<th>ItemName</th><th>ItemPrice</th><th>Category</th><th>Film</th><th>Quantity
</th></font></tr>
<form action="Cal.jsp">
<%
String unam=(String)session.getAttribute("UserName");
if(unam==null)
	{
	response.sendRedirect("Logout.jsp");
	}
try{

ResultSet rs=st.executeQuery("select * from search where price>="+i+" and price<="+j);
System.out.println("Statement executed");
while(rs.next())
{
%>
			   <tr class="LFont"><center><font color=#bb055e>
				<% ct=rs.getInt("itemno"); itemname=rs.getString("itemname");price=rs.getInt("price");cat=rs.getString("category");
				film=rs.getString("film");%>
			  <td><center><%=itemname%></center></td>
			  <input type=hidden name="t" value="<%=itemname%>">
              <td><center><%=price%></center></td>
              <td><center><%=cat%></center></td>
              <td><center><%=film%></center></font></td>
			  <td><center>
			<select name="quan">
			<% for(int in=0;in<=10;in++) {%>
			  <option value="<%=in%>"><%=in%></option><%}%> </center></td></tr>
<%

PreparedStatement	ps=con1.prepareStatement("insert into cart values(?,?,?)");
ps.setString(1,itemname);
ps.setInt(2,price);
ps.setString(3,film);
ps.executeUpdate();
}%>
<tr class="Lfont"><td></td><td></td><td align="center">
<input type="submit" value="submit"></td></tr>
</TABLE>
<%
out.println("	</form>");
  }
catch(Exception e)
{
out.println(e);
}
%>
</body>
</html>



