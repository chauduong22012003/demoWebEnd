<%@page import="java.math.BigDecimal"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="css/mystyle.css" type="text/css">
    
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
	<%@ page import="java.util.List" %>
	<%@ page import="javax.servlet.http.HttpSession" %>
	<%@ page import="java.util.Base64" %>
	<%@ page import="java.text.DecimalFormat" %>
	
	<%
		String login="SIGN IN";
		String userId="0";
		
		HttpSession _session = request.getSession();
		if(_session!=null){
			
			System.out.print("sesssion dang khong null");
			
			String userName = (String) _session.getAttribute("userName");
			userId = (String) _session.getAttribute("userId");
		
			if(userName!=null){
				login=userName;
				System.out.print(login);
			}
		}
		else{
			System.out.print("sesssion dang null");
		}
		System.out.print(userId);
		BigDecimal total_price_of_cart=cartDao.getTotalPrice(userId);
		List<Product> prs=ProductDao.GetNewProduct();
		List<Product> hotsale=ProductDao.getHotSale();
		DecimalFormat decimalFormat = new DecimalFormat("#,###");
		
		
		
		
	%>


    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__option">
            <div class="offcanvas__links">
                <a href="#">Sign in</a>
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
                                    <%-- <li><a style="color: white;" href="./checkout.jsp?stt=<%=login %>" data-value="check_out">Check Out</a></li> --%>
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
                        
                        <a href="FavoriteServlet?idcus=<%=userId %>" style="color: white;"><i  class="fa-solid fa-heart"></i></a>       <!-- chauduong -->
                        <a style="color: white;" href="./shopping-cart.jsp?id=<%=userId %>"><i class="fa-solid fa-cart-shopping"></i> <span></span></a>
                         <%String formattedNum = decimalFormat.format(total_price_of_cart); %>
                        <div style="color: white;" class="price">$ <%=formattedNum %></div>   <!-- phattien -->
                        
                        
                    </div>
                </div>
                
            </div>
            <div class="canvas__open"><i class="fa fa-bars"></i></div>
        </div>
    </header>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="hero__slider owl-carousel">
            <div class="hero__items set-bg" data-setbg="img/rolex_back.png">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-8">
                            <div class="hero__text">
                                <h6>Rolex</h6>
                                <h2>A Crown for Every Achievement.</h2>
                                <p style="color: black;font-weight: bold;">Discover the epitome of timeless elegance and precision with Rolex.Crafted with meticulous attention to detail and legendary Swiss craftsmanship, each Rolex timepiece embodies the pinnacle of luxury and sophistication</p>
                                <a href="#" class="primary-btn">Shop now <span class="arrow_right"></span></a>
                                <div class="hero__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            
            <div class="hero__items set-bg" data-setbg="img/patekphilippe_back.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-8">
                            <div class="hero__text">
                                <h6>Patek Philippe</h6>
                                <h2>You never actually own a Patek Philippe.</h2>
                                <p style="color: black;font-weight: bold;">Introducing Patek Philippe, where time stands still in the embrace of timeless elegance. With a legacy spanning centuries, Patek Philippe has epitomized the pinnacle of Swiss watchmaking artistry.</p>
                                <a href="#" class="primary-btn">Shop now <span class="arrow_right"></span></a>
                                <div class="hero__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="hero__items set-bg" data-setbg="img/omega_back.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-8">
                            <div class="hero__text">
                                <h6>Omega</h6>
                                <h2>The Exact Time for Life.</h2>
                                <p style="font-weight: bold;color:white;">Welcome to the world of Omega, where timekeeping reaches new heights of excellence. With a heritage spanning over a century, Omega watches have become synonymous with precision, innovation, and timeless elegance</p>
                                <a href="#" class="primary-btn">Shop now <span class="arrow_right"></span></a>
                                <div class="hero__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

    <!-- Banner Section Begin -->
    <section class="banner spad">
        <div class="container">
            <div class="row">
            	<form id="formgetbrand" action="GetBrand" method="get"> <!--  phat tien -->
            		<input type="hidden" name="barnd">
            		
            	</form>
                <div class="col-lg-7 offset-lg-4">
                    <div class="banner__item">
                        <div class="banner__item__pic">
                            <img style="width: 450px" src="img/rolex_pre.jpg" alt="">
                        </div>
                        <div class="banner__item__text">
                            <h2>Rolex</h2>
                            <a data-value="Rolex" style="cursor: pointer;" onclick="getBrand()" >Shop now</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="banner__item banner__item--middle">
                        <div class="banner__item__pic">
                            <img src="img/PatekPhilippe_pre.jpg" alt="">
                        </div>
                        <div class="banner__item__text">
                            <h2>Patek Philippe</h2>
                            <a data-value="Patek Philippe" style="cursor: pointer;" onclick="getBrand()" >Shop now</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="banner__item banner__item--last">
                        <div class="banner__item__pic">
                            <img style="width: 480px" src="img/omega_pre.jpg" alt="">
                        </div>
                        <div class="banner__item__text">
                            <h2>Omega</h2>
                            <a data-value="Omega" style="cursor: pointer;" onclick="getBrand()" >Shop now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Section End -->

    <!-- Product Section Begin -->
    <section class="product spad">
        <div id="containerIDuser" data-value=<%=userId %> class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="filter__controls">
                        <li class="active" data-filter="*">Best Sellers</li>
                        <li data-filter=".new-arrivals">New Arrivals</li>
                        <li data-filter=".hot-sales">Hot Sales</li>
                    </ul>
                </div>
            </div>
            <div class="row product__filter">
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                    <div class="product__item">
                    <% 
                    String base64Image = Base64.getEncoder().encodeToString(prs.get(0).getImage());
		        	String dataURL = "data:image/png;base64," + base64Image;
                    %>
                        <div class="product__item__pic set-bg" data-setbg="<%= dataURL %>">
                            <span class="label">New</span>
                            <ul class="product__hover">
                                <li><a data-value=<%=prs.get(0).getId() %> onclick="addFavorite()"><img  src="img/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                                <li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><%=prs.get(0).getName() %></h6>
                           <a onclick="addTocart()" style="cursor: pointer;" data-value='{"id_pro":<%= prs.get(0).getId() %>,"id_cus":<%= userId %>,"price":<%=prs.get(0).getPrice() %>}' class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <%String formattedNumber = decimalFormat.format(prs.get(0).getPrice()); %>
                            <h5>$<%=formattedNumber %></h5>   <!-- chauduong -->
                            <div class="product__color__select">
                                <label for="pc-1">
                                    <input type="radio" id="pc-1">
                                </label>
                                <label class="active black" for="pc-2">
                                    <input type="radio" id="pc-2">
                                </label>
                                <label class="grey" for="pc-3">
                                    <input type="radio" id="pc-3">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                    <div class="product__item">
                    <% 
                    String HSbase64Image = Base64.getEncoder().encodeToString(hotsale.get(0).getImage());
		        	String HSdataURL = "data:image/png;base64," + HSbase64Image;
                    %>
                        <div class="product__item__pic set-bg" data-setbg="<%= HSdataURL %>">
                            <ul class="product__hover">
                                <li><a data-value=<%=hotsale.get(0).getId() %> onclick="addFavorite()"><img  src="img/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                                <li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><%=hotsale.get(0).getName() %></h6>
                            <a onclick="addTocart()" style="cursor: pointer;" data-value='{"id_pro":<%= hotsale.get(0).getId() %>,"id_cus":<%= userId %>,"price":<%=hotsale.get(0).getPrice() %>}' class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <%String HSformattedNumber = decimalFormat.format(hotsale.get(0).getPrice()); %>
                            <h5>$<%=HSformattedNumber %></h5>
                            <div class="product__color__select">
                                <label for="pc-4">
                                    <input type="radio" id="pc-4">
                                </label>
                                <label class="active black" for="pc-5">
                                    <input type="radio" id="pc-5">
                                </label>
                                <label class="grey" for="pc-6">
                                    <input type="radio" id="pc-6">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                    <div class="product__item sale">
                    <%
                    String base64Image1 = Base64.getEncoder().encodeToString(prs.get(1).getImage());
		        	String dataURL1 = "data:image/png;base64," + base64Image1; 
		        	%>
                        <div class="product__item__pic set-bg" data-setbg="<%= dataURL1 %>">
                            <span class="label">Sale</span>
                            <ul class="product__hover">
                                <li><a data-value=<%=prs.get(1).getId() %> onclick="addFavorite()" ><img src="img/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                                <li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><%=prs.get(1).getName() %></h6>
                            <a onclick="addTocart()" style="cursor: pointer;" data-value='{"id_pro":<%= prs.get(1).getId() %>,"id_cus":<%= userId %>,"price":<%=prs.get(1).getPrice() %>}' class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <%String formattedNumber1 = decimalFormat.format(prs.get(1).getPrice()); %>
                            <h5>$<%=formattedNumber1 %></h5>
                            <div class="product__color__select">
                                <label for="pc-7">
                                    <input type="radio" id="pc-7">
                                </label>
                                <label class="active black" for="pc-8">
                                    <input type="radio" id="pc-8">
                                </label>
                                <label class="grey" for="pc-9">
                                    <input type="radio" id="pc-9">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                    <div class="product__item">
                    <%
                    String HSbase64Image1 = Base64.getEncoder().encodeToString(hotsale.get(1).getImage());
		        	String HSdataURL1 = "data:image/png;base64," + HSbase64Image1; 
		        	%>
                        <div class="product__item__pic set-bg" data-setbg="<%=HSdataURL1%>">
                            <ul class="product__hover">
                                 <li><a data-value=<%=hotsale.get(1).getId() %> onclick="addFavorite()" ><img src="img/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                                <li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                           <h6><%=hotsale.get(1).getName() %></h6>
                            <a onclick="addTocart()" style="cursor: pointer;" data-value='{"id_pro":<%= hotsale.get(1).getId() %>,"id_cus":<%= userId %>,"price":<%=hotsale.get(1).getPrice() %>}' class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                           <%String HSformattedNumber1 = decimalFormat.format(hotsale.get(1).getPrice()); %>
                            <h5>$<%=formattedNumber1 %></h5>
                            <div class="product__color__select">
                                <label for="pc-10">
                                    <input type="radio" id="pc-10">
                                </label>
                                <label class="active black" for="pc-11">
                                    <input type="radio" id="pc-11">
                                </label>
                                <label class="grey" for="pc-12">
                                    <input type="radio" id="pc-12">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                    <div class="product__item">
                    <%
                    String base64Image2 = Base64.getEncoder().encodeToString(prs.get(2).getImage());
		        	String dataURL2 = "data:image/png;base64," + base64Image2; 
		        	%>
                        <div class="product__item__pic set-bg" data-setbg="<%= dataURL2 %>">
                            <ul class="product__hover">
                                <li><a data-value=<%=prs.get(2).getId() %> onclick="addFavorite()" ><img src="img/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                                <li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><%=prs.get(2).getName() %></h6>
                            <a onclick="addTocart()" style="cursor: pointer;" data-value='{"id_pro":<%= prs.get(2).getId() %>,"id_cus":<%= userId %>,"price":<%=prs.get(2).getPrice() %>}' class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                             <%String formattedNumber2= decimalFormat.format(prs.get(2).getPrice()); %>
                            <h5>$<%=formattedNumber2 %></h5>
                            <div class="product__color__select">
                                <label for="pc-13">
                                    <input type="radio" id="pc-13">
                                </label>
                                <label class="active black" for="pc-14">
                                    <input type="radio" id="pc-14">
                                </label>
                                <label class="grey" for="pc-15">
                                    <input type="radio" id="pc-15">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                    <div class="product__item sale">
                     <%
                    String HSbase64Image2 = Base64.getEncoder().encodeToString(hotsale.get(2).getImage());
		        	String HSdataURL2 = "data:image/png;base64," + HSbase64Image2; 
		        	%>
                        <div class="product__item__pic set-bg" data-setbg="<%=HSdataURL2%>">
                            <span class="label">Sale</span>
                            <ul class="product__hover">
                               <li><a data-value=<%=hotsale.get(2).getId() %> onclick="addFavorite()" ><img src="img/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                                <li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                           <%=hotsale.get(2).getName() %>
                            <a onclick="addTocart()" style="cursor: pointer;" data-value='{"id_pro":<%= hotsale.get(2).getId() %>,"id_cus":<%= userId %>,"price":<%=hotsale.get(2).getPrice() %>}' class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                            <%String HSformattedNumber2= decimalFormat.format(hotsale.get(2).getPrice()); %>
                            <h5>$<%=HSformattedNumber2 %></h5>
                            <div class="product__color__select">
                                <label for="pc-16">
                                    <input type="radio" id="pc-16">
                                </label>
                                <label class="active black" for="pc-17">
                                    <input type="radio" id="pc-17">
                                </label>
                                <label class="grey" for="pc-18">
                                    <input type="radio" id="pc-18">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                    <div class="product__item">
                    <%
                    String base64Image3 = Base64.getEncoder().encodeToString(prs.get(3).getImage());
		        	String dataURL3 = "data:image/png;base64," + base64Image3; 
		        	%>
                        <div class="product__item__pic set-bg" data-setbg="<%= dataURL3 %>">
                            <ul class="product__hover">
                                <li><a data-value=<%=prs.get(3).getId() %> onclick="addFavorite()" ><img src="img/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                                <li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><%=prs.get(3).getName() %></h6>
                            <a onclick="addTocart()" style="cursor: pointer;" data-value='{"id_pro":<%= prs.get(3).getId() %>,"id_cus":<%= userId %>,"price":<%=prs.get(3).getPrice() %>}' class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                           <%String formattedNumber3= decimalFormat.format(prs.get(3).getPrice()); %>
                            <h5>$<%=formattedNumber3 %></h5>
                            <div class="product__color__select">
                                <label for="pc-19">
                                    <input type="radio" id="pc-19">
                                </label>
                                <label class="active black" for="pc-20">
                                    <input type="radio" id="pc-20">
                                </label>
                                <label class="grey" for="pc-21">
                                    <input type="radio" id="pc-21">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                    <div class="product__item">
                    <%
                    String HSbase64Image3 = Base64.getEncoder().encodeToString(hotsale.get(3).getImage());
		        	String HSdataURL3 = "data:image/png;base64," + HSbase64Image3; 
		        	%>
                        <div class="product__item__pic set-bg" data-setbg="<%=HSdataURL3%>">
                            <ul class="product__hover">
                                <li><a data-value=<%=hotsale.get(3).getId() %> onclick="addFavorite()" ><img src="img/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="img/icon/compare.png" alt=""> <span>Compare</span></a></li>
                                <li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6><%=hotsale.get(3).getName() %></h6>
                            <a onclick="addTocart()" style="cursor: pointer;" data-value='{"id_pro":<%= hotsale.get(3).getId() %>,"id_cus":<%= userId %>,"price":<%=hotsale.get(3).getPrice() %>}' class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                                <i class="fa fa-star-o"></i>
                            </div>
                             <%String HSformattedNumber3= decimalFormat.format(hotsale.get(3).getPrice()); %>
                            <h5>$<%=HSformattedNumber3 %></h5>
                            <div class="product__color__select">
                                <label for="pc-22">
                                    <input type="radio" id="pc-22">
                                </label>
                                <label class="active black" for="pc-23">
                                    <input type="radio" id="pc-23">
                                </label>
                                <label class="grey" for="pc-24">
                                    <input type="radio" id="pc-24">
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->

    <!-- Categories Section Begin -->
    <section class="categories spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="categories__text">
                        <h2>Clothings Hot <br /> <span>Shoe Collection</span> <br /> Accessories</h2>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="categories__hot__deal">
                        <img src="img/product-sale.png" alt="">
                        <div class="hot__deal__sticker">
                            <span>Sale Of</span>
                            <h5>$29.99</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 offset-lg-1">
                    <div class="categories__deal__countdown">
                        <span>Deal Of The Week</span>
                        <h2>Multi-pocket Chest Bag Black</h2>
                        <div class="categories__deal__countdown__timer" id="countdown">
                            <div class="cd-item">
                                <span>3</span>
                                <p>Days</p>
                            </div>
                            <div class="cd-item">
                                <span>1</span>
                                <p>Hours</p>
                            </div>
                            <div class="cd-item">
                                <span>50</span>
                                <p>Minutes</p>
                            </div>
                            <div class="cd-item">
                                <span>18</span>
                                <p>Seconds</p>
                            </div>
                        </div>
                        <a href="#" class="primary-btn">Shop now</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Instagram Section Begin -->
    <section class="instagram spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="instagram__pic">
                        <div class="instagram__pic__item set-bg" data-setbg="img/instagram/instagram-1.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="img/instagram/instagram-2.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="img/instagram/instagram-3.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="img/instagram/instagram-4.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="img/instagram/instagram-5.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="img/instagram/instagram-6.jpg"></div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="instagram__text">
                        <h2>Instagram</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                        labore et dolore magna aliqua.</p>
                        <h3>#Male_Fashion</h3>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Instagram Section End -->

    <!-- Latest Blog Section Begin -->
    <section class="latest spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <span>Latest News</span>
                        <h2>Fashion New Trends</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="img/blog/blog-1.jpg"></div>
                        <div class="blog__item__text">
                            <span><img src="img/icon/calendar.png" alt=""> 16 February 2020</span>
                            <h5>What Curling Irons Are The Best Ones</h5>
                            <a href="#">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="img/blog/blog-2.jpg"></div>
                        <div class="blog__item__text">
                            <span><img src="img/icon/calendar.png" alt=""> 21 February 2020</span>
                            <h5>Eternity Bands Do Last Forever</h5>
                            <a href="#">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="img/blog/blog-3.jpg"></div>
                        <div class="blog__item__text">
                            <span><img src="img/icon/calendar.png" alt=""> 28 February 2020</span>
                            <h5>The Health Benefits Of Sunglasses</h5>
                            <a href="#">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest Blog Section End -->

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
                            <p>Leave an email if you would like to receive notifications about our new products!</p>
                            <form action="MailServlet" method="get">
                                <input type="email" placeholder="Your email" name="mail">
                                <button type="submit"><span class="icon_mail_alt"></span></button>  <!-- abcd -->
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
   <script type="text/javascript">
	    function addTocart() {
	        let dataValue = event.target.getAttribute("data-value");
	        let jsonObject = JSON.parse(dataValue);
	        let id_pro = jsonObject.id_pro;
	        let id_cus = jsonObject.id_cus;
	        let price=jsonObject.price;
	        let name=jsonObject.name;
	       
	
	        if (id_cus === null) {
	            window.location.href = "login.jsp";
	        } else {
	        	
	    		 
	    		  window.location.href = "detailProduct.jsp?id_pro=" + id_pro + "&id_cus=" + id_cus+ "&price="+price;
	        }
	    }
	    
	    
	    
	    
	    
	    function getBrand() {
	    
	        let form = document.querySelector('#formgetbrand');
	        form.querySelector('input').value=event.target.getAttribute('data-value')
	        form.submit();
	    }
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
			
			
			
			function addFavorite() {
				let login = document.querySelector("#containerIDuser").getAttribute('data-value');
				if (login === "null") {
					  window.location.replace("login.jsp");
					} else {
					  let anchorElement = event.target;
					  let parent = anchorElement.parentNode;
					  let id_proStr = parent.getAttribute("data-value");
					  let idPro = parseInt(id_proStr);
					  var xhr = new XMLHttpRequest();
					  xhr.open("POST", "FavoriteProServlet", true);
					  xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
					  xhr.onreadystatechange = function() {
					    if (xhr.readyState === 4 && xhr.status === 200) {
					      var response = xhr.responseText;
					      alert(response);
					    }
					  };

					  var data = "id_pro=" + id_proStr;
					  xhr.send(data);
					}
			}
			
			
			
			
			
    </script>
   
    
    
</body>

</html>