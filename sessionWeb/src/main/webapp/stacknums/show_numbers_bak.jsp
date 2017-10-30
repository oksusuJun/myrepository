<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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
 
 <%
 	
 	ArrayList<Integer> list = (ArrayList<Integer>)session.getAttribute("numberList");
 	if(list == null || list.isEmpty()) {
 %>
 <span style="color:red;font-size:30px"><b>누적된 숫자가 없습니다.</b></span>
 <% } else { %>
<ul>
<% 	 	for(Integer num : list) {
%>
	 		<li><span style="background-color:skyblue;color:navy;font-size:20px"><%= num %></li></span>
<%	 	} // for 종료  %>
</ul>
<%	} 	// else 종료
%>

 <p>
 <a href="/sessionWeb/index.jsp">메인페이지</a>
</body>
</html>