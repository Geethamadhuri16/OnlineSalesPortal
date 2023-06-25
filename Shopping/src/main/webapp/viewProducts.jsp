<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="product.ProductDao,product.Product,java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>viewProducts</title>
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
  

 <style>
 
 .outer-container {
      padding: 20px; /* Add padding around the table */
    }
    
    .table-container {
      overflow-x: auto; /* Enable horizontal scrolling if table exceeds container width */
    }
 
 
    table {
      width: 100%;
      border-collapse: collapse;
     

    }
    
    th, td {
      padding: 8px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    
    /* Apply different background colors to odd and even rows */
    tr:nth-child(even) {
      background-color: #f2f2f2;
    }
    
    /* Add responsive styles for smaller screens */
    @media screen and (max-width: 600px) {
      table {
       font-size: 12px;
      }
      
      th, td {
        padding: 4px;
      }
    }
  </style>

</head>
<body>

<jsp:include page="header.jsp"></jsp:include>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
<div class="outer-container">
<div class="table-container">
 <table >
    <tr>
      <th>ProductId</th>
      <th>CategoryId</th>
      <th>ProductName</th>
      <th>Description</th>
      <th>Price</th>
      <th>Inventory</th>
      <th>Img</th>
    </tr>
   <%
   ProductDao p=new ProductDao();
   ArrayList<Product> products=p.getProductList();
   int size=products.size();
   while(!products.isEmpty()){
	 Product product=products.remove(0) ;
	  
   %>
    <tr>
          <td> <%=product.getProductid()%> </td>
          <td><%=product.getCategoryid()%></td>
          <td><%=product.getProductName()%></td>
          <td><%=product.getDescription()%></td>
          <td><%=product.getPrice()%></td>
          <td><%=product.getInventory()%></td>
          <td><%=product.getImage()%></td>
          
        </tr>
        <%} %>
  </table>
  </div>
  </div>
 </br>
 </br>
 
  
<jsp:include page="footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous">

</body>
</html>