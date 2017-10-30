<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--
	vo.Person result = (vo.Person)request.getAttribute("result"); 
	if(result == null) {
		result = new vo.Persion();  ~> no-arg 생성자로 객체를 생성
		request.setAttribute("result", result);
	}
-->
<jsp:useBean scope="request" id="result" class="vo.Person"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/menu.jsp"/>
<h1>조회 결과</h1>
<%-- out.print(result.getName()) --%>
이름 : <jsp:getProperty name="result" property="name"/>   -  <%= result.getName() %><br>
나이 : <jsp:getProperty name="result" property="age"/> 세 <br> 
키    : <jsp:getProperty name="result" property="tall" /> cm <br>
결혼 : <jsp:getProperty name="result" property="marriage" /> <p>

<a href="/myjsp/actiontag/request.jsp">request.jsp</a>
</body>
</html>