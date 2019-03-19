<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>
     
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<title>Insert title here</title>
</head>
<body>

	<form method="get" accept-charset="EUC-KR" action="LoginAction.jsp" name="login">
		<table>
			<tr>
				<td>User ID</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password"></td>
			</tr>
		</table>
		<br><input type="submit" value="로그인"/>
	</form>
</body>
</html>