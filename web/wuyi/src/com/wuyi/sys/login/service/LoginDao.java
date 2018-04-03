package com.wuyi.sys.login.service;

public interface LoginDao {
	public boolean isLogin(String user_account,String user_pwd);
	public int user_type();
}
