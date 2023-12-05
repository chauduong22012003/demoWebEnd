package servlets;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.query.Query;
import org.hibernate.Session;

import demo.pojo.Bills;
import demo.pojo.Cart;
import demo.pojo.Customer;
import demo.pojo.Product;
import demo.pojo.Saled;
import demo.utl.HibernateUtils;

/**
 * Servlet implementation class CheckoutServlet
 */
@WebServlet("/CheckoutServlet")
public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckoutServlet() {
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
		
		String act=request.getParameter("idAct");
		HttpSession http_session= request.getSession();
		int idcus;
		
		if(http_session!=null) {
			String idStr=(String) http_session.getAttribute("userId");
			idcus=Integer.parseInt(idStr);
			if(act.equals("checkout")) {
				String name=request.getParameter("namecus");
				String phone=request.getParameter("phonecus");
				String mail=request.getParameter("mailCus");
				String add=request.getParameter("addCus");
				String pass=request.getParameter("passCus");
				String note=request.getParameter("noteCus");
				String city=request.getParameter("citycus");
				String method_pay=request.getParameter("paymethod");
				
				if(method_pay==null) {
					method_pay="cash";
				}
				LocalDateTime currentTime = LocalDateTime.now();
				double total=Double.parseDouble(request.getParameter("totalPrice"));
				
				try(Session sess=HibernateUtils.getSessionFactory().openSession()){
					sess.beginTransaction();
					String hql = "FROM Cart WHERE customerId = :_idcus";
					Query<Cart>query = sess.createQuery(hql,Cart.class);
					query.setParameter("_idcus", idcus);
					List<Cart> carts = query.getResultList();
					for (Cart i : carts) {
						Saled newsale=new Saled(idcus, i.getProductId(), i.getNameProduct(), i.getPrice() , i.getQuantity());
						Product pro=sess.get(Product.class, i.getProductId());
						pro.setQuantity(pro.getQuantity()-i.getQuantity());
						if(pro.getQuantity()<=0) {
							sess.delete(pro);
						}
						sess.save(newsale);
						sess.delete(i);
						
					
					}
					Bills newbill=new Bills(idcus, currentTime, name, add, city, phone,
							mail, note, method_pay,total);
					sess.save(newbill);
					sess.getTransaction().commit();
					request.setAttribute("bill",newbill );
					sess.close();
					request.getRequestDispatcher("bill.jsp").forward(request, response);
				}catch (Exception e) {
					request.getRequestDispatcher("error.jsp").forward(request, response);
				}
				
			}
			else {
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		}
		
		
		 
		
		
		
	}

}
