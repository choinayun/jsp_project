<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dao" class="member.MemberDAO"/>
	<jsp:useBean id="dto" class="member.MemberDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	<c:choose>
		<c:when test="${ dao.loginCheck(dto) == 0 }">
			<script>
				alert("존재하지 않는 계정 입니다")
				history.back()
			</script>
		</c:when>
		<c:otherwise>
			<% 
				session.setAttribute("loginId", dto.getId());
				session.setMaxInactiveInterval(60*60*24); 
			%>
			<script>
				alert("로그인 성공")
				location.href="../index.jsp"
			</script>		
		</c:otherwise>
	</c:choose>
</body>
</html>