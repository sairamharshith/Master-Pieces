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
    background-image: url('https://images.unsplash.com/photo-1588260693037-45d3add2388d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1984&q=80');
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
            background-color: #FAEBD7;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            width: 1400px;
        }
        
            .customer-details th {
            background-color: #DEB887;
            color: white;
        }
</style>
</head>
<body>
       <div class="container">
       <h2>Artist Report</h2>
       <table class="customer-details">
           <tr>
             <th>Artist No</th>
             <th>Artist Name</th>
             <th>Country of Birth</th>
           </tr>
           
           
           <%
           try {
        	   Class.forName("com.mysql.cj.jdbc.Driver");
        	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting_db","root","password");
        	   String artist_id = request.getParameter("artistID");
        	   PreparedStatement ps = con.prepareStatement("SELECT * from artists where artistid="+artist_id);
        	   
        	   ResultSet rs = ps.executeQuery();
        	   while(rs.next()) {
        	%>
        	
                   <tr>
                   <td><%= rs.getString(1) %></td>
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
             <th>Year of Birth</th>
             <th>Year of Death</th>
           </tr>
           
           
           <%
           try {
        	   Class.forName("com.mysql.cj.jdbc.Driver");
        	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting_db","root","password");
        	   String artist_id = request.getParameter("artistID");
        	   PreparedStatement ps = con.prepareStatement("SELECT yearofbirth, yearofdeath from artists where artistid="+artist_id);
        	   
        	   ResultSet rs = ps.executeQuery();
        	   while(rs.next()) {
        	%>
        	
                   <tr>
                   <td><%= rs.getInt(1) %></td>
                   <td><%= rs.getString(2) %></td>
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
       
       <div class="container">
       <h2>Artist Report</h2>
       <table class="customer-details">
           <tr>
             <th>Painting No</th>
             <th>Painting Title</th>
             <th>Theme</th>
             <th>Rental Price(Monthly)</th>
             <th>Owner No</th>
             <th>Owner Name</th>
           </tr>
           
           
           <%
           try {
        	   Class.forName("com.mysql.cj.jdbc.Driver");
        	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting_db","root","password");
        	   String artist_id = request.getParameter("artistID");
        	   PreparedStatement ps = con.prepareStatement("SELECT p.paintingid, p.Title, p.Theme, p.rentalprice, a.artistid, a.artistname\r\n"
           	   		+ "   FROM Artists a\r\n"
        	   		+ "   JOIN Paintings p ON a.ArtistID = p.ArtistID where a.artistid="+artist_id);
        	   
        	   ResultSet rs = ps.executeQuery();
        	   while(rs.next()) {
        	%>
        	
                   <tr>
                   <td><%= rs.getString(1) %></td>
                   <td><%= rs.getString(2) %></td>
                   <td><%= rs.getString(3) %></td>
                   <td><%= rs.getString(4) %></td>
                   <td><%= rs.getString(5) %></td>
                   <td><%= rs.getString(6) %></td>
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