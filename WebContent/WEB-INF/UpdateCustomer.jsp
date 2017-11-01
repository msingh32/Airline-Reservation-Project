<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<%@ page language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.lang.*"%> 

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form name="form1">

<%
String custid,custfname,Lname,birthdt,email,phone,add;
		try
		{   
			 
			custid=request.getParameter("custid");
			custfname=request.getParameter("custfname");
			Lname=request.getParameter("Lname");
			birthdt=request.getParameter("birthdt");
			email=request.getParameter("email");
			phone=request.getParameter("phone");
			 add=request.getParameter("add");
			 Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();
			System.out.println("Successful");
		    Connection con=DriverManager.getConnection("jdbc:odbc:AirlineDatabase");  
        	System.out.println("Successful");
		    Statement st=con.createStatement();
		    System.out.println("Successful");
            String query="update Flight_details set flight_name=?,source=?,destination=?,destination_time=?,arrival_time=?,duration=?,fare=?,capacity=? WHERE flight_no=?";
            PreparedStatement preparedStmt = con.prepareStatement(query);           
            preparedStmt.setString(1,custid);
            preparedStmt.setString(2,custfname);
            preparedStmt.setString(3,Lname);
            preparedStmt.setString(4,birthdt);
            preparedStmt.setString(5,phone);
            preparedStmt.setString(6,email);
            preparedStmt.setString(7,add);
            preparedStmt.executeUpdate();
            System.out.println("Shri Ram");
                      
           } 
            
        catch(Exception e)
		{ 
    		System.out.println(e);
    		
		}
%>
	
	 </form>
	 
</body>
</html>