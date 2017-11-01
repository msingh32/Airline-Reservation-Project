<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deletion of Flight Details</title>
</head>
<body>

<%@ page language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.lang.*"%> 
<%@page import="Connector.*"%>
<%@page import="java.sql.*"%>
<%

//It will throw the the error if occured

		try
		{
			//Getting values from form to store in the variables for deleting the flight_details from the database
			
			String fnum= request.getParameter("delete");
			
			//Create database connectivity with AirlineDatabase
			
			ConnectionProvider a=new ConnectionProvider();
			Connection con=a.connect();		
			
		  //Creating SQL staements to select all the data from Flight_details where flight_no is given by user
		    
		    Statement st=null;
		    PreparedStatement ps=null;
		    ResultSet rs=null;
		    String message="";
		    ps=con.prepareStatement("select flight_no from m_sing_Flight_Details where flight_no = '"+fnum+"'");
		    rs=ps.executeQuery();
		    if(rs.next())
		    {
		    	String query = "delete from m_sing_Flight_Details where flight_no='"+fnum+"'";
		    	ps=con.prepareStatement(query);
		    	ps.executeUpdate();
		    	
		    	message="Flight detail with flight number " +fnum+ " deleted";

		    	%>
		    	
		    	<script type="text/javascript">
		    	
		    	//If Deleted the message stating the "Flight detail is sucessfully deleted" will be displayed
            	
   				alert("<%= message %>");
   				location="Admin1.html";
   		 
      			</script>
		    	
		   <% }
		    else
		    {
		    
		    	message="There is no record with the flight number " +fnum;
		    %>
		    
		    	<script type="text/javascript">
		    	
		    	//It will display the message stating the "There is no record" will be displayed
            	
            	alert("<%= message %>");
            	location="delFlight.html";
        		</script>
		    	
		    	
		   <% }
			
		}	

//It will catch the error if occured 

		catch(Exception e)
		{
			System.out.println("There is no data found");
			
		} %>
</body>
</html>