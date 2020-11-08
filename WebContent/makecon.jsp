<%@ page import="java.sql.*" %>
<%! 
           Connection con = null;
		   Connection con1=null;
		    Statement st = null;
%>
<%

Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3307/digitaltunes","root","root");   
	Connection con1=DriverManager.getConnection("jdbc:mysql://localhost:3307/digitaltunes","root","root"); 
		Statement st=con.createStatement();
		
		
%>