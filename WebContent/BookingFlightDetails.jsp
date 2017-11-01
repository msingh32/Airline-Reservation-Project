
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>    
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*"%>
<%@ page language="java" import="java.sql.*" errorPage="" %>
<%@page import="java.lang.*"%> 
<%@page import="Connector.*"%>
<%@page import= "java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="html">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script type="text/javascript">
function getfid(){
	var f= document.getElementById('fid').value;
}
</script>
<title>Insert title here</title>
<link href="styles.css" type="text/css" rel="stylesheet" media="all" />
<style type="text/css">
table th, td{

	margin-left: 15px;
	text-align: center;
	padding: 5px;
	

}
</style>

</head>
<body class="body">
<form name="form1"  action="BookingDetails.jsp"  method="post">
<%
Connection con;

//variables are declared to store value from the form

String cid,First_Name,Last_Name,Birth_Date,Email_ID,Phone_No,Address,source,destination;

//It will throw the the error if occured

		try
		{   

			//Getting values from form to store in the variables for booking process
					
			cid=request.getParameter("custid");
			First_Name=request.getParameter("custfname");
			Last_Name=request.getParameter("Lname");
			Birth_Date=request.getParameter("birthdt");
			Email_ID=request.getParameter("email");
			Phone_No=request.getParameter("phone");
			Address=request.getParameter("add");
			source=request.getParameter("source");
			destination=request.getParameter("destin");
			
			//Create database connectivity with AirlineDatabase
			
			ConnectionProvider a=new ConnectionProvider();
			con=a.connect();			

			 //Creating SQL staements to select all the data from Flight_details where Source and Destination is given by user
			   
			Statement st=con.createStatement();
		    ResultSet rs=st.executeQuery("select * from m_sing_Flight_Details where source='"+source+"' and destination='"+destination+"' ");
		   	
		    //Values are set as attribute from variables
		    
		    request.setAttribute("cid",cid);
            request.setAttribute("First_Name",First_Name);
            request.setAttribute("Last_Name",Last_Name);
            request.setAttribute("Birth_Date",Birth_Date);
            request.setAttribute("Email_ID",Email_ID);
            request.setAttribute("Phone_No",Phone_No);
            request.setAttribute("Address",Address);
            %>  
            <table>
					<tr><th colspan="2"><h2>The Customer Details
					</h2></th></tr>
					<tr>
					<td >
					Customer ID:
					</td>
					<td>
					<input type="text" name="custid" class="input" value='<%=request.getAttribute("cid")%>' class="input"/>
					</td>
					</tr>
					
					<tr>
					<td>
					First Name:
					</td>
					<td>
					<input type="text" name="custfname" class="input" value='<%=request.getAttribute("First_Name")%>' class="input"/>
					</td>
					</tr>
					
					<tr>
					<td>
					Last name:
					</td>
					<td>
					<input type="text" name="Lname" class="input" value='<%=request.getAttribute("Last_Name")%>' class="input"/>
					</td>
					</tr>
					
					<tr>
					<td>
					Date of Birth:
					</td>
					<td>
					<input type="text" name=birthdt class="input" value='<%=request.getAttribute("Birth_Date")%>' class="input"/>
					</td>
					</tr>
					
					<tr>
					<td>
					Email_Id :</td>
					<td>
					<input type="text" name="email" class="input" value='<%=request.getAttribute("Email_ID")%>' class="input"/>
					</td>
					</tr>
					
					
					<tr>
					<td>
					Phone Number:
					</td>
					<td>
					<input type="text" name="phone" class="input" value='<%=request.getAttribute("Phone_No")%>' class="input"/>
					</td>
					</tr>
					
					
					<tr>
					<td>
					Address</td>
					<td>
					<input type="text" name="add" class="input" value='<%=request.getAttribute("Address")%>' class="input"/>
					</td>
					</tr>
					<tr>
					<td>
					<tr>
					
					<td colspan="2">
					</td>
					</tr>
					</table>
					
             <p><strong>Result for Selection Criteria is given Below</strong></p> 
           <TABLE Border=1 bordercolor="purple" bgcolor=#85929E >
            <TR>        
                 
                <TH><font color="white">Flight ID</font></TH>
                <TH><font color="white">Flight Name</font></TH>
                <TH><font color="white">Source</font></TH>
                <TH><font color="white">Destination</font></TH>
               <TH><font color="white">Arrival Time</font></TH>
                <TH><font color="white">Destination Time</font></TH> 
                <TH><font color="white">Duration of Flight</font></TH> 
                <TH><font color="white">Fare</font></TH> 
                <TH><font color="white">Number of seats</font></TH>               
            </TR> 
            
            
             <% 
            		 while(rs.next()){
            			 
            			 //Variable is declared to accept an input from user
            			 
						String fid = rs.getString(1);
            	 %>
              
            <TR>
              	    <TD><font color="white"> <%= fid %></font></td>
				    <TD> <font color="white"><%= rs.getString(2) %></font></td>
				    <TD> <font color="white"><%= rs.getString(3) %></font></td>
				    <TD><font color="white"> <%= rs.getString(4) %></font></td>
				    <TD><font color="white"> <%= rs.getString(5) %></font></td>
				    <TD><font color="white"> <%= rs.getString(6) %></font></td>
				    <TD><font color="white"> <%= rs.getString(7) %></font></td>
				    <TD><font color="white"> <%= rs.getString(8) %></font></td>
				    <TD><font color="white"> <%= rs.getInt(9) %></font></td>
                    <td><input type="radio" name="Book" value="<%= fid%>" ><span class="radio1"></span></td>
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
		
            
			</TABLE> 
			<table>
			
			<tr><td><input type="submit" value="show" class="myButton"/></td>
			<td><input type="button" value="Back" onclick="window.location.href='Employee.html'" class="myButton"/></td></tr>
			</table>
					
					 			         
	 </form>	 
</body>
</html>