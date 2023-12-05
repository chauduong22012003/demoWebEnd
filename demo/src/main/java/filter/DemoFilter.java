package filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter("/*") // Đăng ký Filter cho tất cả các URL
public class DemoFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        // Khởi tạo Filter (không cần thực hiện gì đặc biệt ở đây)
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String url = httpRequest.getRequestURL().toString();

        // Thực hiện kiểm tra đầu vào URL tại đây
        boolean isValid = validateURL(url);
        String id =request.getParameter("id");
        HttpSession session = httpRequest.getSession();
        String idCus=(String)session.getAttribute("userId");
       
        
    
        if(id !=null) {
        	  if (!id.equals(idCus)) {
             	 RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
                  dispatcher.forward(request, response);
             }
        }

        if (isValid) {
            
            chain.doFilter(request, response);
        } else {
            // Nếu URL không hợp lệ, có thể chuyển hướng hoặc xử lý theo ý muốn
            RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    public void destroy() {
        // Huỷ Filter (không cần thực hiện gì đặc biệt ở đây)
    }

    private boolean validateURL(String url) {
        // Thực hiện kiểm tra đầu vào URL tại đây
        // Trả về true nếu URL hợp lệ, false nếu không hợp lệ
        // Có thể sử dụng các biểu thức chính quy hoặc điều kiện tùy thuộc vào yêu cầu kiểm tra của bạn
        // Ví dụ:
        return url.startsWith("http://localhost:8080/demo/");
    }
}
