<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
<title>填写账号</title>
<link rel="shortcut icon" href="favicon.ico" />
<link rel="stylesheet" type="text/css" href="css/base.css" />
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/placeholder.js"></script>
<script type="text/javascript" src="js/base.js"></script>
<script type="text/javascript" src="js/forget.js"></script>

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
					<a class="fr cl_d22" href="signin.jsp">登录&gt;</a>
					<h2>填写账号</h2>
				</div>
				<div class="opy">
					<div class="headnote login_ts" id="error" style="display: block;"></div>
				</div>
				<form id="forget_form" name="forget_form" autocomplete="off" method="post">
					<div class="form-item form-item-account">
						<label>账 号</label> <input type="text" id="user_account"
							name="user_account" class="field" placeholder="输入原账号">
					</div>
					<div class="form-item form-item-account form-item-select">
						<label>用 户 邮 箱</label> <input type="text" id="user_email"
							name="user_email" class="field" placeholder="输入邮箱"> <select
							name="user_email_hz" id="user_email_hz" class="input select-in">
							<option>@qq.com</option>
							<option>@163.com</option>
						</select> <span title="邮箱必填,找回密码时需用到" class="mailbox"></span>
					</div>
					<div class="form-item form-item-phonecode">
						<label>验 证 码</label> <input type="text" name="phoneCode"
							maxlength="6" id="phoneCode" class="field phonecode"
							placeholder="请输入验证码" autocomplete="off">
						<button onclick="getCode();" id="getPhoneCode"  class="btn-phonecode" type="button">发送验证码</button>
					</div>
					<div>
						<a onclick="forget();" class="btn-register">下一步</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>