<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Chi tiết sản phẩm</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    
    <style type="text/css">
    	.control{
    		display: flex;
    		flex-direction: row;
    		width: 100%;
    		justify-content:flex-end;
    	}
    	.control form button{
    		width: 200px;
    		margin: 100px;
    		cursor: pointer;
    	}
    	.trans_img{
    		display: flex;
    		flex-direction: row;
    		align-items: center;
    		margin-right: 60px;
    		width: 200px
    	}
    	.trans_img button{
    		margin: auto;
    	}
    	
    	#image{
    		width: 50px;
    		height: 50px;
    		
    		background-size: cover;
    		border: none;
    		width: ; 
    	}
    	#img1{
    		width: 50px;
    		height: 50px;
    		
    		background-size: cover;
    		border: none;
    	}
    	#img2{
    		width: 50px;
    		height: 50px;
    		
    		background-size: cover;
    		border: none;
    	}
    	
    </style>
</head>
<body>

	<%@ page import="demo.dao.*" %>
	<%@ page import="demo.pojo.*" %>
	<%@ page import="java.util.List" %>
	<%@ page import="javax.servlet.http.HttpSession" %>
	<%@ page import="java.util.Base64" %>
	<%@ page import="demo.utl.HibernateUtils" %>
	<%@ page import="org.hibernate.Session" %>
	<%@ page import="java.math.BigDecimal" %>
	<%
	int id_cus=0;
	Product pr=null;
	
	try(Session sess=HibernateUtils.getSessionFactory().openSession()){
		sess.beginTransaction();
		int id_pro=Integer.parseInt(request.getParameter("id_pro"));
		id_cus=Integer.parseInt(request.getParameter("id_cus"));
		double price=Double.parseDouble(request.getParameter("price")) ; 
		pr=sess.get(Product.class, id_pro);
		Cart newcart=new Cart();
		newcart.setNameProduct(pr.getName());
		newcart.setCustomerId(id_cus);
		newcart.setProductId(id_pro);
		newcart.setPrice(BigDecimal.valueOf(price));
		newcart.setQuantity(1);
		System.out.print("hhhhhhhh      "+newcart.getPrice()+"        lllllllll");
		sess.close();
		}catch (Exception e) {
			System.out.print("hhhhhhhh      "+e+"      lllllllll");
		}
	%>

    <div class="container">
        <h1 style="text-align: center; height:100px; line-height: 100px; "><%=pr.getName() %></h1>
        <div class="row">
            <div class="col-md-4">
            			<% 
	                    String base64Image = Base64.getEncoder().encodeToString(pr.getImage());
			        	String dataURL = "data:image/png;base64," + base64Image;
	                    %>
                <img id='mainImg' src="<%= dataURL %>" alt="Hình ảnh sản phẩm" class="img-fluid">
            </div>
            <div class="col-md-8">
                <h2><%=pr.getBranch() %></h2>
                <ul class="list-group">
                    <li class="list-group-item">Price: <span id="price">$<%=pr.getPrice() %></span></li>
                    
                    <li class="list-group-item">quantity: <span id="size">
                    	 <input id="quantity" type="number" class="form-control" id="quantity" name="productQuan" required>
                    </span></li>
                    <li class="list-group-item">Size: <span id="color">
                    	<select id="Sesize" class="form-control" >
					        <option value="1">Normal</option>
					        <option value="2">Small</option>
					        <option value="3">Large</option>
					        
					    </select>
                    </span></li>
                    <li class="list-group-item">material: <span id="gender">
                    	<select  class="form-control" id="Select_material">
					        <option value="metal">metal wire</option>
					        <option value="leather">leather wire</option>					       
					    </select>
                    </span></li>
                </ul>
            </div>
        </div>
        <div class="control">
        	<div class="trans_img">
        	
        		<button class="butImg" data-value=1 style="background-image: url('<%=dataURL %>');background-size: cover;" id="image"></button>
        		<% 
	                    String base64Image1 = Base64.getEncoder().encodeToString(pr.getImg1());
			        	String dataURL1 = "data:image/png;base64," + base64Image1;
	              %>
        		<button class="butImg" data-value=2 class="butImg" style="background-image: url('<%=dataURL1 %>');background-size: cover;" id="img1"></button>
        		<% 
	                    String base64Image2 = Base64.getEncoder().encodeToString(pr.getImg2());
			        	String dataURL2 = "data:image/png;base64," + base64Image2;
	                    %>
        		<button class="butImg" data-value=3  style="background-image: url('<%=dataURL2 %>');background-size: cover;" id="img2"></button>
        	</div>
        	<form class="order" onsubmit="event.preventDefault();">
        		<button onclick="backshop()"  style="background-color: green;" type="submit" class="btn btn-primary">Back shop</button>
        	</form>
        	<form class="addToCart" onsubmit="event.preventDefault();">
        		<button onclick="addTocart()" data-value='{"id_pro":<%= pr.getId() %>,"id_cus":<%= id_cus %>,"price":<%=pr.getPrice() %>}'  style="background-color: orange;" type="submit" class="btn btn-primary">Add to cart	</button>
        	</form>
        </div>
    </div>

    <!-- Các phần tử HTML khác và mã JavaScript có thể được thêm vào ở đây -->

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
      <script type="text/javascript">
	    function addTocart() {
	        let dataValue = event.target.getAttribute("data-value");
	        let jsonObject = JSON.parse(dataValue);
	        let id_pro = jsonObject.id_pro;
	        let id_cus = jsonObject.id_cus;
	        let price=jsonObject.price;
	        let name=jsonObject.name;
	        let selectElement =document.getElementById("Sesize");
	        let selectedOption = selectElement.options[selectElement.selectedIndex];
	        let size = selectedOption.value;
	        
	       
	        
	        let selectElement1 =document.getElementById("Select_material");
	        let selectedOption1 = selectElement1.options[selectElement1.selectedIndex];
	        let material = selectedOption1.value;
	        
	        alert(material);
	        
	        let quantity=document.getElementById("quantity").value;
	        
	        
	        var data = "id_pro=" + id_pro + "&id_cus=" + id_cus+ "&size="+size + "&material="+material + "&quantity="+quantity + "&price="+price;
	        
	
	        var xhr = new XMLHttpRequest();
	        xhr.open("POST", "cartServlet", true);
	        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

	        xhr.onreadystatechange = function() {
	          if (xhr.readyState === 4 && xhr.status === 200) {
	            // Xử lý phản hồi từ servlet (nếu cần)
	          }
	        };

	        xhr.send(data);
	        window.location.href = "shop.jsp";

	        
	        
	        
	    }
	    
	    
	    
	    
	    
	    
	    
	    
	    let Buts = document.querySelectorAll('.butImg');
	    let main=document.querySelector('#mainImg');

	    Buts.forEach(function(but) {
	      but.addEventListener('click', function() {
	        
	        if(but.getAttribute('data-value')==="1"){
	        	main.src="<%= dataURL %>"
	        }
			if(but.getAttribute('data-value')==="2"){
				main.src="<%= dataURL1 %>"
	        }
			if(but.getAttribute('data-value')==="3"){
				main.src="<%= dataURL2 %>"
	        }
	        
	      });
	    });
	    
	    
	    
	    function backshop() {
	    	window.history.go(-1);
		}
	    
    </script>
</body>
</html>