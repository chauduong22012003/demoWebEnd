package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;

import demo.utl.HibernateUtils;

/**
 * Servlet implementation class deleteCart
 */
@WebServlet("/deleteCart")
public class deleteCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteCart() {
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


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idCus=Integer.parseInt(request.getParameter("idCus"));
		
		int idPro= Integer.parseInt(request.getParameter("idPro"));
		
		try(Session sess=HibernateUtils.getSessionFactory().openSession()){
			sess.beginTransaction();
			String hql = "DELETE  FROM Cart WHERE customerId = :_idCus AND productId = :_idPro";
			sess.createQuery(hql)
	                .setParameter("_idCus", idCus)
	                .setParameter("_idPro", idPro)
	                .executeUpdate();
			sess.getTransaction().commit();
			String responseText = "deleted";
			response.setContentType("text/plain");
		    response.setStatus(HttpServletResponse.SC_OK);
		    PrintWriter out = response.getWriter();
		    out.print(responseText);
		    out.flush();
			sess.close();
		}
		catch (Exception e) {
			String responseText = "notdeleted";
			response.setContentType("text/plain");
		    response.setStatus(HttpServletResponse.SC_OK);
		    PrintWriter out = response.getWriter();
		    out.print(responseText);
		    out.flush();
		}
	}

}
