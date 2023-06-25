<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>setCategory</title>
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
<jsp:include page="header.jsp"></jsp:include>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js"></script>
  
  </br>
  </br>
  <div class="div1">
  </br>
  </br>
  <form action="SetCategory">
  <input type="text" value="Category_name" name="name" id="name" size="50">
  <br>
  <br>

  <input type="text" value="Category_desc" name="desc" id="desc" size="50">
  <br>
  <br>
  <button type="submit" class="btn btn-outline-primary">submit</button>
  </form>
  <br>
  <br>
  </div>
  </br>
  </br>
  <%
  if(request.getSession().getAttribute("successfull")!=null){
  %>
  <script type="text/javascript">
  alert("category details inserted successfully");
  </script>
  <%} %>

<jsp:include page="footer.jsp"></jsp:include>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>

</body>
</html>