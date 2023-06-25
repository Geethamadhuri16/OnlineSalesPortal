<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="Cart.CartDao,product.Product,java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>viewCart</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">


<style type="text/css">


.icon-hover-primary:hover {
  border-color: #3b71ca !important;
  background-color: white !important;
}

.icon-hover-primary:hover i {
  color: #3b71ca !important;
}
.icon-hover-danger:hover {
  border-color: #dc4c64 !important;
  background-color: white !important;
}

.icon-hover-danger:hover i {
  color: #dc4c64 !important;
}

</style>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
 <Script>
 
  function handleClick(proid) {
	  var pro_Id=proid ;
      // Make an AJAX request to send the pro_Id to the server-side
      var xhr = new XMLHttpRequest();
      xhr.open("POST", "RemoveFromCart", true);
      xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      xhr.onreadystatechange = function() {
        if (xhr.readyState === 4 && xhr.status === 200) {
          console.log("Data sent successfully!");
          alert(xhr.responseText);
          // Perform any further client-side actions here if needed
        }
      };
      xhr.send("product_id=" + encodeURIComponent(pro_Id));
    }
  
  
  function placeOrder(){
	  window.location.href = "PlaceOrder";
  }
  
  
  </Script>
 

  
</header>

<!-- cart + summary -->
<section class="bg-light my-5">
  <div class="container">
    <div class="row">
      <!-- cart -->
      <div class="col-lg-9">
        <div class="card border shadow-0">
          <div class="m-4">
            <h4 class="card-title mb-4">Your shopping cart</h4>
            <!-- Cart items loop -->
            
           
            <% CartDao c = new CartDao();
            String uid = request.getSession().getAttribute("uid").toString();
            ArrayList<Product> pro_list = c.getCartItems(uid);
            
            while (!pro_list.isEmpty()) {
              Product p = pro_list.remove(0);
            %>
            
            
            <div class="row gy-3 mb-4">
<div class="col-lg-5">
  <div class="me-lg-5">
    <div class="d-flex">
      <img src="<%=p.getImage()%>" class="border rounded me-3" style="width: 96px; height: 96px;" />
      <div class="">
        <a href="#" class="nav-link"><%=p.getProductName()%></a>
        
      </div>
    </div>
  </div>
</div>
<div class="col-lg-2 col-sm-6 col-6 d-flex flex-row flex-lg-column flex-xl-row text-nowrap">
  
  <div class="">
    <text class="h6"><%=p.getPrice() %></text> <br />
    
  </div>
</div>
<div class="col-lg col-sm-6 d-flex justify-content-sm-center justify-content-md-start justify-content-lg-center justify-content-xl-end mb-2">
  <div class="float-md-end">
    
    <a  class="btn btn-light border text-danger icon-hover-danger" onclick="handleClick('<%=p.getProductid() %>')"> Remove</a>
  </div>
</div>
</div>

            <% } %>
          </div>
          <div class="border-top pt-4 mx-4 mb-4" id="2">
            <p><i class="fas fa-truck text-muted fa-lg"></i> Free Delivery within 1-2 weeks</p>
            <p class="text-muted">
              Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
              aliquip
            </p>
          </div>
        </div>
      </div>
      <!-- cart -->
      <!-- summary -->
      
      
      </br>
      </br>
      </br>
      </br>
    
       <div class="col-lg-3">
        <div class="card mb-3 border shadow-0">
          <div class="card-body">
            <form>
              <div class="form-group">
                <label class="form-label">Have coupon?</label>
                <div class="input-group">
                  <input type="text" class="form-control border" name="" placeholder="Coupon code" />
                  <button class="btn btn-light border">Apply</button>
                </div>
              </div>
            </form>
          </div>
        </div>
        
        
        
        </br>
      </br>
      
      
      
        <div class="card shadow-0 border" id="3">
          <div class="card-body pt-4 pb-2">
            <div class="d-flex justify-content-between">
              <p class="mb-2">Total price:</p>
              <p class="mb-2">$329.00</p>
            </div>
            <div class="d-flex justify-content-between">
              <p class="mb-2">Discount:</p>
                 <p class="mb-2 text-success">-60/-</p>
            </div>
            <div class="d-flex justify-content-between">
              <p class="mb-2">TAX:</p>
              <p class="mb-2">$14.00</p>
            </div>
            <hr />
            <div class="d-flex justify-content-between">
              <p class="mb-2">Total price:</p>
              <p class="mb-2 fw-bold">$283.00</p>
            </div>
            <div class="mt-3">
              <a  class="btn btn-success w-100 shadow-0 mb-2" id="makePurchaseBtn" onclick="placeOrder()"> Make Purchase </a>
              <a href="home.jsp" class="btn btn-light w-100 border mt-2"> Back to shop </a>
            </div>
          </div>
        </div>
      </div>
      <!-- summary -->
    </div>
  </div>
</section>

<!-- cart + summary -->
<jsp:include page="footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous">



</body>
</html>