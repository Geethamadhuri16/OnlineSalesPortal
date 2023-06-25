<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>header</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    
<style>
.welcome-text {
  float: right;
}
.icon-hover:hover {
  border-color: #3b71ca !important;
  background-color: white !important;
}

.icon-hover:hover i {
  color: #3b71ca !important;
}
</style>
</head>
<body>
<script>
  function redirectToAnotherJSP() {
    window.location.href = "login.jsp";
  }
  
  function redirectToDisplayCartJSP() {
	    window.location.href = "DisplayCartItems.jsp";
	  }
  
  function redirectTowishlistJSP() {
	    window.location.href = "Wishlist.jsp";
	  }
</script>
<header>
<!-- Jumbotron -->
<div class="p-3 text-center bg-white border-bottom">
  <div class="container">
    <div class="row gy-3">
      <!-- Left elements -->
      <div class="col-lg-2 col-sm-4 col-4">
        <a href="https://www.vizagsteel.com/" target="_blank" class="float-start">
          <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/VIZAG-STEEL.jpg/330px-VIZAG-STEEL.jpg " height="80" width="60" />
        </a>
      </div>
      <!-- Left elements -->

      <!-- Center elements -->
      <div class="order-lg-last col-lg-5 col-sm-8 col-8">
        <div class="d-flex float-end">
         
          <button type="button" class="btn btn-outline-primary" onclick="redirectToAnotherJSP()">login  <img  src="https://png.pngtree.com/png-vector/20191009/ourmid/pngtree-user-icon-png-image_1796659.jpg" height="20" width="20" > </button>
          <button type="button" class="btn btn-outline-secondary" onclick="redirectTowishlistJSP()">my wishlist <img  src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS9zd4OdpEhRBWMEIq2CuQds-TGEl2vDY8Y9g&usqp=CAU" height="20" width="20"></button>
          <button type="button" class="btn btn-outline-success" onclick="redirectToDisplayCartJSP()">cart <img  src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSvgK4DibycwaiYTXo96bPuPUi9V4gFRoKAJw&usqp=CAU" height="20" width="20"></button>
          
          
        </div>
        <div> </div>
        
        <h3 class="welcome-text">Welcome <%=request.getSession().getAttribute("uname") %>!</h3>
       
      </div>
     
      
  

      <!-- Center elements -->

      <!-- Right elements -->
      <div class="col-lg-5 col-md-12 col-12">
        <div class="input-group float-center">
          <div class="form-outline">
           
            <input type="search" id="form1" class="form-control"  value="search" size="40"/>
            
          </div>
          <button type="button" style="background-color: blue; color: white; box-shadow: none;">
  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
    <path d="M6.5 11A4.5 4.5 0 1 1 6.5 2a4.5 4.5 0 0 1 0 9zm7.854 3.646a.5.5 0 0 1-.708 0l-3.27-3.27A5.5 5.5 0 1 0 6.5 14a5.5 5.5 0 0 0 4.676-8.178l3.27 3.27a.5.5 0 0 1 0 .708z"/>
  </svg>
</button>

        </div>
      </div>
      <!-- Right elements -->
    </div>
  </div>
</div>
<!-- Jumbotron -->

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <!-- Container wrapper -->
  <div class="container justify-content-center justify-content-md-between">
    <!-- Toggle button -->
    <button class="navbar-toggler" type="button" data-mdb-toggle="collapse" data-mdb-target="#navbarLeftAlignExample" aria-controls="navbarLeftAlignExample" aria-expanded="false" aria-label="Toggle navigation">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Collapsible wrapper -->
    <div class="collapse navbar-collapse" id="navbarLeftAlignExample">
      <!-- Left links -->
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        
        <%
        if(request.getSession().getAttribute("adminLogged")!=null){
        %>
        <li class="nav-item">
         <a class="nav-link" href="viewProducts.jsp">ViewProducts</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="viewUsers.jsp">ViewUsers</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="addProduct.jsp">AddProduct</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="removeProduct.jsp">RemoveProduct</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="setInventory.jsp">SetInventory</a>
        </li>
     
        
        <li class="nav-item">
          <a class="nav-link" href="setCategory.jsp">SetCategory</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="getCategory.jsp">getCategory</a>
        </li>
        
      </ul>
      <!-- Left links -->
        <%
        }else{
        %>
        <li class="nav-item">
          <a class="nav-link" href="SteelRods.jsp">Steel rods</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="SteelWires.jsp">steel wires</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="SteelCoil.jsp">steel coils</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="SteelSheets.jsp">steel sheets</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="alogin.jsp">admin login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="home.jsp">go to home</a>
        </li>
        
        
      <!-- Left links -->
      <%} %>
      </ul>
    </div>
  </div>
  <!-- Container wrapper -->
</nav>
<!-- Navbar -->
</header>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous">



</body>
</html>