package session.stacknum;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import exception.LoginFailException;
import vo.Member;

/**
 * Servlet implementation class StackNumberServlet
 */
@WebServlet("/stacknums/stack")
public class StackNumberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/*
	 * 요청한 사용자가 볼 숫자를 생성하여 요청시마다 누적처리 => 로그인한 사용자만 사용할 수 있는 서비스 (->로그인 체크 필요) <기본흐름>
	 * 1. 로그인 여부 체크 2. 새로운 숫자를 생성 3. 생성한 숫자를 Session에 추가 4. show_numbers.jsp 로 이동
	 * (응답)
	 * 
	 * <예외흐름> 1-a. 로그인을 하지 않은 사용자? -> login_form.jsp 로 이동
	 * 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 1. HttpSession 조회
		HttpSession session = request.getSession(); // 요청한사람의 session 내놔!!!!

		// 2. 로그인 여부 체크 : x -> login_form.jsp 로 이동
		/*
		 * if 에서 return 을 바로 하는 것은
		 * if-else 구문에서 반드시 처리되어야 하는 것이 있다면 return 하면 안되고,
		 * if 문 다음 else 에서만 처리되어도 되는 것이면 if 에서 return 하고 블럭 바깥에 else 구문을 바로 넣는다.
		 */
		if (session.getAttribute("loginMember") == null) {
			request.setAttribute("errorMessage", "숫자 누적은 로그인을 해야 합니다.");
			request.getRequestDispatcher("/login/login_form.jsp").forward(request, response);
			return;	
		} 
		
		/*
		 * 누적 숫자들을 저장할 list 를 session에서 조회
		 *  - 없다면 만들어서 session에 넣는다.
		 */
		int num = (int)(Math.random()*1000); 	// 누적할 새 숫자
		ArrayList<Integer> list = (ArrayList<Integer>)session.getAttribute("numberList");
		if(list == null) {
			list = new ArrayList<>();
			session.setAttribute("numberList", list);
		}
		
		// 숫자를 list에 넣는다. -> 누적!!
		list.add(num);
		
		// 3. 응답
		request.getRequestDispatcher("/stacknums/show_numbers.jsp").forward(request, response);

	}

}
