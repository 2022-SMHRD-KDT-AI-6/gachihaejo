package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.LoginDTO;
import Model.history_SP_niceDAO;

@WebServlet("/RequestCancelService")
public class RequestCancelService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter writer = response.getWriter();
		HttpSession session = request.getSession();
		response.setContentType("text/html; charset=utf-8");
		
		
		 int party_seq = Integer.parseInt(request.getParameter("party_seq"));
		 history_SP_niceDAO dao = new history_SP_niceDAO();
		 
		 
		 System.out.println(party_seq);
		LoginDTO user = (LoginDTO)session.getAttribute("user");
		String user_id = user.getId();
		
		// 나중에 세션에서 유저 아이디 받아올 것!
		int row = dao.rq_delete(party_seq, user_id);
		
		if(row > 0) {
		
			System.out.println("파티신청 취소 완료");
			
			
		}else {
			
			System.out.println("파티신청 취소 실패");
		}
		
		writer.print(row);
		 
	}

}
