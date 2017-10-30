package session.cart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ShoppingCartServlet
 */
@WebServlet("/cart/addCart")
public class ShoppingCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// session
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");

		// 로그인 체크
		if (session.getAttribute("loginMember") == null) {
			request.setAttribute("errorMessage", "장바구니 등록은 로그인을 하셔야 이용 가능합니다.");
			request.getRequestDispatcher("/login/login_form.jsp").forward(request, response);
			return;
		}
		
		// 요청 파라미터
		String[] item = request.getParameterValues("items");
		Integer itemEA = 0;
		HashMap<String, Integer> itemList = (HashMap<String, Integer>)session.getAttribute("itemList");
		if(itemList == null) {
			itemList = new HashMap<String, Integer>();
			session.setAttribute("itemList", itemList);
		}
	
		
		// 처리
		if(item == null) {
			request.setAttribute("errorMessage", "장바구니에 넣을 item이 선택되지 않았습니다.");
			request.getRequestDispatcher("/cart/showItems").forward(request, response);
			
		} else {
			for(String selectItem : item) {
				if (itemList.containsKey(selectItem)) {
					itemEA = itemList.get(selectItem) + 1;
					itemList.put(selectItem, itemEA);
					session.setAttribute("itemList", itemList);
				} else {
					itemEA = 1;
					itemList.put(selectItem, itemEA);
					session.setAttribute("itemList", itemList);
				}
			}
		} 
		request.setAttribute("itemList", itemList);
		
		// 응답
//		request.getRequestDispatcher("/cart/cart_list.jsp").forward(request, response);
		response.sendRedirect("/sessionWeb/cart/cart_list.jsp");
	
	}

}
