<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setAttribute("current", new Date());
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
현재 일시 : ${requestScope.current }<br>
<h1>fmt를 이용하여 일시 출력</h1>
<%--
	fmt:setLocale 태그로 지역을 설정하면
	formatDate / formatNumber의 기본 형식이
	해당 지역의 형식으로 변경된다.
	지역 코드 형식 : 언어코드_국가코드
	언어코드 : ISO-639, 국가코드 : ISO-3166
	 *주요코드
	 	- 한국 : ko_RK
	 	- 중국 : zh_CN, zh_TW(대만)
	 	- 미국 : en_US
	 	- 영국 : en_GB
	 	- 일본 : ja_JP
 --%>
<fmt:setLocale value="en_US"/> <!-- fmt를 통해 출력할 것들을 영어_미국 형태에 맞춰라 -->
<fmt:setLocale value="zh_CN"/> <!-- 중국 형태 -->

<fmt:formatDate value="${requestScope.current }" /><br> 
<fmt:formatDate value="${requestScope.current }" type="time"/><br>
<fmt:formatDate value="${requestScope.current }" type="both"/><br>
<%--
	type="date" 는 기본값 ~> 생략!!
	date : 날짜만
	time : 시간만
	both : 날짜 + 시간
 --%>
 <fmt:formatDate value="${requestScope.current }" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초"/><br>
 <fmt:formatDate value="${requestScope.current }" pattern="yyyy/MM/dd  HH:mm:ss"/><br>
 

</body>
</html>