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
	#mlist {display: flex; margin: auto; width: 1400px; }
	#wrap { margin: auto; width: 1400px; }
</style>

</head>
<body>
	
	<div id="wrap">
	<jsp:include page="/default/header.jsp"/>
	
	<!-- 영화리스트 평점순으로 정렬 -->

	<jsp:useBean id="dao" class="movie.MovieDAO" />
	<% 
		ArrayList<MovieDTO> li = new ArrayList<MovieDTO>();
		if(request.getParameter("top").equals("true")) {
			li = dao.getTopMovie();
		}else{			
			li = dao.list();
		}
	%>
	<br>
	<div>
		<c:if test="${ param.top == false }">
			<input type="button" value="조회수" onclick="location.href='hitList.jsp'">
			<input type="button" value="평점순" onclick="location.href='list.jsp?top=false'">
		</c:if>
	</div>
	<hr>
	
	<% for(MovieDTO dto : li) { %>
	<div id="mlist">
		<div>
			<a href="info.jsp?m_name=<%= dto.getM_name() %>"><img src=<%=dto.getImg() %>></a>
		</div>
		<div>
			<dl>
				<dt>
					<span><%=dto.getAge() %></span>
					<b><a href="info.jsp?m_name=<%= dto.getM_name() %>"><%=dto.getM_name() %></a></b><br>
					<b>평점</b> <%=dto.getGrade() %><br>
					<b>장르</b> <%=dto.getGenre() %><br>
					<b>줄거리</b> <%=dto.getStory() %>
				</dt>
			</dl>
		</div>
	</div>
	<hr>
	<% } %>
	
	<jsp:include page="/default/footer.jsp"/>
	</div>

</body>
</html>