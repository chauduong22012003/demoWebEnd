package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import demo.pojo.Product;

/**
 * Servlet implementation class Mod_proServlet
 */
@WebServlet("/Mod_proServlet")
public class Mod_proServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Mod_proServlet() {
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
		int index=Integer.parseInt(request.getParameter("data").toString());
		List<Product> proList=demo.dao.ProductDao.getAllProduct();
		int size=proList.size();
		try {
			List<Product> newlist=proList.subList(index, index+5);
			request.setAttribute("proList", newlist);
			request.setAttribute("index", index);
			request.setAttribute("size", size);
			request.getRequestDispatcher("admin.jsp").forward(request, response);
		}
		catch (Exception e) {
			
			if(index>=size) {
				List<Product> newlist=proList.subList(0, 5);
				request.setAttribute("proList", newlist);
				request.setAttribute("index", index);
				request.setAttribute("size", size);
				request.getRequestDispatcher("admin.jsp").forward(request, response);
			}
			else {
				List<Product> newlist=proList.subList(index, (size-index-1)+index);
				request.setAttribute("proList", newlist);
				request.setAttribute("index", index);
				request.setAttribute("size", size);
				request.getRequestDispatcher("admin.jsp").forward(request, response);
			}
			
		}
		
		
		
	}

}
