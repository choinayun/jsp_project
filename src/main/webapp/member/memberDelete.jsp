<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="dao" class="member.MemberDAO"/>
	<c:choose>
		<c:when test="${ dao.memberDelete(param.id) == 1 }">
			<% session.invalidate(); %>
			<script>
				alert("탈퇴되었습니다.")
				location.href="../index.jsp"
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("Error")
				history.back()
			</script>			
		</c:otherwise>
	</c:choose>
</body>
</html>