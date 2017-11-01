
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New Customer</title>
</head>
<body>
<%@ page language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.lang.*"%> 
<%@page import="java.sql.*"%> 
<%@page import="Connector.*"%>

<%

Connection con;

//It will throw the the error if occured
		try
		{
			//Getting values from addCustomerDeatils form to store in the variables for inserting into database
			
			String Customer_ID=request.getParameter("Customer_ID");
			String First_Name=request.getParameter("First_Name");
			String Last_Name=request.getParameter("Last_Name");
			String Birth_Date=request.getParameter("Birth_Date");
			String Email_ID=request.getParameter("Email_ID");
			String Phone_No=request.getParameter("Phone_No");
			String Address=request.getParameter("Address");
			String message="";
			//Create database connectivity with AirlineDatabase
			ConnectionProvider a=new ConnectionProvider();
			con=a.connect();			
	       //Creating SQL staements to select all the data from Customer_Details where Customer_ID is given by user
		    String sql1="create table if not exists m_sing_Customer_Details"+
						"(Customer_ID int(11) PRIMARY KEY,"+
  						"First_Name varchar(100),"+
  						"Last_Name varchar(100),"+
       					"Birth_Date varchar(80),"+
 						"Email_ID varchar(75),"+
 						"Phone_No varchar(80),"+
  						"Billing_Address varchar(80))";
		    Statement st;
		    PreparedStatement ps=null;
		    ResultSet rs;
		    ps=con.prepareStatement(sql1);
		    ps.executeUpdate(sql1);
		    ps=con.prepareStatement("select * from m_sing_Customer_Details where Customer_ID='"+Customer_ID+"'");
            rs=ps.executeQuery();
            
            //Check whether the customer exists or not in the database with same customer id
            
            if(rs.next())
            {
            	//If exists this msg will be displayed
            	
            	message="This Customer is already exist";
            %>
            
            <script type="text/javascript"> 
   		
            //After displaying alert with "This Customer is already exist" message it redirects to main form to add details of customer
            
   				alert("<%= message %>");
   				location="addCustomerDetails.html";
   		 
      			</script>
           <% }
            
            //If the customer does not exist in database then following sql will execute to insert value in customer_details table
            
            else
            {
            	String sql="insert into m_sing_Customer_Details values('"+Customer_ID+"','"+First_Name+"','"+Last_Name+"','"+Birth_Date+"','"+Email_ID+"','"+Phone_No+"','"+Address+"')";
            	ps=con.prepareStatement(sql);
            	ps.executeUpdate();
		    	message="New Customer Added";

            	%>
            	
            	<script type="text/javascript"> 
            	
            	 //After displaying alert with New Customer Added message it redirects to main form to add details of customer
            	 
   				alert("<%= message %>");
   				location="addCustomerDetails.html";
   		 
      			</script>
            	
           <% }
		}

//It will catch the error if occured 

		catch(Exception e)
		{
			out.println("Data is not inserted"+e);
		}
            
            
            
%>
</body>
</html>