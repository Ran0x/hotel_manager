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
<link rel="stylesheet" type="text/css" href="easyui-1.5/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="easyui-1.5/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="easyui-1.5/demo/demo.css">
	<link rel="stylesheet" type="text/css" href="css/base.css" />
	
	
	<script type="text/javascript" src="easyui-1.5/jquery.min.js"></script>
	<script type="text/javascript" src="easyui-1.5/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui-1.5/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/base.js"></script>
	<script type="text/javascript" src="js/role.js"></script>

</head>
<body>
				<!-- 用户管理开始 -->
<div style="margin:20px 0;"></div>
	<form id="user_list_form" name="user_list_form" method="post">
	
	<div  style="padding:2px 5px;">
		角色名称: <input id="role_name" name="role_name" style="width:110px">
		角色编号: <input id="role_code" name="role_code"   style="width:110px">
	<a onclick="search_role();" class="easyui-linkbutton" iconCls="icon-search">Search</a>
	</div>
	
	<div id="ft" style="padding:2px 5px;">
		<a onclick="add();" class="easyui-linkbutton" iconCls="icon-add" plain="true"></a>
		<a onclick="edit();" class="easyui-linkbutton" iconCls="icon-edit" plain="true"></a>
		<a onclick="delete_role();" class="easyui-linkbutton" iconCls="icon-remove" plain="true"></a>
	</div>
	<table id="th" class="easyui-datagrid" title="角色管理" style="width:80%;height:470px"
			data-options="rownumbers:true,singleSelect:true,url:'datagrid_data1.json',toolbar:'#tb',footer:'#ft'">
		
	</table>
				
</form>
				<!-- 用户管理结束-->
					<!-- 用户编辑开始-->
<div id="role_edit" >
	<div  class="easyui-panel" style="width: 386px;height:164px">
		<div style="padding: 10px 60px 20px 60px">
			<form id="role_edit_form" name="user_edit_form" method="post" >
							
							角色编号:
							<input class="easyui-textbox" type="text" id="role_code_val" name="role_code"  ></input>
							<br />
							角色名称:
							<input class="easyui-textbox" type="text" id="role_name_val" name="role_name" ></input>
							<br />		
							角色类型:
							<input class="easyui-textbox" type="text" id="role_type" name="role_type" ></input>
							<br />
							备&nbsp;&nbsp;注:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input class="easyui-textbox" type="text" id="role_note" name="role_note" ></input>
					
					
			</form>
			<div style="text-align: center; padding: 5px">
				<a href="javascript:void(0)" class="easyui-linkbutton"onclick="submitForm()">Submit</a>
				 <a href="javascript:void(0)"class="easyui-linkbutton" onclick="clearForm()">Clear</a>
			</div>
		</div>
	</div>
</div>
				<!-- 用户编辑结束-->
</body>
</html>