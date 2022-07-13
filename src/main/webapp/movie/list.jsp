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
	#mlist {display: flex; }
</style>

</head>
<body>
	<!-- 7/13 리스트 작업 -->
	<jsp:useBean id="dao" class="movie.MovieDAO" />
	<% ArrayList<MovieDTO> list = dao.getMovie(); %>
	
	<% for(MovieDTO dto : list) { %>
	<div id="mlist">
		<div>
			<img src=<%=dto.getImg() %>>
		</div>
		<div>
			<dl>
				<dt>
					<span><%=dto.getAge() %></span>
					<b><a href=""><%=dto.getM_name() %></a></b><br>
					<b>장르</b> <%=dto.getGenre() %><br>
					<b>줄거리</b> <%=dto.getStory() %>
					</dt>
			</dl>
		</div>
	</div>
	<hr>
	<% } %>

</body>
</html>