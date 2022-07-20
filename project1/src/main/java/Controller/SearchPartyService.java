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

import Model.SearchPartyDAO;
import Model.SearchPartyDTO;

@WebServlet("/SearchPartyService")
public class SearchPartyService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("파티찾기 서블릿입니다.");
		
		String Do = request.getParameter("addressDo");
		String Gungu = request.getParameter("addressSiGunGu");
		String hobby = request.getParameter("hobby");
		
		SearchPartyDAO dao = new SearchPartyDAO();
		
		if(Do != null && Gungu != null && hobby != null) {
			
			ArrayList<SearchPartyDTO> list = (ArrayList<SearchPartyDTO>)dao.select(Do, Gungu, hobby);
			
			request.setAttribute("list", list);
			RequestDispatcher rd = request.getRequestDispatcher("SearchPartys.jsp");
			rd.forward(request, response);
			
			
		}else {
			System.out.println("조건에 맞는 파티가 존재하지 않습니다.");
			response.sendRedirect("SearchPartys.jsp");
		}
		
		
		
		
//		if(Do != null && Gungu != null && hobby != null) {
//			
//			ArrayList<SearchPartyDTO> list = dao.select(Do, Gungu, hobby);
//			
//				request.setAttribute("list", list);
//				// forward 이동
//				// request가 사라지지 않게 유지시키면서 jsp로 이동
//				RequestDispatcher rd = request.getRequestDispatcher("#");
//				rd.forward(request, response);
//		}else {
//			
//		}
//		
//		response.sendRedirect("test.jsp");
	
	}

}
