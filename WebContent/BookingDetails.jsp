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
<html class="html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link href="styles.css" type="text/css" rel="stylesheet" media="all" />


</head>
<body class="body">
 <form name="form1" action="BookCode.jsp"  method="post">
<%

Connection con;

//List of variables are declared for further processing

String cid,First_Name,Last_Name,Birth_Date,Email_ID,Phone_No,Address,source,destination;
String fno,fname,arrival_time,destination_time,fare,capacity,duration;

//It will throw the the error if occured
		
try
		{   
	
	//Getting values from Book form to store in the variables for booking the flight
	
			String book=request.getParameter("Book");
			cid=request.getParameter("custid");
			First_Name=request.getParameter("custfname");
			Last_Name=request.getParameter("Lname");
			Birth_Date=request.getParameter("birthdt");
			Email_ID=request.getParameter("email");
			Phone_No=request.getParameter("phone");
			Address=request.getParameter("add");	
			
			//Create database connectivity with AirlineDatabase
			
			ConnectionProvider a=new ConnectionProvider();
			con=a.connect();		
			//Creating SQL staements to select all the data from Flight_details where flight_no is given by user
		    
        	Statement st=con.createStatement();
		    ResultSet rs=st.executeQuery("select * from m_sing_Flight_Details where flight_no='"+book+"'");
            
		    //Stored variables are set as attribute from variables
		    
            request.setAttribute("cid",cid);
            request.setAttribute("First_Name",First_Name);
            request.setAttribute("Last_Name",Last_Name);
            request.setAttribute("Birth_Date",Birth_Date);
            request.setAttribute("Email_ID",Email_ID);
            request.setAttribute("Phone_No",Phone_No);
            request.setAttribute("Address",Address);
          
            %>  
            <table>
					<tr><td colspan="2" align="left"><h2><strong>Customer Details</strong>
					</h2></td></tr>
					<tr>
					
					<td >
					Customer ID:
					</td>
					<td>
					<input type="text" name="custid" class="input" value='<%=request.getAttribute("cid")%>'/>
					</td>
					</tr>
					
					<tr>
					<td>
					First Name:
					</td>
					<td>
					<input type="text" name="custfname" class="input" value='<%=request.getAttribute("First_Name")%>'/>
					</td>
					</tr>
					
					<tr>
					<td>
					Last name:
					</td>
					<td>
					<input type="text" name="Lname" class="input" value='<%=request.getAttribute("Last_Name")%>'/>
					</td>
					</tr>
					
					<tr>
					<td>
					Date of Birth:
					</td>
					<td>
					<input type="text" name=birthdt class="input" value='<%=request.getAttribute("Birth_Date")%>'/>
					</td>
					</tr>
					
					<tr>
					<td>
					Email_Id :</td>
					<td>
					<input type="text" name="email" class="input" value='<%=request.getAttribute("Email_ID")%>'/>
					</td>
					</tr>
					
					
					<tr>
					<td>
					Phone Number:
					</td>
					<td>
					<input type="text" name="phone" class="input" value='<%=request.getAttribute("Phone_No")%>'/>
					</td>
					</tr>
					
					
					<tr>
					<td>
					Address</td>
					<td>
					<input type="text" name="add" class="input" value='<%=request.getAttribute("Address")%>'/>
					</td>
					</tr>
			
           <% 
           
    	   
    	  
            while(rs.next())
            {
        	
            	//Getting values from Flight_Details table to store in the variables for booking
    		fno=rs.getString("flight_no");	
            fname=rs.getString("flight_name");
            source=rs.getString("source");
            destination=rs.getString("destination");
            arrival_time=rs.getString("arrival_time");
            destination_time=rs.getString("destination_time");
            duration=rs.getString("duration");
            fare=rs.getString("fare");
            capacity=rs.getString("capacity");
            
          //Stored variables are set as attribute from variables
		    request.setAttribute("fno",fno);
            request.setAttribute("fname",fname);
            request.setAttribute("source",source);
            request.setAttribute("destination",destination);
            request.setAttribute("arrival_time",arrival_time);
            request.setAttribute("destination_time",destination_time);
            request.setAttribute("duration",duration);
            request.setAttribute("fare",fare);
            request.setAttribute("capacity",capacity);    
            
            
          }%>
          
         
<tr>          
<td colspan="2" align="left">
<h2><strong>Flight Details</strong></h2>    
</td>
</tr>         
<tr>
<td >
Flight Number:
</td>
<td>
<input type="text" name="flightno" class="input" value="<%=request.getAttribute("fno")%>"/>
</td>
</tr>

<tr>
<td>
Flight Name:
</td>
<td>
<input type="text" name="flightname" class="input" value='<%=request.getAttribute("fname")%>'/>
</td>
</tr>

<tr>
<td>
Source:
</td>
<td>
<input type="text" name="source" class="input" value='<%=request.getAttribute("source")%>'/>
</td>
</tr>

<tr>
<td>
Destination:
</td>
<td>
<input type="text" name="destination" class="input" value='<%=request.getAttribute("destination")%>'/>
</td>
</tr>

<tr>
<td>
Departure time:
</td>
<td>
<input type="text" name="dtime" class="input" value='<%=request.getAttribute("arrival_time")%>'/>
</td>
</tr>


<tr>
<td>
Arrival time:
</td>
<td>
<input type="text" name="atime" class="input" value='<%=request.getAttribute("destination_time")%>'/>
</td>
</tr>

<tr>
<td>
Duration:
</td>
<td>
<input type="text" name="duration" class="input" value='<%=request.getAttribute("duration")%>'/>
</td>
</tr>

<tr>
<td>
Fare:
</td>
<td>
<input type="text" name="fare" class="input" value='<%=request.getAttribute("fare")%>'/>
</td>
</tr>

<tr>
<td>
Capacity:
</td>
<td>
<input type="text" name="capacity" class="input" value='<%=request.getAttribute("capacity")%>'/>
</td>
</tr>
<tr>
<td>
Date of Journey:
</td>
<td>
<input type="text" name="doj" class="input" value=""'/>
</td>
</tr>

<tr>

<td colspan="2">
<input type="submit" value="Book" class="myButton"/>
<input type="reset" value="Cancel" name="Cancel" class="myButton"/>
<input type="button" value="Back" onclick="window.location.href='BookingFlightDetails.jsp'" class="myButton"/>
</td>
</tr>
</table>
 <%        
 
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