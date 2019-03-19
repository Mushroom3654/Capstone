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
	//DB위치로 가서 아이디, 비번 설정
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
	
 
	try{ //try catch 문은 try에서 오류가 나면 catch문에 대응책을 실행
		//드라이버를 로딩한다
		Class.forName("oracle.jdbc.driver.OracleDriver");
	} catch (ClassNotFoundException e ){
		e.printStackTrace();
	}
	
	try{
		//데이터베이스의 연결을 설정
		conn = DriverManager.getConnection(DB_URL,DB_USER, DB_PASSWORD);
		//Statement를 가져온다. SQL query문을 실행하기 위해
		stmt = conn.createStatement();
		//SQL문 실행
		rs=stmt.executeQuery(query);
	%>
	<br>
	<br>
	<b><font size="6" color="gray">가입된 회원 정보</font></b>
	<br>
	<br>
 
	
	<form accept-charset="EUC-KR" name="member_info" method="get">
		<table>
			<tr>
				<td id="id">아이디</td>
				<td><%=request.getParameter("id") %></td>
			</tr>
			<tr>
				<td id="password">비밀번호</td>
				<td><%=request.getParameter("password") %></td>
			</tr>
			<tr>
				<td id="name">이름</td>
				<td><%=request.getParameter("name") %></td>
			</tr>
			<tr>
				<td id="sex">성별</td>
				<td><%=request.getParameter("sex") %></td>
			</tr>
			<tr>
				<td id="mail">이메일</td>
				<td><%=request.getParameter("mail") %>@
				<%=request.getParameter("mail2") %></td>
			</tr>
			<tr>
				<td id="phone">휴대전화</td>
				<td><%=request.getParameter("phone") %></td>
			</tr>
		</table>
	</form>
 
	<%
		} catch (Exception e){
			 e.printStackTrace();
		} finally{
		    try{
				//ResultSet 닫는다
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