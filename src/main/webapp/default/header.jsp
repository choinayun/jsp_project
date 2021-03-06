<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#login_area ul { display: flex; float: right; list-style: none;}
	#login_area ul li { margin-left: 30px; }
	a { text-decoration: none; }
	.title { padding: 60px; text-align: center; }
	.title a { font-size: 50pt; text-shadow: 10px 10px 20px gray; color: black; }
	.service_area { border-top: 2px solid gray; border-bottom: 2px solid gray; height: 50px; }
	.searchBtn { height: 22px; margin-top: 1px; margin-left: -25px; }

</style>
<script type="text/javascript">
	function enterKey(obj){
		let text = obj.value 
		if(window.event.keyCode == 13) {
			location.href="/jsp_project/movie/movieSearch.jsp?word=" + text
		}
	}
	function searchBtn() {
		let text = document.getElementById("search").value
		location.href="/jsp_project/movie/movieSearch.jsp?word=" + text
	}
</script>
</head>
<body>
<div id="login_area">
	<ul>
		<c:choose>
			<c:when test="${ loginId == null }">
				<li><a href="/jsp_project/member/loginForm.jsp">로그인</a></li>
				<li><a href="/jsp_project/member/registerForm.jsp">회원가입</a></li>
			</c:when>
			<c:otherwise>
				<li><a href="/jsp_project/member/logout.jsp">로그아웃</a></li>
				<li><a href="/jsp_project/member/myInfo.jsp">내정보</a></li>
			</c:otherwise>
		</c:choose>
		<c:if test="${ loginId == 'admin' }">
			<li><a href="/jsp_project/member/managementForm.jsp">관리</a></li>
		</c:if>
	</ul>
		<h1 class="title"><a href="http://localhost:8085/jsp_project/index.jsp">Movie</a></h1>

	<div class="service_area">
		<ul>
			<li><a href="/jsp_project/movie/list.jsp?top=false">전체 영화</a></li>	
			<li><a href="/jsp_project/movie/list.jsp?top=true">TOP 30</a></li>
			<li><a href="/jsp_project/review/list.jsp">리뷰</a></li>
			<li class="search"><input type="text" placeholder="Search" name="search" onkeyup="enterKey(this)" id="search"></li>
			<li><input type="button" value="검색" class="searchBtn" onclick="searchBtn()"></li>
		</ul>
	</div>
</div>
</body>
</html>