package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.RequestPartyDAO;
import Model.RequestPartyDTO;

@WebServlet("/RequestPartyService")
public class RequestPartyService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html; charset=utf-8");

		String cpath = request.getContextPath();
		PrintWriter writer = response.getWriter();

		String party_seq_s = request.getParameter("party_seq");
		System.out.println("파티 번호 : " + party_seq_s);

		int party_seq = Integer.parseInt(request.getParameter("party_seq"));
		String user_id = request.getParameter("user_id");
		System.out.println("유저 아이디 : " + user_id);

		RequestPartyDTO dto = new RequestPartyDTO();

		dto.setParty_seq(party_seq);
		dto.setUser_id(user_id);

		RequestPartyDAO dao = new RequestPartyDAO();

		int row = 0;

		boolean result = dao.select(dto);

		if (result) {
			System.out.println("파티신청 성공");
			row = dao.party_request(dto);
			
			writer.print(row);
		}

		else {
			System.out.println("파티신청 실패");
		}
	}

}
