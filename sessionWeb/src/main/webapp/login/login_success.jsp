<%@page import="vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/menu.jsp"/>
<h1>login_success.jsp</h1>


<!-- < % HttpSession session = request.getSession(); %>  #### 필요없음!!-->
<!--
	JSP
	+ HttpServletRequest 객체 사용 : request 변수 사용
		(request.getParameter("~");  &  request.getAttribute("~");
	+ HttpSession 객체 사용 : session 변수 사용
		(session.getAttribute("~");  &  session.setAttribute("~");
	
	=> request, session 변수 : JSP 내장 객체	
-->

<span style="color:green;font-size:30px">
 ${sessionScope.loginMember.name }</span> <b>님 환영합니다!</b>
<p>
<a href="/sessionWeb/index.jsp">메인페이지</a>
<a href="/sessionWeb/logout">로그아웃</a>
</body>
</html>