<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
	Context Root 경로 : applicaion의 시작 경로(myjsp/sessionWeb)
	http://ip:port/contextRoot/자원경로
 --%>
<h1>Context Root 경로 조회</h1>

<%-- application :JSP 내장객체 - ServletContext  --%>	
<%= application.getContextPath() %><br>

<%= application.getInitParameter("rootPath") %> <br><!-- 초기 파라미터 조회 -->
${initParam.rootPath }<p>
<!-- initParam -> rootPath 에 접근 -->

<a href="<%=application.getContextPath() %>/el/el_exam1.jsp">el_examl.jsp</a><br>
<a href="${initParam.rootPath }/el/el_exam2.jsp">el_exam2.jsp</a><p>
<form action="${initParam.rootPath }/el/el_exam3.jsp" method="post">
	이름 : <input type="text" name="name"><br>
	나이 : <input type="number" name="age"><br> <!-- type="number" : html ver.5 부터 적용됨 -->
	다중선택 : 
		C언어 : <input type="checkbox" name="language" value="C">
		JAVA : <input type="checkbox" name="language" value="Java">
		파이썬 : <input type="checkbox" name="language" value="python"><br>
	<button>전송</button>
</form>
</body>
</html>