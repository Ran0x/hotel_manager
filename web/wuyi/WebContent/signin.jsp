<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <title>登录</title>
    <link rel="shortcut icon" href="favicon.ico" />
    <link rel="stylesheet" type="text/css" href="css/base.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/placeholder.js"></script>
        <script type="text/javascript" src="js/base.js"></script>
    <script type="text/javascript" src="js/login.js"></script>
</head>
<body>
    <div class="navn">
        <div class="wrap">
            <h1>
                <a href="index.jsp" class="logo"><img src="images/logo-zero2one.png" alt="" /></a>
            </h1>
        </div>
    </div>
    <div class="wrap">
        <div class="about_login">
            <div class="pa"><img src="images/sin-bg.jpg" alt=""></div>
            <div class="fr login_wrap">
                <div class="login_account">
                    <a class="fr cl_d22" href="register.jsp">立即注册&gt;</a>
                    <h2>账号登陆</h2>
                    <!-- 账号格式不正确：弹出 -->
                    <div class="opy">
                        <div class="headnote login_ts" id="error" style="display: block;"></div>
                    </div>
                    <form id="login_form" name="login_form" method="post" action="">
                        <div class="sign-in">
                            <label>账  号</label>
                            <input id="user_account" name="user_account" placeholder="手机号码" class="ipt ipt_txt" type="text" value="">
                        </div>
                        <div class="sign-in">
                            <label>密  码</label>
                            <input id="user_pwd" name="user_pwd" placeholder="输入密码" class="ipt ipt_txt" type="password" value="">
                        </div>
                        <div class="sign-in">
                            <label>验证码</label>
                            <input type="text" autocomplete="off" name="authCode" id="authCode" maxlength="6" class="ipt ipt_txt" placeholder="请输入验证码"/>
                            <!-- 验证码 -->
                           <div class="img-code"><img src="VerifyServlet" onclick="this.src=this.src+'?time='+new Date();" /></div>
                        </div>
                        <div class="opt">
                            <a href="pword_number.jsp">忘记密码？</a>
                        </div>
                        <div class="btn_login">
                            <a class="login_ac fl"  onclick="login();">登&nbsp;&nbsp;录</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>