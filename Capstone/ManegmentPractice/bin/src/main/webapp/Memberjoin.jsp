 <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
</head>
<body>
	<br>
	<b><font size="6" color="gray">ȸ������</font></b>
	<br>
	<form method="get" accept-charset="EUC-KR" action="MemberDB.jsp" name="memberjoin">
		<table>
			<tr>
				<td id="id">���̵�</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td id="password">��й�ȣ</td>
				<td><input type="password" name="password" maxlength="50"></td>
			</tr>
			<tr>
				<td id="passwordcheck">��й�ȣ Ȯ��</td>
				<td><input type="password" name="passwordcheck" maxlength="50"></td>
			</tr>
			<tr>
				<td id="name">�̸�</td>
				<td><input type="text" name="name" maxlength="50"></td>
			</tr>
			<tr>
				<td id="sex">����</td>
				<td><input type="radio" name="sex" value="��" checked>��
					<input type="radio" name="sex" value="��">��
				</td>
			</tr>
			
			<tr>
				<td id="email">�̸���</td>
				<td><input type="text" name="mail" maxlength="50">@<select name="mail2">
					<option>naver.com</option>
					<option>daum.net</option>
					<option>gmail.com</option>
					<option>nate.com></option>
					<option>daelim.ac.kr</option>
				</select></td>
			</tr>
			<tr>
				<td id="phone">�޴���ȭ</td>
				<td><input type="text" name="phone" /></td>
			</tr>
		</table>
		<br><input type="submit" value="����"/>
	</form>
</body>
</html>