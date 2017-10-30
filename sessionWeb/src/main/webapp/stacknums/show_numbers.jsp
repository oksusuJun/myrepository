<%@page import="java.util.ArrayList"%>
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
<!-- 
	<process>
	1. Session 에서 numberList 조회 
	2. 반복문을 이용하여 list 내의 숫자들을 출력
 -->
 <p>
 <a href="/sessionWeb/stacknums/stack">숫자 누적하기!</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <a href="/sessionWeb/stacknums/removenums">누적 숫자 제거</a>
 </p>
 <!-- 
 	ul -> li : 항목 앞에 점을 붙여 출력된다. 
 	<ul>
	<li>10</li>
 	<li>20</li>   
 	</ul>
 
 -->
 <c:choose>
 	<c:when test="${empty sessionScope.numberList }">
 	 <span style="color:red;font-size:30px"><b>누적된 숫자가 없습니다.</b></span>
 	</c:when>
 	<c:otherwise>
 		<ul>
 		<c:forEach items="${sessionScope.numberList }" var="num">
 		<li><span style="background-color:skyblue;color:navy;font-size:20px">
 		${num }
 		</li></span>
 		</c:forEach>
 		</ul>
 	</c:otherwise>
 </c:choose>

 <p>
 <a href="/sessionWeb/index.jsp">메인페이지</a>
</body>
</html>



