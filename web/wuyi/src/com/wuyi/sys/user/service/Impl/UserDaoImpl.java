package com.wuyi.sys.user.service.Impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.wuyi.core.jdbc.DBUtil;

import com.wuyi.sys.register.User;
import com.wuyi.sys.user.UserDao;

public class UserDaoImpl implements UserDao {

	private Connection connection ;
	private PreparedStatement ps;
	private ResultSet rs;
	private User user;
	private int count;
	private List<User> list=new ArrayList<>();
	private String jsonStr;
	@Override
	public String userList(String user_account, String nick_name) {
		try {
			connection = DBUtil.getSQLConn();
			String sql="SELECT s.user_id,s.user_account,s.nick_name,s.user_email FROM sys_p_user s WHERE 1=1";
			String sql_count="SELECT count(*) total FROM sys_p_user s WHERE 1=1";
			if(user_account!=null){
				sql+=" and s.user_account like '%"+user_account+"%'";
				sql_count+=" and s.user_account like '%"+user_account+"%'";
			}		
			if(nick_name!=null){
				sql+=" and s.nick_name like '%"+nick_name+"%'";
				sql_count+=" and s.nick_name like '%"+nick_name+"%'";
			}
				
			ps= connection.prepareStatement(sql_count);
			rs = ps.executeQuery();
			
			while(rs.next()){
				count = rs.getInt("total");
				
				
			}
			ps= connection.prepareStatement(sql);
			rs = ps.executeQuery();
			//System.out.println(count);
			while(rs.next()){
				user=new User();
				user.setUser_id(rs.getString("user_id"));
				user.setUser_account(rs.getString("user_account"));
				user.setNick_name(rs.getString("nick_name"));		
				user.setUser_email(rs.getString("user_email"));
				list.add(user);
			}
			jsonStr="{\"total\":"+count+",\"rows\":"+JSON.toJSONString(list)+"}";
		//	System.out.println(jsonStr);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonStr;
	}
//	public static void main(String[] args) {
//		UserDaoImpl userDaoImpl=new UserDaoImpl();
//		userDaoImpl.userList(null, null);
//	}
	@Override
	public boolean del(String user_id) {
		boolean flag=false;
		try {
		connection=DBUtil.getSQLConn();
		
		String sql="DELETE FROM sys_p_user WHERE FIND_IN_SET(user_id,?)";
		ps=connection.prepareStatement(sql);
		ps.setString(1, user_id);
		
		int executeUpdate = ps.executeUpdate();
		flag=executeUpdate==0?false:true;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;
	}
	
	
	@Override
	public boolean edit(String nick_name, String user_email, String user_account) {
		boolean flag=false;
		try {

			connection = DBUtil.getSQLConn();
			String sql = "UPDATE sys_p_user SET nick_name=?,user_email=? WHERE user_account=?";
			ps = connection.prepareStatement(sql);
			ps.setString(1, nick_name);
			ps.setString(2, user_email);
			ps.setString(3, user_account);
			int result = ps.executeUpdate();
			flag=result==0?false:true;
			

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return flag;

	
	}

}
