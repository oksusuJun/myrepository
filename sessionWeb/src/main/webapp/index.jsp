<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>index.jsp - 메인페이지</h1>

<%
	// 로그인을 하지 않았다면
	Object loginFlag = session.getAttribute("loginMember");
	if(loginFlag == null) { // 로그인 하지 않은 사람만 보는 메뉴
%>
<a href="/sessionWeb/login/login_form.jsp">로그인 폼</a>
<%	} else {  // 로그인 한 사람만 보는 메뉴 %> 
<a href="/sessionWeb/stacknums/stack">숫자 누적</a>
<a href="/sessionWeb/logout">로그아웃</a>
<%	} %>
<!-- 로그인 여부에 상관 없이 보는 메뉴 -->
<a href="/sessionWeb/cart/showItems">상품 목록 보기</a>

</body>
</html>


<!-- 
	사용자가 인터넷창을 껐는지, 뭔지, 뭐하는지 모르기때문에
	session을 종료하지 않은 채로 계속 쌓이게 된다.
	따라서, container 에서 일정 시간이 지난 후 연결을 끊어버리도록 만든다.
	~> web.xml
-->