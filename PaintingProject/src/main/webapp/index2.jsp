<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MasterPieces</title>
<style>
  body {
    margin: 0;
    padding: 0;
    font-family: Arial, sans-serif;
    background-image: url('https://images.unsplash.com/photo-1578926375605-eaf7559b1458?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1963&q=80');
    background-size: 100vw 100vh;
    background-position: center top;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
  }
    .title-caption {
    position: absolute;
    left: 165px; /* Adjust the left position as needed */
    top: 18%; /* Adjust the top position as needed */
    text-align: right;
    padding: 20px;
    color: #fff;
    max-width: 400px;
    background-color: transparent; 
    border: none;
  }
  .title-caption h1 {
    margin: 0;
}

.title-caption p {
    margin-top: 5px; /* Adjust the top margin as needed */
    font-size: 20px; /* Adjust the font size as needed */
}

  .container {
    background-color: rgba(210, 215, 211, 0.9);
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
    text-align: center;
    width: 80%;
    max-width: 400px;
    margin-left: 800px;
  }
  .container p{
  text-align:right;
  margin-top:5px;
  }
  form {
    margin: 20px 0;
  }
  
  
  h1 {
    font-size: 40px; /* Larger font size */
    margin-bottom: 10px;
    color: #555;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2); 
    letter-spacing: 2px; 
  }

  p {
    font-size: 18px;
    color: #666;
    margin-bottom: 20px;
    font-family: 'Pacifico', cursive; 
  }
  

  label {
    display: block;
    text-align: left;
    font-weight: bold;
    margin-bottom: 5px;
  }

  input[type="text"] {
    width: 100%;
    padding: 5px;
    border: none;
    border-bottom: 2px solid #ccc;
    font-size: 16px;
    margin-bottom: 15px;
    background-color: transparent;
    border-color: #6c757d;
  }

  input[type="submit"] {
    padding: 10px 20px;
    background-color: #e67e22;
    color: white;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
  }

  input[type="submit"]:hover {
    background-color: #d35400;
  }
  .container input[type="submit"] {
    background-color: #8b5a2b; 
}

.container input[type="submit"]:hover {
    background-color: #725025; 
}
  
    .additional-message {
    position: absolute;
    right: 600px; 
    margin-left: 175px;
    top: 50%;
    transform: translateY(-50%);
    background-color: transparent; 
    padding: 10px;
    border: none;
    text-align: left;
  }
  
 
form input[type="submit"],
.container input[type="submit"] {
  width: 55%; /* Make the buttons take up the full width */
  padding: 10px 20px;
  background-color: #8b5a2b;
  color: white;
  border: none;
  border-radius: 5px;
  font-size: 16px;
  cursor: pointer;
  margin-top: 10px; 
}


form input[type="submit"]:hover,
.container input[type="submit"]:hover {
  background-color: #725025;
}


  .container form {
    margin-bottom: 20px; /* Add some spacing between form sections */
    padding: 15px;
    border: 1px solid #ccc; /* Add a border around each form section */
    border-radius: 10px;
    background-color: #dddddd; /* Add a light background color */
  }

 

  
</style>
</head>
<body>
  <div class="title-caption">
    <h1>MASTERPIECES</h1>
    <p>-Your Gateway to Artistry</p>
  </div>
  <div class="additional-message">
    <p>Welcome to MasterPieces, your premier destination for exquisite paintings and artistic creations. 
    With a passion for creativity and a dedication to excellence, we curate a diverse collection of artworks that inspire, captivate, and add a touch of elegance to your surroundings.
    Whether you're an art enthusiast or a discerning collector, our carefully selected pieces reflect the beauty of human expression and creativity. 
    Explore our galleries, discover new perspectives, and immerse yourself in the world of artistry.</p>
  </div>
  <div class="container">
    <h1>MasterPieces</h1>
    <p>-Your Gateway to Artistry</p>
    <form action="customer-rental-report" method="post">
      <label for="customerID">Enter Customer ID:</label>
      <input type="text" id="customerID" name="customerID" placeholder="Customer ID" required>
      <input type="submit" value="Customer Rental Report">
    </form>
    
    <form action="artist-report" method="post">
      <label for="artistID">Enter Artist ID:</label>
      <input type="text" id="artistID" name="artistID" placeholder="Artist ID" required>
      <input type="submit" value="Artist Report">
    </form>
    
    <form action="return-to-owner-report" method="post">
      <label for="ownerID">Enter Owner ID:</label>
      <input type="text" id="ownerID" name="ownerID" placeholder="Owner ID" required>
      <input type="submit" value="Return to Owner Report">
    </form>
  </div>
</body>
</html>
