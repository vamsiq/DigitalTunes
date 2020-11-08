<%@ page import="java.sql.*" %>
<%! 
           Connection con = null;
		   Connection con1=null;
		    Statement st = null;
%>
<%
String unam=(String)session.getAttribute("UserName");
if(unam==null)
	{
	response.sendRedirect("Logout.jsp");
	}
	String[] s1={"NF","NF1"};
	try{
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/digitaltunes","root","root"); 
		PreparedStatement st=con.prepareStatement("select * from test");
		ResultSet rs=st.executeQuery();
		while(rs.next())
		{
		String s=rs.getString("filmname");
		for(int i=0;i<s1.length;i++)
			{
		if(s.indexOf(s1[i])!=-1)
			out.println(s);
		String s2=s+".jpg";
			out.println("<img src='"+s2+"'> ");

		%>
	
		<%  break;
			}
		}
}catch(Exception e){e.printStackTrace();}

		
		
%>