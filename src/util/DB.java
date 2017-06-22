package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DB {
	static String JDBC_DRIVER_NAME = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	static String DB_URL = "jdbc:sqlserver://holein0ne.cv1419rxp91q.ap-northeast-2.rds.amazonaws.com;databaseName=student";
	static String USER_ID = "boseok";
	static String USER_PASSWORD = "qhtjr123";

	public static Connection getConnection() throws Exception {
		Class.forName(JDBC_DRIVER_NAME);
		return DriverManager.getConnection(DB_URL, USER_ID, USER_PASSWORD);
	}

}
