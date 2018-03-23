
function register(){
		
		var user_account=$("#user_account").val();
		var nick_name=$("#nick_name").val();
		var user_email=$("#user_email").val();
		var user_email_hz=$("#user_email_hz").val();
		var user_pwd=$("#user_pwd").val();
		var re_user_pwd=$("#re_user_pwd").val();
		var isEmail = /^\w+([-+.]\w+)*/;
		
		
	if($.trim(user_account)==""){
			$("#error").html("请输入手机号码");
			return;
		}
	
		
	
		//test()方法在字符串中查找是否存在指定的正则表达式，并返回布尔值，如果存在则返回true，否则返回false
		if(!(/^1[34578]\d{9}$/.test(user_account))){
			$("#error").html("请输入合法手机号码");
			return;
		
		}
		if($.trim(nick_name)==""){
			$("#error").html("请输入用户名");
			return;
		}
		
		if($.trim(user_email)==""){
			$("#error").html("请输入邮箱");
			return;
		}
		if(!(/^\w+([-+.]\w+)*/).test(user_email)){
			$("#error").html("请输入合法邮箱");
			return;
		}
		
		if($.trim(user_pwd)==""){
			$("#error").html("请输入密码");
			return;
		}
		if($.trim(user_pwd).length>16 || $.trim(user_pwd).length<6){
			$("#error").html("密码长度为6至16");
			return;
		}
		if($.trim(user_pwd)!=$.trim(re_user_pwd)){
			$("#error").html("两次密码不一致");
			return;
		}
		
	
		//获取整个表单数据
		var datas=$("#register_form").serialize();//表单序列化(获取)
		//console.log(datas);
		//注册接口请求

		request("LoginRegisterServlet?method=register",datas, function(msg){
 		   if(msg.tip == "注册成功")
			   location.href = "register_complete.jsp";
		   else
			   $("#error").html(msg.tip);}
		);
	}
  	
	
	$(function(){
		$("input").keyup(function(){
			$("#error").html("");
		});
	})
	