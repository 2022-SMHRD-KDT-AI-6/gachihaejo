package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import Model.MemberDAO;
import Model.MemberDTO;


@WebServlet("/MyPageServlet")
public class MyPageServlet extends HttpServlet {
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 프로젝트
		
		// 업데이트 함수, 중복 거르는 조건문 만들기
		request.setCharacterEncoding("UTF-8");
		
		String savePath = request.getServletContext().getRealPath("image");
		System.out.println(savePath);
		
		// 최대 허용 용량(단위 byte)
		int maxSize = 5 * 1024 * 1024; // 5MB
		
		// 인코딩 방식
		String encoding = "utf-8";
		
		// multipart 데이터를 받을 수 있는 request 생성
		MultipartRequest multi = new MultipartRequest(
				request, // 원본 request 필요
				savePath, // 저장 경로
				maxSize, // 최대 용량
				encoding, // 인코딩 방식
				new DefaultFileRenamePolicy() // 중복된 파일 이름 발생 시 자동으로 이름 변환
				);
		
		String user_pw = multi.getParameter("user_pw");
		String user_nick = multi.getParameter("user_nick");
		String user_phone = multi.getParameter("user_phone");
		String user_email = multi.getParameter("user_email");
		String user_profile = multi.getParameter("user_profile");
		
		String user_photo = multi.getFilesystemName("file");
		System.out.println("전송 받은 파일 : " + user_photo);
		
		// 내가 확인하면서 할 것
//		MemberDAO dao = new MemberDAO();
//		MemberDTO user = dao.select("user_id");
		
		System.out.println("비밀번호 : " + user_pw);
		System.out.println("닉네임 : " + user_nick);
		System.out.println("번호 : " + user_phone);
		System.out.println("이메일 : " + user_email);
		System.out.println("프로필 : " + user_profile);
		System.out.println("사진 : " + user_photo);
		
		
		// 은영이꺼랑 합치면 쓰장
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("user_id");
//		String user_id = user.getUser_id(); -> 확인
		String user_id = dto.getUser_id();
		
		System.out.println("아이디 : " + user_id);
		
		MemberDTO udto = new MemberDTO(user_id, user_pw, user_nick, user_phone, user_email, user_profile, user_photo);
		
		MemberDAO dao = new MemberDAO();
		// -> 합치고 나서 사용!
		int cnt = dao.update(udto);
		
		if(cnt > 0) {
			// 성공 : cnt = 1
			System.out.println("개인정보 수정 성공");
			
			System.out.println("수정 비번 : " + udto.getUser_pw());
			System.out.println("수정 닉 : " + udto.getUser_nick());
			System.out.println("수정 번호 : " + udto.getUser_phone());
			System.out.println("수정 메일 : " + udto.getUser_email());
			System.out.println("수정 프로필 : " + udto.getUser_profile());
			System.out.println("수정 사진 : " + udto.getUser_photo());
			
			// 세션에 있는 dto 덮어쓰기
			// 저장하는 이름이 겹쳤을 경우 -> 덮어쓰기
			session.setAttribute("user", udto);
		}else {
			// 실패 : cnt = 0
			System.out.println("개인정보 수정 실패");
		}
		
		response.sendRedirect("Main.jsp");
	}

}
