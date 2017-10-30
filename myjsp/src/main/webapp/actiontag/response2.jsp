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
<span style="color:navy;background-color:skyblue;font-size:30px">등록 완료!!</span><br>
등록된 이름 : ${person.name }<br>
등록된 나이 : ${person.age } 세 <br>
등록된 키 : ${person.tall } cm<br>
등록된 결혼여부 : ${person.marriage ? "기혼" : "미혼"} <br>
<hr>
<a href="/myjsp/actiontag/request.jsp">메인페이지</a>
</body>
</html>