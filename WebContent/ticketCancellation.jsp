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
<title>View Customer Details for Cancellation</title>

<link href="styles.css" type="text/css" rel="stylesheet" media="all" />

</head>
<body class="body">
<form name="form1" action="Refund.jsp"  method="post">

<%
String cno, fno, fname, src,dest, bdate, adate, atime, dtime,doj;
		int snum,fare;
		try
		{   
			 
			String cnumber1=request.getParameter("cnumber");
			int cnumber=Integer.parseInt(cnumber1);
			ConnectionProvider a=new ConnectionProvider();
			Connection con=a.connect();			
	        Statement st=con.createStatement();
		    ResultSet rs=st.executeQuery("select * from m_sing_Reservation_Details where Confirmationnumber='"+cnumber+"'");
		    SimpleDateFormat format = new SimpleDateFormat("YYY-MM-DD");

		    Date d1= null;
		    Date d2= null;
            while(rs.next())
            {
            cno=rs.getString("Customer_ID");
            fno=rs.getString("Flight_no");
            fname=rs.getString("Flight_name");
            src=rs.getString("Source");
            dest=rs.getString("Destination");
            bdate=rs.getString("Booking_Date");
           // adate=rs.getString("Arrival_Date");
 	        dtime=rs.getString("Departure_time");
            atime=rs.getString("Arrival_time");
            snum=rs.getInt("Seat_number");
            fare=rs.getInt("Fare");
            doj=rs.getString("dateofjour");     
            request.setAttribute("cno",cno);
            request.setAttribute("fno",fno);
            request.setAttribute("fname",fname);
            request.setAttribute("src",src);
            request.setAttribute("dest",dest);
            request.setAttribute("bdate",bdate);
           // request.setAttribute("adate",adate);
            request.setAttribute("dtime",dtime);
            request.setAttribute("atime",atime);
            request.setAttribute("snum",snum);
            request.setAttribute("fare",fare);
            request.setAttribute("doj",doj);
                      
          }%>
          <table>
<tr><th colspan="2"><h2>Enter the flight details
</h2></th></tr>
<tr>
<td >
Confirmation Number:
</td>
<td>
<input type="text" name="cnum" value='<%=cnumber%>'/>
</td>
</tr>
<tr>
<td>
Flight Number:
</td>
<td>
<input type="text" name="cno" value='<%=request.getAttribute("cno")%>'/>
</td>
</tr>
<tr>
<td>
Flight Number:
</td>
<td>
<input type="text" name="flno" value='<%=request.getAttribute("fno")%>'/>
</td>
</tr>

<tr>
<td>
Flight Name:
</td>
<td>
<input type="text" name="flname" value='<%=request.getAttribute("fname")%>'/>
</td>
</tr>

<tr>
<td>
Source:
</td>
<td>
<input type="text" name=sourc value='<%=request.getAttribute("src")%>'/>
</td>
</tr>

<tr>
<td>
Destination:</td>
<td>
<input type="text" name="destination" value='<%=request.getAttribute("dest")%>'/>
</td>
</tr>


<tr>
<td>
Booking Date:
</td>
<td>
<input type="text" name="bookingdate" value='<%=request.getAttribute("bdate")%>'/>
</td>
</tr>


<tr>
<td>
Departure time</td>
<td>
<input type="text" name="depttime" value='<%=request.getAttribute("dtime")%>'/>
</td>
</tr>

<tr>
<td>
Arrival time</td>
<td>
<input type="text" name="arttime" value='<%=request.getAttribute("atime")%>'/>
</td>
</tr>

<tr>
<td>
Seat number</td>
<td>
<input type="text" name="seat" value='<%=request.getAttribute("snum")%>'/>
</td>
</tr>

<tr>
<td>
Fare</td>
<td>
<input type="text" name="fare" value='<%=request.getAttribute("fare")%>'/>
</td>
</tr>
<tr>
<td>
Date Of Journey</td>
<td>
<input type="text" name="doj" value='<%=request.getAttribute("doj")%>'/>
</td>
</tr>

<tr>

<td colspan="2">
<input type="submit" value="Cancel Ticket" name="cancel" class="myButton"/>
<input type="reset" value="Cancel" name="Reset" class="myButton"/>
<input type="button" value="Back" onclick="window.location.href='Employee.html'" class="myButton"/>
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