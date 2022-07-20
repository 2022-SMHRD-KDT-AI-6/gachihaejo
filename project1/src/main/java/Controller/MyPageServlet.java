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

import Model.LoginDTO;
import Model.MemberupDAO;



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
		
		String pw = multi.getParameter("pw");
		String nick = multi.getParameter("nick");
		String phone = multi.getParameter("phone");
		String email = multi.getParameter("email");
		String profile = multi.getParameter("profile");
		String name = multi.getParameter("name");
		String birth = multi.getParameter("birth");
		String gender = multi.getParameter("gender");
		
		
		String photo = multi.getFilesystemName("file");
		String photo2 = multi.getParameter("file2");
		
		
		System.out.println("전송 받은 파일 : " + photo);
		System.out.println("전송 받은 파일 : " + photo2);
		
		if(photo == null ) {
			photo = photo2;
		}
		
		// 내가 확인하면서 할 것
//		MemberDAO dao = new MemberDAO();
//		MemberDTO user = dao.select("user_id");
		
		System.out.println("비밀번호 : " + pw);
		System.out.println("닉네임 : " + nick);
		System.out.println("번호 : " + phone);
		System.out.println("이메일 : " + email);
		System.out.println("프로필 : " + profile);
		System.out.println("사진 : " + photo);
		
		
		// 은영이꺼랑 합치면 쓰장
		HttpSession session = request.getSession();
		LoginDTO dto = (LoginDTO)session.getAttribute("user");
//		String user_id = user.getUser_id(); -> 확인
		String id = dto.getId();
		
		System.out.println("아이디 : " + id);
		
		LoginDTO udto = new LoginDTO(id, pw, name, nick, birth, gender, email, phone, profile, photo);
		
		MemberupDAO dao = new MemberupDAO();
		// -> 합치고 나서 사용!
		int cnt = dao.update(udto);
		
		
		
		if(cnt > 0) {
			// 성공 : cnt = 1
			
		
			
			System.out.println("개인정보 수정 성공");
			
			System.out.println("수정 비번 : " + udto.getPw());
			System.out.println("수정 닉 : " + udto.getNick());
			System.out.println("수정 번호 : " + udto.getPhone());
			System.out.println("수정 메일 : " + udto.getEmail());
			System.out.println("수정 프로필 : " + udto.getProfile());
			System.out.println("수정 사진 : " + udto.getPhoto());
			
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
