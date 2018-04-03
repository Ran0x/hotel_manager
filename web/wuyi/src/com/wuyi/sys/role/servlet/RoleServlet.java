package com.wuyi.sys.role.servlet;

import java.io.IOException;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wuyi.sys.role.service.RoleDaoImpl;
import com.wuyi.sys.servlet.BaseServlet;


public class RoleServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private RoleDaoImpl roleDaoImpl=new RoleDaoImpl();
	private String tip;
	public void roleList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String role_name = request.getParameter("role_name");
		String role_code = request.getParameter("role_code");
		int user_type=(int) request.getSession().getAttribute("user_type");
	//	System.out.println(user_type);
		String jsonStr = roleDaoImpl.role_List(role_name, role_code);
	
		if(user_type==0)
			out_json(jsonStr, response);
		else{
			tip="非超级管理";
			out_write(tip, response);
		}
	}
	public void editRole(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String role_name = request.getParameter("role_name");
		String role_code = request.getParameter("role_code");
		int role_type = Integer.parseInt(request.getParameter("role_type"));
		String role_note = request.getParameter("role_note");
	
		System.out.println(role_code+"---"+role_name+"--"+role_type+"--"+role_note);
		boolean flag = roleDaoImpl.edit(role_name, role_code, role_type, role_note);
		tip=flag==false?"修改失败":"修改成功";
		out_write(tip, response);
	}
	public void addRole(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String role_name = request.getParameter("role_name");
		String role_code = request.getParameter("role_code");
		int role_type = Integer.parseInt(request.getParameter("role_type"));
		String role_note = request.getParameter("role_note");
		
		System.out.println(role_name+"--"+role_type+"--"+role_note);
		boolean flag = roleDaoImpl.add(role_name, role_code, role_type, role_note);
		tip=flag==false?"修改失败":"修改成功";
		out_write(tip, response);
	}
	public void delRole(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ids = request.getParameter("ids");
		boolean flag = roleDaoImpl.del(ids);
		tip = flag == false ? "删除用户失败" : "删除用户成功";
		out_write(tip, response);
}
}
