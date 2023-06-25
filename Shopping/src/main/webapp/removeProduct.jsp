<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ page import="admin.AdminDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>removeProducts</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
   <style>
.div1 {
  margin: auto;
  width: 50%;
  border: 3px solid blue;
  padding: 10px;
}
</style>
</head>



<body>
<%
AdminDao a=new AdminDao();
String productId=request.getParameter("product_Id");
a.delete(productId);

%>
<jsp:include page="header.jsp"></jsp:include>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
  </br>
</br>
<div class="div1">
<form action="">

<h4>Remove Product</h4>
</br>
<input type="text" value="ProductId" name="product_Id" id="Product_id" size="40"> 


</br>
</br>
  <button type="submit" class="btn btn-outline-primary">remove</button>
  </br>
</br>

</form>

</div>


</br>
</br>

<jsp:include page="footer.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

</body>
</html>