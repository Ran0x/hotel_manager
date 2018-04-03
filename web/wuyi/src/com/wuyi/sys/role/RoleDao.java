package com.wuyi.sys.role;

public interface RoleDao {
	public String role_List(String role_name, String role_code);
	public boolean edit(String role_name,String role_code,int role_type,String role_note);
	public boolean del(String role_id);
	
	public boolean add(String role_name,String role_code,int role_type,String role_note);
}
