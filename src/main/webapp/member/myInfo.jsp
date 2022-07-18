<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function memberModify(){
		let id = document.getElementById("id")
		let pw = document.getElementById("pw")
		
		if(id.value == "") {
			id.focus()
			alert("아이디를 입력해주세요.")
		}else if(pw.value == "") {
			pw.focus()
			alert("비밀번호를 입력해주세요.")
		}else{
			fo.submit()
		}
	}
</script>
<style type="text/css">
	#wrap { margin: auto; width: 1400px; }
	.myInfo { text-align: center; margin-top: 50px;}
	.myInfo table { margin: auto; }
	.myInfo table th { font-size: 15pt; text-align: left; }
	.myInfo table td { font-size: 15pt; }
	.myInfo table input { height: 25px; }
</style>
</head>
<body>
<div id="wrap"> 
	<jsp:include page="../default/header.jsp"/>
	<jsp:useBean id="dao" class="member.MemberDAO"/>
	<c:set var="dto" value="${ dao.getMyInfo(loginId) }"/>
	<div class="myInfo">
		<form action="memberModify.jsp" method="post" id="fo">
			<table>
				<tr>
					<th>아이디 : </th><td><input type="text" name="id" value="${ dto.id }" id="id" readonly ></td>
				</tr>
				<tr>
					<th>비밀번호 : </th><td><input type="password" name="pw" value="${ dto.pw }" id="pw"></td>
				</tr>
				<tr>
					<th>이름 : </th><td><input type="text" name="name" value="${ dto.name }"></td>
				</tr>
				<tr>
					<td>
						<input type="button" value="수정" onclick="memberModify()">
						<input type="button" value="회원탈퇴" onclick="location.href='memberDelete.jsp?id=${dto.id}'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>