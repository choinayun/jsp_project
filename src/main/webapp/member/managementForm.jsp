<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
	#wrap { margin: auto; width: 1400px; }
	table { 
		border-collapse: collapse; border-left: none; border-right: none; font-size: 14pt; 
		margin-left: auto; margin-right: auto; width: 700px; text-align: center;
	}
    th:first-child, td:first-child { border-left: none; }
	th:last-child, td:last-child { border-right: none; }
	.management .tap input { padding: 5px 30px 5px 30px; border-radius: 10px; font-size: 16pt; }
	.management .tap { text-align: center; margin-top: 40px; margin-bottom: 5px; }
</style>
<script type="text/javascript">
	function memberTap(){		
		$(".member_list").css({ display: ''})
		$(".movie_list").css({ display: 'none'})
		$(".review_list").css({ display: 'none'})
		
		
		$(".member_tap").css({ backgroundColor: 'teal', color: 'white'})		
		$(".movie_tap").css({ backgroundColor: '', color: 'black'})		
		$(".review_tap").css({ backgroundColor: '', color: 'black'})		
	}
	function movieTap(){
		$(".member_list").css({ display: 'none'})
		$(".movie_list").css({ display: ''})
		$(".review_list").css({ display: 'none'})
		
		$(".member_tap").css({ backgroundColor: '', color: 'black'})		
		$(".movie_tap").css({ backgroundColor: 'teal', color: 'white'})		
		$(".review_tap").css({ backgroundColor: '', color: 'black'})
	}
	function reviewTap(){
		$(".member_list").css({ display: 'none'})
		$(".movie_list").css({ display: 'none'})
		$(".review_list").css({ display: ''})
		
		$(".member_tap").css({ backgroundColor: '', color: 'black' })		
		$(".movie_tap").css({ backgroundColor: '', color: 'black'})		
		$(".review_tap").css({ backgroundColor: 'teal', color: 'white'})
	}
</script>
</head>
<body>
	<jsp:useBean id="dao" class="member.MemberDAO"/>
<div id="wrap">
	<jsp:include page="../default/header.jsp"/>
	<div class="management">
		<div class="tap">
			<input type="button" onclick="memberTap()" value="Member Management" style="background-color: teal; color: white;" class="member_tap">
			<input type="button" onclick="movieTap()" value="Movie Management" class="movie_tap">
			<input type="button" onclick="reviewTap()" value="Review Management" class="review_tap">
		</div>
		<table border="1" class="member_list">
			<tr>
				<th>아이디</th>
				<th>비밀번호</th>
				<th>이름</th>
			</tr>
			<c:forEach var="dto" items="${ dao.getMemberList() }">
				<tr>
					<td><a href="myInfo.jsp?id=${ dto.id }">${ dto.id }</a></td>
					<td>${ dto.pw }</td>
					<td>${ dto.name }</td>
				</tr>
			</c:forEach>
		</table>
		<table border="1" class="movie_list" style="display: none;">
			<tr>
				<th>123123</th>
				<th>12313</th>
				<th>12312312</th>
			</tr>
		</table>
		<table border="1" class="review_list" style="display: none;">
			<tr>
				<th>7777777777</th>
				<th>7777777777</th>
				<th>7777777777</th>
			</tr>			
		</table>
	</div>
	<jsp:include page="../default/footer.jsp"/>
</div>
</body>
</html>