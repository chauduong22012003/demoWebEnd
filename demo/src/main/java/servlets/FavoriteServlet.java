package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.query.Query;

import demo.pojo.Favorite_products;
import demo.pojo.Product;
import demo.utl.HibernateUtils;

/**
 * Servlet implementation class FavoriteServlet
 */
@WebServlet("/FavoriteServlet")
public class FavoriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FavoriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idcus=request.getParameter("idcus");
		if(idcus.equals("null")) {
			response.sendRedirect("login.jsp");
		}
		else {
			int id =Integer.parseInt(idcus);
			try(Session sess=HibernateUtils.getSessionFactory().openSession()){
				sess.beginTransaction();
				String hql = "FROM Favorite_products WHERE id_cus = :idcus";
				Query<Favorite_products> query = sess.createQuery(hql, Favorite_products.class);
				query.setParameter("idcus", id);
				List<Favorite_products> favs = query.getResultList();
				List<Product> myList = new ArrayList<>();
				for (Favorite_products i : favs) {
					Product pr=sess.get(Product.class, i.getId());
					myList.add(pr);
				}
				request.setAttribute("proList", myList);
				sess.clear();
				request.getRequestDispatcher("favorite.jsp").forward(request, response);
			}catch (Exception e) {
				response.setContentType("text/html");
		        
		        PrintWriter out = response.getWriter();
		        out.println("<html>");
		        out.println("<head><title>My Servlet Response</title></head>");
		        out.println("<body>");
		        out.println("<h1>Aler</h1>");
		        out.println("<p>you don't have any product</p>");
		        out.println("</body>");
		        out.println("</html>");
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
