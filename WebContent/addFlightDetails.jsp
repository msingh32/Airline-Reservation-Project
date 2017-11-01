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
<%@page import="Connector.*"%>

<%

Connection con;

//It will throw the the error if occured

		try
		{
			//Getting values from addFlightDetails form to store in the variables for inserting into database
			
			String fno=request.getParameter("flightno");
			String fname=request.getParameter("flightname");
			String src=request.getParameter("source");
			String dest=request.getParameter("destination");
			String dept=request.getParameter("dtime");
			String arr=request.getParameter("atime");
			String dura=request.getParameter("duration");
			String fare=request.getParameter("fare");
			String cap1=request.getParameter("capacity");
			String message="";
			
			//Create database connectivity with AirlineDatabase
			
			ConnectionProvider a=new ConnectionProvider();
			con=a.connect();		
			
		  //Creating SQL staements to select all the data from Flight_details where flight_no is given by user
		    String sql1="create table if not exists m_sing_Flight_Details"+
						"(flight_no varchar(50) PRIMARY KEY,"+
  						"flight_name varchar(100),"+
  						"source varchar(100),"+
       					"destination varchar(80),"+
 						"arrival_time varchar(75),"+
 						"destination_time varchar(80),"+
  						"duration varchar(80),"+
  						"fare varchar(80),"+
  						"capacity int(80))";
		 	 int cap=Integer.parseInt(cap1);
		    Statement st;
		    PreparedStatement ps=null;
		    ResultSet rs;
		    ps=con.prepareStatement(sql1);
		    ps.executeUpdate(sql1);
		    ps=con.prepareStatement("select * from m_sing_Flight_Details where flight_no='"+fno+"'");
            rs=ps.executeQuery();
            
          //Check whether the flight exists or not in the database with same flight_no
            
            if(rs.next())
            {
            	//If exists this msg will be displayed
            	
            	message="This flight details already exist";
            %>
            
            
            <script type="text/javascript"> 
          //After displaying alert with "This flight details already exist" message it redirects to main form to add details of flight
            
   				alert("<%= message %>");
   				location="addFlightDetails.html";
   		 
      			</script>
           <% }
          
            //If the flight does not exist in database then following sql will execute to insert value in Flight_details table
            
            else
            {
            	String sql="insert into m_sing_Flight_Details values('"+fno+"','"+fname+"','"+src+"','"+dest+"','"+dept+"','"+arr+"','"+dura+"','"+fare+"','"+cap+"')";
            	ps=con.prepareStatement(sql);
            	ps.executeUpdate();
		    	message="New Flight Deatils are Inserted";

            	%>
            	<script type="text/javascript"> 
            	
            	//After displaying alert with "New Flight Deatils are Inserted" message it redirects to main form to add details of flight
           	 
   		
   				alert("<%= message %>");
   				location="addFlightDetails.html";
   		 
      			</script>
            	
           <% }
		}
		catch(Exception e)
		{
			out.println("data is not inserted" +e);
		}
            
            
            
%>
</body>
</html>