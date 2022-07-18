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
	
	<!-- 영화 상세 정보 -->
	
	<jsp:useBean id="dao" class="movie.MovieDAO" />
	<c:set var="dto" value="${dao.getInfo(param.m_name) }" />
	
	<div id="minfo">
		<div>
			<h2>${dto.m_name }</h2>
			<hr>
			<dl>
				<dt>
					 <b>조회수</b> ${dto.hit }<br>
					 <b>평점</b> ${dto.grade }<br>
					 <b>관람등급</b> ${dto.age }<br>
					 <b>장르</b> ${dto.genre }<br>
					 <b>줄거리</b> ${dto.story } 
				</dt>
			</dl>
			<hr>
		</div>
		<div>
			<img src="${dto.img }">
		</div>
	</div>
	
	<input type="button" value="수정하기" onclick="location.href='modify.jsp?m_name=${dto.m_name }'">	
	<input type="button" value="삭제하기" onclick="location.href='delete.jsp?m_name=${dto.m_name }'">	

	<jsp:include page="/default/footer.jsp"/>
	</div>
	
</body>
</html>