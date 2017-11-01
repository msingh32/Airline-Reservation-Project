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

<link href="styles.css" type="text/css" rel="stylesheet" media="all" />

</head>
<body>
<form method="post">

<%

Connection con;
Date date = new Date();
String bookdate= new SimpleDateFormat("yyyy-MM-dd").format(date);
String sql1="create table if not exists m_sing_Reservation_Details"+
		"(Confirmationnumber int(50) PRIMARY KEY,"+
			"Customer_ID varchar(100),"+
			"Flight_no varchar(100),"+
			"Flight_name varchar(80),"+
			"Source varchar(75),"+
			"Destination varchar(80),"+
			"Booking_Date varchar(80),"+
			"Departure_time varchar(80),"+
			"Arrival_time varchar(80),"+
			"Seat_number int(50),"+
			"Fare int(80),"+
			"duration varchar(80),"+
			"dateofjour varchar(80))";


//It will catch the error if occured 

			try
			{  
				int d=0;
				int confirm=0;
				Random rand=new Random();
				
				//Getting Customer details
				String cid=request.getParameter("custid");
				
				//Getting flight id for boking the seat
				
				
			String book=request.getParameter("flightno");
			String flightname=request.getParameter("flightname");
			String source=request.getParameter("source");
			String destination=request.getParameter("destination");
			String dtime=request.getParameter("dtime");
			String atime=request.getParameter("atime");
			String duration=request.getParameter("duration");
			String fare=request.getParameter("fare");
			String capacity=request.getParameter("capacity");
			String doj=request.getParameter("doj");
			
			
				
				//Converting String values of flight id to integer value
				
				int capacity1=Integer.parseInt(capacity);
						
				//Create database connectivity with AirlineDatabase
				
				ConnectionProvider a=new ConnectionProvider();
				con=a.connect();			
	     		
				//Executing SQL staements to book the ticket 
			    
				Statement st=con.createStatement();
				//String sql2=" Drop table if exists m_sing_Reservation_Details ";
			    if(capacity1 > 0)
			    {
			    	capacity1=capacity1-1;		
			    	confirm=Math.abs(rand.nextInt(100000))+1;
					d=Math.abs(rand.nextInt(capacity1));
					String seat=String.valueOf(capacity1);
			    	String query="update m_sing_Flight_Details set Capacity= ? where flight_no=?";
		            PreparedStatement preparedStmt = con.prepareStatement(query);  
		            preparedStmt.setInt(1,capacity1);
		            preparedStmt.setString(2,book);
		            preparedStmt.executeUpdate();
		         //   preparedStmt.executeUpdate(sql2);
				     String message="Your tickets have been booked successfully"+ "Seat number is"+d+"and the confirmation number is"+confirm;
				    preparedStmt=con.prepareStatement(sql1);
			    	preparedStmt.executeUpdate(sql1);
			    	//Sql statement executed to drop the table if it already exists
					String sql="insert into m_sing_Reservation_Details values('"+confirm+"','"+cid+"','"+book+"','"+flightname+"','"+source+"','"+destination+"','"+bookdate+"','"+dtime+"','"+atime+"','"+d+"','"+fare+"','"+duration+"','"+doj+"')";
					preparedStmt=con.prepareStatement(sql);
					preparedStmt.executeUpdate();
			    	message="Your ticket has been booked"+" "+confirm+"  "+"Is your confirmation number";       
		           %>
		          <script type="text/javascript"> 
		          
		        //After booking the ticket an alert is issued stating "Your tickets have been booked successfully" by redirecting to employee page
		        
				alert("<%= message %>");
				location="Employee.html";
		 
   			</script>
		         
		          
		          <%
			    }
			    else
			    {
			    	//If the seat is not available then it will prompt"Sorry, no seats available"
			    	
			    	out.println("Sorry, no seats available");	
			    }
			   
			}

			//It will catch the error if occured 

			catch(Exception e)
			{
				System.out.println(e);		
			}


%>

</form>
</body>
</html>