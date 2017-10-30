<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/menu.jsp"/>
<h1>find person - useBean, getProperty 태그</h1>
<form action="/myjsp/findPerson" method="post">
	<input type="text" name="name">
	<button type="submit">조회</button>	
	<!-- button tag의 submit type은 default 이기 때문에 생략할 수 있다. -->
</form>

<%-- 요청 파라미터를 속성에 넣기 --%>
<h1>add person - useBean, setProperty 태그</h1>
<form action="/myjsp/actiontag/add_forward.jsp" method="post">
	이름 : <input type="text" name="name"><br>
	나이 : <input type="text" name="age"><br>
	키 :  <input type="text" name="tall"><br>
	결혼 : 
		기혼 - <input type="radio" name="marriage" value="true">
	 	미혼 - <input type="radio" name="marriage" value="false"><p>
	
	<button type="submit">등록</button>

</form>

</body>
</html>