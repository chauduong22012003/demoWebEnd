package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import demo.dao.cartDao;
import demo.pojo.Cart;

/**
 * Servlet implementation class Inc_Dec_servlet
 */
@WebServlet("/Inc_Dec_servlet")
public class Inc_Dec_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Inc_Dec_servlet() {
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
		int idpro=Integer.parseInt(request.getParameter("idPro"));
		int idCus=Integer.parseInt(request.getParameter("idCus"));
		String idAct=request.getParameter("id_act");
		if(idAct.equals("dec")) {
			cartDao.Dec_Quantity(idpro, idCus);
			String responseText = "modified";
			response.setContentType("text/plain");
		    response.setStatus(HttpServletResponse.SC_OK);
		    PrintWriter out = response.getWriter();
		    out.print(responseText);
		    out.flush();
		}
		else if(idAct.equals("inc")) {
			cartDao.Inc_Quantity(idpro, idCus);
			String responseText = "modified";
			response.setContentType("text/plain");
		    response.setStatus(HttpServletResponse.SC_OK);
		    PrintWriter out = response.getWriter();
		    out.print(responseText);
		    out.flush();
		}
		
	} 

}
