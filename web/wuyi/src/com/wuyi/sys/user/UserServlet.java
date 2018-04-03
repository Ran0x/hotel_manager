package com.wuyi.sys.user;

import java.io.IOException;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wuyi.sys.servlet.BaseServlet;
import com.wuyi.sys.user.service.Impl.UserDaoImpl;


public class UserServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private UserDaoImpl userDaoImpl=new UserDaoImpl();
	private String tip;
	public void userList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String user_account = request.getParameter("user_account");
		String nick_name = request.getParameter("nick_name");
		int user_type=(int) request.getSession().getAttribute("user_type");
		System.out.println(user_type);
		String jsonStr = userDaoImpl.userList(user_account, nick_name);
		System.out.println(user_account+nick_name);
		if(user_type==0)
			out_json(jsonStr, response);
		else{
			tip="非超级管理";
			out_write(tip, response);
		}
		
	}
	public void editUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user_account = request.getParameter("user_account");
		String nick_name = request.getParameter("nick_name");
		String user_email = request.getParameter("user_email");
		System.out.println(user_account+"--"+nick_name+"--"+user_email);
		boolean flag = userDaoImpl.edit(nick_name, user_email, user_account);
		tip=flag==false?"修改失败":"修改成功";
		out_write(tip, response);
		
	}
	public void delUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String ids = request.getParameter("ids");
		boolean flag = userDaoImpl.del(ids);
		tip = flag == false ? "删除用户失败" : "删除用户成功";
		out_write(tip, response);
	}
}
