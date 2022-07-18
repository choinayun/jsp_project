<%@page import="movie.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	#wrap { margin: auto; width: 1400px; }
</style>

</head>
<body>

	<div id="wrap">
	<jsp:include page="/default/header.jsp"/>
	
	<!-- 영화 삭제하기 -->
	
	<%
		MovieDAO dao = new MovieDAO();
		dao.delete(request.getParameter("m_name"));
		response.sendRedirect("list.jsp");
	%>
	
	<jsp:include page="/default/footer.jsp"/>
	</div>

</body>
</html>