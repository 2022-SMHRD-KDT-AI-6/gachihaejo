package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.LoginDAO;


@WebServlet("/NickCheckService")
public class NickCheckService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		// ajax로 값을 받기 때문에 UTF-8로 인코딩해준다
		response.setCharacterEncoding("EUC-KR");
		
		String nick = request.getParameter("nick");
		
		System.out.println(nick);
		
		PrintWriter out = response.getWriter();
		
		
		
		LoginDAO dao = new LoginDAO();
		
		int nickCheck = dao.checkNick(nick);
		
		//성공여부 확인
		if(nickCheck == 0) {
			System.out.println("이미 존재하는 닉네임입니다.");
		}else if(nickCheck == 1) {
			System.out.println("사용 가능한 닉네임입니다.");
		}
		
		out.write(nickCheck + ""); // ajax 결과값이 result가 됨
						// String으로 값을 내보낼 수 있도록 +""를 해준다
		
		}
	}


