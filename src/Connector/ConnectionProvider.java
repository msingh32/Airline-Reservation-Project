package Connector;

import java.sql.*;


public class ConnectionProvider implements Provider { 
			//Connection object
		private  Connection connection;
		//Database connection parameters storing in tostirng can do it directly by passing vlaues in to 
	    	    public  Connection connect() {
	    	try{
	        	
	        	// This will load the MySQL driver, each DB has its own driver
			    Class.forName(DRIVER).newInstance();
				}
	     // Setup the connection with the DB
		     catch(ClassNotFoundException cnfe){
	            System.err.println("Error: "+cnfe.getMessage());
	        }catch(InstantiationException ie){
	            System.err.println("Error: "+ie.getMessage());
	        }catch(IllegalAccessException iae){
	            System.err.println("Error: "+iae.getMessage());
	        }
	        
	        try
	        {
	        	
	        	connection = DriverManager.getConnection(CONNECTION_URL+USERNAMEDETAIL);
				
				
			} 
	        catch (SQLException e)
	        {
				// TODO Auto-generated catch block
	        	System.out.println(e);
			}
    	    	 	       return connection;
    	    	 	       
	    }
	    
	  }
	