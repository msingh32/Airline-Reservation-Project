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
</head>
<body>
<form name="form1" action="UpdateCustomer.jsp"  method="post">

<%
String uid,FirstName,LastName,uName,pass,Age,Gender,email,role;
int phone_no;
		try
		{   
			 
			 uid=request.getParameter("uid");
			 uName=request.getParameter("uname");
			 pass=request.getParameter("password");
				
			FirstName=request.getParameter("fname");
			 LastName=request.getParameter("lname");
			 Age=request.getParameter("age");
			 int Age1=Integer.parseInt(Age);
			  Gender=request.getParameter("gend");
			  String contact=request.getParameter("phone");
				 phone_no=Integer.parseInt(contact);
			 email=request.getParameter("emailid");
			 role=request.getParameter("emprole");			 
			 
			ConnectionProvider a=new ConnectionProvider();
			Connection con=a.connect();			
		    Statement st=con.createStatement();
		    System.out.println("Successful");
		    String query="update m_sing_User_Detail set username=?,password=?,FirstName=?,LastName=?,Age=?,Gender=?,Phone_no=?,email_id=?,role=? WHERE User_id=?";
            PreparedStatement preparedStmt = con.prepareStatement(query);  
            preparedStmt.setString(1,uName);
            preparedStmt.setString(2,pass);
            preparedStmt.setString(3,FirstName);
            preparedStmt.setString(4,LastName);
            preparedStmt.setInt(5,Age1);
            preparedStmt.setString(6,Gender);
            preparedStmt.setInt(7,phone_no);
            preparedStmt.setString(8,email);
            preparedStmt.setString(9,role);
            preparedStmt.setString(10,uid);
            preparedStmt.executeUpdate();
            String message="Employee Details Updated";
	        %>
	         <script type="text/javascript"> 
	    		
				alert("<%= message%>");
				location="updateEmployeeDetails.jsp";
		 
   			</script>
     
	<%	
	          
           } 
            
        catch(Exception e)
		{ 
    		System.out.println(e);
    		
		}
%>
	
	 </form>
	 
</body>
</html>