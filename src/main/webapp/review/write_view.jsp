<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#wrap { margin: auto; width: 1400px; }
	#rt { margin: auto; width: 1400px; }
</style>
</head>
<body>
<!-- 내가 쓴 리뷰만 보이기 -->
<div id="wrap">
	<jsp:include page="/default/header.jsp"/>
	<jsp:useBean id="dao" class="review.ReviewDAO" />
	<c:set var="list" value="${dao.MyIn(param.id) }" />
	<table  id="rt">
		<tr>
			<td>번호</td><td>영화 이름</td><td>아이디</td><td>작성 시간</td><td>평점</td><td>내용</td>
		</tr>
	<tr>
			<td colspan="6"><hr></td>
		</tr>
	<c:forEach var="dto" items="${ list }">
		<tr>
		<td><a href="modifyForm.jsp?num=${dto.num}">${dto.num }</a></td>
		<td width="300px">${dto.m_name }</td>
		<td>${dto.id }</td><td width="200px">${dto.time }</td><td>${dto.r_grade }</td><td width="700px">${dto.content }</td>
		</tr>
	</c:forEach>
		<tr>
			<td colspan="6" align="right">
				<input type="button" value="뒤로" onclick="location.href='list.jsp'">
			</td>
		</tr>
	</table>
			<jsp:include page="/default/footer.jsp"/>
</div>
</body>
</html>