package com.wuyi.core.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


/**
 * <pre>
 * @author Administrator
 *数据库连接
 *</pre>
 */
public class DBUtil {
	private static Connection connection=null;
	static{
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/erpcloud";
			String user="root";
			String password="root";
			connection = DriverManager.getConnection(url, user, password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static Connection getSQLConn()throws Exception {
		return connection;
	}

	public static void sqlClose(){
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
