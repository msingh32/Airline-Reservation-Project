<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<%@ page language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.lang.*"%> 
<%@page import="Connector.*"%>
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
String flightno,flightname,source1,destination1,atime,dtime,fare1,capacity1,duration1;
		try
		{   
			 
			
			 flightno=request.getParameter("flightno");
			 flightname=request.getParameter("flightname");
			 source1=request.getParameter("source");
			 destination1=request.getParameter("destination");
			 dtime=request.getParameter("dtime");
			 atime=request.getParameter("atime");
			 duration1=request.getParameter("duration");
			 fare1=request.getParameter("fare");
			 capacity1=request.getParameter("capacity");
			 ConnectionProvider a=new ConnectionProvider();
			Connection con=a.connect();			
		    Statement st=con.createStatement();
		    String query="update m_sing_Flight_Details set flight_name=?,source=?,destination=?,arrival_time=?,destination_time=?,duration=?,fare=?,capacity=? WHERE flight_no=?";
            PreparedStatement preparedStmt = con.prepareStatement(query);           
            preparedStmt.setString(1,flightname);
            preparedStmt.setString(2,source1);
            preparedStmt.setString(3,destination1);
            preparedStmt.setString(4,dtime);
            preparedStmt.setString(5,atime);
            preparedStmt.setString(6,duration1);
            preparedStmt.setString(7,fare1);
            preparedStmt.setString(8,capacity1);        
            preparedStmt.setString(9,flightno);            
            preparedStmt.executeUpdate();
            String message="Flight Details Updated";
	        %>
	         <script type="text/javascript"> 
	    		
				alert("<%= message %>");
				location="updateFlightDetails.jsp";
		 
   			</script>
     
	<%	
                      
           } 
            
        catch(Exception e)
		{ 
    		System.out.println(e);
    		
		}
%>
	
	 </form>
	 
</body>
</html>