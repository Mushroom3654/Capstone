<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
     <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
	//DB��ġ�� ���� ���̵�, ��� ����
	String DB_URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	String DB_USER = "hr";
	String DB_PASSWORD = "hr";
	
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
	
	
	String query = " INSERT INTO MEMBERS(SEQ_MEMBERS, ID, PASSWORD, NAME, EMAIL, PHONE)"
			+ " VALUES(SEQ_MEMBERS.NEXTVAL, " + "'" + id + "', " + "'" + password + "', " + "'" + name + "', " + "'" + sex + "', "
	+  "'" + mail + "', " + "'" + phone + "'" + ")";
	
 
	try{ //try catch ���� try���� ������ ���� catch���� ����å�� ����
		//����̹��� �ε��Ѵ�
		Class.forName("oracle.jdbc.driver.OracleDriver");
	} catch (ClassNotFoundException e ){
		e.printStackTrace();
	}
	
	try{
		//�����ͺ��̽��� ������ ����
		conn = DriverManager.getConnection(DB_URL,DB_USER, DB_PASSWORD);
		//Statement�� �����´�. SQL query���� �����ϱ� ����
		stmt = conn.createStatement();
		//SQL�� ����
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
				//ResultSet �ݴ´�
				rs.close();
				//Statement close
				stmt.close();
				//Connection close
				conn.close();
			} catch (SQLException e){}
		}
		%>
</body>
</html>