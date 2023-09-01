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
    background-image: url('https://images.unsplash.com/photo-1584278773680-8d940a213dcf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1780&q=80');
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
            background-color: #ADD8E6;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
            width: 1400px;
        }
         .customer-details th {
            background-color: #87CEFA;
            color: white;
        }
</style>
</head>
<body>

       
       <div class="container">
       <h2>Customer Rental Report</h2>
       <table class="customer-details">
           <tr>
             <th>Customer No</th>
             <th>Customer Name</th>
             <th>Address</th>
           </tr>

           <%
           try {
        	   Class.forName("com.mysql.cj.jdbc.Driver");
        	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting_db","root","password");
        	   String customer_id = request.getParameter("customerID");
        	   PreparedStatement ps = con.prepareStatement("select customerid, name, address from customers where customerid="+customer_id);
        	   
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
             <th>Category</th>
             <th>Discount</th>
           </tr>

           <%
           try {
        	   Class.forName("com.mysql.cj.jdbc.Driver");
        	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting_db","root","password");
        	   String customer_id = request.getParameter("customerID");
        	   PreparedStatement ps = con.prepareStatement("select category, discount from customers where customerid="+customer_id);
        	   
        	   ResultSet rs = ps.executeQuery();
        	   while(rs.next()) {
        	%>
                   <tr>
                   <td><%= rs.getString(1) %></td>
                   <td><%= rs.getFloat(2) %></td>
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
       <h2>Customer Rental Report</h2>
       <table class="customer-details">
           <tr>
             <th>Painting No</th>
             <th>Painting Title</th>
             <th>Painting Theme</th>
             <th>Rental Price</th>
             <th>Date of Hire</th>
             <th>Date of Return</th>
           </tr>

           <%
           try {
        	   Class.forName("com.mysql.cj.jdbc.Driver");
        	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting_db","root","password");
        	   String customer_id = request.getParameter("customerID");
        	   PreparedStatement ps = con.prepareStatement("SELECT P.paintingid ,P.Title, P.theme, P.RentalPrice, P.HireDate, P.ReturnDate\r\n"
           	   		+ "FROM Customers C\r\n"
        	   		+ "JOIN Paintings P ON C.CustomerID = P.HiredBy\r\n"
        	   		+ "JOIN Artists A ON P.ArtistID = A.ArtistID WHERE C.customerid="+customer_id);
        	   
        	   ResultSet rs = ps.executeQuery();
        	   while(rs.next()) {
        	%>
                   <tr>
                   <td><%= rs.getInt(1) %></td>
                   <td><%= rs.getString(2) %></td>
                   <td><%= rs.getString(3) %></td>
                   <td><%= rs.getFloat(4) %></td>
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