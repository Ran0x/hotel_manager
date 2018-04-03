package com.wuyi.core.utils;

import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

public class EmailUtils {
	/**
	 * 发送邮件
	 * @param user_account
	 * @param user_email
	 * @param email_code
	 * @throws Exception
	 */
	public static void sendEmail(String user_account, String user_email, String email_code) throws Exception {
		//实例化发送邮件对象
				JavaMailSenderImpl mailSenderImpl = new JavaMailSenderImpl();
				
				//配置发送邮件参数
				mailSenderImpl.setHost("smtp.qq.com");
				mailSenderImpl.setPort(587);
				mailSenderImpl.setUsername("1316882869@qq.com");
				mailSenderImpl.setPassword("bjqnljmuvzhgidjf");
				
				//实例化属性对象
				Properties javaMailProperties = new Properties();
				//往属性对象里面添加属性
				javaMailProperties.setProperty("mail.smtp.auth", "true");
				javaMailProperties.setProperty("mail.smtp.timeout", "25000");
				
				mailSenderImpl.setJavaMailProperties(javaMailProperties);
				    
				
				try {
					//创建消息体
					MimeMessage mimeMessage = mailSenderImpl.createMimeMessage();   
					MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
					//发送人
					messageHelper.setFrom("1316882869@qq.com");
					//发给谁
					messageHelper.setTo(user_email);
					//标题
					messageHelper.setSubject("邮箱取回验证码");
					//内容
					messageHelper.setText("Deer 用户 :"+user_account+" 请妥善保管取回邮箱验证码：" + email_code);
					
					
					//发送邮箱
					mailSenderImpl.send(mimeMessage);
					
				} catch (MessagingException e) {
					e.printStackTrace();
				}
	}
//	public static void main(String[] args) throws Exception {
//		EmailUtils.sendEmail(null, "tituba999@163.com", "大煞笔");
//	}
	

}
