<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/menu.jsp"/>
	<h1>장바구니 목록</h1>
	
	<c:choose>
		<c:when test="${empty sessionScope.itemList }">
			<span style="color: red; font-size: 30px"><b>"${requestScope.errorMessage }"
			</b> </span>
		</c:when>
		<c:otherwise>

			<span style="background-color: skyblue; color: navy; font-size: 30px">현재
				추가한 장바구니 목록</span>
			<ul>
			<c:forEach items="${sessionScope.itemList }" var="item">
				<li>${item }</li>
			</c:forEach>
				
			</ul>
		</c:otherwise>
	</c:choose>

	<p>
		<a href="/sessionWeb/index.jsp">메인페이지</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="/sessionWeb/cart/item_list.jsp">상품 목록으로 돌아가기</a>
</body>
</html>