package servlets;

import java.io.BufferedReader;
import java.io.IOException;
import java.math.BigDecimal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import com.google.gson.Gson;

import demo.pojo.Cart;
import demo.pojo.Product;
import demo.utl.HibernateUtils;

/**
 * Servlet implementation class cartServlet
 */
@WebServlet("/cartServlet")
public class cartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cartServlet() {
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
		
		
		
		
		try(Session sess=HibernateUtils.getSessionFactory().openSession()){
			sess.beginTransaction();
			int id_pro=Integer.parseInt(request.getParameter("id_pro"));
			int size=Integer.parseInt(request.getParameter("size"));
			int quantity=Integer.parseInt(request.getParameter("quantity"));
			int id_cus=Integer.parseInt(request.getParameter("id_cus"));
			double price=Double.parseDouble(request.getParameter("price")); 
			String material=request.getParameter("material");
			Product pr=sess.get(Product.class, id_pro);
			Cart newcart=new Cart();
			newcart.setNameProduct(pr.getName());
			newcart.setCustomerId(id_cus);
			newcart.setProductId(id_pro);
			newcart.setPrice(BigDecimal.valueOf(price));
			newcart.setQuantity(quantity);
			newcart.setSize(size);
			newcart.setMaterial(material);
			sess.save(newcart);
			sess.getTransaction().commit();
			sess.close();
			
			/* response.sendRedirect("newPage.jsp"); */
			
		}catch (Exception e) {
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}
