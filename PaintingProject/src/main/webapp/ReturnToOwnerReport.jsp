<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MasterPieces</title>
<link rel="stylesheet" href="styles.css">
<style>
body{
    background-image: url('https://images.unsplash.com/photo-1576504164753-8fd338cd450b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2043&q=80');
    background-size: 100vw 100vh;
    background-position: center top;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 80vh;
    margin: 0;
    padding: 0;
    }
         .container {
            background-color: #FFA07A;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            width: 1400px;
        }
         .customer-details th {
            background-color: 	#FA8072;
            color: white;
        }
</style>
</head>
<body>
       <div class="container">
       <h2>Return to Owner Report</h2>
       <table class="customer-details">
           <tr>
             <th>Owner No</th>
             <th>Owner Name</th>
             <th>Owner Address</th>
           </tr>

           <%
           try {
        	   Class.forName("com.mysql.cj.jdbc.Driver");
        	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting_db","root","password");
        	   String owner_id = request.getParameter("ownerID");
        	   PreparedStatement ps = con.prepareStatement("SELECT a.ArtistID, a.ArtistName, a.ArtistAddress\r\n"
           	   		+ "FROM artists a\r\n"
           	   		+ "WHERE a.ArtistID ="+owner_id);
        	   
        	   ResultSet rs = ps.executeQuery();
        	   while(rs.next()) {
        	%>
        	
                   <tr>
                   <td><%= rs.getInt(1) %></td>
                   <td><%= rs.getString(2) %></td>
                   <td><%= rs.getString(3) %></td>
                   </tr>
             <%      
        	   }

           }
           catch(Exception e) {
        	  System.out.println("Exception occured"+ e.getMessage()); 
           }
           
           %>
       
       </table>

       <table class="customer-details">
           <tr>
             <th>Painting No</th>
             <th>Painting Title</th>
             <th>Painting Theme</th>
             <th>Return Date</th>
           </tr>

           <%
           try {
        	   Class.forName("com.mysql.cj.jdbc.Driver");
        	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting_db","root","password");
        	   String owner_id = request.getParameter("ownerID");
        	   PreparedStatement ps = con.prepareStatement("SELECT  p.PaintingID, p.Title, p.Theme, p.ReturnDate\r\n"
           	   		+ "FROM artists a\r\n"
        	   		+ "LEFT JOIN paintings p ON a.ArtistID = p.ArtistID\r\n"
        	   		+ "LEFT JOIN customers c ON p.HiredBy = c.CustomerID\r\n"
        	   		+ "WHERE (p.HiredBy IS NULL OR (p.HireStatus = 'Available' AND p.ReturnDate < DATE_SUB(NOW(), INTERVAL 6 MONTH)))\r\n"
        	   		+ "AND a.ArtistID = "+owner_id+"\r\n"
        	   		+ "ORDER BY p.PaintingID;");
        	   
        	   ResultSet rs = ps.executeQuery();
        	   while(rs.next()) {
        	%>
        	
                   <tr>
                   <td><%= rs.getInt(1) %></td>
                   <td><%= rs.getString(2) %></td>
                   <td><%= rs.getString(3) %></td>
                   <td><%= rs.getString(4) %></td>
                   </tr>
             <%      
        	   }

           }
           catch(Exception e) {
        	  System.out.println("Exception occured"+ e.getMessage()); 
           }
           
           %>
       
       </table>
       </div>
</body>
</html>