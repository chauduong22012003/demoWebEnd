package servlets;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.nio.channels.SeekableByteChannel;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.hibernate.query.Query;

import demo.dao.*;
import demo.dao.convertImage;
import demo.pojo.Product;
import demo.pojo.mail;
import demo.utl.HibernateUtils;

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
			String idAct= request.getParameter("idAct");
			if(idAct!=null) {
				System.out.print(idAct);
			}
			
			if(idAct.equals("delete")) {
				
				int id=Integer.parseInt(request.getParameter("idProDelete"));
				ProductDao.deleteProduct(id);
				request.getRequestDispatcher("admin.jsp").forward(request, response);
			}
			else if(idAct.equals("add")) {
					try {
						 Part filePart = request.getPart("image");
						 Part fileImg1=request.getPart("img1");
						 Part fileImg2=request.getPart("img2");
						 
						 
						
						 InputStream fileContent = filePart.getInputStream();
						 InputStream fileContentImg1 = fileImg1.getInputStream();
						 InputStream fileContentImg2 = fileImg2.getInputStream();
						 
						  byte[] image =convertImage.convertToByteArray(fileContent); 
						  byte[] img1=convertImage.convertToByteArray(fileContentImg1);
						  byte[] img2=convertImage.convertToByteArray(fileContentImg2);
						
						  String _name=request.getParameter("product_name"); 
						  double _price=Double.parseDouble(request.getParameter("productPrice")) ; 
						  String _desciption=request.getParameter("description"); 
						  
						  String _material=request.getParameter("material");
						  String _branch =request.getParameter("productBranch");
						  String dateUpString = request.getParameter("date_up");
						  SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
						  java.util.Date dateUp = dateFormat.parse(dateUpString);
						  
						  int _quantity=Integer.parseInt(request.getParameter("productQuan"));
						  
						  Product newProduct=new Product(  _name,  _price,  _desciption,  image,  img1,  img2,  dateUp,_quantity,_material,_branch);
						  
						  
						  org.hibernate.Session sess=HibernateUtils.getSessionFactory().openSession();
							  	String hql = "FROM mail";
							    Query<mail> query = sess.createQuery(hql, mail.class);
							    List<mail> mails = query.list();
							    if(mails!=null) {
							    	for (mail m : mails) {
							    		String content="new product, link here : http://localhost:8080/demo/";
										mailDao.Send_mail(content,m.getMailName());
									}
							    }
						  
						
						  ProductDao.addProduct(newProduct);
						  PrintWriter out = response.getWriter();
						  String base64Image = Base64.getEncoder().encodeToString(image);
						  response.setContentType("text/html");
						  
				          out.println("<html><body>");
				          out.println("<h2>notify</h2>");
				          out.println("<p>" + _name + "</p>");
				          out.println("<p>" + _price + "</p>");
				          out.println("<p>" + _desciption + "</p>");
				          out.println("<img src='data:image/jpeg;base64," + base64Image + "' alt='Image'>");
				          out.println("<a href='admin.jsp'>Back</a>");
				          out.println("</body></html>");
						  System.out.print("add successful!");
						//uanm eqvj buof gxnb    chauduongphattien2201@gmail.com

						
				 }catch (Exception e) {
					 request.getRequestDispatcher("error.jsp").forward(request, response);
				} 
			} 
			
			
		 
	}

}
