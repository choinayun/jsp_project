<%@page import="review.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 리뷰 저장 -->
	<% request.setCharacterEncoding("utf-8");%>
	
		<jsp:useBean id="dto" class="review.ReviewDTO"/>
		<jsp:setProperty property="*" name="dto" />

		<jsp:useBean id="dao" class="review.ReviewDAO" />
		${dao.insert(dto) }
	
		
		<%response.sendRedirect("list.jsp"); %>
	
</body>
</html>