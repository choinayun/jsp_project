<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<!-- 전체 리뷰 -->
<div id="wrap">
	<jsp:include page="/default/header.jsp"/>
	<jsp:useBean id="dao" class="review.ReviewDAO" />
	<table id="rt">
		<tr>
			<td colspan="3" style="align-content: left; font-size: bold;"><h4>전체 리스트</h4></td>
			<td colspan="3" align="right" >
		<input type="button" value="내가 작성한 리뷰 보기" onclick="location.href='write_view.jsp?id=${loginId}'">
		</td>
		</tr>
		<tr>
			<td colspan="6"><hr></td>
		</tr>
		<tr>
			<td>번호</td><td>영화 이름</td><td>아이디</td><td>작성 시간</td><td>평점</td><td>내용</td>
		</tr>
		<tr>
			<td colspan="6"><hr></td>
		</tr>
	<c:forEach var="dto" items="${dao.list() }">
		<tr>
		<td>${dto.num }</td>
		<td width="300px"><a href="/jsp_project/movie/info.jsp?m_name=${dto.m_name}">${dto.m_name }</a></td>
		<td>${dto.id }</td><td width="200px">${dto.time }</td><td>${dto.r_grade }</td><td width="700px">${dto.content }</td>
		</tr>
	</c:forEach>
	</table>
		<jsp:include page="/default/footer.jsp"/>
</div>
</body>
</html>