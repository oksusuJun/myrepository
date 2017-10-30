package session.login;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그아웃 처리 - 요청한 사용자의 Session을 '소멸'시킨다.
		HttpSession session = request.getSession();	// session 가져오기
		session.invalidate();	// session 소멸 --> 사용자가 사용할 수 없게 만드는 것
		
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);	// doGet 에 구현해놓고 post방식으로 요청이 들어오면 doGet 을 호출하여 같은 작업을 하게 한다.
	}

}
