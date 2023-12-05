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
 * Servlet implementation class GetProductServlet
 */
@WebServlet("/GetProductServlet")
public class GetProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idGet=request.getParameter("idget");
		if(idGet==null) {
			try(Session sess=HibernateUtils.getSessionFactory().openSession()){
				sess.beginTransaction();
				
				String hql = "FROM Product";
		        Query<Product> query = sess.createQuery(hql, Product.class);
				
				List<Product> pros=query.setMaxResults(9).list();
				String hql1 = "SELECT COUNT(*) FROM Product";
			    Query<Long> querycount = sess.createQuery(hql1, Long.class);
			    Long count = querycount.uniqueResult();
			    Long numpage=count/9;
			    Long du=count%9;
			    if(du>0) {
			    	numpage+=1;
			    }
				request.setAttribute("proList", pros);
				request.setAttribute("numpage", numpage);
				request.setAttribute("index", 1);
				request.getRequestDispatcher("shop.jsp").forward(request, response);
				sess.close();
	            
			}catch (Exception e) {
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		}
		else {
			int index=Integer.parseInt(idGet);
			try(Session sess=HibernateUtils.getSessionFactory().openSession()){
				sess.beginTransaction();
				int startIndex =(index-1)*9;
				int count = 9; 
				String hql = "FROM Product";
		        Query<Product> query = sess.createQuery(hql, Product.class);
		        query.setFirstResult(startIndex);
		        query.setMaxResults(count);
		        List<Product> productList = query.getResultList();
		        String hql1 = "SELECT COUNT(*) FROM Product";
			    Query<Long> querycount = sess.createQuery(hql1, Long.class);
			    Long count1 = querycount.uniqueResult();
			    Long numpage=count1/9;
			    Long du=count1%9;
			    if(du>0) {
			    	numpage+=1;
			    }
			    request.setAttribute("proList", productList);
				request.setAttribute("numpage", numpage);
				request.setAttribute("index", index);
				request.getRequestDispatcher("shop.jsp").forward(request, response);
				sess.close();
			}catch (Exception e) {
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
