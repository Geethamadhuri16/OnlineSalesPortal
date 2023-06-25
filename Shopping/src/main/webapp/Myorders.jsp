<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="orders.OrderDao,product.Product,java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>MyOrders</title>
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

.heading-container {
  display: flex;
  justify-content: space-between;
}

.heading {
  margin-right: 20px; /* Adjust this value to control the spacing between the headings */
}

</style>

</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
  

  
</header>

<!-- cart + summary -->
<section class="bg-light my-5">
  <div class="container">
    <div class="row">
      <!-- cart -->
      <div class="col-lg-9">
        <div class="card border shadow-0">
          <div class="m-4">
            <div class="heading-container">
  <h4 class="heading">My Orders</h4>
  <h4 class="heading">Order Id</h4>
</div>
            
           
            <% OrderDao o=new OrderDao();
            String uid = request.getSession().getAttribute("uid").toString();
            ArrayList<Product> pro_list = o.getOrderListforUser(uid);
            
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
    <%=o.orderId(uid, p.getProductid())%>
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