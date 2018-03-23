$(function(){
	$("#user_edit").hide();
	
	request("UserServlet?method=userList",null,function(msg){
		if(msg.tip=="非超级管理"){
			$("#user_list_form").hide();
			$.messager.alert('您非超级管理员用户','不可操作'); 
			return ;
			
		}
		else{
			user_list(null);
		}
			
	
		}
	);
		
});

function search_user(){
	var params = {"user_account":$("#user_account").val(),"nick_name" : $("#nick_name").val()};
	user_list(params);
}
function user_list(params){
	$('#th').datagrid({    
	    url:'UserServlet?method=userList',  
	    queryParams: params,
	    pagination:true,
	    fitColumns:true,
	    singleSelect:false,
	    selectOnCheck:true,
	    checkOnSelect:true,
	    columns:[[ 
	    	{field:'ck',checkbox:true}, 
	        {field:'user_id',title:'用户id',width:100,align:'center'}, 
	        {field:'user_account',title:'账号',width:100,align:'center'},  
	        {field:'nick_name',title:'昵称',width:100,align:'center'},    
	          
	        {field:'user_email',title:'邮箱',width:100,align:'center'}    
	      ]]
	}); 
	
}
function delete_user(){
	var checkedItems = $('#th').datagrid('getChecked');
	var ids = "";
	for(var i= 0; i < checkedItems.length; i++){
		ids += checkedItems[i].user_id +",";
	}
	ids = ids.substring(0, ids.length-1);
	request("UserServlet?method=delUser","ids=" +ids, function(msg){
		if(msg.tip=="删除用户成功")
		$('#th').datagrid('reload');
		else{
			alert("抱歉，删除失败");
			$('#th').datagrid('reload');
		}
	});
}
function edit(){
	var checkedItems = $('#th').datagrid('getChecked');
	
	console.log(checkedItems);
	if(checkedItems.length == 1){
		
		$('#user_edit_form').form('load',checkedItems[0]);
		$('#user_edit').dialog({    
		    title: '编辑用户信息',    
		    width: 400,    
		    height: 200,    
		    modal: true,
		 
		});
		
		
	
	}else{
		$.messager.alert('警告','请选择或勿多选！');    
	}
	
}

function submitForm(){
	var user_account=$("#user_account_val").val();
	var datas=$("#user_edit_form").serialize();
	var params="user_account="+user_account+"&"+datas;
	console.log(params);
	request("UserServlet?method=editUser",params, function(msg){
		if(msg.tip=="修改成功"){
			$('#user_edit').dialog('close');
			$('#th').datagrid('reload');
		}
		
		else{
			alert("抱歉，修改失败");
			$('#user_edit').dialog('close');
			$('#th').datagrid('reload');
		}
	});
}
function clearForm(){
	$('#user_edit').dialog('close');
}