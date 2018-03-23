function getCode(){
	
	var datas=$("#forget_form").serialize();
	request("ForgetServlet?method=sendCode",datas,function(msg){
		
		$("#error").html(msg.tip);
			
	});
}
function forget(){
	var user_account=$("#user_account").val();
	var user_email=$("#user_email").val();
	var user_email_hz=$("#user_email_hz").val();
	var phoneCode=$("#phoneCode").val();
	
	if($.trim(user_account)==""){
		$("#error").html("请输入原帐号");
		return;
	}
	//test()方法在字符串中查找是否存在指定的正则表达式，并返回布尔值，如果存在则返回true，否则返回false
	if(!(/^1[34578]\d{9}$/.test(user_account))){
		$("#error").html("请输入合法手机号码");
		return;
	
	}
	

	if($.trim(user_email)==""){
		$("#error").html("请输入邮箱");
		return;
	}
	
	if($.trim(phoneCode)==""){
		$("#error").html("请输入验证码");
		return;
	}
	var datas=$("#forget_form").serialize();
	request("ForgetServlet?method=verify",datas,function(msg){
		if(msg.tip=="验证成功"){
			location.href="pword_retrieval.jsp";
			
		}
		else{
			$("#error").html(msg.tip);
		}
			
		}
	);
	
}

$(function(){
	$("input").keyup(function(){
		$("#error").html(" ");
	});
});