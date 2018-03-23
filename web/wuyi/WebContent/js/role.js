$(function(){
	
	$("#role_edit").hide();
	request("RoleServlet?method=roleList",null,function(msg){
		if(msg.tip=="非超级管理"){
			$("#user_list_form").hide();
			$.messager.alert('您非超级管理员用户','不可操作'); 
			return ;
			
		}
		else{
			role_list(null);
		}
			
	
		}
	);
		
});
function search_role(){
	var params = {"role_name":$("#role_name").val(),"role_code" : $("#role_code").val()};
	role_list(params);
}
function role_list(params){
	$('#th').datagrid({    
	    url:'RoleServlet?method=roleList',  
	    queryParams: params,
	    pagination:true,
	    fitColumns:true,
	    singleSelect:false,
	    selectOnCheck:true,
	    checkOnSelect:true,
	    columns:[[ 
	    	{field:'ck',checkbox:true},
	    	  {field:'role_id',title:'角色ID',width:100,align:'center'}, 
	        {field:'role_name',title:'角色名称',width:100,align:'center'}, 
	        {field:'role_type',title:'角色类型',width:100,align:'center'}, 
	        {field:'role_code',title:'角色编号',width:100,align:'center'},  
	        {field:'role_note',title:'备注',width:100,align:'center'},      
	      ]]
	}); 
	
}
function delete_role(){
	var checkedItems = $('#th').datagrid('getChecked');
	var ids = "";
	for(var i= 0; i < checkedItems.length; i++){
		ids += checkedItems[i].role_id +",";
	}
	ids = ids.substring(0, ids.length-1);
	request("RoleServlet?method=delRole","ids=" +ids, function(msg){
		if(msg.tip=="删除用户成功")
		$('#th').datagrid('reload');
		else{
			alert("抱歉，删除失败");
			$('#th').datagrid('reload');
		}
	});
}
var method;
function add(){	
	$("#role_name").html(" ");
	$("#role_code").html(" ");
	$("#role_type").html(" ");
	$("#role_note").html(" ");
		$('#role_edit').dialog({    
		    title: '编辑用户信息',    
		    width: 400,    
		    height: 200,    
		    modal: true,	 
		});
		method="addRole";
}
function edit(){
	var checkedItems = $('#th').datagrid('getChecked');
	
	console.log(checkedItems);
	if(checkedItems.length == 1){
		
		$('#role_edit_form').form('load',checkedItems[0]);
		$('#role_edit').dialog({    
		    title: '编辑用户信息',    
		    width: 400,    
		    height: 200,    
		    modal: true,	 
		});
		method="editRole";

	}else{
		$.messager.alert('警告','请选择或勿多选！');    
	}
	
}

function submitForm(){

	var role_code=$("#role_code_val").val();
	var datas=$("#role_edit_form").serialize();
	var params="role_code="+role_code+"&"+datas;
	console.log(params);
	request("RoleServlet?method="+method,params, function(msg){
		if(msg.tip=="修改成功"){
			$('#role_edit').dialog('close');
			$('#th').datagrid('reload');
		}
		
		else{
			alert("抱歉，修改失败");
			$('#role_edit').dialog('close');
			$('#th').datagrid('reload');
		}
	});
}
function clearForm(){
	$('#role_edit').dialog('close');
}