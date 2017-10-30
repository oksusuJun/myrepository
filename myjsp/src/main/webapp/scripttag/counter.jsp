
<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.text.DecimalFormat"
    pageEncoding="UTF-8"%>
<%! 
	// 선언자 태그 - instance 변수, 메소드(jspInit, jspDestroy) 선언/구현
	private int count = 100000;
%>
<!DOCTYPE html>
<html>
<head>
<meta content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/menu.jsp"/>
<%
	// 프로그램 로직 - 스크립트 태그
	int size = (int)(Math.random()*50+1); // 1~50
	DecimalFormat format = new DecimalFormat("#,###");
	String countStr = format.format(++count);
%>
환영합니다!<br>
당신은 <span style="color:white;font-size:<%=size%>px;background-color:yellowgreen">
<b><%= countStr %></b></span> 번째 방문자 입니다.

</body>
</html>
<%-- http://127.0.0.1:8088/myjsp/scripttag/counter.jsp --%>
<!--   ~>  html <%= size%> 주석!! -->