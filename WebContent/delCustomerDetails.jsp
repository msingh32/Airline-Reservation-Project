<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deletion of Customer Details</title>
</head>
<body>

<%@ page language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.lang.*"%> 
<%@page import="Connector.*"%>
<%@page import="java.sql.*"%>
<%

//It will throw the the error if occured

		try
		{
			//Getting values from Delete Customer form to delete from datbase as seleced by user
			
			String cnumber= request.getParameter("delete");
			
			//Create database connectivity with AirlineDatabase
			
			ConnectionProvider a=new ConnectionProvider();
			Connection con=a.connect();			
	      
		   //Creating SQL staements to delete all the data from Customer_Details where Customer_ID is given by user
			    
		     PreparedStatement ps=null;		      
		     Statement st=con.createStatement();
		     String query="delete from m_sing_Customer_Details where Customer_ID = '"+cnumber+"'";
		     PreparedStatement preparedStmt = con.prepareStatement(query);           
	         preparedStmt.executeUpdate();
	         String message="Customer Details with Customer id " +cnumber+ " Deleted";
		        %>
		         <script type="text/javascript"> 
		    		
		       /*After deletion the message"Customer Details with Customer id is deleted" 
		       and redirected to delcustomer.jsp form for further processing*/
		       
	            	
					alert("<%= message%>");
					location="delCustomer.jsp";
			 
	   			</script>
	     
		<%		
		}	

//It will catch the error if occured 

		catch(Exception e)
		{
			System.out.println("There is no data found"+e);
			
		} %>
</body>
</html>