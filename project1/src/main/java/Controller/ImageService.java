package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/ImageService")
public class ImageService extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String savePath = request.getServletContext().getRealPath("image");
		System.out.println(savePath);
		
	
		int maxSize = 5* 1024 * 1024; 
		
		//3. 인코딩 방식
		String encoding = "utf-8";
		
		MultipartRequest multi = new MultipartRequest(
				request, //원본 request 필요
				savePath, //저장 경로
				maxSize, //최대용량
				encoding, //인코딩 방식
				new DefaultFileRenamePolicy() 
			);
		
		String filename = multi.getFilesystemName("file");
		System.out.println("전송받은 파일 : " + filename);	
	}

}
