package session.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import exception.LoginFailException;
import vo.Member;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 요청 파라미터 조회
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		try {
		// 2. Business logic 처리 (로그인 처리) - Model 호출
			Member member = authenticate(id, password);
			// 인증 성공 -> 로그인 처리 : HttpSession 생성 + 로그인여부 체크 속성 추가
			HttpSession session = request.getSession();	// session 생성
			// 로그인 여부 체크 
			session.setAttribute("loginMember", member);
			// 로그인할 때 httpsession 에 loginMember 라는 이름으로 member 객체를 준다.
			// member 객체 말고 그냥 의미없는 값을 줄 수도 있지만, 추후 사용할 수 있는 값을 주는 것이 좋다. --> 로그인한 회원의 회원정보,,
			
			// 3. 처리결과 응답 - View 호출
			request.getRequestDispatcher("/login/login_success.jsp").forward(request, response);
		} catch(LoginFailException e) {
			// 인증 실패
			// 3. 처리결과(실패결과) 응답
			request.setAttribute("errorMessage", e.getMessage());
			request.getRequestDispatcher("/login/login_form.jsp").forward(request, response);
		}

	}
	
	/*
	 * 회원 인증(Login) 처리하는 메소드
	 *  => MemberService(Business Service) 에 있는 메소드
	 * 
	 * 원래 Business logic 을 따로 빼면 MemberService 라는 클래스를 만들고 그 안에 들어가야하는 메소드이다.
	 * 
	 * <기본흐름>
	 *  1. 매개변수로 받은 ID와 password가 회원 DB에 있는지 확인
	 *  2. 회원의 정보를 리턴
	 * 
	 * <오류흐름>
	 *  2-1. 회원정보가 틀리면 예외를 던진다.
	 */
	public Member authenticate(String id, String password) throws LoginFailException {
//		String dbId = "java", dbPwd = "servlet"; --> 가정
		// Member member = memberDao.selectMemberById(id);
			// select id, password, name, email from member where id=?
		/* 원래 위의 두 구문이 진행되고 나서 아래 구문이 진행되어야한다.*/
		// DAO 를 만들게되면 삭제할 구문 두 줄
		// delete 1
		Member member = null; // 없는 ID
		// delete 2
		member = new Member(id, "servlet", "김회원", "kim@a.com"); // ID 가 있다!!!!!!!
		if (member != null) { // 있는 ID 라면~
			if (password.equals(member.getPassword())) {
				// 인증 성공
				return member;
			} else {	// ID 는 있는데, Password 는 틀린경우 -> 인증 실패
				throw new LoginFailException("비밀번호를 다시 확인하십시오.");
			}
		} else {  // 없는 ID 라면~
			throw new LoginFailException("없는 ID 입니다. ID를 다시 확인해주세요.");
		}
		
	}

}
