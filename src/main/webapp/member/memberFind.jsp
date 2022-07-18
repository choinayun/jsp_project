<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dao" class="member.MemberDAO"/>
	<c:set var="dto" value="${ dao.memberFind( param.name ) }"/>
	<c:choose>
		<c:when test="${ dto == null }">
			<script>
				alert("존재하지 않는 계정 입니다.")
				history.back()
			</script>
		</c:when>
		<c:otherwise>
			<c:redirect url="loginForm.jsp">
				<c:param name="findId" value="${ dto.id }"/>
				<c:param name="findPw" value="${ dto.pw }"/>
			</c:redirect>
		</c:otherwise>
	</c:choose>
</body>
</html>