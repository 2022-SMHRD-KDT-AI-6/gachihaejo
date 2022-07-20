package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Model.LoginDAO;
import Model.LoginDTO;

@WebServlet("/JoinService1")
public class JoinService1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("[JoinService1]");
		 request.setCharacterEncoding("UTF-8");
		 
		 String savePath = request.getServletContext().getRealPath("image");
			System.out.println(savePath);
			int maxSize = 5* 1024 * 1024; // 5MB
			String encoding = "utf-8";
			MultipartRequest multi = new MultipartRequest(
					request, //원본 request 필요
					savePath, //저장 경로
					maxSize, //최대용량
					encoding, //인코딩 방식
					new DefaultFileRenamePolicy() 
				);
		
		
			String id = multi.getParameter("id");
		System.out.println(id);
		String pw = multi.getParameter("pw");
		String name = multi.getParameter("name");
		String nick = multi.getParameter("nick");	
		String birth_yy = multi.getParameter("birth_yy");
		String birth_mm = multi.getParameter("birth_mm");
		String birth_dd = multi.getParameter("birth_dd");
		String gender = multi.getParameter("gender");
		String phone = multi.getParameter("phone");
		String email = multi.getParameter("email");
		String profile = multi.getParameter("profile");
		String photo = multi.getFilesystemName("file");//input 태그에 걸려있는 name
		System.out.println("전송받은 파일 : " + photo);	
		
		
		
		String birth = birth_yy+"."+birth_mm+"."+birth_dd;
		
		//이거 왜 포토,생일은 2개 생성되는거???
		LoginDTO dto = new LoginDTO(id, pw, name, nick, birth, gender, email, phone, profile, photo);
		
		System.out.println("id :"+dto.getId());
		System.out.println("pw :"+dto.getPw());
		System.out.println("name :"+dto.getName());
		System.out.println("nick :"+dto.getNick());
		System.out.println("birth:"+dto.getBirth());
		System.out.println("gender:"+dto.getGender());
		System.out.println("email :"+dto.getEmail());
		System.out.println("phone :"+dto.getPhone());
		System.out.println("profile :"+dto.getProfile());
		System.out.println("photo :"+dto.getPhoto());
		
		
		LoginDAO dao = new LoginDAO();
		int row = dao.join(dto);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		if(row == 1) {
			System.out.println("회원가입 성공");
			writer.print("<script>alert('회원가입 성공 !');location.href='http://localhost:8081/project1/view.jsp'</script>");
			writer.close();
//			request.setAttribute("user_id", id);	
//			
//			//회원가입 성공 후 어디 페이지로 가야 되는가?Main페이지?회원가입 성공 페이지?
//			RequestDispatcher rd = request.getRequestDispatcher("./");
//			rd.forward(request, response);
			 
		}else {
			System.out.println("회원가입 실패");
			writer.print("<script>alert('회원가입 실패');location.href='http://localhost:8081/project1/join.jsp'</script>");
			writer.close();
//			response.sendRedirect("./join.jsp");
		
//			request.setAttribute("user_id", id);
//			RequestDispatcher rd = request.getRequestDispatcher("./join.jsp");
//			rd.forward(request, response);

		}
//		RequestDispatcher rd = request.getRequestDispatcher();
//		rd.forward(request, response);
		
		
	}
}
		
		
		
		
	


