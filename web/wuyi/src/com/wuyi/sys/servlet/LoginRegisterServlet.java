package com.wuyi.sys.servlet;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.wuyi.core.utils.MD5Encryptor;
import com.wuyi.core.utils.VerifyCodeUtils;
import com.wuyi.sys.login.service.impl.LoginDaoImpl;
import com.wuyi.sys.register.service.impl.RegisterDaoImpl;
/**
 * <pre>
 * @author Administrator
 *登录注册模块
 *</pre>
 */
public class LoginRegisterServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;

	private LoginDaoImpl loginDao = new LoginDaoImpl();
	private RegisterDaoImpl registerDao=new RegisterDaoImpl();
	private boolean isregister;
	private String tip = " ";
	/**
	 * <pre>
	 * login()
	 * 登录模块
	 * </pre>
	 */

	public void login(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String user_account = request.getParameter("user_account");
		String user_pwd = request.getParameter("user_pwd");
		String authCode = request.getParameter("authCode");

		String code = (String) request.getSession().getAttribute("code");
		request.getSession().setAttribute("user_account", user_account);
		
		// 验证码正确--loginDao返回值为true即登录成功
		if (code.equals(authCode)) {
			boolean flag = loginDao.isLogin(user_account, MD5Encryptor.encrypt(user_pwd));
			request.getSession().setAttribute("user_type", loginDao.user_type());
			tip = flag == false ? "用户名或密码错误" : "登录成功";

		} else
			tip = "验证码错误";

		// 验证码错误--提示重新输入

		out_write(tip, response);

	}
	/**
	 * <pre>
	 * register()
	 * 注册模块
	 * </pre>
	 */

	public void register(HttpServletRequest request, HttpServletResponse response)
		throws ServletException, IOException {
		

		String user_account = request.getParameter("user_account");
		String nick_name = request.getParameter("nick_name");
		String user_email = request.getParameter("user_email");
		String user_email_hz = request.getParameter("user_email_hz");
		String user_pwd = request.getParameter("user_pwd");
	
		
		
		boolean isUser=registerDao.isUserExist(user_account);
		if(isUser)
		{
			isregister=registerDao.register(user_account, nick_name, user_email+user_email_hz, MD5Encryptor.encrypt(user_pwd));
			if(isregister)
				tip="注册成功";
		}
		else
			tip="该用户帐号已存在";
		
		
		//请求响应
		
		out_write(tip, response);
		
	}
	/**
	 * 
	 * <pre>
	 * 退出
	 * </pre>
	 */
	public void quit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getSession().removeAttribute("user_account");
		request.getSession().invalidate();
		
	//	response.flushBuffer();
		
		//tip="退出成功";
		
	}
	/*<pre>
	 * 验证是否登录
	 * </pre>
	 */
	public void isLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user_account=(String) request.getSession().getAttribute("user_account");
		if(user_account!=null)
			tip="进入首页";
		else
			tip="请登录";
		out_write(tip, response);
	}
	

}
