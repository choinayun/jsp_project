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
<!-- 리뷰 삭제 -->
	<%
		ReviewDAO dao = new ReviewDAO();
		dao.delete((String)request.getParameter("num"));
		response.sendRedirect("list.jsp");
	%>
</body>
</html>