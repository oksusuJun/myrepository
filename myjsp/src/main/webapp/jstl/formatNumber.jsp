<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setAttribute("num", 3000000);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

EL : ${requestScope.num }<br>
fmt:formatNumber -&gt; <fmt:formatNumber value="${requestScope.num }"/> : value만 지정 - 단위구분자
<fmt:formatNumber value="${requestScope.num }" type="currency"/> : type='currency' - 통화 <br> 
<%--
	type
	 - number(기본) : 단위구분자
	 - currency : 통화기호
	 - percent : % 기호 ( value*100 )
 --%>

<fmt:formatNumber value="${requestScope.num }" type="currency"/><br>
<fmt:formatNumber value="${requestScope.num }" type="currency" groupingUsed="false"/> <br>
<fmt:setLocale value="en_US"/>
en_US : <fmt:formatNumber value="${requestScope.num }" type="currency"/><br>
<fmt:setLocale value="en_GB"/>
en_GB : <fmt:formatNumber value="${requestScope.num }" type="currency"/><br>
<fmt:setLocale value="zh_CN"/>
zh_CN : <fmt:formatNumber value="${requestScope.num }" type="currency"/><br>
<%
	request.setAttribute("doubleNum", 30000.123456);
%>
<fmt:formatNumber value="${requestScope.doubleNum }" pattern="#,###.00000000"/><br>
<%--
	pattern
	#,###.##..#  : 세자리 단위로 , 로 구분  - .# 이후 # 갯수만큼 소숫점 아래자리 표시(남는자리는 반올림)
	0,000.00..0	 : 세자리 단위로 , 로 구분  - 세자리 이하의 수는 1000 을 기준으로 남는 자리수를 0으로 채움
									 - .0 이후 0 개수만큼 소수점 아래자리 표시 (모자란 자리는 0으로 채움) 
 --%>

</body>
</html>










