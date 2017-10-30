<%@page import="vo.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- 
	JSTL 사용 
	1.	jstl library를 다운	
	2. 각 JSP 에서 taglib 지시자 설정 
	~> 여기서는 Maven 사용
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set scope="session" var="loginInfo"
	value='<%=new Person("홍길동", 30, 175.7, false)%>' />
<c:set target="${sessionScope.loginInfo }" property="age" value="15" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 
	사용자가 로그인 한 상태이면 메뉴2를, 
	로그인하지 않은 상태이면 메뉴 1을 보여준다. 
	고객센터 - 공통메뉴
	* 로그인 여부 : session 영역에 loginInfo 라는 속성이 있으면 login 상태, 없으면 안한 상태
	-> else => choose Tag 사용
--%>
<c:choose>
	<c:when test="${empty sessionScope.loginInfo }">
	메뉴1 : 로그인  | 회원가입
	
	</c:when>
	<c:otherwise>
	메뉴2 : 로그아웃  | 마이페이지
	<%-- 로그인한 사람의 나이가 20세 이상이면 성인용품 메뉴를 보여준다. --%>
	<c:if test="${sessionScope.loginInfo.age >= 20 }">
	 | 성인용품<br>
	</c:if>
	</c:otherwise>
</c:choose>
| 고객센터<br>
</body>
</html>