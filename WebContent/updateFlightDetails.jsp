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
<body class="body">
 <form name="form1" action="updateRetrieveFlightDetails.jsp"  method="post">
<%
String fnum;

		try
		{   
			 
			ConnectionProvider a=new ConnectionProvider();
			Connection con=a.connect();			
	      	Statement st=con.createStatement();
		    System.out.println("Successful");
            ResultSet rs=st.executeQuery("select * from m_sing_Flight_Details");
            %>

            <TABLE Border="1">
                      <tr><h2><strong>Details of the Flights in the database</strong></h2></tr>
                       <TR>             
                           <TH>Flight Number</TH>
                           <TH>Flight Name</TH>
                           <TH>Source</TH>
                           <TH>Destination</TH>
                           <TH>Arrival time</TH>
                           <TH>Departure time</TH> 
                           <TH>Duration</TH>
                           <TH>Fare</TH>
                           <TH>Capacity</TH> 
                                         
                       </TR> 
                       
                        <% 
                       		 while(rs.next()){
           						 fnum = rs.getString(1);
                       	 %>
                        
                       <TR>
                         	    <TD> <%= fnum %></td>
           				    <TD> <%= rs.getString(2) %></td>
           				    <TD> <%= rs.getString(3) %></td>
           				    <TD> <%= rs.getString(4) %></td>
           				    <TD> <%= rs.getString(5) %></td>
           				    <TD> <%= rs.getString(6) %></td>
           				    <TD> <%= rs.getString(7) %></td>
           				    <TD> <%= rs.getString(8) %></td>
           				    <TD> <%= rs.getString(9) %></td>
                               <td><input type="radio" name="update" value="<%= fnum %>"></td>

                      			</TR>
           					
           					
           				           
            <%     
                       }
            		}
                       
                   catch(Exception e)
           		{ 
               		System.out.println(e);
               		
           		}
           %>

           					<table>
           					<tr>
           					<td><input type="Submit" value="View" class="myButton"/>
           				   	</td>
           				   	<td><input type="button" value="Back" onclick="window.location.href='Admin1.html'" class="myButton"/>
           				   	</td>
           					</tr>
           					</table>
           					</TABLE>
           	 </form>
</body>
</html>