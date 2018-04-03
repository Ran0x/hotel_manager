package com.wuyi.sys.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wuyi.core.jdbc.DBUtil;

import com.wuyi.core.utils.EmailUtils;
import com.wuyi.core.utils.MD5Encryptor;
import com.wuyi.sys.forget.service.impl.ForgetDaoImpl;



/**
 * <pre>
 * @author Administrator
 *忘记密码模块
 *</pre>
 */
public class ForgetServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private String email_code;
	private ForgetDaoImpl forgetDaoImpl = new ForgetDaoImpl();
	private Connection connection = null;
	private PreparedStatement psStatement = null;
	private String tip=" ";
/**
 * <pre>
 * verify()
 * 校验验证码
 * </pre>
 */
	public void verify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String phoneCode=request.getParameter("phoneCode");	
		email_code=(String) request.getSession().getAttribute("email_code");
		if(phoneCode.equals(email_code)){
			tip="验证成功";
		}else
			tip="验证码错误";	
		out_write(tip, response);
	}
	/**
	 * <pre>
	 * sendCode()
	 * 发送邮箱验证码
	 * </pre>
	 */
	public void sendCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// TODO Auto-generated method stub
		String user_account = request.getParameter("user_account");
		String user_email = request.getParameter("user_email");
		String user_email_hz = request.getParameter("user_email_hz");
		boolean flag = forgetDaoImpl.isValidate(user_account, user_email + user_email_hz);
		email_code = Integer.toString(getRandNum(1, 999999));
		request.getSession().setAttribute("email_code", email_code);
		System.out.println(email_code);

		if (flag) {
			request.getSession().setAttribute("user_account", user_account);
			tip = "验证码已发送";
			try {
				EmailUtils.sendEmail(user_account, user_email + user_email_hz, email_code);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				
			}

		} else
			tip = "帐号不存在或邮箱错误";
		out_write(tip, response);
	}
	/**
	 * <pre>
	 * reset()
	 * 重新设置密码
	 * </pre>
	 */
	public void reset(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user_pwd = request.getParameter("user_pwd");
		String user_account = (String) request.getSession().getAttribute("user_account");
		try {

			connection = DBUtil.getSQLConn();
			String sql = "UPDATE  sys_p_user SET user_pwd=? WHERE user_account=?";
			psStatement = connection.prepareStatement(sql);
			psStatement.setString(1, MD5Encryptor.encrypt(user_pwd));
			psStatement.setString(2, user_account);
			int result = psStatement.executeUpdate();
			System.out.println(result);
			tip = result == 0 ? "密码修改失败，请重置" : "修改成功";

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		out_write(tip, response);
	}
/**
 * <pre>
 * 生成随机验证码
 * 以发给邮箱（6位）
 * </pre>
 * @param min
 * @param max
 * @return
 */
	public  int getRandNum(int min, int max) {
		int randNum = min + (int) (Math.random() * ((max - min) + 1));
		return randNum;
	}

}
