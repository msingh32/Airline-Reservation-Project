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
<title>Update Customer Details</title>

<link href="styles.css" type="text/css" rel="stylesheet" media="all" />

</head>
<body class="body">
<form name="form1" action="UpdateCustomer.jsp"  method="post">

<%
String cid,First_Name,Last_Name,Birth_Date,Email_ID,Phone_No,Address;
		try
		{   
			 
			 String Customer_ID=request.getParameter("update");
			ConnectionProvider a=new ConnectionProvider();
			Connection con=a.connect();			
		    Statement st=con.createStatement();
		    ResultSet rs=st.executeQuery("select * from m_sing_Customer_Details where Customer_ID='"+Customer_ID+"'");
		    while(rs.next())
            {
            cid=rs.getString("Customer_ID");
            First_Name=rs.getString("First_Name");
            Last_Name=rs.getString("Last_Name");
            Birth_Date=rs.getString("Birth_Date");
            Email_ID=rs.getString("Email_ID");
            Phone_No=rs.getString("Phone_No");
            Address=rs.getString("Billing_address");
            
            
            request.setAttribute("cid",cid);
            request.setAttribute("First_Name",First_Name);
            request.setAttribute("Last_Name",Last_Name);
            request.setAttribute("Birth_Date",Birth_Date);
            request.setAttribute("Email_ID",Email_ID);
            request.setAttribute("Phone_No",Phone_No);
            request.setAttribute("Address",Address);
                      
          }%>
          <table>
<tr><th colspan="2"><h2>The Customer Details
</h2></th></tr>
<tr>
<td >
Customer ID:
</td>
<td>
<input type="text" name="custid" class="input" value='<%=request.getAttribute("cid")%>'/>
</td>
</tr>

<tr>
<td>
First Name:
</td>
<td>
<input type="text" name="custfname" class="input" value='<%=request.getAttribute("First_Name")%>'/>
</td>
</tr>

<tr>
<td>
Last name:
</td>
<td>
<input type="text" name="Lname" class="input" value='<%=request.getAttribute("Last_Name")%>'/>
</td>
</tr>

<tr>
<td>
Date of Birth:
</td>
<td>
<input type="text" name=birthdt class="input" value='<%=request.getAttribute("Birth_Date")%>'/>
</td>
</tr>

<tr>
<td>
Email_Id :</td>
<td>
<input type="text" name="email" class="input" value='<%=request.getAttribute("Email_ID")%>'/>
</td>
</tr>


<tr>
<td>
Phone Number:
</td>
<td>
<input type="text" name="phone" class="input" value='<%=request.getAttribute("Phone_No")%>'/>
</td>
</tr>


<tr>
<td>
Address</td>
<td>
<input type="text" name="add" class="input" value='<%=request.getAttribute("Address")%>'/>
</td>
</tr>

<tr>

<td colspan="2">
<input type="submit" value="update" name="Update" class="myButton"/>
<input type="reset" value="Cancel" name="Cancel" class="myButton"/>
<input type="button" value="Back" onclick="window.location.href='Employee.html'" class="myButton"/>
</td>
</tr>
</table>
 <%           }
            
        catch(Exception e)
		{ 
    		System.out.println(e);
    		
		}
%>
	 </form>
	
</body>
</html>