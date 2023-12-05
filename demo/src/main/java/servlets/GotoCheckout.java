package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.query.Query;

import demo.pojo.Cart;
import demo.pojo.Customer;
import demo.utl.HibernateUtils;

/**
 * Servlet implementation class GotoCheckout
 */
@WebServlet("/GotoCheckout")
public class GotoCheckout extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GotoCheckout() {
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
		HttpSession http_session= request.getSession();
		int idcus;
		double totalPrice= Double.parseDouble(request.getParameter("totalPrice"));
		if(http_session!=null) {
			String idStr=(String) http_session.getAttribute("userId");
			idcus=Integer.parseInt(idStr);
			
			try(Session sess=HibernateUtils.getSessionFactory().openSession()){
				sess.beginTransaction();
				Customer cus=sess.get(Customer.class, idcus);
				String hql = "FROM Cart WHERE customerId = :_idcus";
				Query<Cart>query = sess.createQuery(hql,Cart.class);
				query.setParameter("_idcus", idcus);
				List<Cart> carts = query.getResultList();
				request.setAttribute("pros",carts);
				request.setAttribute("email", cus.getEmail());
				request.setAttribute("phone", cus.getPhone());
				request.setAttribute("name", cus.getName());
				request.setAttribute("totalPrice", totalPrice);
				RequestDispatcher dispatcher=request.getRequestDispatcher("checkout.jsp");
				dispatcher.forward(request, response);
				sess.close();
			}catch (Exception e) {
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		}
		else {
			response.sendRedirect("login.jsp");
		}
	}

}
