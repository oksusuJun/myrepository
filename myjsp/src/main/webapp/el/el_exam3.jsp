<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>요청 파라미터 출력 - EL</h1>
	name : ${param.name }
	<br>
	<%-- param.요청파라미터이름 : request.getParameter() --%>
	age : ${param.age }
	<br> 
	language : ${param.language }<br>
	${paramValues.language[0] } ${paramValues.language[1] } ${paramValues.language[2] }
	<%-- paramValues.요청파라미터이름 : request.getParameterValues() --%>
</body>
</html>