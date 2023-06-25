<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
            <%@ page import="product.ProductDao,product.Product,java.util.ArrayList" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Index</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
 
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

<style type="text/css">
.icon-hover:hover {
  border-color: #3b71ca !important;
  background-color: white !important;
}

.icon-hover:hover i {
  color: #3b71ca !important;
}

.space-between {
  margin-top: 10px;
}
</style>
</head>
<body>

<jsp:include page="indexheader.jsp"></jsp:include>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>

<!--  intro  -->
<section class="mt-3">
<div class="container">
  <main class="card p-3 shadow-2-strong">
    <div class="row">
      
      <div class="col-lg-9">
        <div class="card-banner h-auto p-5 bg-primary rounded-5" style="height: 350px;">
          <div>
            <h2 class="text-white">
              Great products with 
              best deals
            </h2>
            <p class="text-white">No matter how far along you are in your sophistication as an amateur astronomer, there is always one.</p>
            <a href="#" class="btn btn-light shadow-0 text-primary"> View more </a>
          </div>
        </div>
      </div>
    </div>
  </main>
</div>
<!-- container end.// -->
</section>
<!-- intro -->

<!-- Products -->
<section>
<div class="container my-5">
  <header class="mb-4">
    <h3>New products</h3>
  </header>

  
  <div class="containerc">
        

        <div class="row">
        
  <%
  ProductDao p=new ProductDao();
  ArrayList<Product> products=p.getProductList();
  int size=products.size();
  while(!products.isEmpty()){
	 Product product=products.remove(0) ;
  
  %>
        
          <div class="col-lg-4 col-md-6 col-sm-6 d-flex">
          
            <div class="card w-100 my-2 shadow-2-strong">
              <img src= "<%=product.getImage()%>" class="card-img-top" / height="320" width="320">
              <div class="card-body d-flex flex-column">
                <div class="d-flex flex-row">
                <div style="display: flex; flex-direction: column; margin-bottom: 10px;">
  <h5 class="mb-1 me-1"><%=product.getProductName() %></h5>
  <h6 class="mb-1 me-1" style="color: blue;"><%=product.getPrice() %></h6>
  
</div>
                </div>
                <p class="card-text"><%=product.getDescription() %></p>
                <div class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto">
                 
               
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