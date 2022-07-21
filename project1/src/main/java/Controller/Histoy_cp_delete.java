package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.history_CP_niceDAO;

@WebServlet("/Histoy_cp_delete")
public class Histoy_cp_delete extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		int party_seq = Integer.parseInt(request.getParameter("party_seq"));
		
		history_CP_niceDAO dao = new history_CP_niceDAO();
		
		int result = dao.CP_delect(party_seq);
		 
		
		
		
		if(result > 0) {
			System.out.println("삭제 성공");
		}else {
			System.out.println("삭제 실패");
		}
		
		// 질문! Ajax로 해결했는데 바로바로 테이블이 지워지지는 않나...?
		
	
	}

}
