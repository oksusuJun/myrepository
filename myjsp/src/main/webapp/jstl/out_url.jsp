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

<h1>out 태그</h1>
<br>은 엔터입니다.
&lt;br&gt;은 엔터입니다.	5&lt; 3<p>
<c:set var="message" scope="request" value="이것은 메세지입니다."/>
<c:out value="<br>은 엔터입니다.-<out>태그로 출력" /><br>
<c:out value="${requestScope.message }" default="메세지가 없습니다."/>

<h1>url 태그</h1> <!-- 링크에 url을 만들 때 사용 -->
<c:url value="/jstl/url_response.jsp" var="myurl">  <!-- 자주 사용할 url 등록 ## main으로 이동이 많을 테니 쓸 일이 있을수도... -->
	<%-- 
		요청 파라미터 등록
		 - url 뒤에 QueryString 으로 추가 
		 - URL Encoding 처리
	--%>
	<c:param name="name">홍길동</c:param>
</c:url>
<a href="/myjsp/jstl/url_response.jsp">url_response.jsp</a>
<a href='<c:url value="/jstl/url_response.jsp"/>'>url_response.jsp - url태그 이용</a>
<a href="${myurl }">url_response.jsp-등록한url</a>
</body>
</html>