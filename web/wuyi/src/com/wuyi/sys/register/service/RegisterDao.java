package com.wuyi.sys.register.service;

public interface RegisterDao {
	public boolean isUserExist(String user_account);
	public boolean register(String user_account,String nick_name,String user_email,String user_pwd);
}
