<%@page import="vo.Person" isELIgnored="false"%>
<%-- isELIgnored : EL 무시할래? -> true : 무시 / false : 놉! --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setAttribute("result", "request - 결과값");  // 이 값이 설정되서 jsp 로 온다.
	session.setAttribute("result", "session - 결과값");
	request.setAttribute("error message", "xxx 이유로 오류가 발생했습니다.");
	
	session.setAttribute("person", new Person("홍길동", 20, 182.1, false));
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
결과값 : ${result} || ${requestScope.result } || ${sessionScope.result } || ${requestScope["result"] }<br>
<!--
	result 만 적는 것은, page로 갔다가 없으면 request 로 가서 값을 찾고,
	requestScope.result 는 바로 request 로 접근하여 값을 찾는다.
 -->
 오류 메세지 : ${requestScope["error message"] }<br>
 오류메세지 유무 : ${requestScope["error message"] == null } - ${empty requestScope["error message"] }<br>
 			  ${requestScope["error message"] != null } - ${empty requestScope["error message"] }<br>
 			  <!--  true or false 로 결과 리턴 -->
 <!-- 속성 명에 공백이 있는 경우, '.속성명' 으로 접근하지 않고 ["속성명"] 으로 접근해야한다. -->
 Person의 10년 후 나이 : ${sessionScope.person.age +10} 세<br>
 Person의 미성년 여부(19세) - > 비교 : ${sessionScope.person.age > 19 ? "성인" : "미성년"} <br>
 Person의 미성년 여부(19세) - gt 비교 :-${sessionScope.person.age gt 19 ? "성인" : "미성년" }<br>
 &nbsk;&lt;&gt;
 <!-- 
 	&nbsp; - 공백
 	&lt; - <
 	&gt; - <
	  -->
</body>
</html>