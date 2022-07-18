<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function registerBtn() {
		let name = document.getElementById("name");
		let id = document.getElementById("id");
		let pw = document.getElementById("pw");
		
		if(name.value == "") {
			name.focus()
			alert("이름을 입력해주세요")
		}else if(id.value == "") {
			id.focus()
			alert("아이디를 입력해주세요")
		}else if(pw.value == "") {
			pw.focus()
			alert("비밀번호를 입력해주세요")
		}else {
			fo.submit()
		}
		
	}
</script>
<style type="text/css">
	#wrap { margin: auto; width: 1400px; }
	.registerForm { text-align: center; margin-top: 50px;}
	.registerForm table { margin: auto; }
	.registerForm table th { font-size: 15pt; text-align: left; }
	.registerForm table td { font-size: 15pt; }
	.registerForm table input { height: 25px; }
</style>
</head>
<body>
<div id="wrap">
	<jsp:include page="../default/header.jsp"/>
	<div class="registerForm">
		<h2>회 원 가 입</h2>
		<form action="registerCheck.jsp" method="post" id="fo">
			<table>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" id="name" placeholder="NAME"></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" id="id" placeholder="ID"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pw" id="pw" placeholder="PASSWORD"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="button" value="회원가입" onclick="registerBtn()">
					</td>				
				</tr>
			</table>
		</form>
	</div>
</div>
</body>
</html>