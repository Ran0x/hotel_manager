package com.wuyi.sys.forget.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.wuyi.core.jdbc.DBUtil;
import com.wuyi.sys.forget.service.ForgetDao;
import com.wuyi.sys.register.User;
/**
 * <pre>
 * @author Administrator
 *验证用户存在和邮箱号正确性
 *</pre>
 */
public class ForgetDaoImpl implements ForgetDao {
	private Connection connection=null;
	private PreparedStatement ps=null;
	@Override
	public  boolean isValidate(String user_account,String user_email) {
		
		boolean flag=false;
		 try {
				connection=DBUtil.getSQLConn();
				String sql="SELECT s.user_id,s.user_account,s.nick_name,s.user_phone,s.user_email,s.user_pwd FROM sys_p_user s WHERE s.user_account=? AND s.user_email=?";
				ps=connection.prepareStatement(sql);
				ps.setString(1, user_account);
				ps.setString(2, user_email);
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
				flag=user==null?false:true;
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			
			}
		
		
		return flag;
	}

}
