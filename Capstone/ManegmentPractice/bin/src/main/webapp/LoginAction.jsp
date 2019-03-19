<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=utf-8">
<title>LoginAction</title>
</head>
<body>
	<!-- 아이디와 비밀번호를 쳤을때 비밀번호 == db 비밀번호 일떄 로그인 -->
	<% 
	String LogId = (String)request.getParameter("id");
	String LogPassword= (String)request.getParameter("password");

	//DB위치로 가서 아이디, 비번 설정
	String DB_URL = "jdbc:oracle:thin:@127.0.0.1:1521:XE";
	String DB_USER = "admin";
	String DB_PASSWORD = "qwer";

	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs= null;


	String query = " SELECT ID, PASSWORD FROM MEMBERS";
	
	String id="";
	String password="";
	
	

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

		if(LogId.equals(id) && LogPassword.equals(password)){
			while(rs.next()){

				id=rs.getString(1);
				password=rs.getString(2);
				
				//세션에 id값 넣기
				//key<-value
				session.setAttribute("LogId", LogId);
				session.setAttribute("LogPassword", LogPassword);
				
				//파라미터의 ID, PASSWORD가 DB에 있는 값과 일치하면,
				//세션에 ID 값을 넣고, Page를 유지하고,
				//일치하지 않으면, 이전 페이지로 돌아감
				
			}
			
		}else{
			%>
			<script>alert('비밀번호가 다릅니다'); window.history.back();</script>
			<%
		}
		
		
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