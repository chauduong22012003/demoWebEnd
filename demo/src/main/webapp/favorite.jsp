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
		
		List<Product> prs = (List<Product>) request.getAttribute("proList");
		
		BigDecimal total_price_of_cart=cartDao.getTotalPrice(userId);
	
		DecimalFormat decimalFormat = new DecimalFormat("#,###");
	%>
    <!-- Page Preloder -->
    				<h3 style="width: 100%" align="center">Your favorite Products</h3>
   
                    <div data-value=<%=userId %> id="containerIDuser" style="width: 50%;padding-top:100px ;margin: auto;" class="row">    <!-- chauduong -->
                    
                    	<%for(Product pr:prs){ %>
                    	 <% 
	                    String base64Image = Base64.getEncoder().encodeToString(pr.getImage());
			        	String dataURL = "data:image/png;base64," + base64Image;
	                    %>
                    		<div class="col-lg-4 col-md-6 col-sm-6">
                            <div class="product__item">
                                <div class="product__item__pic set-bg" data-setbg="<%= dataURL %>">
                                    <ul class="product__hover">
                                         <li><a data-value=<%=pr.getId() %> onclick="addFavorite()" ><img src="img/icon/heart.png" alt=""></a></li>
                                        <li><a href="#"><img src="img/icon/compare.png" alt=""> <span>Compare</span></a>
                                        </li>
                                        <li><a href="#"><img src="img/icon/search.png" alt=""></a></li>
                                    </ul>
                                </div>
                                <div class="product__item__text">
                                    <h6><%=pr.getName() %></h6>
                                    <a onclick="addTocart()" style="cursor: pointer;" data-value='{"id_pro":<%= pr.getId() %>,"id_cus":<%= userId %>,"price":<%=pr.getPrice() %>}' class="add-cart">+ Add To Cart</a>
                                    <div class="rating">
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                        <i class="fa fa-star-o"></i>
                                    </div>
                                     <%String formattedNumber = decimalFormat.format(pr.getPrice()); %>
                            		<h5>$<%=formattedNumber %></h5> 
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
                    	
                    	<%} %>>
                       
                    </div>
                    <div class="d-flex justify-content-between" style="width: 70%; margin: auto;">
                    	<button onclick="back()" style="width: 20%;margin: 20px;" type="button" class="btn btn-info">Back</button>
                    	<button onclick="more()" style="width: 20%;margin: 20px;" type="button" class="btn btn-success">More product</button>
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
    	
    	
    	
    	
    	function getIndex(event) {
    		  
    		  let form = document.querySelector('#formgetIndex');
    		  let inputValue = event.target.getAttribute('data-value');
    		  form.querySelector('input').value = inputValue;
    		  form.submit();
    		  
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
	    
	    
	    function back() {
	    	window.history.back();
		}
	    function more() {
	    	window.location.href = "shop.jsp";
		}
    </script>
</body>

</html>