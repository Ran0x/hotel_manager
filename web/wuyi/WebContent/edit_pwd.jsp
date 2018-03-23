<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%  
    // 权限验证  
    if(session.getAttribute("user_account")==null){  
        response.sendRedirect("signin.jsp");  
        return;  
    }  
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="easyui-1.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui-1.5/themes/icon.css">
<link rel="stylesheet" type="text/css" href="easyui-1.5/demo/demo.css">
<script type="text/javascript" src="easyui-1.5/jquery.min.js"></script>
<script type="text/javascript" src="easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript">
	$.extend($.fn.validatebox.defaults.rules, {
		confirmPass : {
			validator : function(value, param) {
				var pass = $(param[0]).passwordbox('getValue');
				return value == pass;
			},
			message : 'Password does not match confirmation.'
		}
	});
	
	function set() {
		var user_pwd = $("#user_pwd").val();
		var pwdRepeat = $("#pwdRepeat").val();
		if ($.trim(user_pwd) != $.trim(pwdRepeat)) {
			$("#error_tips").html("两次填写的密码不一致");
			$('#user_pwd').focus();
			return;
		}
		if($.trim(user_pwd).length>16 || $.trim(user_pwd).length<6){
			$("#error_tips").html("密码长度为6至16");
			return;
		}
		var datas = $("#ff").serialize();
		$.ajax({
			type : "POST",
			url : "ForgetServlet?method=reset",
			data : datas,
			dataType : "json",
			success : function(msg) {
			if(msg.tip=="修改成功")
				{
					alert(msg.tip+"!请重新登录");
					$.ajax({
						type : "POST",
						url : "LoginRegisterServlet?method=quit",
						data : null,
						dataType : "json",
						success : function(msg) {}
						});
					

					
					 
					
				}
				
				
			}		
		});
	}
		
	
	$(function() {
		$("input").keyup(function() {
			$("#error_tips").html("");
		});
	});
</script>
</head>
<body>
	<div id="tt" class="easyui-panel" style="width: 400px; padding: 50px 60px">
		<div class="headnote login_ts" style="display: block;" id="error_tips"></div>
		<form id="ff" name="ff" class="easyui-form" method="post"
			data-options="novalidate:true">
			<div style="margin-bottom: 20px">
				<input id="user_pwd" name="user_pwd" class="easyui-passwordbox"
					prompt="Password" iconWidth="28"
					style="width: 100%; height: 34px; padding: 10px">
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-passwordbox" id="pwdRepeat" name="pwdRepeat"
					prompt="Confirm your password" iconWidth="28"
					validType="confirmPass['#pass']"
					style="width: 100%; height: 34px; padding: 10px">
			</div>
		</form>

		<div style="text-align: center; padding: 5px 0">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="set();" style="width: 80px">保存</a>
		</div>
	</div>

</body>
</html>