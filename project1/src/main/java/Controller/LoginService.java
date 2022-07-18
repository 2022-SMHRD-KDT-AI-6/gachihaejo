package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.LoginDAO;
import Model.LoginDTO;



@WebServlet("/LoginService")
public class LoginService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("[LoginService]");
		HttpSession session = request.getSession(); 
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		System.out.println("id :"+ id);
		System.out.println("pw :"+ pw);

		LoginDTO dto = new LoginDTO(id,pw); 
		
		LoginDTO dto2 = new LoginDTO();
		
		LoginDAO dao = new LoginDAO();
		
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if((id!=null && id.equals("")) || (pw!=null && pw.equals(""))) {
			writer.print("<script>alert('아이디 비밀번호를 입력해주세요');location.href='http://localhost:8081/project1/login.jsp'</script>");
			writer.close();
			if(session.getAttribute("user") != null) {
				session.removeAttribute("user");
			}
		}else {
			dto2 = dao.login(dto);	
			if(dto2.getId() != null) {
				
				System.out.println("로그인 성공");
				session.setAttribute("user", dto2); // 세션에 데이터 저장
			}
			else {
				System.out.println("로그인 실패");
				writer.print("<script>alert('회원정보가 없습니다');location.href='http://localhost:8081/project1/login.jsp'</script>");
				writer.close();

			}
		}
		System.out.println("끝");
		
		response.sendRedirect("Main.jsp");
		
		
		
		
		
	}

}
