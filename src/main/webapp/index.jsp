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
	.aaa { width: 800px; margin: auto; margin-top: 100px; }
	img { border: 2px solid black; width: 18%; height: 200px;}
</style>
</head>
<body>

<div id="wrap">
	<jsp:include page="default/header.jsp"/>
	
	<!-- ArrayList 조회수 기준으로 내림차순해서 10개까지만 --> 

	<jsp:useBean id="dao" class="movie.MovieDAO" />
	
	<div class="aaa">
		<c:forEach var="dto" items="${ dao.getMovieList() }" >
				<a href="movie/info.jsp?m_name=${dto.m_name }"><img src="${dto.img }"></a>
		</c:forEach>
	</div>
	
	<jsp:include page="default/footer.jsp"/>
</div>

</body>
</html>