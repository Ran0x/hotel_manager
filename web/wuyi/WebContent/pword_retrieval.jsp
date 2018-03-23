<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <title>重置密码</title>
    <link rel="shortcut icon" href="favicon.ico" />
    <link rel="stylesheet" type="text/css" href="css/base.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/placeholder.js"></script>
    <script type="text/javascript" src="js/base.js"></script>
    <script type="text/javascript" src="js/reset.js"></script>
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
            <div class="as_wrap">
                <div class="texi">
                    <a class="fr cl_d22" href="pword_number.jsp">上一步&gt;</a>
                    <h2>请填写您需要设置的新密码</h2>
                </div>
                <div class="opy">
                    <div class="headnote login_ts" id="error" style="display: block;"></div>
                </div>
                 <form id="reset_form" name="reset_form" method="post" autocomplete="off">
                     <div class="form-item form-item-account">
                         <label>设  置  密  码</label>
                         <input type="password" name="user_pwd" id="user_pwd" class="field" maxlength="20" placeholder="输入密码"/>
                     </div>
                     <div class="form-item form-item-account">
                         <label>确  认  密  码</label>
                         <input type="password" name="re_user_pwd" id="re_user_pwd" class="field" placeholder="请再次输入密码" maxlength="20"/>
                     </div>
                    <div>
                        <a onclick="reset();" class="btn-register">确定</a>
                    </div>
                 </form>
            </div>
        </div>
    </div>
</body>
</html>