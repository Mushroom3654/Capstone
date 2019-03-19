 <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
</head>
<body>
	<br>
	<b><font size="6" color="gray">회원가입</font></b>
	<br>
	<form method="get" accept-charset="EUC-KR" action="MemberDB.jsp" name="memberjoin">
		<table>
			<tr>
				<td id="id">아이디</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td id="password">비밀번호</td>
				<td><input type="password" name="password" maxlength="50"></td>
			</tr>
			<tr>
				<td id="passwordcheck">비밀번호 확인</td>
				<td><input type="password" name="passwordcheck" maxlength="50"></td>
			</tr>
			<tr>
				<td id="name">이름</td>
				<td><input type="text" name="name" maxlength="50"></td>
			</tr>
			<tr>
				<td id="sex">성별</td>
				<td><input type="radio" name="sex" value="남" checked>남
					<input type="radio" name="sex" value="여">여
				</td>
			</tr>
			
			<tr>
				<td id="email">이메일</td>
				<td><input type="text" name="mail" maxlength="50">@<select name="mail2">
					<option>naver.com</option>
					<option>daum.net</option>
					<option>gmail.com</option>
					<option>nate.com></option>
					<option>daelim.ac.kr</option>
				</select></td>
			</tr>
			<tr>
				<td id="phone">휴대전화</td>
				<td><input type="text" name="phone" /></td>
			</tr>
		</table>
		<br><input type="submit" value="가입"/>
	</form>
</body>
</html>