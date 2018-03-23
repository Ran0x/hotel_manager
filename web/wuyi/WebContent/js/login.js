function login() {
	var user_account = $("#user_account").val();
	var user_pwd = $("#user_pwd").val();
	var authCode = $("#authCode").val();
	
	if ($.trim(user_account) == "") {
		$("#error").html("请输入用户帐号");
		return;
	}

	// test()方法在字符串中查找是否存在指定的正则表达式，并返回布尔值，如果存在则返回true，否则返回false
	if (!(/^1[34578]\d{9}$/.test(user_account))) {
		$("#error").html("格式不正确");
		return;
	}
	if ($.trim(user_pwd) == "") {
		$("#error").html("请输入密码");
		return;
	}

	var datas=$("#login_form").serialize();//表单序列化(获取)
	request("LoginRegisterServlet?method=login",datas,function(msg){
		if(msg.tip=="登录成功")
			location.href="index.jsp";
		else
			$("#error").html(msg.tip);

	});


}

$(function() {
	$("input").keyup(function() {
		$("#error").html("");
	});
})