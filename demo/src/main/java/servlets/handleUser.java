package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import demo.utl.*;
import demo.dao.*;

/**
 * Servlet implementation class handleUser
 */
@WebServlet("/handleUser")
public class handleUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public handleUser() {
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
		int idReq=Integer.parseInt(request.getParameter("idReuest")); 
		
		if(idReq==1) {
			String _name=request.getParameter("name");
			String _pass=request.getParameter("password");
			String message = "Người dùng đã được thêm vào hệ thống:<br>"
	                + "Tên: " + _name + "<br>"
	                + "Mật khẩu: " + _pass;
			response.setContentType("text/html");

	        try {
	        	
	        	controlAdmin.addUser(_name, _pass);
	        	PrintWriter out = response.getWriter();
	            out.println("<html><body>");
	            out.println("<h2>notify</h2>");
	            out.println("<p>" + message + "</p>");
	            out.println("</body></html>");
	        }
	        catch (Exception e) {
	        	PrintWriter out = response.getWriter();
	        	out.println("<html><body>");
	            out.println("<h2>notify</h2>");
	            out.println("<p>can't add this user</p>");
	            out.println("</body></html>");
			}
		}
		else if(idReq==2) {
			int idUser=Integer.parseInt(request.getParameter("userId"));
			try {
				controlAdmin.removeUser(idUser);
				response.setContentType("text/html");
				PrintWriter out=response.getWriter();
				out.println("<html><body>");
	            out.println("<h2>notify</h2>");
	            out.println("<p>delete successful!</p>");
	            out.println("</body></html>");
			}catch (Exception e) {
				response.setContentType("text/html");
				PrintWriter out=response.getWriter();
				out.println("<html><body>");
	            out.println("<h2>notify</h2>");
	            out.println("<p>delete Failure!</p>");
	            out.println("</body></html>");
			}
			
		}
		
        	
       
        
	}

}
