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

@WebServlet("/artist-report")
public class ArtistReport extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       resp.setContentType("text/html");
       
       //PrintWriter out = resp.getWriter();
       try {
    	   Class.forName("com.mysql.cj.jdbc.Driver");
    	   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/painting_db","root","password");
    	   PreparedStatement ps = con.prepareStatement("SELECT p.paintingid, p.Title, p.Theme, p.rentalprice, a.artistid, a.artistname\r\n"
    	   		+ "   FROM Artists a\r\n"
    	   		+ "   JOIN Paintings p ON a.ArtistID = p.ArtistID;");
    	   
    	   ResultSet rs = ps.executeQuery();
    	   if(rs.next()) {
    		   System.out.println(" artist report fetched successfully");
     		   RequestDispatcher rd =  req.getRequestDispatcher("/ArtistReport.jsp");
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
