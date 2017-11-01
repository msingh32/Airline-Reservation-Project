<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
 <%@ page import = "java.sql.*,java.util.*" %>
 <%@ page import = "java.sql.*,java.util.*" %>
 <%@page import="Connector.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>JSP Files</title>
</head>
<body>
<form>
			<% 
			String snum,fno,doj;
			String Confirmationnumber="",Customer_ID="",Flight_no="",Flight_name="",Source="",Destination="",Booking_Date="",Departure_time="",Arrival_time="",
			duration="",dateofjour="";
			int Seat_number=0,Fare=0;

			//It will throw the the error if occured
	
				try
				{  
										String sql1="create table if not exists m_sing_Cancellation_Details"+
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
								"dateofjour varchar(80),"+
								"canceldt varchar(80))";

					Date date = new Date();
					SimpleDateFormat format=new SimpleDateFormat("yyyy-MM-dd");
					String candate= format.format(date);
					String candate1= new SimpleDateFormat("yyyy-MM-dd").format(date);

					//Getting values from cancel form to store in the variables for selecting from database
					
					String cno=request.getParameter("cnum");
					fno=request.getParameter("flno");
					snum=request.getParameter("snum");
					doj=request.getParameter("doj");
					//Create database connectivity with AirlineDatabase
					
					ConnectionProvider b=new ConnectionProvider();
					Connection con=b.connect();			
	      			Statement st=con.createStatement();
				   	//String dateStop=request.getParameter("candate");
					
					//HH converts hour in 24 hours format (0-23), day calculation
					
					Date d1= null;
					Date d2= null;
					d1=format.parse(doj);
					d2=format.parse(candate);	
		     long diff = d1.getTime() - d2.getTime();
			long diff2 = d2.getTime()- d2.getTime();			
			long diffSeconds = diff / 1000 % 60;
			long diffMinutes = diff / (60 * 1000) % 60;
			long diffHours = diff / (60 * 60 * 1000) % 24;
			long diffDays = diff / (24 * 60 * 60 * 1000);
			System.out.println(diffDays);
			//If condition to check the difference in the date of journey and cancelation date for refund status
			
			if(diffDays>2)
			{
				//If the difference in days is less than 2 days then 50 percent amount will be deducted
				
					//System.out.println(" You will be charged penalty of 50% amount deduction");
					String cost=request.getParameter("fare");
					double intcost=Double.parseDouble(cost);
					double a = (0.3) * intcost;					
					intcost=intcost-a;					
					String deduction=String.valueOf(intcost);
					
					String sql="select * from m_sing_Reservation_Details where Confirmationnumber='"+cno+"'";
		            Statement stmt= con.createStatement();  
		            ResultSet rs=stmt.executeQuery(sql);				
		            while(rs.next())
		            {
		        	
		            	//Getting values from Flight_Details table to store in the variables for booking
		    			
		            Confirmationnumber=rs.getString("Confirmationnumber");
		            Customer_ID=rs.getString("Customer_ID");
		            Flight_no=rs.getString("Flight_no");
		            Flight_name=rs.getString("Flight_name");
		            Source=rs.getString("Source");
		            Destination=rs.getString("Destination");
		            Booking_Date=rs.getString("Booking_Date");
		            Departure_time=rs.getString("Departure_time");	
		          //  Source=rs.getString("Source");
		            Arrival_time=rs.getString("Arrival_time");
		            Seat_number=rs.getInt("Seat_number");
		            Fare=rs.getInt("Fare");	
		            duration=rs.getString("duration");
		            dateofjour=rs.getString("dateofjour");
		            }
		            PreparedStatement preparedStmt=con.prepareStatement(sql1);
		            preparedStmt.executeUpdate();
			    	
		            String sql2="insert into m_sing_Cancellation_Details values('"+Confirmationnumber+"','"+Customer_ID+"','"+Flight_no+"','"+Flight_name+"','"+Source+"','"+Destination+"','"+Booking_Date+"','"+Departure_time+"','"+Arrival_time+"','"+Seat_number+"','"+Fare+"','"+duration+"','"+dateofjour+"','"+candate1+"')";
		             preparedStmt = con.prepareStatement(sql2);  
		            preparedStmt=con.prepareStatement(sql2);
					preparedStmt.executeUpdate();
					
		            String query="delete from m_sing_Reservation_Details where Confirmationnumber=?";
		           
		            preparedStmt = con.prepareStatement(query);  
		            preparedStmt.setString(1,cno);
		            preparedStmt.executeUpdate();					
					out.println(intcost);					
					
					//After cancellation the following message has been displayed stating "Ticket has been cancelled"
					
				     String message="Ticket has been cancelled you will be chareged penalty of 30% amount deduction "+ intcost;
				        %>
				         <script type="text/javascript"> 
				    		
							alert("<%= message%>");
							location="Employee.html";
					 
			   			</script>
			<%     
			}
			
			//If the difference in days is greater than 2 days then 30 percent amount will be deducted
			
			else
					{
				
				String cost=request.getParameter("fare");
				double intcost=Double.parseDouble(cost);
				double a = (0.5) * intcost;				
				intcost=intcost-a;				
				String deduction=String.valueOf(intcost);
				String sql="select * from m_sing_Reservation_Details where Confirmationnumber='"+cno+"'";
	            Statement stmt= con.createStatement();  
	            ResultSet rs=stmt.executeQuery(sql);				
	            while(rs.next())
	            {
	        	
	            	//Getting values from Flight_Details table to store in the variables for booking
	    			
	            Confirmationnumber=rs.getString("Confirmationnumber");
	            Customer_ID=rs.getString("Customer_ID");
	            Flight_no=rs.getString("Flight_no");
	            Flight_name=rs.getString("Flight_name");
	            Source=rs.getString("Source");
	            Destination=rs.getString("Destination");
	            Booking_Date=rs.getString("Booking_Date");
	            Departure_time=rs.getString("Departure_time");	
	          //  Source=rs.getString("Source");
	            Arrival_time=rs.getString("Arrival_time");
	            Seat_number=rs.getInt("Seat_number");
	            Fare=rs.getInt("Fare");	
	            duration=rs.getString("duration");
	            dateofjour=rs.getString("dateofjour");
	            }
	            
	            PreparedStatement preparedStmt=con.prepareStatement(sql1);
	            preparedStmt.executeUpdate();
		    	
	            String sql2="insert into m_sing_Cancellation_Details values('"+Confirmationnumber+"','"+Customer_ID+"','"+Flight_no+"','"+Flight_name+"','"+Source+"','"+Destination+"','"+Booking_Date+"','"+Departure_time+"','"+Arrival_time+"','"+Seat_number+"','"+Fare+"','"+duration+"','"+dateofjour+"','"+candate+"')";
	            preparedStmt = con.prepareStatement(sql2);  
	  //          preparedStmt=con.prepareStatement(sql2);
				preparedStmt.executeUpdate();
				
	            String query="delete from m_sing_Reservation_Details where Confirmationnumber=?";
	           
	            preparedStmt = con.prepareStatement(query);  
	            preparedStmt.setString(1,cno);
	            preparedStmt.executeUpdate();					
				out.println(intcost);					
				
				 String message="Ticket has been cancelled you will be chareged penalty of 50% amount deduction "+ intcost;
				        %>
				         <script type="text/javascript"> 
				    		
				       //After cancellation the following message has been displayed stating "Ticket has been cancelled"
							
							alert("<%= message%>");
							location="Employee.html";
					 
			   			</script>
			<%     
			}
		    ResultSet rs=st.executeQuery("select Capacity from m_sing_Flight_Details where flight_no='"+fno+"'");
			 while(rs.next())
	            {
			            String cap=rs.getString("Capacity");
			            request.setAttribute(cap, cap);
			            int intcap=Integer.parseInt(cap);
			            
			            
						intcap=intcap+1;
				    	String seat=String.valueOf(intcap);
		
			            
							String sql="update m_sing_Flight_Details set capacity= ? where flight_no=?";
							PreparedStatement preparedStmt = con.prepareStatement(sql);  
				            preparedStmt.setString(1,seat);
				            preparedStmt.setString(2,fno);
				            preparedStmt.executeUpdate();
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