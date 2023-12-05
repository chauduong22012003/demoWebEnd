package servlets;
import demo.dao.*;
import demo.pojo.Feedback;
import demo.utl.HibernateUtils;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.query.Query;

/**
 * Servlet implementation class FeedbackServlet
 */
@WebServlet("/FeedbackServlet")
public class FeedbackServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedbackServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(Session sess =HibernateUtils.getSessionFactory().openSession()){
			sess.beginTransaction();
			 String hql = "FROM Feedback";
		        Query<Feedback> query = sess.createQuery(hql, Feedback.class);
		        List<Feedback> feedList=query.getResultList();
		        request.setAttribute("feeds", feedList);
		        request.getRequestDispatcher("admin.jsp").forward(request, response);
			sess.close();
		}
		catch (Exception e) {
			 request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("nameF");
		String mail=request.getParameter("mailF");
		String content=request.getParameter("contentF");
		String successful="";
		try {
			FeelbackDao.addFeedback(name, mail, content);
			successful="send feedback successful!";
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(successful);
		}
		catch (Exception e) {
			successful="send failure!";
			response.setContentType("text/plain");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(successful);
		}
		
	}

}
