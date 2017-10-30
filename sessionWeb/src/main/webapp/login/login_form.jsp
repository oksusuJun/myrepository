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
	<h1>로그인</h1>
	<%
		String errorMessage = (String)request.getAttribute("errorMessage");	
	%>

	<c:if test="${errorMessage != null }">
	<span style="color:red;font-size:30px"><b>"warning : <%= errorMessage %>"</b> </span>
	</c:if>

	<form action="/sessionWeb/login" method="post">
		ID : <input type="text" name="id"><br> 
		Password : <input type="password" name="password"><br>
		<button type="submit">로그인</button>
	</form>
</body>
</html>