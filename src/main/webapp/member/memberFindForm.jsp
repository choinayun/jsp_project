<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#wrap { margin: auto; width: 1400px; }
	.member_find { text-align: center; margin-top: 50px;}
	.member_find table { margin: auto; }
	.member_find table th { font-size: 15pt; text-align: left; }
	.member_find table td { font-size: 15pt; }
	.member_find table input { height: 25px; }
</style>
</head>
<body>
<div id="wrap">
	<jsp:include page="../default/header.jsp"/>
	<div class="member_find">
		<h2>아이디 / 비밀번호 찾기</h2>
		<form action="memberFind.jsp" method="get">
			<b>찾을 계정 이름 : </b><input type="text" name="name">
			<input type="submit" value="찾기">
		</form>
	</div>
</div>
</body>
</html>