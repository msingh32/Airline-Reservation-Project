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
<style type="text/css">
table th, td{

	margin-bottom: 50px;
	margin-left: 15px;
	text-align: center;
	padding: 5px;

}
body
{
	background-image: url('sky.jpg') ;
	background-position: center center;
			background-repeat:  no-repeat;
			background-attachment: fixed;
			background-size:  cover;
			background-color: #999;
}
</style>

</head>
<body class="body">
 <form name="form1" action="delCustomerDetails.jsp"  method="post">
<%
//Variable declared to select radio button as input choice from user

String cid;
Connection con;

//It will throw the the error if occured

		try
		{   
			//Create database connectivity with AirlineDatabase
			 
			ConnectionProvider a=new ConnectionProvider();
			con=a.connect();			
	      
			//Creating SQL staements to select all the data from Customer_Details where Customer_ID is selected by user
		    
        	Statement st=con.createStatement();
		    ResultSet rs=st.executeQuery("select * from m_sing_Customer_Details");
         %>

 			<TABLE Border="1">
           <tr><h2><strong>Details of the customer in the database</strong></h2></tr>
            <TR>             
                <TH>Customer Id</TH>
                <TH>First Name</TH>
               	<TH>Last Name</TH>
                <TH>Birth Date</TH> 
				<TH>Email Id</TH>                
				<TH>Phone no</TH>
                <TH>Billing Address</TH> 
                              
            </TR> 
            
             <% 
            		 while(rs.next()){
            			 
            			 //Select the value selected by the user in radio button
            			 
						 cid = rs.getString(1);
            	 %>
             
            <TR>
              	    <TD> <%= cid %></td>
				    <TD> <%= rs.getString(2) %></td>
				    <TD> <%= rs.getString(3) %></td>
				    <TD> <%= rs.getString(4) %></td>
				    <TD> <%= rs.getString(5) %></td>
				    <TD> <%= rs.getString(6) %></td>
				    <TD> <%= rs.getString(7) %></td>
				   
				    
                    <td><input type="radio" name="delete" value="<%= cid%>"></td>

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

					<table>
					<tr>
					<td><input type="Submit" value="Delete" class="myButton"/>
				   </td>
				   <td><input type="button" value="Back" onclick="window.location.href='Employee.html'" class="myButton"/>
				   </td>
					</tr>
					</table>
					</TABLE>
	 </form>
	
</body>
</html>