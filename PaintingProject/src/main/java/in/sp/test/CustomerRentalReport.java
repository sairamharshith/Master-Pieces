package in.sp.test;

import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/customer-rental-report")
public class CustomerRentalReport extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       resp.setContentType("text/html");
       
       //PrintWriter out = resp.getWriter();
       try {
    	   Class.forName("com.mysql.cj.jdbc.Driver");
    	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting_db","root","password");
    	   PreparedStatement ps = con.prepareStatement("SELECT C.*, A.ArtistName, P.Title,  P.RentalPrice, P.HireDate, P.ReturnDate\r\n"
    	   		+ "FROM Customers C\r\n"
    	   		+ "JOIN Paintings P ON C.CustomerID = P.HiredBy\r\n"
    	   		+ "JOIN Artists A ON P.ArtistID = A.ArtistID;");
    	   
    	   ResultSet rs = ps.executeQuery();
    	   if(rs.next()) {
    		   System.out.println(" customer rental report fetched successfully");
     		   RequestDispatcher rd =  req.getRequestDispatcher("/CustomerRentalReport.jsp");
     		   rd.include(req, resp);
    		   
    	   }
    	   else {
    		  RequestDispatcher rd =  req.getRequestDispatcher("/index.jsp");
    		  rd.include(req, resp);
    	   }
       }
       catch(Exception e) {
    	  System.out.println("Exception occured"+ e.getMessage()); 
 		  RequestDispatcher rd =  req.getRequestDispatcher("/index.jsp");
 		  rd.include(req, resp);
       }
    }
}
