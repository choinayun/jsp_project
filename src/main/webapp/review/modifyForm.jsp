<%@page import="review.ReviewDTO"%>
<%@page import="review.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function modifyCheck(num){
		let grade = document.getElementById("r_grade").value
		let content = document.getElementById("content").value
		
		location.href="modify.jsp?r_grade="+grade+"&content="+content+"&num="+num
	}
</script>
<style type="text/css">
	#wrap { margin: auto; width: 1400px; }
	#table {margin-top: 100px; margin-left: 450px; width: 500px; 
			}
</style>
</head>
<body>
<!-- 리뷰 수정 페이지 -->
<div id="wrap">
	<jsp:include page="/default/header.jsp"/>
	<jsp:useBean id="dao" class="review.ReviewDAO"/>
	<c:set var="dto" value="${dao.getInfo(param.num) }"/>
		<table border="1" id="table">
			<tr>
				<td>번호</td>
				<td>${dto.getNum() }</td>
				<td>영화 이름</td>
				<td>${dto.getM_name() }</td>
			</tr>
			<tr>
				<td>아이디</td><td>${dto.getId()}</td>
				<td>작성 시간</td>
				<td>${dto.getTime() }</td>
			</tr>
			<tr>
				<td>평점</td>
				<td colspan="3">
				<img src="img/star.png" width="12px" height="12px" >
				<select name="r_grade" id="r_grade">
				<option >0<option>1<option >2<option>3<option >4<option>5
				<option >6<option>7<option >8<option>9<option >10
				</select>
		
				</td>
			</tr>
			<tr>
				<td>내용 작성</td>
				<td colspan="3"><textarea name="content" style="min-width: 430px; min-height: 300px;" id="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="4" align="right">
				<input type="button" value="수정 완료" onclick="modifyCheck(${dto.num})">
				<input type="button" value="수정 취소" onclick="location.href='write_view.jsp'">
				<input type="button" value="삭제" onclick="location.href='delete.jsp?num=${dto.num}'">
				</td>
			</tr>
		</table>
		<jsp:include page="/default/footer.jsp"/>
</div>
</body>
</html>