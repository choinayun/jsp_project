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
	
	<% request.setCharacterEncoding("utf-8"); %>
	
	<jsp:useBean id="dao" class="movie.MovieDAO" />
	<jsp:useBean id="dto" class="movie.MovieDTO" />
	<jsp:setProperty property="*" name="dto" />
	
	${dao.update(dto) }
	
	<% response.sendRedirect("list.jsp"); %>
	
	<jsp:include page="/default/footer.jsp"/>
	</div>

</body>
</html>