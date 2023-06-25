<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.ArrayList,product.Product,product.ProductDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>SteelCoil</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<style type="text/css">
.containerc {
  position: relative;
  
}

.icon-hover:hover {
  border-color: #3b71ca !important;
  background-color: white !important;
}

.icon-hover:hover i {
  color: #3b71ca !important;
}


  .invisible {
    display: none;
  }

</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
  <section>
<div class="container my-5">
  <header class="mb-4">
    <h3>New products</h3>
 </header>

  
  <div class="containerc">
        

        <div class="row">
        
  <%
  ProductDao p=new ProductDao();
  ArrayList<Product> products=p.displayByCategory("ce18a4c8-66b3-4229-b188-601d3a19e2a7");
  int size=products.size();
  int num=0;
  while(!products.isEmpty()){
	 Product product=products.remove(0) ;
	 num++;
	 if(num>9){
		 break;
	 }
  
  %>
        
          <div class="col-lg-4 col-md-6 col-sm-6 d-flex">
          
            <div class="card w-100 my-2 shadow-2-strong">
              <img src= "<%=product.getImage()%>" class="card-img-top" / height="300" width="300">
              <div class="card-body d-flex flex-column">
                <div class="d-flex flex-row">
                <div style="display: flex; flex-direction: column; margin-bottom: 10px;">
  <h5 class="mb-1 me-1"><%=product.getProductName() %></h5>
  <h6 class="mb-1 me-1" style="color: blue;"><%=product.getPrice() %></h6>
  
</div>
                </div>
                <p class="card-text"><%=product.getDescription() %></p>
                <div class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto">
                  <a  class="btn btn-primary shadow-0 me-1" onclick="handleClick('<%=product.getProductid() %>')">Add to cart</a>
                  <a href="#!" class="btn btn-light border icon-hover px-2 pt-2" style="margin-left: 220px;"><i class="fas fa-heart fa-lg text-secondary px-1"></i></a>
                </div>
              </div>
            </div>
          </div>
          
          
          <%} %>
          
        </div>
         </div>

  
</div>
</section>
<!-- Products -->




<section>
<div class="container">
  <div class="px-4 pt-3 border">
    <div class="row pt-1">
      <div class="col-lg-3 col-md-6 mb-3 d-flex">
        <div class="d-flex align-items-center">
          <div class="badge badge-warning p-2 rounded-4 me-3">
            <i class="fas fa-thumbs-up fa-2x fa-fw"></i>
          </div>
          <span class="info">
            <h6 class="title">Reasonable prices</h6>
            <p class="mb-0">Have you ever finally just</p>
          </span>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 mb-3 d-flex">
        <div class="d-flex align-items-center">
          <div class="badge badge-warning p-2 rounded-4 me-3">
            <i class="fas fa-plane fa-2x fa-fw"></i>
          </div>
          <span class="info">
            <h6 class="title">Worldwide shipping</h6>
            <p class="mb-0">Have you ever finally just</p>
          </span>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 mb-3 d-flex">
        <div class="d-flex align-items-center">
          <div class="badge badge-warning p-2 rounded-4 me-3">
            <i class="fas fa-star fa-2x fa-fw"></i>
          </div>
          <span class="info">
            <h6 class="title">Best ratings</h6>
            <p class="mb-0">Have you ever finally just</p>
          </span>
        </div>
      </div>
      <div class="col-lg-3 col-md-6 mb-3 d-flex">
        <div class="d-flex align-items-center">
          <div class="badge badge-warning p-2 rounded-4 me-3">
            <i class="fas fa-phone-alt fa-2x fa-fw"></i>
          </div>
          <span class="info">
            <h6 class="title">Help center</h6>
            <p class="mb-0">Have you ever finally just</p>
          </span>
        </div>
      </div>
    </div>
  </div>
</div>
</section>
<jsp:include page="footer.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
  
</body>
</html>