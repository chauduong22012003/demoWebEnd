package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import demo.dao.*;
import demo.dao.convertImage;
import demo.pojo.Product;

/**
 * Servlet implementation class handProduct
 */
@WebServlet("/handProduct")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,  // Kích thước tối thiểu của file để lưu trên đĩa (2MB)
	    maxFileSize = 1024 * 1024 * 10,      // Kích thước tối đa của mỗi file (10MB)
	    maxRequestSize = 1024 * 1024 * 50    // Kích thước tối đa của một request (50MB)
	)
public class handProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public handProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
			 Part filePart = request.getPart("image");
			
			 InputStream fileContent = filePart.getInputStream();
				  byte[] fileBytes =convertImage.convertToByteArray(fileContent); 
				
				  String _name=request.getParameter("product_name"); 
				  double _price=Double.parseDouble(request.getParameter("productPrice")) ; 
				  String _branch=request.getParameter("productBranch"); 
				  String _desciption=request.getParameter("description"); 
				  Product newProduct=new Product(_name,_price,_branch,_desciption,fileBytes);
				  ProductDao.addProduct(newProduct);
				  PrintWriter out = response.getWriter();
				  String base64Image = Base64.getEncoder().encodeToString(fileBytes);
				  response.setContentType("text/html");
				  
		          out.println("<html><body>");
		          out.println("<h2>notify</h2>");
		          out.println("<p>" + _name + "</p>");
		          out.println("<p>" + _price + "</p>");
		          out.println("<p>" + _branch + "</p>");
		          out.println("<p>" + _desciption + "</p>");
		          out.println("<img src='data:image/jpeg;base64," + base64Image + "' alt='Image'>");
		          out.println("</body></html>");
				  System.out.print("add successful!");
				 
			 
		 }catch (Exception e) {
			System.out.print("add failure: "+e);
		}
	}

}
