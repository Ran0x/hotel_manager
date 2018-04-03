package com.wuyi.sys.user;

public interface UserDao {
	String userList(String user_account,String nick_name);
	boolean del(String user_id);
	boolean edit(String nick_name,String user_email,String user_account);
}
