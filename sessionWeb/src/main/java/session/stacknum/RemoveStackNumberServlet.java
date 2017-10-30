package session.stacknum;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class RemoveStackNumberServlet
 */
@WebServlet("/stacknums/removenums")
public class RemoveStackNumberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	/*
	 * 누적된 숫자 제거
	 * <기본 흐름>
	 *  1. 로그인 여부 체크
	 *  2. 누적된 숫자 제거
	 *  3. show_numbers.jsp 로 이동
	 *  
	 *  <예외 흐름>
	 *  1-a. 로그인을 하지 않은 경우
	 *  	-> login_form.jsp 로 이동
	 */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// session
		HttpSession session = request.getSession();
		
		// 1. 로그인 여부 체크
		if (session.getAttribute("loginMember")==null) {
			request.setAttribute("errorMessage", "숫자 누적초기화는 로그인을 하셔야 가능합니다.");
			request.getRequestDispatcher("/login/login_form.jsp").forward(request, response);
			return;
		}
		
		// 2. 누적된 숫자 제거
		session.removeAttribute("numberList");  // by Teacher -> ArrayList 자체를 날려버린다! ,,,사용자가 더이상 숫자 누적을 안하겠다 하는것으로 판단.
		
		/*
		// @jun -> ArrayList 내부 데이터만 제거
		ArrayList<Integer> list = (ArrayList<Integer>)session.getAttribute("numberList");
		list.clear();
		*/
		request.getRequestDispatcher("/stacknums/show_numbers.jsp").forward(request, response);
		
	}

}
