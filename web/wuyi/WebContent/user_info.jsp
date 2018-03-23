<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Validate Form on Submit - jQuery EasyUI Demo</title>
<link rel="stylesheet" type="text/css"
	href="easyui-1.5/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui-1.5/themes/icon.css">
<link rel="stylesheet" type="text/css" href="easyui-1.5/demo/demo.css">
<script type="text/javascript" src="easyui-1.5/jquery.min.js"></script>
<script type="text/javascript" src="easyui-1.5/jquery.easyui.min.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({
			type : "POST",
			url : "UserInfoServlet?method=userInfoLoad",
			dataType : "json",
			success : function(msg) {
				$('#ff').form('load',{
					nick_name:msg.nick_name,
					user_phone:msg.user_phone,
					user_email:msg.user_email,
				});
			}
		
		});
	});	
		
	function submitForm() {
		var nick_name=$("#nick_name").val();
   		if($.trim(nick_name)==""){
   			$("#error_tips").html("用户昵称不能为空");
   			$('#nick_name').focus();
   			return;
   		}
   		var user_email=$("#user_email").val();
   		if($.trim(user_email)==""){
   			$("#error_tips").html("用户邮箱不能为空");
   			$('#user_email').focus();
   			return;
   		}
   		var user_email=$("#user_phone").val();
   		if($.trim(user_email)==""){
   			$("#error_tips").html("用户邮箱不能为空");
   			$('#user_phone').focus();
   			return;
   		}
		var datas = $("#ff").serialize();
		$.ajax({
			type : "POST",
			url : "UserInfoServlet?method=userInfoSave",
			data : datas,
			dataType : "json",
			success : function(msg) {
				
				$("#error_tips").html(msg.tip);


			}
		});
	}
	
	function clearForm() {
		$('#ff').form('clear');
	}
	$(function(){
    	$("input").keyup(function(){
    		$("#error_tips").html("");
    	});
    });
</script>

</head>
<body>

	<div style="margin: 20px 0;"></div>
	<div class="easyui-panel" title="个人信息"
		style="width: 100%; max-width: 400px; padding: 30px 60px;">
		<div class="headnote login_ts" style="display: block;" id="error_tips"></div>
		<form id="ff" name="ff" class="easyui-form" method="post"
			data-options="novalidate:true">
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" name="nick_name" id="nick_name"
					style="width: 100%" data-options="label:'用户昵称:',required:true">
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" name="user_phone" id="user_phone"
					style="width: 100%" data-options="label:'手机号码:',required:true">
			</div>
			<div style="margin-bottom: 20px">
				<input class="easyui-textbox" name="user_email" id="user_email"
					style="width: 100%"
					data-options="label:'个人邮箱:',required:true,validType:'email'">
					
			</div>
		</form>
		<div style="text-align: center; padding: 5px 0">
			<a href="javascript:void(0)" class="easyui-linkbutton"
				onclick="submitForm();" style="width: 80px">保存</a> <a
				href="javascript:void(0)" class="easyui-linkbutton"
				onclick="clearForm();" style="width: 80px">清除</a> 
		</div>
	</div>
</body>
</html>