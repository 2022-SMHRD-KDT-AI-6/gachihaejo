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

@WebServlet("/MainService")
public class MainService extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		MainDAO dao = new MainDAO();
		
		
		ArrayList<MainDTO> dto = dao.select();
		
		System.out.println("���");
		request.setAttribute("list", dto);
		RequestDispatcher rd = request.getRequestDispatcher("view.jsp");
		rd.forward(request, response);
		
		
	}

}
