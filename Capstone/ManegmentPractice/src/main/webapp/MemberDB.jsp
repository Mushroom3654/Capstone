<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.sql.*" %>
<%@page import="gagosang.DBConnect.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MemberDB</title>
</head>
<body>
<% 
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs= null;
	

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String sex = request.getParameter("sex");
	String mail = request.getParameter("mail");
	String mail2 = request.getParameter("mail2");
	String phone = request.getParameter("phone");
	
	
	String query = " INSERT INTO USER_INFO(SEQ, ID, PASSWORD, NAME, MAIL, MAIL2, PHONE)"
			+ " VALUES(SEQ, " + "'" + id + "', " + "'" + password + "', " + "'" + name + "', " + "'" + sex + "', "
	+  "'" + mail + "', " + "'" + mail2 + "', '" + phone + "'" + ")";
	
 
	try{
		Class.forName("com.mysql.jdbc.Driver");
	} catch (ClassNotFoundException e ){
		e.printStackTrace();
	}
	
	try{
		conn = DBConnection.getDBConn();
		stmt = conn.createStatement();
		rs=stmt.executeQuery(query);
	%>
	
	<br>
	<br>
	<b><font size="6" color="gray">���Ե� ȸ�� ����</font></b>
	<br>
	<br>
 
	<form accept-charset="EUC-KR" name="member_info" method="get">
		<table>
			<tr>
				<td id="id">���̵�</td>
				<td><%=request.getParameter("id") %></td>
			</tr>
			<tr>
				<td id="password">��й�ȣ</td>
				<td><%=request.getParameter("password") %></td>
			</tr>
			<tr>
				<td id="name">�̸�</td>
				<td><%=request.getParameter("name") %></td>
			</tr>
			<tr>
				<td id="sex">����</td>
				<td><%=request.getParameter("sex") %></td>
			</tr>
			<tr>
				<td id="mail">�̸���</td>
				<td><%=request.getParameter("mail") %>@
				<%=request.getParameter("mail2") %></td>
			</tr>
			<tr>
				<td id="phone">�޴���ȭ</td>
				<td><%=request.getParameter("phone") %></td>
			</tr>
		</table>
	</form>
 
	<%
		} catch (Exception e){
			 e.printStackTrace();
		} finally{
		    try{
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e){}
		}
		%>
</body>
</html>