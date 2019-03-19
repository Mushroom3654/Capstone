package gagosang.DBConnect;
import java.sql.*;

public class DBConnection{
	public static Connection getDBConn() throws SQLException{
		
		Connection conn =null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			//timezone 문제 해결을 위한 코드
			String DB_URL = "jdbc:mysql://localhost:3306/USER_DB?characterEncoding=UTF-8&serverTimezone=UTC";
			String DB_USER = "root";
			String DB_PASSWORD = "qwer";
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return conn;
	}
}