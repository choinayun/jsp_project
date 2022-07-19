<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="review.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#wrap { margin: auto; width: 1400px; }
	#table {margin-top: 100px; margin-left: 450px; width: 500px; 
			}
</style>
</head>
<body>
<!-- 리뷰 작성 페이지 -->
<div id="wrap">
	<jsp:include page="/default/header.jsp"/>
<%
	ReviewDAO dao = new ReviewDAO();
%>
	<form action="write_save.jsp" method="post">
		<table id="table" border="1">
			<tr>
				<td>번호</td>
				<td><input type="text" name="num" readonly="readonly" value="<%= dao.rNum() %>"></td>
				<td>영화 이름</td>
				<td><input type="text" name="m_name" readonly="readonly" value="레베카"></td>
			</tr>
			<tr>
				<td>아이디</td><td><input type="text" name="id" readonly="readonly" value="고길동"></td>
				<td>평점</td>
				<td >
				<img src="img/star.png" width="12px" height="12px" >
				<select name="r_grade">
				<option >0<option>1<option >2<option>3<option >4<option>5
				<option >6<option>7<option >8<option>9<option >10
				</select>
		
				</td>
			</tr>
			<tr>
				<td>내용 작성</td>
				<td colspan="3"><textarea name="content" style="min-width: 430px; min-height: 300px;"></textarea></td>
			</tr>
			<tr>
				<td colspan="4" align="right">
				<input type="submit" value="작성 완료">
				<input type="button" value="작성취소" onclick="location.href='list.jsp'">

				</td>
			</tr>
		</table>
	
	</form>
			<jsp:include page="/default/footer.jsp"/>
</div>
</body>
</html>