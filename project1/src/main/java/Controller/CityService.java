package Controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.MainDAO;
import Model.MainDTO;

@WebServlet("/CityService")
public class CityService extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("[CityService]");
		String city = request.getParameter("city");
	
		System.out.println(city);
	
		MainDAO dao = new MainDAO();
		ArrayList<MainDTO> list = dao.select(city);
		
		//객체 바인딩
		request.setAttribute("list", list);
						
		//forward 이동
		//request가 사라지지 않게 유지시키면서 jsp로 이동//
		
		RequestDispatcher rd = request.getRequestDispatcher("view.jsp");
		
		rd.forward(request, response);// 페이지 이동
	
	}

}
