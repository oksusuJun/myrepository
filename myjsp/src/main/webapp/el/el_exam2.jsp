<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.Person"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	// EL 을 이용해 Collection(배열/List/Map) 의 요소(element) 출력
	// List/배열 - index로 접근 -> [] 표기법 사용  - [index]
	// Map - key로 접근 -> .표기법 & [] 표기법 모두 사용  - .key || ["key"]
	// Set -> EL 로는 요소 출력할 수 없다.

	String[] names = { "김회원", "박회원", "윤회원", "장회원", "임회원" };
	request.setAttribute("nameList", names);
	// 사용자가 요청한 것ㄷ은 servlet인데, 거기서 request scope 에서 setAttribute 에 값을 넣어 놓고
	// 그 값을 가져다가 사용한다.

	HashMap map = new HashMap();
	map.put("product name", "텔레비젼");
	map.put("price", 200000);
	map.put("owner", new Person("김영수", 33, 175.4, false));
	request.setAttribute("product", map);

	ArrayList<Person> personList = new ArrayList<>();
	personList.add(new Person("박현준", 26, 178.8, false));
	personList.add(new Person("조수연", 26, 160.2, false));
	personList.add(new Person("장준석", 25, 170.1, false));
	personList.add(new Person("백승민", 20, 182.7, false));
	personList.add(new Person("김은아", 29, 163.5, true));
	request.setAttribute("result", personList);
	
	HashSet set = new HashSet();
	set.add("a");
	set.add("b");
	set.add("c");
	session.setAttribute("set", set);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table {
		width:500px;
		border-collapse:collapse;
	}
	table,td,th{
		border:1px solid black;
		padding: 5px;
		text-align: center;
	}
</style>
</head>
<body>
	<h1>배열의 값 출력 - EL</h1>
	<!-- 
	배열, List 출력 시 [ ] 표기법 사용
	[] 안에 index 표기 시 " , ' 를 붙이지 않아도 된다.
 -->
	${requestScope.nameList[0] } - ${requestScope.nameList[1] } -
	${requestScope.nameList[2] } - ${requestScope.nameList[3] } -
	${requestScope.nameList[4] } ${requestScope.nameList[7] }
	<%-- 없는 index 접근 : 출력하지 않음!! (Exception 발생하지 않고 아예 출력을 안해버림!! --%>

	<h1>Map의 값 출력 - EL</h1>

	<%-- 식별자 규칙에 어긋나는 문자가 포함된 경우는 [ ] 표기법을 사용해야한다. --%>
	제품명 : ${requestScope.product["product name"] }
	<br> 가격 : ${requestScope.product.price } 원
	<br> owner 의 이름 - 나이 : ${requestScope.product.owner.name } -
	${requestScope.product.owner.age } 세

	<h1>Person 조회 결과 - List 를 EL 로 출력</h1>
	<table border="1" bordercolor="navy" bgcolor="navy" align="center" width="500px">
		<thead>
			<tr bgcolor="skyblue">
				<th>이름</th>
				<th>나이</th>
				<th>키</th>
				<th>결혼여부</th>
			</tr>
		</thead>
		<tbody>
			<tr bgcolor="skyblue">
				<td>${requestScope.result[0].name }</td>
				<td>${requestScope.result[0].age }세</td>
				<td>${requestScope.result[0].tall }cm</td>
				<td>${requestScope.result[0].marriage ? "기혼" : "미혼" }</td>
			</tr>
			<tr bgcolor="skyblue">
				<td>${requestScope.result[1].name }</td>
				<td>${requestScope.result[1].age }세</td>
				<td>${requestScope.result[1].tall }cm</td>
				<td>${requestScope.result[1].marriage ? "기혼" : "미혼" }</td>
			</tr>
			<tr bgcolor="skyblue">
				<td>${requestScope.result[2].name }</td>
				<td>${requestScope.result[2].age }세</td>
				<td>${requestScope.result[2].tall }cm</td>
				<td>${requestScope.result[2].marriage ? "기혼" : "미혼" }</td>
			</tr>
			<tr bgcolor="skyblue">
				<td>${requestScope.result[3].name }</td>
				<td>${requestScope.result[3].age }세</td>
				<td>${requestScope.result[3].tall }cm</td>
				<td>${requestScope.result[3].marriage ? "기혼" : "미혼" }</td>
			</tr>
			<tr bgcolor="skyblue">
				<td>${requestScope.result[4].name }</td>
				<td>${requestScope.result[4].age }세</td>
				<td>${requestScope.result[4].tall }cm</td>
				<td>${requestScope.result[4].marriage ? "기혼" : "미혼" }</td>
			</tr>
		</tbody>

	</table>
	
	<h1>Set 조회 출력 - EL : Set 의 요소 조회 및 출력은 안된다.</h1>
	${sessionScope.set }  <%-- 전체 조회 - toString() 출력 => JSTL 과 연동 --%>
	
	
</body>
</html>