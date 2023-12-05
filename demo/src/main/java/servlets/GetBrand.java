package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.query.Query;

import demo.pojo.Product;
import demo.utl.HibernateUtils;

/**
 * Servlet implementation class GetBrand
 */
@WebServlet("/GetBrand")
public class GetBrand extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetBrand() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String brand=request.getParameter("barnd");
		try(Session sess=HibernateUtils.getSessionFactory().openSession()){
			sess.beginTransaction();
			String hql = "FROM Product WHERE branch = :brand"; // Điều chỉnh tên tham số
			Query<Product> query = sess.createQuery(hql, Product.class);
			query.setParameter("brand", brand); // Điều chỉnh tên tham số
			List<Product> products = query.getResultList();
			request.setAttribute("proList", products);
			request.setAttribute("brand", brand);
			sess.getTransaction().commit(); // Thêm commit trước khi đóng phiên
			sess.close();

			request.getRequestDispatcher("rolex.jsp").forward(request, response);
		}
		catch (Exception e) {
			request.getRequestDispatcher("error.jsp").forward(request, response);
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
