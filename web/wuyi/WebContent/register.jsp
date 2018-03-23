<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<title>注册</title>
<link rel="shortcut icon" href="favicon.ico" />
<link rel="stylesheet" type="text/css" href="css/base.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/placeholder.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript" src="js/register.js"></script>


</head>
<body>
	<div class="navn">
		<div class="wrap">
			<h1>
				<a href="index.jsp" class="logo"><img
					src="images/logo-zero2one.png" alt="" /></a>
			</h1>
		</div>
	</div>
	<div class="wrap">
		<div class="about_login">
			<div class="as_wrap">
				<div class="texi">
					<a class="fr cl_d22" href="signin.jsp">已有账号&gt;</a>
					<h2>账号注册</h2>
				</div>
				<div class="opy">
					<div class="headnote login_ts" id="error" style="display: block;"></div>
				</div>
				<form action="" name="register_form" id="register_form"
					autocomplete="off" method="POST">
					<div class="form-item form-item-account">
						<label>手 机 号 码</label> <input type="text" id="user_account"
							name="user_account" class="field" placeholder="使用常用手机号码">
					</div>
					<div class="form-item form-item-account">
						<label>用 户 昵 称</label> <input type="text" id="nick_name"
							name="nick_name" class="field" placeholder="输入用户名">
					</div>
					<div class="form-item form-item-account form-item-select">
						<label>用 户 邮 箱</label> <input type="text" name="user_email"
							id="user_email" class="field" placeholder="输入邮箱">
							 <select name="user_email_hz" id="user_email_hz" class="input select-in">
								<option>@qq.com</option>
								<option>@163.com</option>
							</select> 
						<span title="邮箱必填,找回密码时需用到" class="mailbox"></span>
					</div>
					<div class="form-item form-item-account">
						<label>设 置 密 码</label> <input type="password" name="user_pwd"
							id="user_pwd" class="field" maxlength="20" placeholder="输入密码" />
					</div>
					<div class="form-item form-item-account">
						<label>确 认 密 码</label> <input type="password" name="re_user_pwd"
							id="re_user_pwd" class="field" placeholder="请再次输入密码"
							maxlength="20" />
					</div>
					<div>
						<a onclick="register();" class="btn-register">立即注册</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>