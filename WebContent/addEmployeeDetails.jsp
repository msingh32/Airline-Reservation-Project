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
<%@page import="Connector.*"%>


<%

Connection con;

//It will throw the the error if occured

		try
		{
			//Getting values from addEmployeeDeatils form to store in the variables for inserting into database
			
			String uid=request.getParameter("userid");
			String uname=request.getParameter("username");
			String pass=request.getParameter("password");
			String fname=request.getParameter("FirstName");
			String lname=request.getParameter("LastName");
			String age=request.getParameter("age");
			String gender=request.getParameter("Gender");
			String pno=request.getParameter("Phoneno");
			String eid=request.getParameter("emailID");
			String role=request.getParameter("role");			
			String message="";
			int empid,empage;
			//Create database connectivity with AirlineDatabase
			
			// This will load the MySQL driver, each DB has its own driver
	      	ConnectionProvider a=new ConnectionProvider();
			con=a.connect();			
	      
		  //Creating SQL statements to select * from UserDetail where User_id is given by user
		    
		    String sql1="create table if not exists m_sing_User_Detail"+
						"(User_id int(30) PRIMARY KEY,"+
  						"username varchar(100),"+
  						"password varchar(100),"+
       					"FirstName varchar(80),"+
 						"LastName varchar(75),"+
 						"Age int(25),"+
  						"Gender varchar(20),"+
  						"Phone_no varchar(80),"+
  						"email_id varchar(75),"+
  						"role varchar(75))";
		  
		    empid=Integer.parseInt(uid);
        	empage=Integer.parseInt(age);
			Statement st;
		    PreparedStatement ps=null;
		    ResultSet rs;
		    ps=con.prepareStatement(sql1);
		    ps.executeUpdate(sql1);
		    ps=con.prepareStatement("select * from m_sing_User_Detail where User_id='"+empid+"'");
            rs=ps.executeQuery();
            
          //Check whether the user exists or not in the database with same user id
            
            if(rs.next())
            {
            	//If exists this msg will be displayed
            	
            	message="This Employee already exist";
            %>
            
            <script type="text/javascript"> 
            
          //After displaying alert with "This Employee already exist" message it redirects to main form to add details of Employee
            
   		
   				alert("<%= message %>");
   				location="addEmployeeDetails.html";
   		 
      			</script>
           <% }
          
          //If the Employee does not exist in database then following sql will execute to insert value in UserDetail table
            
            else
            {
            	String sql="insert into m_sing_User_Detail values('"+empid+"','"+uname+"','"+pass+"','"+fname+"','"+lname+"','"+empage+"','"+gender+"','"+pno+"','"+eid+"','"+role+"')";
				ps=con.prepareStatement(sql);
            	ps.executeUpdate();
		    	message="New Employee Added";

            	%>
            	
            	<script type="text/javascript">
            	
            	 //After displaying alert with New Employee Added message it redirects to main form to add details of Employee
            	   		
   				alert("<%= message %>");
   				location="addEmployeeDetails.html";
   		 
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