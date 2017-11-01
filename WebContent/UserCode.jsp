<%@page import="javax.xml.ws.Response"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
<%@page import="Connector.*"%>
<%

//It will throw the the error if occured


		try
		{
			//Getting values from UserDetail form to validate the username,password and role
			
			String user=request.getParameter("username");
			String pass=request.getParameter("password");
			String role=request.getParameter("role");
			
			//Create database connectivity with AirlineDatabase
			
			ConnectionProvider a=new ConnectionProvider();
		    Connection con=a.connect();			
	      
		  //Creating SQL staements to select all the data from UserDetail where user,password and role is given by user
		    
        	Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select * from m_sing_User_Detail where username='"+user+"' and password='"+pass+"' and role='"+role+"'");
            int count=0;
			while(rs.next())
			{	
				count++;
			}
			if(count>0)
			{	
				
//If the role is admin then it redirects to Admin page

				if(role.equals("admin") )
       			{
       				response.sendRedirect("Admin1.html");
       			}
       			else
       			{
       				
       			//If the role is employee then it redirects to Employee page

       				response.sendRedirect("Employee.html");
       				
       			}
				
			}
			
			/*If the details does not validates the it displays 
			"Please check username password or your role" message redirecting to user page*/

			else
			{	%>
			<script type="text/javascript"> 
   		
   		alert("Please check username password or your role");
   		location="User.html";
   		 
      		</script>
           <% 
				
			}	
		}
		catch(Exception e)
		{
    		System.out.println(e);
    		
		} %>

</body>
</html>