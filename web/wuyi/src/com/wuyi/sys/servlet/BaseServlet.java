package com.wuyi.sys.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Method;

import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * <pre>
 * @author Administrator
 *反射servlet
 *</pre>
 */

public class BaseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String method = request.getParameter("method");//获取方法参数名称
		
		
		try {
			
			Method m = this.getClass().getMethod(method, HttpServletRequest.class,HttpServletResponse.class);
			m.invoke(this.getClass().newInstance(),request,response);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
	
	
	public  void out_write(String tip ,HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charSet=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.write("{\"tip\":\""+tip+"\"}");
	}
	public  void out_json(String jsonStr ,HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charSet=UTF-8");
		PrintWriter writer = response.getWriter();
		writer.write(jsonStr);
	}

}
