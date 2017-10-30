<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--
	요청 파라미터들을 attribute의 VO 객체에 담아서 실제 요청처리할 Servlet으로 이동
 --%>
 <jsp:useBean scope="request" id="person" class="vo.Person" />
 
 <jsp:setProperty name="person" property="*"/>
 
 <%--
 	request.getRequestDispatcher("/addPerson").forward(request, response);
  --%>
 <jsp:forward page="/addPerson" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/menu.jsp"/>

</body>
</html>