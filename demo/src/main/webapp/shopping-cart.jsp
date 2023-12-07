<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Male_Fashion Template">
    <meta name="keywords" content="Male_Fashion, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Male-Fashion | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <script src="https://kit.fontawesome.com/9e67a6eec1.js" crossorigin="anonymous"></script>
    <style type="text/css">
    	.hide{
    		display: none;
    	}
    </style>
   
    
</head>

<body>
	<%@ page import="demo.dao.*" %>
	<%@ page import="demo.pojo.*" %>
	<%@ page import="demo.utl.*" %>
	<%@ page import="java.util.List" %>
	<%@ page import="javax.servlet.http.HttpSession" %>
	<%@ page import="java.util.Base64" %>
	<%@ page import="java.text.DecimalFormat" %>
	<%@ page import="org.hibernate.Session" %>
	
	<%
		String userId="0";
		String login="SIGN IN";
		HttpSession _session = request.getSession();
		if(_session!=null){
			System.out.print("sesssion dang khong null");
			userId = (String) _session.getAttribute("userId");
			String userName = (String) session.getAttribute("userName");
			if(userName!=null){
				login=userName;
				System.out.print(login);
			}
		}
		else{
			System.out.print("sesssion dang null");
		}
		List<Cart> carts=null;
		try{
			carts=cartDao.getAllCartOfCus(userId); 
		 	System.out.print(carts.get(0).getNameProduct());
		}
		catch(Exception e){
			System.out.print("loi");
		}
		
		
		BigDecimal total_price_of_cart=cartDao.getTotalPrice(userId);
		
		DecimalFormat decimalFormat = new DecimalFormat("#,###");
	 	
		
		
		
	%>
    <!-- Page Preloder -->
    <div data-value="<%=userId%>" id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__option">
            <div class="offcanvas__links">
                <a href="login.jsp">Sign in</a>
                <a href="#">FAQs</a>
            </div>
            <div class="offcanvas__top__hover">
                <span>Usd <i class="arrow_carrot-down"></i></span>
                <ul>
                    <li>USD</li>
                    <li>EUR</li>
                    <li>USD</li>
                </ul>
            </div>
        </div>
        <div class="offcanvas__nav__option">
            <a href="#" class="search-switch"><img src="img/icon/search.png" alt=""></a>
            <a href="#"><img src="img/icon/heart.png" alt=""></a>
            <a href="#"><img src="img/icon/cart.png" alt=""> <span>0</span></a>
            <div class="price">$0.00</div>
        </div>
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__text">
            <p>Free shipping, 30-day return or refund guarantee.</p>
        </div>
    </div>
    <!-- Offcanvas Menu End -->

    <!-- Header Section Begin -->
     <header style="background-color: #028843; color: white;" class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-7">
                        <div class="header__top__left">
                            <p>Free shipping, 30-day return or refund guarantee.</p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-5">
                        <div class="header__top__right">
                            <div class="header__top__links">
                                <a href="login.jsp"><%=login %></a>
                                <a href="#">FAQs</a>
                            </div>
                            <div class="header__top__hover">
                                <span>Usd <i class="arrow_carrot-down"></i></span>
                                <ul>
                                    <li>USD</li>
                                    <li>EUR</li>
                                    <li>USD</li>
                                </ul>
                            </div>
                            <div style="position: relative;" class="header__top__links <% if (login.equals("SIGN IN")==true) { %>hide<% }  %>">
                                <button onclick="log_out()" style="position: absolute; right: -30px;top: -20px"><i class="fa-solid fa-right-from-bracket"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div  class="container">
            <div class="row">
                <div class="col-lg-3 col-md-3">
                    <div class="header__logo">
                        <a href="./index.jsp"><img style="height: 50px"  src="img/R.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li class="active"><a style="color: white;" href="./index.jsp?stt=<%=login %>" data-value="home">Home</a></li>
                            <li><a style="color: white;" href="./shop.jsp?stt=<%=login %>" data-value="shop">Shop</a></li>
                            <li><a style="color: white;" href="#">Pages</a>
                                <ul class="dropdown">
                                    <li><a style="color: white;" href="./about.jsp?stt=<%=login %>" data-value="about">About Us</a></li>
                                    <li><a style="color: white;" href="./shop-details.jsp?stt=<%=login %>" data-value="shop_details">Shop Details</a></li>
                                    <li><a style="color: white;" href="./shopping-cart.jsp?id=<%=userId %>" data-value="shopping_cart">Shopping Cart</a></li>
                                   <%--  <li><a style="color: white;" href="./checkout.jsp?stt=<%=login %>" data-value="check_out">Check Out</a></li> --%>
                                    <li><a style="color: white;" href="./blog-details.jsp?stt=<%=login %>" data-value="blog_details">Blog Details</a></li>
                                </ul>
                            </li>
                            <li><a style="color: white;" href="./blog.jsp?stt=<%=login %>" data-value="blog">Blog</a></li>
                            <li><a style="color: white;" href="./contact.jsp?stt=<%=login%>" data-value="contacts">Contacts</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3 col-md-3">
                    <div class="header__nav__option">
                        <a style="color: white;" href="#" class="search-switch"><i class="fa-solid fa-magnifying-glass"></i></a>
                        <a href="FavoriteServlet?idcus=<%=userId %>" style="color: white;"><i  class="fa-solid fa-heart"></i></a>        <!-- chauduong -->
                        <a style="color: white;" href="./shopping-cart.jsp?id=<%=userId %>"><i class="fa-solid fa-cart-shopping"></i> <span></span></a>
                         <%String formattedNum = decimalFormat.format(total_price_of_cart); %>
                        <div style="color: white;" class="price totalPrice">$ <%=formattedNum %></div>   <!-- phattien -->
                        
                        
                    </div>
                </div>
                
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Shopping Cart</h4>
                        <div class="breadcrumb__links">
                            <a href="./index.jsp">Home</a>
                            <a href="./shop.jsp">Shop</a>
                            <span>Shopping Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shopping Cart Section Begin -->
    <section class="shopping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="shopping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>
                                </tr>
                            </thead>      <!--  chauduong -->
                            <tbody>
                            <%if(carts!=null) {%>
                           <%for(Cart i:carts){ %>
                           <%	
                           		byte[] data=cartDao.getimagePro(i.getProductId());
	                            String base64Image = Base64.getEncoder().encodeToString(data);
	   			        		String dataURL = "data:image/png;base64," + base64Image;
	   			        		int quantityPro=ProductDao.getProductById(i.getProductId()).getQuantity();
                           %>
								  <tr>
                                    <td class="product__cart__item">
                                        <div class="product__cart__item__pic">
                                            <img style="height: 100px;width: 100px" src="<%=dataURL %>" alt="">
                                        </div>
                                        <div class="product__cart__item__text">
                                            <h6 id="nameofPro"><%=i.getNameProduct() %></h6>
                                            <%String formattedNumber = decimalFormat.format(i.getPrice().doubleValue()); %>
                                            <h5>$ <%=formattedNumber%></h5>
                                        </div>
                                    </td>
                                    <td class="quantity__item">
                                        <div class="quantity">
                                            <div style="display: flex;flex-direction: row; vertical-align: middle;" data-value='{"idPro":"<%=i.getProductId()%>","quantity":"<%= quantityPro%>","price":"<%=i.getPrice() %>"}' class="pro-qty-2">
                                               <%--  <input id="inputQuantity" type="text" value="<%=i.getQuantity()%>"> --%>
                                               <p id="inputQuantity" style="margin: 0 10px 0 10px;width: 25px;height: 16px;font-size: 13px;line-height: 16px;text-align: center;"><%=i.getQuantity()%></p>
                                            </div>
                                        </div>
                                    </td>
                                    <%BigDecimal totalPri=i.getPrice().multiply(BigDecimal.valueOf(i.getQuantity())); %>
                                    <%String formattedNumber1 = decimalFormat.format(totalPri.doubleValue()); %>
                                    <td class="cart__price">$<%=formattedNumber1%></td>
                                    <td onclick="deleteProductInCart()" data-value=<%=i.getProductId() %> class="cart__close"><i class="fa fa-close"></i></td>
                                </tr>                    
                           <%} %>
                           <%} %>
                                 <!-- <tr>
                                    <td class="product__cart__item">
                                        <div class="product__cart__item__pic">
                                            <img src="img/shopping-cart/cart-1.jpg" alt="">
                                        </div>
                                        <div class="product__cart__item__text">
                                            <h6>T-shirt Contrast Pocket</h6>
                                            <h5>$98.49</h5>
                                        </div>
                                    </td>
                                    <td class="quantity__item">
                                        <div class="quantity">
                                            <div class="pro-qty-2">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="cart__price">$ 30.00</td>
                                    <td class="cart__close"><i class="fa fa-close"></i></td>
                                </tr>
                                <tr>
                                    <td class="product__cart__item">
                                        <div class="product__cart__item__pic">
                                            <img src="img/shopping-cart/cart-2.jpg" alt="">
                                        </div>
                                        <div class="product__cart__item__text">
                                            <h6>Diagonal Textured Cap</h6>
                                            <h5>$98.49</h5>
                                        </div>
                                    </td>
                                    <td class="quantity__item">
                                        <div class="quantity">
                                            <div class="pro-qty-2">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="cart__price">$ 32.50</td>
                                    <td class="cart__close"><i class="fa fa-close"></i></td>
                                </tr>
                                <tr>
                                    <td class="product__cart__item">
                                        <div class="product__cart__item__pic">
                                            <img src="img/shopping-cart/cart-3.jpg" alt="">
                                        </div>
                                        <div class="product__cart__item__text">
                                            <h6>Basic Flowing Scarf</h6>
                                            <h5>$98.49</h5>
                                        </div>
                                    </td>
                                    <td class="quantity__item">
                                        <div class="quantity">
                                            <div class="pro-qty-2">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="cart__price">$ 47.00</td>
                                    <td class="cart__close"><i class="fa fa-close"></i></td>
                                </tr>
                                <tr>
                                    <td class="product__cart__item">
                                        <div class="product__cart__item__pic">
                                            <img src="img/shopping-cart/cart-4.jpg" alt="">
                                        </div>
                                        <div class="product__cart__item__text">
                                            <h6>Basic Flowing Scarf</h6>
                                            <h5>$98.49</h5>
                                        </div>
                                    </td>
                                    <td class="quantity__item">
                                        <div class="quantity">
                                            <div class="pro-qty-2">
                                                <input type="text" value="1">
                                            </div>
                                        </div>
                                    </td>
                                    <td class="cart__price">$ 30.00</td>
                                    <td class="cart__close"><i class="fa fa-close"></i></td>
                                </tr>  -->
                            </tbody>
                        </table>
                    </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn">
                                <a href="shop.jsp">Continue Shopping</a>
                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <div class="continue__btn update__btn">
                                <a href="#"><i class="fa fa-spinner"></i> Update cart</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="cart__discount">
                        <h6>Discount codes</h6>
                        <form action="#">
                            <input type="text" placeholder="Coupon code">
                            <button type="submit">Apply</button>
                        </form>
                    </div>
                    <div class="cart__total">
                        <h6>Cart total</h6>
                        <ul>
                            <li>Subtotal <span>$ 10.50</span></li>   
                            
                            <li>Total <span class="totalPrice">$ <%=formattedNum %></span></li>
                        </ul>
                        <a style="cursor: pointer;" onclick="checkout()" class="primary-btn">Go to checkout</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shopping Cart Section End -->

    <!-- Footer Section Begin -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__logo">
                            <a href="#"><img src="img/footer-logo.png" alt=""></a>
                        </div>
                        <p>The customer is at the heart of our unique business model, which includes design.</p>
                        <a href="#"><img src="img/payment.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
                    <div class="footer__widget">
                        <h6>Shopping</h6>
                        <ul>
                            <li><a href="#">Clothing Store</a></li>
                            <li><a href="#">Trending Shoes</a></li>
                            <li><a href="#">Accessories</a></li>
                            <li><a href="#">Sale</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-2 col-md-3 col-sm-6">
                    <div class="footer__widget">
                        <h6>Shopping</h6>
                        <ul>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Payment Methods</a></li>
                            <li><a href="#">Delivary</a></li>
                            <li><a href="#">Return & Exchanges</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
                    <div class="footer__widget">
                        <h6>NewLetter</h6>
                        <div class="footer__newslatter">
                            <p>Be the first to know about new arrivals, look books, sales & promos!</p>
                            <form action="#">
                                <input type="text" placeholder="Your email">
                                <button type="submit"><span class="icon_mail_alt"></span></button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="footer__copyright__text">
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        <p>Copyright ©
                            <script>
                                document.write(new Date().getFullYear());
                            </script>2020
                            All rights reserved | This template is made with <i class="fa fa-heart-o"
                            aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                        </p>
                        <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Footer Section End -->

    <!-- Search Begin -->
    <div class="search-model">
        <div class="h-100 d-flex align-items-center justify-content-center">
            <div class="search-close-switch">+</div>
            <form class="search-model-form">
                <input type="text" id="search-input" placeholder="Search here.....">
            </form>
        </div>
    </div>
    <!-- Search End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery.nicescroll.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/jquery.countdown.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
     <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    
	    $(document).ready(function() {
	        var url = new URL(window.location.href);
	        var searchParams = new URLSearchParams(url.search);
	        var id = searchParams.get('id');
	
	        if (id === "null") {
	        	window.location.href = "login.jsp";
	        }
	        else{
	        	
	        }
	        
	    });
	</script>
	<script type="text/javascript">
    	function log_out() {
    		var xhr = new XMLHttpRequest();
    		  xhr.open("POST", "accServlet", true); 
    		  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    		  xhr.onreadystatechange = function() {
    		    if (xhr.readyState === 4 && xhr.status === 200) {  
    		      var response = xhr.responseText;
    		      console.log(response);
    		      window.location.href = "index.jsp";
    		    }
    		  };		 
    		  var data = "id_act=log_out"; 
    		  xhr.send(data);
		}
    	
    	
    	inputQuantity
    	
    	
    	let decs = document.querySelectorAll('.dec');

    	// Lặp qua từng phần tử trong danh sách
    	decs.forEach(function(element) {
    		let parentElement = element.parentNode;
    		let dataValue = parentElement.getAttribute('data-value');
    		let jsonObj = JSON.parse(dataValue)
    		let valid_quan=jsonObj.quantity
    		let id_pro=jsonObj.idPro
    		let queryParams = new URLSearchParams(window.location.search);
    		let idCus = queryParams.get('id');
    		let price=parseFloat(jsonObj.price)
    		let totalPre=<%=total_price_of_cart.doubleValue()%>
    	    element.onclick = function() {
    	    	let totalClasses = document.querySelectorAll(".totalPrice");
    	    	let input = parentElement.querySelector("#inputQuantity")
    	    	let value = parseInt(input.textContent);
    	    	
    	    	if (value > 1) {
    	    	   
    	    	    input.textContent =(value-1).toString();
    	    	    totalPre-=price
    	    	  
    	    	  var xhr = new XMLHttpRequest();
	      		  xhr.open("POST", "Inc_Dec_servlet", true); 
	      		  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	      		  xhr.onreadystatechange = function() {
	      		    if (xhr.readyState === 4 && xhr.status === 200) {  
	      		      var response = xhr.responseText;
	      		    if (response){
	      		    	totalClasses.forEach(function(i) {
	      		    		location.reload();
	      		    		
	      		    	});
	      		      }
	      		      
	      		    }
	      		  };	
	      		 if(input.value==="0" || input.value==="1"){
   	    		  input.value="1"
   	    		  
   	    	 	 }
	      		  var data = "id_act=dec&idPro="+id_pro+"&idCus="+idCus; 
	      		  xhr.send(data);  
	      		  
    	    	}
    	    };
    	});
    	
    	
    	let incs = document.querySelectorAll('.inc');
    	incs.forEach(function(element) {
    		let parentElement = element.parentNode;
    		let dataValue = parentElement.getAttribute('data-value');
    		let jsonObj = JSON.parse(dataValue)
    		let valid_quan=jsonObj.quantity
    		let id_pro=jsonObj.idPro
    		let price=parseFloat(jsonObj.price)
    		let queryParams = new URLSearchParams(window.location.search);
    		let idCus = queryParams.get('id');
    		let numquantity=parseInt(valid_quan);
    		let totalPre=<%=total_price_of_cart.doubleValue()%>
    		
    	    element.onclick = function() {
    	    	let totalClasses = document.querySelectorAll(".totalPrice");
    	    	let input = parentElement.querySelector("#inputQuantity")
    	    	let value = parseInt(input.textContent);
    	    	
    	    	if (value < numquantity) {
    	    	   
    	    	    input.textContent =(value+1).toString();
    	    	    totalPre+=price
    	    	   
    	    	  
    	    	 var xhr = new XMLHttpRequest();
	      		  xhr.open("POST", "Inc_Dec_servlet", true); 
	      		  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	      		  xhr.onreadystatechange = function() {
	      		    if (xhr.readyState === 4 && xhr.status === 200) {  
	      		      var response = xhr.responseText;
	      		      if (response){
	      		    	totalClasses.forEach(function(i) {
	      		    		location.reload();
	      		    	});
	      		      }
	      		      
	      		    }
	      		  };		 
	      		  var data = "id_act=inc&idPro="+id_pro+"&idCus="+idCus; 
	      		  xhr.send(data);
    	    	}
    	    };
    	});
    	
    	
    	
    	function deleteProductInCart() {
			let obj=event.target
			let parentofObj=obj.parentNode
			let idPro=parentofObj.getAttribute('data-value');
			let idCus=<%=userId%>
			 var xhr = new XMLHttpRequest();
     		  xhr.open("POST", "deleteCart", true); 
     		  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
     		  xhr.onreadystatechange = function() {
     		    if (xhr.readyState === 4 && xhr.status === 200) {  
     		      var response = xhr.responseText;
     		      if (response==="deleted"){
     		    	 location.reload();
     		      }
     		      else{
     		    	  alert('dont delete this product!')
     		    	  location.reload();
     		      }
     		      
     		    }
     		  };		 
     		  var data = "idPro="+idPro+"&idCus="+idCus; 
     		  xhr.send(data); 
			
			
		}
    	
    	
    	
    	function checkout() {
    		 let totalPrice = <%=total_price_of_cart.toString()%>;
    		  
    		  if (parseInt(totalPrice) === 0) {
    		    alert("You don't have any product in the cart!");
    		  } else {
    		    var form = document.createElement("form");
    		    form.method = "POST";
    		    form.action = "GotoCheckout";

    		    var input = document.createElement("input");
    		    input.type = "hidden";
    		    input.name = "totalPrice";
    		    input.value = totalPrice;

    		    form.appendChild(input);
    		    document.body.appendChild(form);

    		    form.submit();
    		  }
    		  
    		}
    	
    	
    	
    </script>
    
	
</body>

</html>