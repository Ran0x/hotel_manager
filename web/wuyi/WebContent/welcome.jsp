<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" " http://www.w3.org/TR/html4/strict.dtd">
<html>
<title>首页</title>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
   
    <style type="text/css">
        *{ margin:0; padding:0; list-style: none; }  /* 初始化清空外内边距------这行代码可无 */
        .designate-icon{ width:100%; }
        .designate-icon .designate-icon-in{  margin:-8px 50px;}
        .designate-icon-in h4{ width:20px;float:left;  font-size:12px;padding: 0px 10px; margin-top: 26px; border-left:2px solid #000; }
        .designate-icon ul li{ display: inline-block; width:80px;  margin:6Px 25px; border:1px solid #ccc; overflow: hidden; }
        .designate-icon ul li a{ display: block; width:100%;  }
        .designate-icon ul li a img{ display: block;  width:100%; height:60px; border:0 none; cursor: pointer;}
        .designate-icon ul li div{  width:100%;  background: #fff; font-size: 12px; line-height: 40px; text-align: center; }
    </style>
</head>
<body>
<div class="designate-icon">
	<div class="designate-icon-in">
			<h4>仓库管理</h4>
        	<ul>
	            <li>
	                <a onclick="open_new_tab('product_list','产品管理','pages/service/fdy/factory/product/pages/productList.jsp');"><img src="images/product.png"  alt="" /></a>
	                <div>产品管理</div>
	            </li>
	            <li>
	                <a onclick="open_new_tab('templet_list','样板管理','pages/service/fdy/factory/templet/pages/ybindex.jsp');"><img src="images/yb.png"  alt="" /></a>
	                <div>样板管理</div>
	            </li>
	            <li>
	                <a onclick="open_new_tab('warehouse_list','大仓库管理','pages/service/fdy/factory/templet/pages/dhcindex.jsp');"><img src="images/store.png"  alt="" /></a>
	                <div>大仓库管理</div>
	            </li>
        	</ul>
    </div>
    <div class="designate-icon-in">
			<h4>业务管理</h4>
	        <ul>
	            <li>
	                <a onclick="open_new_tab('busi_list','客户管理','pages/service/fdy/business/customer/pages/customerList.jsp');"><img src="images/kh.png"  alt="" /></a>
	                <div>客户管理</div>
	            </li>
	            <li>
	                <a onclick="open_new_tab('contract_list','合同管理','pages/service/fdy/factory/contract/pages/contractList.jsp');"><img src="images/yewu.png"  alt="" /></a>
	                <div>合同管理</div>
	            </li>
	        </ul>
    </div>
    <div class="designate-icon-in">
			<h4>采购管理</h4>
	        <ul>
	            <li>
	                <a onclick="open_new_tab('factory_list','工厂管理','pages/service/fdy/purchase/factory/pages/factoryList.jsp');"><img src="images/gc.png"  alt="" /></a>
	                <div>工厂管理</div>
	            </li>
	            <li>
	                <a onclick="open_new_tab('order_list','订单管理','pages/service/fdy/purchase/order/pages/orderList.jsp');"><img src="images/order.png"  alt="" /></a>
	                <div>订单管理</div>
	            </li>
	        </ul>
      </div>
      <div class="designate-icon-in">
			<h4>财务管理</h4>
	        <ul>
	            <li>
	                <a href="#"><img src="images/caiwu.png"  alt="" /></a>
	                <div>财务管理</div>
	            </li>
	            <li>
	                <a href="#"><img src="images/report.png"  alt="" /></a>
	                <div>报表管理</div>
	            </li>
	        </ul>
      </div>
    </div>
</body>
</html>
