<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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

<link href="styles.css" type="text/css" rel="stylesheet" media="all" />

<body class="body">
<form>
<%@page import="java.util.Map.Entry"%>
<%@ page language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.lang.*"%> 
<%@page import="Connector.*"%>

	     <% 
	     
	     String cid,First_Name,Last_Name,Birth_Date,Email_ID,Phone_No,Address;
			try
			{   
				 
				 //String Customer_ID=request.getParameter("Customer_ID");
				ConnectionProvider a=new ConnectionProvider();
				Connection con=a.connect();			
	      		Statement st=con.createStatement();
			    System.out.println("Successful");
			    
			    ResultSet rs=st.executeQuery("select * from m_sing_Customer_Details");
	
	          
	          %>
           <TABLE Border="1">
           <tr><h2><strong>Details of the customer in the database</strong></h2></tr>
            <TR>             
                <TH>Customer ID</TH>
                <TH>First Name</TH>
                <TH>Last name</TH>
                <TH>Date of Birth</TH>
               <TH>Email Id</TH>
                <TH>Phone Number</TH> 
                <TH>Address</TH> 
                              
            </TR> 
            
             <% 
            		 while(rs.next()){
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
					<td><input type="button" value="Back" onclick="window.location.href='Employee.html'" class="myButton"/>
				   </td>
					</tr>
					</table>
			</table>
			</form>	
			</body>
			</html>