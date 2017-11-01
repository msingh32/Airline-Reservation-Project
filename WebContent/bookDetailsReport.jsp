
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@ page language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.lang.*"%> 
<%@page import="Connector.*"%>
<%@page import= "java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
function getfid(){
	var f= document.getElementById('fid').value;
}
</script>
<title>Insert title here</title>
<link href="styles.css" type="text/css" rel="stylesheet" media="all" />
<style type="text/css">
table th, td{

	margin-left: 15px;
	text-align: center;
	padding: 5px;
	

}
</style>

</head>
<body class="body">
<form name="form1"  method="post">
<%
Connection con;

//variables are declared to store value from the form

String cid,First_Name,Last_Name,Birth_Date,Email_ID,Phone_No,Address,source,destination;

//It will throw the the error if occured

		try
		{   
		
			//Create database connectivity with AirlineDatabase
			
			ConnectionProvider a=new ConnectionProvider();
			con=a.connect();			

			 //Creating SQL staements to select all the data from Flight_details where Source and Destination is given by user
			   
			Statement st=con.createStatement();
		    ResultSet rs=st.executeQuery("select * from m_sing_Reservation_Details  ");
		   	
		   %>
		    <p><strong>Result for Selection Criteria is given Below</strong></p> 
           <TABLE Border=1 bordercolor="purple" bgcolor=#85929E >
            <TR>        
                 
                <TH><font color="white">Confirmation Number</font></TH>
                <TH><font color="white">Customer_Id</font></TH>
                <TH><font color="white">Flight Number</font></TH>
                <TH><font color="white">Flight Name</font></TH>
                <TH><font color="white">Source</font></TH>
                <TH><font color="white">Destination</font></TH>
                <TH><font color="white">Booking Date</font></TH>
               <TH><font color="white">Departure Time</font></TH>
                <TH><font color="white">Arrival Time</font></TH> 
                <TH><font color="white">Seat Number</font></TH> 
                <TH><font color="white">Fare</font></TH>        
                <TH><font color="white">Duration of Flight</font></TH> 
                <TH><font color="white">Date of Journey</font></TH> 
                   
            </TR> 
            
            
             <% 
            		 while(rs.next()){
            			 
            			 //Variable is declared to accept an input from user
            			 
		      	 %>
             
            <TR>
              	    <TD><font color="white"> <%= rs.getString(1) %></font></td>
				    <TD> <font color="white"><%= rs.getString(2) %></font></td>
				    <TD> <font color="white"><%= rs.getString(3) %></font></td>
				    <TD><font color="white"> <%= rs.getString(4) %></font></td>
				    <TD><font color="white"> <%= rs.getString(5) %></font></td>
				    <TD><font color="white"> <%= rs.getString(6) %></font></td>
				    <TD><font color="white"> <%= rs.getString(7) %></font></td>
				    <TD><font color="white"> <%= rs.getString(8) %></font></td>
				    <TD><font color="white"> <%= rs.getString(9) %></font></td>
				    <TD><font color="white"> <%= rs.getInt(10) %></font></td>
				    <TD><font color="white"> <%= rs.getInt(11) %></font></td>
				    <TD><font color="white"> <%= rs.getString(12) %></font></td>
				    <TD><font color="white"> <%= rs.getString(13) %></font></td>
				    
               </TR>
            		                 

           <%
           
           		 
             }
           
		} 
		//It will catch the error if occured 

		catch(Exception e)
		{ 
    		System.out.println(e);
    		
		}
%>
		
            
			</TABLE> 
			<table>			
			<tr>
			<td><input type="button" value="Back" onclick="window.location.href='Admin1.html'" class="myButton"/></td></tr>
			</table>
					
					 			         
	 </form>	 
</body>
</html>