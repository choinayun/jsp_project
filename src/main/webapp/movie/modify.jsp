<%@page import="movie.MovieDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#minfo {display: flex; margin: auto; width: 1400px; }
	#wrap { margin: auto; width: 1400px; }
</style>

</head>
<body>

	<div id="wrap">
	<jsp:include page="/default/header.jsp"/>
	
	<!-- 영화 정보 수정하기 -->
	
	<jsp:useBean id="dao" class="movie.MovieDAO" />
	<c:set var="dto" value="${dao.getInfo(param.m_name) }" />

	<form action="modify_save.jsp" method="post">
		<div id="minfo">
			<div>
				<input type="text" name="m_name" value="${dto.m_name }">
				<hr>
				<dl>
					<dt>
						 <b>조회수</b> ${dto.hit }<br>
						 <b>평점</b> ${dto.grade }<br>
						 <b>관람등급</b>
						 <input type="text" name="age" value="${dto.age }"><br>
						 <b>장르</b> 
						 <input type="text" name="genre" value="${dto.genre }"><br>
						 <b>줄거리</b> 
						 <input type="text" name="story" value="${dto.story }"><br>
					</dt>
				</dl>
				<hr>
			</div>
		</div>
		<input type="submit" value="수정하기">
		<input type="button" value="목록이동" onclick="location.href='list.jsp'">
	</form>
	
	<jsp:include page="/default/footer.jsp"/>
	</div>

</body>
</html>