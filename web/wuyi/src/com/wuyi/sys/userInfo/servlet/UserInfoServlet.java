package com.wuyi.sys.userInfo.servlet;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wuyi.sys.servlet.BaseServlet;
import com.wuyi.sys.userInfo.service.UserServiceImpl;


public class UserInfoServlet extends BaseServlet {
private static final long serialVersionUID = 1L;
    
	
	private UserServiceImpl userService = new UserServiceImpl();
	public void userList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String user_account  = request.getParameter("user_account");
		String nick_name  = request.getParameter("nick_name");
				
		String userList = userService.userList(user_account, nick_name);
		
		out_json(userList, response);
	}
	public void userInfoLoad(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String user_account = (String) request.getSession().getAttribute("user_account");
		
		String json=userService.userInfoLoad(user_account);
		out_json(json, response);
	}
	public void userInfoSave(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String user_account = (String) request.getSession().getAttribute("user_account");
		
		String nick_name  = request.getParameter("nick_name");
		String user_phone  = request.getParameter("user_phone");
		String user_email  = request.getParameter("user_email");
		
		boolean flag=userService.userInfoSave(user_account, nick_name, user_phone, user_email);
		String tips = flag == false ? "失败" : "成功";
		
		out_write(tips, response);

		
		
	}

}
