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
<c:choose>
	<c:when test="${empty sessionScope.loginMember }">
	<a href="/sessionWeb/login/login_form.jsp">로그인 폼</a>
	</c:when>
	<c:otherwise>
	<a href="/sessionWeb/stacknums/stack">숫자 누적</a>
	<a href="/sessionWeb/logout">로그아웃</a>
	</c:otherwise>
</c:choose>
<!-- 로그인 여부에 상관 없이 보는 메뉴 -->
<a href="/sessionWeb/cart/showItems">상품 목록 보기</a>

</body>
</html>