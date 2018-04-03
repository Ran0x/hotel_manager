package com.wuyi.sys.userInfo.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.wuyi.core.jdbc.DBUtil;
import com.wuyi.sys.register.UserPlus;

public class UserServiceImpl {
	public static void main(String[] args) {
		UserServiceImpl userServiceImpl=new UserServiceImpl();
		//System.out.println(userServiceImpl.userList("13528329503","Zhongshan 23"));
	}
	
	public String  userList(String user_account, String nick_name) {
		String json_str = "";
		try {
			
			Connection connection = DBUtil.getSQLConn();
			
			String sql_data="SELECT t.user_id,t.nick_name,t.user_account,t.user_email FROM sys_p_user t where 1=1";
			
			if(user_account != null){
				sql_data += " and t.user_account like '%"+user_account+"%'";
			}
			if(nick_name != null){
				sql_data += " and t.nick_name like '%"+nick_name+"%'";
			}
			
			String sql_count="SELECT count(*) total_count FROM sys_p_user t";
			
			int total_count=0;
			UserPlus user = null;
			List<UserPlus> users = new ArrayList<UserPlus>();
			PreparedStatement ps = connection.prepareStatement(sql_count);
			ResultSet rs =ps.executeQuery();
			while(rs.next()) {
				total_count = rs.getInt("total_count");
			}
			
			ps = connection.prepareStatement(sql_data);
			rs = ps.executeQuery();
			while(rs.next()){
				user = new UserPlus();
				user.setUser_id(rs.getInt("user_id"));
				user.setUser_account(rs.getString("user_account"));
				user.setNick_name(rs.getString("nick_name"));
				user.setUser_email(rs.getString("user_email"));
				users.add(user);
			}
			json_str = "{\"total\":"+total_count+",\"rows\":"+JSON.toJSONString(users)+"}";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json_str;
	}
	public String userInfoLoad(String user_account) {
		String json_str = "";
		try {
			
			Connection connection = DBUtil.getSQLConn();
			
			String sql="SELECT t.user_id,t.nick_name,t.user_phone,t.user_email FROM sys_p_user t where 1=1 and t.user_account = ?";
			
			
			
			UserPlus user = null;
			PreparedStatement ps = connection.prepareStatement(sql);
			ps.setString(1, user_account);
			ResultSet rs =ps.executeQuery();
		
			
			while(rs.next()){
				user = new UserPlus();
				user.setNick_name(rs.getString("nick_name"));
				user.setUser_phone(rs.getString("user_phone"));
				user.setUser_email(rs.getString("user_email"));
			}
			json_str = JSON.toJSONString(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json_str;
		
	}
	public boolean userInfoSave(String user_account,String nick_name,String user_phone,String user_email) {
		boolean flag=false;
		try {
			String sql = "UPDATE sys_p_user t SET t.nick_name=?,t.user_email=?,t.user_phone=? WHERE t.user_account=?";
			Connection sqlConnection = DBUtil.getSQLConn();
			PreparedStatement ps = sqlConnection.prepareStatement(sql);
			ps.setString(1, nick_name);
			ps.setString(2, user_email);
			ps.setString(3, user_phone);
			ps.setString(4, user_account);
			
			
			int result = ps.executeUpdate();
			flag = result == 0 ? false : true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
