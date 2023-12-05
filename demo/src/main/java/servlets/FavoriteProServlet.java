package servlets;
import demo.dao.FavoriteDao;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class FavoriteProServlet
 */
@WebServlet("/FavoriteProServlet")
public class FavoriteProServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FavoriteProServlet() {
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
		HttpSession session = request.getSession();
		String attributeValue = (String) session.getAttribute("userId");
		int id_cus=Integer.parseInt(attributeValue);
		int id_pro=Integer.parseInt(request.getParameter("id_pro"));
		try {
			FavoriteDao.add_favorite_pro(id_pro, id_cus);
			String responseText = "Liked!";
			response.setContentType("text/plain");
		    response.setStatus(HttpServletResponse.SC_OK);
		    PrintWriter out = response.getWriter();
		    out.print(responseText);
		    out.flush();
		}
		catch (Exception e) {
			String responseText = "liked!";
			response.setContentType("text/plain");
		    response.setStatus(HttpServletResponse.SC_OK);
		    PrintWriter out = response.getWriter();
		    out.print(responseText);
		    out.flush();
			e.printStackTrace();
		}
		
		
		
	}

}
