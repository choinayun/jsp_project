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
<% request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean id="dao" class="member.MemberDAO"/>
	<jsp:useBean id="dto" class="member.MemberDTO"/>
	<jsp:setProperty property="*" name="dto"/>
	<c:set var="result" value="${ dao.memberModify(dto) }"/>
	<c:choose>
		<c:when test="${ result == 1 }">
			<script>
				alert("수정되었습니다.")
				location.href="../index.jsp"
			</script>
		</c:when>
		<c:otherwise>
			<script>
				alert("수정에 실패하였습니다.")
				history.back()
			</script>			
		</c:otherwise>
	</c:choose>
</body>
</html>