package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.CreatePartyDAO;
import Model.CreatePartyDTO;
import Model.LoginDTO;

@WebServlet("/CreatePartyService")
public class CreatePartyService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		LoginDTO user = (LoginDTO)session.getAttribute("user");
		
		String title = request.getParameter("title");
		String type = request.getParameter("hobby");
		String content = request.getParameter("text");
		String addr = request.getParameter("testmap");
		int max_cnt = Integer.parseInt(request.getParameter("maxPeople"));
		String end_date = request.getParameter("endDate");
		String end_time = request.getParameter("time");
		Double lat = Double.parseDouble(request.getParameter("lat"));
		Double lon = Double.parseDouble(request.getParameter("lon"));
		String end_date_time = end_date + " " + end_time;
		String user_id = user.getId();
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		System.out.println(title);
		System.out.println(type);
		System.out.println(content);
		System.out.println(addr);
		System.out.println(max_cnt);
		System.out.println(end_date_time);
		System.out.println(lat);
		System.out.println(lon);

		CreatePartyDAO dao = new CreatePartyDAO();
		CreatePartyDTO dto = new CreatePartyDTO(title, type, content, addr, max_cnt, end_date_time, user_id, lat, lon);
		
		int row = dao.insert(dto);
		
		if(row != 1) {
			System.out.println("파티생성 실패");
			writer.print("<script>alert('파티생성 실패');location.href='http://localhost:8081/project1/CreatePartys.jsp'</script>");
			writer.close();
			
		}else {
			System.out.println("파티생성 성공");
			writer.print("<script>alert('파티생성 성공');location.href='http://localhost:8081/project1/CreatePartys.jsp'</script>");
			writer.close();
		}
		// response.sendRedirect("./Home.jsp");
	}

}
