<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.lang.*"%> 
<%@page import="java.sql.*"%> 
<%@page import="Connector.*"%>
<%

//It will throw the the error if occured

		try
		{
			
		   //Getting values from addCustomerDeatils form to store in the variables for inserting into database
			
		    String upfno=request.getParameter("fno");
		    String upfname=request.getParameter("txtflightName");
		    String upsrc=request.getParameter("txtSource");
		    String updest=request.getParameter("txtDestination");
		    Time upartime=Time.valueOf(request.getParameter("timeArrival"));
		    Time updtime=Time.valueOf(request.getParameter("timeDeparture"));
		    String updura=request.getParameter("txtDuration");
		    String upfare=request.getParameter("txtFare");
		    String upcap=request.getParameter("txtCapacity");
		    
			//Create database connectivity with AirlineDatabase
			
			ConnectionProvider a=new ConnectionProvider();
			Connection con=a.connect();			
	      
		    //Creating SQL staements to select all the data from Flight_details where flight_no is given by user for updation
		    
			Statement st=con.createStatement();
			PreparedStatement ps=null;
			ResultSet rs=null;		
		    ps=con.prepareStatement("update m_sing_Flight_Details set flight_name=?, source=?, destination=?, arrival_time=?, destination_time=?, duration=?, Fare=?, Capacity=? where flight_no='"+upfno+"'");
		  	ps.setString(1,upfname);
		   	ps.setString(2,upsrc);
		   	ps.setString(3,updest);
		   	ps.setTime(4,upartime);
		   	ps.setTime(5,updtime);
   		   	ps.setString(6,updura);
		   	ps.setString(7,upfare);
		   	ps.setString(8,upcap);
		    ps.executeQuery();
 		    out.println("Records updated successfully");
   
		}

//It will catch the error if occured 

        catch(Exception e)
        {
        	out.println("not updated");
        }
%>
</body>
</html>