<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*" %>
<%@ page language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.lang.*"%> 

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Connector.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link href="styles.css" type="text/css" rel="stylesheet" media="all" />


</head>
<body class="body">
 <form name="form1" action="UpdateFlight.jsp"  method="post">
<%
String fno,fname,source,destination,arrival_time,destination_time,fare,capacity,duration;

		try
		{   
			 
			fno=request.getParameter("update");
			ConnectionProvider a=new ConnectionProvider();
			Connection con=a.connect();			
	      	Statement st=con.createStatement();
		    ResultSet rs=st.executeQuery("select * from m_sing_Flight_Details where flight_no='"+fno+"'");
            while(rs.next())
            {
            fno=rs.getString("flight_no");
            System.out.println(fno);
            fname=rs.getString("flight_name");
            source=rs.getString("source");
            destination=rs.getString("destination");
            arrival_time=rs.getString("arrival_time");
            destination_time=rs.getString("destination_time");
            duration=rs.getString("duration");
            fare=rs.getString("fare");
            capacity=rs.getString("capacity");
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
          <table>
<tr><th colspan="2"><h2>The Flight Details
</h2></th></tr>
<tr>
<td >
Flight Number:
</td>
<td>
<input type="text" name="flightno" class="input" value='<%=request.getAttribute("fno")%>'/>
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

<td colspan="2">
<input type="submit" value="update" name="Update" class="myButton"/>
<input type="reset" value="Cancel" name="Cancel" class="myButton"/>
<input type="button" value="Back" onclick="window.location.href='updateFlightDetails.jsp'" class="myButton"/>
</td>
</tr>
</table>
 <%           }
            
        catch(Exception e)
		{ 
    		System.out.println(e);
    		
		}
%>
	 </form>
	
</body>
</html>