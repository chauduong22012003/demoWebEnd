<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <title>Form reply</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<%
	String mail=(String)request.getAttribute("mail");
%>
  <div class="container">
    <h2>Reply</h2>
    <form action="Reply_mailSevlet" method="post">
      
      <div class="form-group">
        <label for="email">Email:</label>
        <input type="email" class="form-control" id="email" name="email" value=<%=mail %> required>
      </div>
      <div class="form-group">
        <label for="message">Content</label>
        <textarea class="form-control" id="message" name="message" rows="5" required></textarea>
      </div>
      <button type="submit" class="btn btn-primary">Send</button>
       <button style="margin-left: 200px;" onclick="back()" type="submit" class="btn btn-primary">Back</button>
    </form>
  </div>
  

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  	function back() {
  		window.location.href = "admin.jsp";
	}
  </script>
</body>
</html>