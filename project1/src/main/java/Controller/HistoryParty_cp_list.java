package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.history_Detail_DAO;
import Model.history_SP_niceDTO;

@WebServlet("/HistoryParty_cp_list")
public class HistoryParty_cp_list extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int party_seq = Integer.parseInt(request.getParameter("party_seq"));
		System.out.println("선택한 파티의 번호 : " + party_seq);
		history_Detail_DAO dao = new history_Detail_DAO();
		
		ArrayList<history_SP_niceDTO> cp_list = dao.DT_select(party_seq);
		
		if(cp_list != null) {
			
			System.out.println("상세기록 조회 성공");
			System.out.println(cp_list.size());
			request.setAttribute("cp_list", cp_list);
			
		}
		else {
			System.out.println("상세기록 조회 실패");
		}
		RequestDispatcher rd = request.getRequestDispatcher("niceDetail.jsp");
		rd.forward(request, response);
	}

}
