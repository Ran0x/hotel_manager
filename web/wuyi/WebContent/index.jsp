<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" " http://www.w3.org/TR/html4/strict.dtd">
<%  
    // 权限验证  
    if(session.getAttribute("user_account")==null){  
        response.sendRedirect("signin.jsp");  
        return;  
    }  
%> 
<html>
<title>系统主界面</title>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- CSS样式引入 -->
	<link rel="stylesheet" type="text/css" href="easyui-1.5/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="easyui-1.5/themes/icon.css">
	<link rel="stylesheet" type="text/css" href="easyui-1.5/demo/demo.css">
	
    <!-- JavaScript插件引入 -->
	<script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="easyui-1.5/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="easyui-1.5/locale/easyui-lang-zh_CN.js"></script>


<link rel="shortcut icon" href="favicon.ico" />
    <style type="text/css">
    ul li{/*margin-top: 15;*/cursor: pointer;}
    </style>
    <script type="text/javascript" src="js/index.js"></script>
</head>
<body class="easyui-layout">

    <!-- TOP开始   -->
	<div data-options="region:'north',border:false" style="height:80px;padding:10px">
	    <div class="wrap" style="float:left;">
              <a href="javascript:void;" class="logo"><img style="width: 180px;border:0 none;" src="images/logo.png"/></a>
        </div>
        <div class="" style="float:right;">
              <div style=" display: inline-block;position: relative;right: 40px;top: 6px;">
                       <img style="width:50px; height:50px;border-radius:50px;overflow: hidden;cursor: pointer;" src="images/head.png" onclick="javascript:opentab('个人信息','pages/sys/user/pages/user_info.jsp');"/>
                       <span style="position: relative;left: 10px;top:-10px;font-size:16px;font-family: 微软雅黑;">欢迎登陆系统</span>
              </div>
          	  <div title="退出" onclick="quit();" style="width:50px; height:50px; background: url(images/back.png) no-repeat; border-radius:50px; display: inline-block; position: relative;top: 15px;cursor: pointer;">
          	  </div>
        </div>
	</div>
    <!-- TOP结束   -->
	
	<div data-options="region:'center'" style="border: 0px;">
		<div class="easyui-layout" data-options="fit:true" style="border: 0px;">
			
			<!-- 菜单栏开始（动态加载）   -->
			<div data-options="region:'west',split:true,title:'  '"
				style="width: 180px; height: 100%; overflow: hidden; overflow-x: hidden;">
				<div class="easyui-accordion" fit="true" style="text-align: center;">
					<div title="仓库管理">
					    <ul><li onclick="opentab('产品管理','building.jsp');">产品管理</li></ul>
						<ul><li onclick="opentab('产品入库','building.jsp');">产品入库</li></ul>
						<ul><li onclick="opentab('产品出库','building.jsp');">产品出库</li></ul>
						<ul><li onclick="opentab('产品退货','building.jsp');">产品退货</li></ul>
						<ul><li onclick="opentab('退货审批','building.jsp');">退货审批</li></ul>
					</div>
					<div title="业务管理">
						<ul><li onclick="opentab('客户管理','building.jsp');">客户管理</li></ul>
						<ul><li onclick="opentab('合同管理','building.jsp');">合同管理</li></ul>
					</div>
					<div title="采购管理">
						<ul><li onclick="opentab('工厂管理','building.jsp');">工厂管理</li></ul>
						<ul><li onclick="opentab('订单管理','building.jsp');">订单管理</li></ul>
					</div>
					<div title="报表管理">
						<ul><li onclick="opentab('报表管理','building.jsp');">报表管理</li></ul>
					</div>
					<div title="系统管理">
						<ul><li onclick="opentab('用户管理','user_list.jsp');">用户管理</li></ul>
						<ul><li onclick="opentab('角色管理','role_list.jsp');">角色管理</li></ul>
						<ul><li onclick="opentab('部门管理','dept_list.jsp');">部门管理</li></ul>
						<ul><li onclick="opentab('菜单管理','dept_test.jsp');">菜单管理</li></ul>
						<ul><li onclick="opentab('权限管理','resourceAccessManage.jsp');">权限管理</li></ul>
						<ul><li onclick="opentab('个人信息','user_info.jsp');">个人信息</li></ul>
						<ul><li onclick="opentab('修改密码','edit_pwd.jsp');">修改密码</li></ul>
					</div>
			    </div>	   
			</div>
			<!-- 菜单栏结束   -->

            <!-- 首页开始   -->
			<div data-options="region:'center'">
				<div id="easytabs" class="easyui-tabs" fit="true">
					<div title="首页">
						<iframe frameborder="0" src="welcome.jsp" style="width:100%;height:470px;overflow:-Scroll;overflow-y:hidden;"></iframe>
					</div>
				</div>
			</div>
            <!-- 首页结束   -->
			
		</div>
	</div>
	
	<!-- 底部开始   -->
	<div data-options="region:'south',border:false" style="height:50px;padding:10px;">
	        <center>
	    		<span>联系我们　 |　 法律声明　 |　合作伙伴　|　客户服务　|　隐私声明</span><br>
	    		<span>CopyRight2017©版权所有 唯品服务股份有限公司</span>
	    	</center>
	</div>
	<!-- 底部结束   -->
</body>
</html>
