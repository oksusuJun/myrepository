<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인</h1>
	<%
		String errorMessage = (String)request.getAttribute("errorMessage");
		if(errorMessage != null) {		
	%>
	<span style="color:red;font-size:30px"><b>"warning : <%= errorMessage %>"</b> </span>
	
	<%} %>
	<form action="/sessionWeb/login" method="post">
		ID : <input type="text" name="id"><br> 
		Password : <input type="password" name="password"><br>
		<button type="submit">로그인</button>

	</form>
</body>
</html>