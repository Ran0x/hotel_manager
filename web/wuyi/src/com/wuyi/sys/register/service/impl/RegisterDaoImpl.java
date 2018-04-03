package com.wuyi.sys.register.service.impl;
import java.sql.*;
import com.wuyi.sys.register.User;
import com.wuyi.sys.register.service.RegisterDao;
import com.wuyi.core.jdbc.DBUtil;

/**
 * <pre>
 * @author Administrator
 *注册模块
 *注册验证（数据库查操作：isUserExist）
 *注册成功（数据库增操作：register）
 *</pre>
 */
public class RegisterDaoImpl implements RegisterDao {

	private Connection connection=null;
	
	private PreparedStatement ps=null;
	@Override
	public boolean isUserExist(String user_account) {
			boolean flag=false;
			try {
				
				connection=DBUtil.getSQLConn();
				String sql="SELECT s.user_id,s.user_account,s.nick_name,s.user_phone,s.user_email,s.user_pwd FROM sys_p_user s WHERE s.user_account=?";
				ps=connection.prepareStatement(sql);
				ps.setString(1, user_account);
				ResultSet rs = ps.executeQuery();
				User user=null;
				while(rs.next()){
					user=new User();
					user.setUser_id(rs.getString("user_id"));
					user.setUser_account(rs.getString("user_account"));
					user.setNick_name(rs.getString("nick_name"));
					user.setUser_phone(rs.getString("user_phone"));
					user.setUser_email(rs.getString("user_email"));
					user.setUser_pwd(rs.getString("user_pwd"));
					
				}
				flag=user==null?true:false;
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			
			}
		
		
		return flag;
	}

	@Override
	public boolean register(String user_account,String nick_name,String user_email,String user_pwd) {
		boolean flag=false;
		try {
		connection=DBUtil.getSQLConn();
		
		String sql="INSERT INTO sys_p_user(user_account,nick_name,user_phone,user_email,user_pwd) VALUE (?,?,?,?,?)";
		ps=connection.prepareStatement(sql);
		ps.setString(1, user_account);
		ps.setString(2, nick_name);
		ps.setString(3, user_account);
		ps.setString(4, user_email);
		ps.setString(5, user_pwd);
		int executeUpdate = ps.executeUpdate();
		flag=executeUpdate==0?false:true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}

}
