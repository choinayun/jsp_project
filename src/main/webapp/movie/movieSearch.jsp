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
	.searchList { border-bottom: 1px solid black; margin-top: 5px; display: flex; }
</style>
</head>
<body>
	<jsp:useBean id="dao" class="movie.MovieDAO"/>
	<c:set var="list" value="${ dao.getSearch(param.word) }"/>
<div id="wrap">
	<jsp:include page="../default/header.jsp"/>
		<c:forEach var="dto" items="${ list }">
			<div class="searchList">
				<img src="${ dto.img }">
				<div>
					<b>${ dto.age }</b><br>
					<b>제목 : </b><a href="info.jsp?m_name=${ dto.m_name }">${ dto.m_name }</a><br>
					<p><b>평점 : </b>${ dto.grade }</p>
					<p><b>장르 : </b>${ dto.genre }</p>
				</div>
			</div>
		</c:forEach>
	<jsp:include page="../default/footer.jsp"/>
</div>

</body>
</html>