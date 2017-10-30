<%@page import="java.util.Map"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>장바구니 목록</h1>
<%	
	String errorMessage = (String)request.getAttribute("errorMessage");
	HashMap<String, Integer> itemList = (HashMap<String, Integer>)session.getAttribute("itemList");
	if(itemList == null || itemList.isEmpty()) {
%>
<span style="color:red;font-size:30px"><b>"<%= errorMessage %>"</b> </span>
<% } else { %>
<ul>
<%
	Set set = itemList.entrySet();
%>
<span style="background-color:skyblue;color:navy;font-size:30px">현재 추가한 장바구니 목록</span>

<li><%= set %></li>
</ul>
<% } %>
<p>
<a href="/sessionWeb/index.jsp">메인페이지</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="/sessionWeb/cart/item_list.jsp">상품 목록으로 돌아가기</a>
</body>
</html>