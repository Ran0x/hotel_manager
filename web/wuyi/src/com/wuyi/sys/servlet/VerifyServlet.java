package com.wuyi.sys.servlet;

import java.awt.image.BufferedImage;
import java.io.IOException;

import javax.imageio.ImageIO;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wuyi.core.utils.VerifyCodeUtils;


public class VerifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private  String code;
	private BufferedImage paintImage ;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				
		//获取验证码图片
		 paintImage = VerifyCodeUtils.paintImage(100, 42);
		//获取随机数
		code = VerifyCodeUtils.getCode();
		//将随机数存到会话
		//将图片响应回页面
		request.getSession().setAttribute("code", code);
		ImageIO.write(paintImage, "png", response.getOutputStream());
	}
		
	


}
