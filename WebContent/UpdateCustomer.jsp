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
String cid,First_Name,Last_Name,Birth_Date,Email_ID,Phone_No,Address;
		try
		{   
			 
			 cid=request.getParameter("custid");
			 First_Name=request.getParameter("custfname");
			 Last_Name=request.getParameter("Lname");
			 Birth_Date=request.getParameter("birthdt");
			 Email_ID=request.getParameter("email");
			 Phone_No=request.getParameter("phone");
			 Address=request.getParameter("add");
			 ConnectionProvider a=new ConnectionProvider();
		     Connection con=a.connect();			
		     Statement st=con.createStatement();
		        
		    SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");
            String query="update m_sing_Customer_Details set First_Name=?,Last_Name=?,Birth_Date=?,Email_ID=?,Phone_No=?,Billing_address=? WHERE Customer_ID=?";
            PreparedStatement preparedStmt = con.prepareStatement(query);  
            
            
            preparedStmt.setString(1,First_Name);
            preparedStmt.setString(2,Last_Name);
            preparedStmt.setString(3,Birth_Date);
            preparedStmt.setString(4,Email_ID);
            preparedStmt.setString(5,Phone_No);
            preparedStmt.setString(6,Address);
            preparedStmt.setString(7,cid);            
            preparedStmt.executeUpdate();
            String message="Customer Details Updated";
	        %>
	         <script type="text/javascript"> 
	    		
				alert("<%= message%>");
				location="updateCustomerDetails.jsp";
		 
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