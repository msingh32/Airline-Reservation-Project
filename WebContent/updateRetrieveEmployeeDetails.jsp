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
<form name="form1" action="UpdateEmployee.jsp"  method="post">

<%
String uid,FirstName,LastName,uName,pass,Age,Gender,email,role;
int phone_no;
		try
		{   
			 
			String Employee_ID=request.getParameter("update");
			ConnectionProvider a=new ConnectionProvider();
			Connection con=a.connect();			
		    Statement st=con.createStatement();
		    ResultSet rs=st.executeQuery("select * from m_sing_User_Detail where User_id='"+Employee_ID+"'");
		    
            while(rs.next())
            {
            	
            uid=rs.getString("User_ID");
            uName=rs.getString("username");
            pass=rs.getString("password");
            FirstName=rs.getString("FirstName");
            LastName=rs.getString("LastName");
            Age=rs.getString("Age");
            Gender=rs.getString("Gender");
            phone_no=rs.getInt("Phone_no");
            email=rs.getString("email_id");
            role=rs.getString("role");  
            
            
            request.setAttribute("uid",uid);
            request.setAttribute("uName",uName);
            request.setAttribute("pass",pass);
            request.setAttribute("FirstName",FirstName);
            request.setAttribute("LastName",LastName);
            request.setAttribute("Age",Age);
            request.setAttribute("Gender", Gender);
            request.setAttribute("phone_no",phone_no);
            request.setAttribute("email",email);
            request.setAttribute("role",role);          
          
            }%>
          <table>
<tr><th colspan="2"><h2>The Employee Details
</h2></th></tr>
<tr>
<td >
User ID:
</td>
<td>
<input type="text" name="uid" value='<%=request.getAttribute("uid")%>' class="input"/>
</td>
</tr>

<tr><td>
User Name:
</td>
<td>
<input type="text" name="uname" value='<%=request.getAttribute("uName")%>' class="input"/>
</td>
</tr>

<tr>
<td>
Password:
</td>
<td>
<input type="text" name="password" value='<%=request.getAttribute("pass")%>' class="input"/>
</td>
</tr>

<tr>
<td>
First name:
</td>
<td>
<input type="text" name=fname value='<%=request.getAttribute("FirstName")%>' class="input"/>
</td>
</tr>

<tr>
<td>
Last Name:</td>
<td>
<input type="text" name="lname" value='<%=request.getAttribute("LastName")%>' class="input"/>
</td>
</tr>


<tr>
<td>
Age:
</td>
<td>
<input type="text" name="age" value='<%=request.getAttribute("Age")%>' class="input"/>
</td>
</tr>


<tr>
<td>
Gender</td>
<td>
<input type="text" name="gend" value='<%=request.getAttribute("Gender")%>' class="input"/>
</td>
</tr>
<tr>
<td>
Phone Number</td>
<td>
<input type="text" name="phone" value='<%=request.getAttribute("phone_no")%>' class="input"/>
</td>
</tr>
<tr>
<td>
Email Id</td>
<td>
<input type="text" name="emailid" value='<%=request.getAttribute("email")%>' class="input"/>
</td>
</tr>
<tr>
<td>
Role</td>
<td>
<input type="text" name="emprole" value='<%=request.getAttribute("role")%>' class="input"/>
</td>
</tr>

<tr>

<td colspan="2">
<input type="submit" value="update" name="Update" class="myButton"/>
<input type="button" value="Back" onclick="window.location.href='Admin1.html'" class="myButton"/>
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