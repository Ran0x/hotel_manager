function reset() {
	var user_pwd = $("#user_pwd").val();
	var re_user_pwd = $("#re_user_pwd").val();

	if ($.trim(user_pwd) == "") {
		$("#error").html("请输入密码");
		return;
	}
	if ($.trim(user_pwd).length > 16 || $.trim(user_pwd).length < 6) {
		$("#error").html("密码长度为6至16");
		return;
	}
	if ($.trim(user_pwd) != $.trim(re_user_pwd)) {
		$("#error").html("两次密码不一致");
		return;
	}
	var datas = $("#reset_form").serialize();
	request("ForgetServlet?method=reset", datas, function(msg) {
		// $("#error").html(msg.tip);
		if (msg.tip = "修改成功")
			location.href = "pword_complete.jsp";
		else
			$("#error").html(msg.tip);
	});
}
$(function() {
	$("input").keyup(function() {
		$("#error").html(" ");
	});
});