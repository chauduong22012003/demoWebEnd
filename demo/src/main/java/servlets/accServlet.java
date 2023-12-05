package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.boot.model.IdGeneratorStrategyInterpreter;

import demo.dao.account_cusDao;
import demo.pojo.Customer;

/**
 * Servlet implementation class accServlet
 */
@WebServlet("/accServlet")
public class accServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public accServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String idAct=request.getParameter("id_act");
		if (idAct.equals("log_out")) {
			HttpSession ses=request.getSession(false);
			if (ses != null) {
				ses.invalidate();
				
			}
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String idAct=request.getParameter("id_act");
		if(idAct.equals("sign_up")){
			String username=request.getParameter("username");
			String mail=request.getParameter("mail");
			String pass= request.getParameter("pass");
			String pass2=request.getParameter("acceptPass");
			String phone=request.getParameter("phone");
			if(pass.equals(pass2)) {
				if(account_cusDao.Register(mail, pass, username, phone)==true) {
					response.setContentType("text/html");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write("Successful!");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
				else {
					response.setContentType("text/html");
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write("sign up failure!");
					request.getRequestDispatcher("error.jsp").forward(request, response);
				}
			}
			
		}
		else if(idAct.equals("sign_in")) {
			String mail=request.getParameter("mail");
			String pass=request.getParameter("pass");
			if(mail.equals("admin@gmail.com") && pass.equals("admin")) {
				request.getRequestDispatcher("admin.jsp").forward(request, response);
			}
			else if(account_cusDao.checkLogin(mail,pass)) {
				Customer cus=account_cusDao.getUser(mail);
				String username=cus.getName();
				int userId=cus.getId();
				String strID = String.valueOf(userId);
			
				HttpSession session=request.getSession();
				session.setAttribute("userId",strID);
				session.setAttribute("userName", username); 
				/* request.setAttribute("username", username); */
				
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
			else {
				response.setContentType("text/html");
				response.setCharacterEncoding("UTF-8");
				response.getWriter().write("Login Failure!");
				request.getRequestDispatcher("error.jsp").forward(request, response);
			}
		}
		else if (idAct.equals("log_out")) {
			HttpSession ses=request.getSession(false);
			if (ses != null) {
				ses.invalidate();
				
			}
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		
		
	}

}
