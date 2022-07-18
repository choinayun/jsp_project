<%@page import="member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>
	<jsp:useBean id="dao" class="member.MemberDAO"/>
	<jsp:useBean id="dto" class="member.MemberDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	<c:choose>
		<c:when test="${ dao.memberSave(dto) == 1}">
			<script>
				alert("회원가입에 성공하였습니다.")
				location.href="../index.jsp"
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("이미 존재하는 아이디 입니다")
				history.back()
			</script>		
		</c:otherwise>
	</c:choose>
</body>
</html>