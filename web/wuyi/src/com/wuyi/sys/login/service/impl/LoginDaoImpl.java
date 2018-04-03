package com.wuyi.sys.login.service.impl;
import java.sql.*;


import com.wuyi.core.jdbc.DBUtil;

import com.wuyi.sys.login.service.LoginDao;
import com.wuyi.sys.register.User;

/**
 * <pre>
 * @author Administrator
 *登录验证
 *数据库连接---查询
 *</pre>
 */
public class LoginDaoImpl implements LoginDao{
	
	private Connection connection=null;
	private PreparedStatement ps=null;
	private int user_type;
	
	@Override
	public boolean isLogin(String user_account, String user_pwd) {
		boolean flag=false;
		 try {
				connection=DBUtil.getSQLConn();
				String sql="SELECT s.user_id,s.user_account,s.user_type,s.nick_name,s.user_phone,s.user_email,s.user_pwd FROM sys_p_user s WHERE s.user_account=? AND s.user_pwd=?";
				ps=connection.prepareStatement(sql);
				ps.setString(1, user_account);
				ps.setString(2, user_pwd);
				ResultSet rs = ps.executeQuery();
				User user=null;
				while(rs.next()){
					user=new User();
					user.setUser_id(rs.getString("user_id"));
					user.setUser_account(rs.getString("user_account"));
					user_type=rs.getInt("user_type");
					user.setNick_name(rs.getString("nick_name"));
					user.setUser_phone(rs.getString("user_phone"));
					user.setUser_email(rs.getString("user_email"));
					user.setUser_pwd(rs.getString("user_pwd"));
					
				}
				flag=user==null?false:true;
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			
			}
		
		
		return flag;
	}

	@Override
	public int user_type() {
		// TODO Auto-generated method stub
		return user_type;
	}
	
	
}
