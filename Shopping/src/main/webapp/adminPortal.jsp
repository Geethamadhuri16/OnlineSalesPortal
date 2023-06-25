<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>adminPortal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 20px;
    }

   
    h1 {
      color: #333;
      margin-left: 90px; /* Adjust the margin-left value as needed */
    }

    .container {
      margin-top: 30px;
    }

    .box {
      border: 1px solid #ccc;
      padding: 20px;
      margin-bottom: 20px;
    }

    .box h2 {
     color: #555;
    }

    .box p {
      color: #777;
    }
  </style>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
  </br>
  </br>
  

<h1>Welcome to the Admin Portal</h1>

  <div class="container">
    <div class="box">
      <h2>Dashboard</h2>
      <p>Welcome to the admin dashboard. Here, you can monitor and manage various aspects of the system.</p>
    </div>

    <div class="box">
      <h2>Users</h2>
      <p>Manage user accounts, permissions, and access levels. Add, edit, or delete user information as needed.</p>
    </div>

    <div class="box">
      <h2>Products</h2>
      <p>View and update product information. Add new products, edit existing ones, or remove outdated items from the catalog.</p>
    </div>

    
  </div>






<jsp:include page="footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous">


</body>
</html>