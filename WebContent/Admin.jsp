<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<link href="styles.css" type="text/css" rel="stylesheet" media="all" />
<style type="text/css">
table th, td{
	margin-left: 8px;
	text-align: center;
	padding: 4px;

}
</style>
</head>
<body>
<%@ page language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.lang.*"%> 


<%@page import="java.sql.*"%>
<%

//It will throw the the error if occured


		try
		{
			//Getting values from UserDetail form to store in the variables for validation from database
			
			String user=request.getParameter("username");
			String pass=request.getParameter("password");
			String role=request.getParameter("role");
			
			
			//Create database connectivity with AirlineDatabase
			
			Class.forName("sun.jdbc.odbc.JdbcOdbcDriver").newInstance();
		    Connection con=DriverManager.getConnection("jdbc:odbc:AirlineDatabase");
		    
		  //Creating SQL staements to select all the data from UserDetail where username,password and role is given by user
		    
        	Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from UserDetail where username='"+user+"' and password='"+pass+"' and role='"+role+"'");
           	int count=0;
           	
           
            while(rs.next())
           	{
            	count++;
            	out.println("<html><table><tr><td><h1><p align=center />Welcome " +user+ "</p></h1></td></tr></table></html>");

           	}
            if(count>0)
            {
            	
            	//If role is admin then redirect to admin page
            	
            	if(role.equals("admin"))
            	{
            		
            		response.sendRedirect("Admin1.html");
				%>
				
				<form name="form1" method="post">
				<table>
				<tr>
				<td>
				<div align="center">
				<input class="myButton" type="button" value="Add Flight Details" onclick="window.location.href='addFlightDetails.html'"/>
				</div>
				</td>
				<td>
				<div align="center">
				<input class="myButton" type="button" value="Delete Flight Details" onclick="window.location.href='delFlight.html'"/>
				</div>
				</td>
				<td>
				<div align="center">
				<input class="myButton" type="button" value="Update Flight Details" onclick="window.location.href='updateFlightDetails.html'"/>
				</div>
				</td>
				</tr>
				
				<tr>
				<td>
				<div align="center">
				<input class="myButton" type="button" value="Add Concession Details" onclick="window.location.href='addConcessionDetails.html'"/>
				</div>
				</td>
				<td>
				<div align="center">
				<input class="myButton" type="button" value="Delete Concession Details" onclick="window.location.href='delConcessionDetails.html'"/>
				</div>
				</td>
				<td>
				<div align="center">
				<input class="myButton" type="button" value="Update Concession Details" onclick="window.location.href='updateConcessionDetails.html'"/>
				</div>
				</td>
				</tr>
				
				
				
				<tr>
				<td>
				<div align="center">
				<input class="myButton" type="button" value="Add Employee" onclick="window.location.href='addEmployee.html'"/>
				</div>
				</td>
				<td>
				<div align="center">
				<input class="myButton" type="button" value="Delete Employee" onclick="window.location.href='delEmployee.html'"/>
				</div>
				</td>
				<td>
				<div align="center">
				<input class="myButton" type="button" value="Update Employee" onclick="window.location.href='updateEmployeeDetails.html'"/>
				</div>
				</td>
				</tr>
				
				
				</table>
			</form>
				<%
            	}
            	
            	//If role is employee then redirect to employee page
            	
            	else
            	{ %>
            		<form name="form2" method="post">
					<table>
					<tr>
					<td>
					<div align="center">
					<input class="myButton" type="button" value="Add Customer Details" onclick="window.location.href='addCustomerDetails.html'"/>
					</div>
					</td>
					<td>
					<div align="center">
					<input class="myButton" type="button" value="Delete Customer Details" onclick="window.location.href='delCustomer.html'"/>
					</div>
					</td>
					</tr>
					<tr>
					<td>
					<div align="center">
					<input class="myButton" type="button" value="Update Customer Details" onclick="window.location.href='updateCustomerDetails.html'"/>
					</div>
					</td>
					
					<td>
					<div align="center">
					<input class="myButton" type="button" value="Ticktet Reservation" onclick="window.location.href='ticketReservation.html'"/>
					</div>
					</td>
					</tr>
					<tr>
					<td>
					<div align="center">
					<input class="myButton" type="button" value="Ticket Cancellation" onclick="window.location.href='ticketCancellation.html'"/>
					</div>
					</td>
					
					<td>
					<div align="center">
					<input class="myButton" type="button" value="View Flight Details" onclick="window.location.href='viewFlightDetails.html'"/>
					</div>
					</td>
					</tr>
					<tr>
					<td colspan="2" align="center">
					<div align="center">
					<input class="myButton" type="button" value="View Concession Details" onclick="window.location.href='viewConcessionDetails.html'"/>
					</div>
					</td>
					</tr>
					
					
					</table>
					</form>
            <%	}
            	
            }
            
          //If validation does not get succeded then displays message"Please check username password or your role" and redirect to user login page
        	
            else
        	{
            	%>
    			<script type="text/javascript"> 
       		
       		alert("Please check username password or your role");
       		location="User.html";
       		 
          		</script>
               <% 	
        	}
           
        	
		}

//It will catch the error if occured 

		catch(Exception e)
		{
			out.println(e.getMessage());
		}
%>
</body>
</html>