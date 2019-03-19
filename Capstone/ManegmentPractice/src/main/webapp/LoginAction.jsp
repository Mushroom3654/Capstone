<%@ page language="java" contentType="text/html; charset=utf-8"
   pageEncoding="utf-8"%>
<%@page import="java.sql.*" %>
<%@page import="gagosang.DBConnect.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-type" content="text/html; charset=EUC-KR">
<title>LoginAction</title>
</head>
<body>
	<!-- 아이디와 비밀번호를 쳤을때 비밀번호 == db 비밀번호 일떄 로그인 -->
	<% 
	String LogId = (String)request.getParameter("id");
	String LogPassword= (String)request.getParameter("password");

	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs= null;


	String query = " SELECT ID, PASSWORD FROM USER_INFO";
	
	String id="";
	String password="";
	

	try{
		conn = DBConnection.getDBConn();
		stmt = conn.createStatement();
		//SQL문 실행
		rs=stmt.executeQuery(query);

			while(rs.next()){
				id=rs.getString(1);
				password=rs.getString(2);
				
				if(LogId.equals(id) && LogPassword.equals(password)){
					//세션에 id값 넣기
					//key<-value
					session.setAttribute("LogId", LogId);
					session.setAttribute("LogPassword", LogPassword);
					
					//파라미터의 ID, PASSWORD가 DB에 있는 값과 일치하면,
					//세션에 ID 값을 넣고, Page를 유지하고,
					//일치하지 않으면, 이전 페이지로 돌아감
				}else{
					%>
					<script>alert('비밀번호가 다릅니다'); window.history.back();</script>
					<%
				}	
					
			}//while
			
		
		
		
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