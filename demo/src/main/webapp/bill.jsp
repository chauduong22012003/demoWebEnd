<%@page import="demo.pojo.Bills"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="servlets.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

	  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
	<%
		Bills bill=(Bills) request.getAttribute("bill");
	%>
	<div style="width: 40%; margin: auto;" class="card">
  <div class="card-body mx-4">
    <div class="container">
      <p class="my-5 mx-5" style="font-size: 30px; padding-left: 25px">Thank for your purchase</p>
      <div class="row">
        <ul class="list-unstyled">
          <li class="text-black"><%=bill.getName() %></li>
          <li class="text-muted mt-1"><span class="text-black">Invoice</span> #12345</li>
          <li class="text-black mt-1"><%=bill.getTime().toString() %></li>
        </ul>
        <hr>
        <div class="col-xl-10">
          <p>Phone</p>
        </div>
        <div class="col-xl-2">
          <p class="float-end"><%=bill.getPhone().toString() %>
          </p>
        </div>
        <hr>
      </div>
      <div class="row">
        <div class="col-xl-10">
          <p>Mail</p>
        </div>
        <div class="col-xl-2">
          <p class="float-end"><%=bill.getMail() %>
          </p>
        </div>
        <hr>
      </div>
      <div class="row">
        <div class="col-xl-10">
          <p>Pay</p>
        </div>
        <div class="col-xl-2">
          <p class="float-end"><%=bill.getPaymentMethod() %>
          </p>
        </div>
        <hr style="border: 2px solid black;">
      </div>
      <div class="row text-black">

        <div class="col-xl-12">
          <p class="float-end fw-bold">Total: $<%=bill.getPrice() %></p>
        </div>
        <hr style="border: 2px solid black;">
      </div>
      <div class="text-center" style="margin-top: 90px;">
        <a><u class="text-info">View in browser</u></a>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. </p>
      </div>

    </div>
  </div>
</div>
<div style="width: 100%; display: flex; align-items: center;">
	<button onclick="backshop()" style="margin: auto;cursor: pointer;" type="button" class="btn btn-primary">Back Shop</button>
</div>


<script type="text/javascript">
	function  backshop() {
		window.location.href = "shop.jsp";
	}
</script>
</body>
</html>