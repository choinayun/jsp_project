<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function loginBtn(bool) {
		let id = document.getElementById("id")
		let pw = document.getElementById("pw")
		if(window.event.keyCode == 13 || bool == true) {
			if(id.value == ""){
				alert("아이디를 입력해주세요")
				id.focus()
			}else if(pw.value == "") {
				alert("비밀번호를 입력해주세요")
				pw.focus()			
			}else {
				fo.submit()
			}
		}
	}
</script>
<style type="text/css">
	#wrap { margin: auto; width: 1400px; }
	.loginForm { text-align: center; margin-top: 50px;}
	.loginForm table { margin: auto; }
	.loginForm table th { font-size: 15pt; text-align: left; }
	.loginForm table td { font-size: 15pt; }
	.loginForm table input { height: 25px; }
</style>
</head>
<body>
<div id="wrap">
	<jsp:include page="../default/header.jsp"/>
	<div class="loginForm">
		<h2>로 그 인</h2>
		<form action="loginCheck.jsp" method="post" id="fo">
			<table>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" placeholder="ID" id="id" value="${ param.findId }"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pw" placeholder="Password" id="pw" value="${ param.findPw }" onkeyup="loginBtn()"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="로그인" onclick="loginBtn(true)" class="checkBtn">
						<input type="button" value="아이디/비밀번호 찾기" onclick="location.href='memberFindForm.jsp'" class="checkBtn">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>