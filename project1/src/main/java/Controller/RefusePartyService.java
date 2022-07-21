package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.history_SP_niceDAO;

@WebServlet("/RefusePartyService")
public class RefusePartyService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		PrintWriter writer = response.getWriter();
		history_SP_niceDAO dao = new history_SP_niceDAO();
		System.out.println("파티거절 서비스입니다.");
		int party_seq = Integer.parseInt(request.getParameter("party_seq"));
		String user_id = request.getParameter("user_id");

		System.out.println(party_seq);

		int row = dao.update_refuse(party_seq, user_id);

		if (row > 0) {

			System.out.println(user_id + "거절 완료");

		} else {

			System.out.println(user_id + "거절 실패");

		}

		writer.print(row);

	}
		
		
	}


