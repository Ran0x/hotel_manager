/*
SQLyog Ultimate v8.32 
MySQL - 5.1.37-community : Database - erpcloud
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`erpcloud` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `erpcloud`;

/*Table structure for table `core_p_upload_file` */

DROP TABLE IF EXISTS `core_p_upload_file`;

CREATE TABLE `core_p_upload_file` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `file_name` varchar(100) DEFAULT NULL COMMENT '文件名称',
  `file_path` varchar(150) DEFAULT NULL COMMENT '文件路径',
  `upload_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传文件时间',
  `upload_user_id` int(8) DEFAULT NULL COMMENT '操作人',
  `file_size` int(6) DEFAULT NULL COMMENT '文件大小',
  `file_type` varchar(50) DEFAULT NULL COMMENT '文件类型',
  `upload_type` varchar(50) DEFAULT NULL COMMENT '上传类型',
  `file_note` varchar(50) DEFAULT NULL COMMENT '文件备注',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传表';

/*Table structure for table `core_p_upload_file_log` */

DROP TABLE IF EXISTS `core_p_upload_file_log`;

CREATE TABLE `core_p_upload_file_log` (
  `file_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `upload_file_id` int(8) DEFAULT NULL COMMENT '上传文件id',
  `log_type_id` int(1) DEFAULT NULL COMMENT '日志类型',
  `log_user_id` int(8) DEFAULT NULL COMMENT '操作人',
  `log_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作日期',
  `log_note` varchar(100) DEFAULT NULL COMMENT '操作备注',
  PRIMARY KEY (`file_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件上传日志表';

/*Table structure for table `sys_p_dept` */

DROP TABLE IF EXISTS `sys_p_dept`;

CREATE TABLE `sys_p_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `dept_name` varchar(30) NOT NULL COMMENT '部门名称',
  `dept_code` varchar(30) NOT NULL COMMENT '部门编号',
  `parent_id` int(8) DEFAULT NULL COMMENT '上级id',
  `level_id` int(1) NOT NULL COMMENT '树级别：1-一级 2-二级 3-三级',
  `is_open` int(1) NOT NULL DEFAULT '2' COMMENT '树是否展开：0-不展开 1-展开 2-不配置（注意：只有有下级菜单时才可以配置）',
  `icon_cls` varchar(100) DEFAULT NULL COMMENT '配置树图标',
  `master_id` int(8) DEFAULT NULL COMMENT '部门负责人id',
  `dept_note` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='部门表';

/*Table structure for table `sys_p_function` */

DROP TABLE IF EXISTS `sys_p_function`;

CREATE TABLE `sys_p_function` (
  `function_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `function_name` varchar(30) DEFAULT NULL COMMENT '功能名称',
  `function_code` varchar(200) DEFAULT NULL COMMENT '菜单链接路径',
  `operate_code` varchar(200) DEFAULT NULL COMMENT '请求接口路径',
  `type_id` int(1) DEFAULT NULL COMMENT '类型：0-按钮、1-菜单',
  `access_rule` int(1) DEFAULT NULL COMMENT '是否授权：1-需要授权 0-不需要授权',
  `module_id` int(8) DEFAULT NULL COMMENT '模块id',
  PRIMARY KEY (`function_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能表';

/*Table structure for table `sys_p_menu` */

DROP TABLE IF EXISTS `sys_p_menu`;

CREATE TABLE `sys_p_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `menu_name` varchar(30) DEFAULT NULL COMMENT '菜单名称',
  `parent_id` int(8) DEFAULT NULL COMMENT '上级',
  `level_id` int(1) DEFAULT NULL COMMENT '级别',
  `order_id` int(1) DEFAULT NULL COMMENT '排序',
  `menu_note` varchar(30) DEFAULT NULL COMMENT '菜单备注',
  `function_id` int(8) DEFAULT NULL COMMENT '功能id',
  `status_id` int(1) DEFAULT '1' COMMENT '状态：0-注销 1-有效',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

/*Table structure for table `sys_p_module` */

DROP TABLE IF EXISTS `sys_p_module`;

CREATE TABLE `sys_p_module` (
  `module_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `module_name` varchar(30) DEFAULT NULL COMMENT '模块名称',
  `parent_id` int(1) DEFAULT NULL COMMENT '上级id',
  `status_id` int(1) DEFAULT NULL COMMENT '状态：0-注销 1-有效',
  `level_id` int(1) DEFAULT NULL COMMENT '级别',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='模块表';

/*Table structure for table `sys_p_role` */

DROP TABLE IF EXISTS `sys_p_role`;

CREATE TABLE `sys_p_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `role_name` varchar(30) DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(30) DEFAULT NULL COMMENT '角色编码',
  `role_type` int(1) DEFAULT NULL COMMENT '角色类型：1-超级管理员 2-',
  `super_admin` int(1) DEFAULT '0' COMMENT '是否超级管理员：1-是 0-不是',
  `role_note` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='角色表';

/*Table structure for table `sys_p_user` */

DROP TABLE IF EXISTS `sys_p_user`;

CREATE TABLE `sys_p_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `user_account` varchar(30) NOT NULL COMMENT '用户账号',
  `user_name` varchar(30) DEFAULT NULL COMMENT '用户名称',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_sex` int(1) DEFAULT NULL COMMENT '用户性别：0-女 1-男',
  `user_phone` varchar(11) NOT NULL COMMENT '用户手机号',
  `user_type` int(1) NOT NULL DEFAULT '1' COMMENT '用户类型：0-超级管理员 1-普通用户',
  `user_pwd` varchar(32) NOT NULL COMMENT '用户密码',
  `user_email` varchar(30) NOT NULL COMMENT '用户邮箱',
  `head_photo` varchar(100) DEFAULT NULL COMMENT '用户头像',
  `dept_id` int(8) DEFAULT NULL COMMENT '所属部门',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status_id` int(1) NOT NULL DEFAULT '1' COMMENT '状态：0-注销 1-有效',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_account` (`user_account`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Table structure for table `sys_p_user_f` */

DROP TABLE IF EXISTS `sys_p_user_f`;

CREATE TABLE `sys_p_user_f` (
  `user_id` int(8) DEFAULT NULL COMMENT '用户id',
  `function_id` int(8) DEFAULT NULL COMMENT '功能id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户授权表';

/*Table structure for table `sys_p_user_role_f` */

DROP TABLE IF EXISTS `sys_p_user_role_f`;

CREATE TABLE `sys_p_user_role_f` (
  `function_id` int(8) DEFAULT NULL COMMENT '功能id',
  `user_group_code` varchar(30) DEFAULT NULL COMMENT '用户角色编码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色授权表';

/*Table structure for table `sys_p_user_ur` */

DROP TABLE IF EXISTS `sys_p_user_ur`;

CREATE TABLE `sys_p_user_ur` (
  `user_id` int(8) DEFAULT NULL COMMENT '用户id',
  `user_role_code` varchar(30) DEFAULT NULL COMMENT '用户角色编码'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户所属角色表';

/*Table structure for table `sys_test` */

DROP TABLE IF EXISTS `sys_test`;

CREATE TABLE `sys_test` (
  `test_id` int(8) DEFAULT NULL,
  `test_name` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `zx_contract_info` */

DROP TABLE IF EXISTS `zx_contract_info`;

CREATE TABLE `zx_contract_info` (
  `contract_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `contract_code` varchar(30) NOT NULL COMMENT '合同编号：唯一',
  `customer_code` varchar(30) NOT NULL COMMENT '客户编号',
  `customer_name` varchar(30) NOT NULL COMMENT '客户名称',
  `contract_total_amount` double(10,2) NOT NULL COMMENT '合同总金额',
  `contract_start_time` datetime DEFAULT NULL COMMENT '合同开始时间',
  `contract_end_time` datetime DEFAULT NULL COMMENT '合同结束时间',
  `contract_schedule` int(1) NOT NULL DEFAULT '1' COMMENT '合同进度：1-生成合同 2-签署合同 3-已下订单 4-未收货 5-收货完成',
  `contract_note` varchar(200) DEFAULT NULL COMMENT '合同备注',
  `user_id` int(8) NOT NULL COMMENT '创建人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status_id` int(1) NOT NULL DEFAULT '1' COMMENT '状态：0-注销 1-有效',
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合同信息表';

/*Table structure for table `zx_contract_relation` */

DROP TABLE IF EXISTS `zx_contract_relation`;

CREATE TABLE `zx_contract_relation` (
  `contract_relation_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增',
  `contract_code` int(8) DEFAULT NULL COMMENT '合同编号',
  `product_id` int(8) DEFAULT NULL COMMENT '产品id',
  `product_name` varchar(30) DEFAULT NULL COMMENT '产品名称',
  `contract_amount` int(6) DEFAULT NULL COMMENT '合同数量',
  `contract_price` double(8,2) DEFAULT NULL COMMENT '产品合同单价',
  PRIMARY KEY (`contract_relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合同关系表';

/*Table structure for table `zx_customer_info` */

DROP TABLE IF EXISTS `zx_customer_info`;

CREATE TABLE `zx_customer_info` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `customer_name` varchar(30) NOT NULL COMMENT '客户名称',
  `customer_code` varchar(30) NOT NULL COMMENT '客户编号：必须唯一',
  `customer_area` varchar(30) NOT NULL COMMENT '客户所属区域',
  `customer_company` varchar(30) NOT NULL COMMENT '客户公司名称',
  `customer_phone` varchar(11) NOT NULL COMMENT '客户联系电话',
  `customer_tel` varchar(20) DEFAULT NULL COMMENT '客户固话',
  `customer_email` varchar(30) DEFAULT NULL COMMENT '客户邮箱',
  `customer_note` varchar(100) DEFAULT NULL COMMENT '客户备注',
  `user_id` int(8) NOT NULL COMMENT '创建人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status_id` int(1) NOT NULL DEFAULT '1' COMMENT '状态：0-注销 1-有效',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户信息表';

/*Table structure for table `zx_factory_info` */

DROP TABLE IF EXISTS `zx_factory_info`;

CREATE TABLE `zx_factory_info` (
  `factory_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `factory_name` varchar(30) NOT NULL COMMENT '工厂名称',
  `factory_code` varchar(30) NOT NULL COMMENT '工厂编号',
  `factory_address` varchar(60) DEFAULT NULL COMMENT '工厂地址',
  `factory_contact` varchar(30) NOT NULL COMMENT '工厂联系人',
  `contact_phone` varchar(11) NOT NULL COMMENT '联系人电话',
  `factory_note` varchar(100) DEFAULT NULL COMMENT '工厂备注',
  `user_id` int(8) NOT NULL COMMENT '创建人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `status_id` int(1) NOT NULL DEFAULT '1' COMMENT '状态：0-注销 1-有效',
  PRIMARY KEY (`factory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工厂信息表';

/*Table structure for table `zx_order_info` */

DROP TABLE IF EXISTS `zx_order_info`;

CREATE TABLE `zx_order_info` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `order_code` varchar(30) DEFAULT NULL COMMENT '订单编号',
  `contract_code` varchar(30) DEFAULT NULL COMMENT '合同编号',
  `order_total_amount` double(8,2) DEFAULT NULL COMMENT '订单总金额',
  `user_id` int(8) DEFAULT NULL COMMENT '创建人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status_id` int(1) DEFAULT '1' COMMENT '状态：0-注销 1-有效',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单管理表';

/*Table structure for table `zx_order_relation` */

DROP TABLE IF EXISTS `zx_order_relation`;

CREATE TABLE `zx_order_relation` (
  `order_relation_id` int(11) NOT NULL AUTO_INCREMENT,
  `contract_relation_id` int(8) DEFAULT NULL COMMENT '合同关系表id',
  `order_code` varchar(30) DEFAULT NULL COMMENT '订单编号',
  `order_start_time` datetime DEFAULT NULL COMMENT '订单开始时间',
  `order_end_time` datetime DEFAULT NULL COMMENT '订单结束时间',
  `order_amount` int(6) DEFAULT NULL COMMENT '订单数量',
  `order_price` double(8,2) DEFAULT NULL COMMENT '订单单价',
  `order_status` int(1) DEFAULT NULL COMMENT '订单状态：1-订单生成 2-已下订单 3-签收订单 4-订单回退',
  `order_note` varchar(200) DEFAULT NULL COMMENT '订单备注',
  PRIMARY KEY (`order_relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单关系表';

/*Table structure for table `zx_product_info` */

DROP TABLE IF EXISTS `zx_product_info`;

CREATE TABLE `zx_product_info` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `product_name` varchar(100) DEFAULT NULL COMMENT '产品名称',
  `product_code` varchar(30) DEFAULT NULL COMMENT '产品编码：（编码必须唯一）',
  `product_source` varchar(30) DEFAULT NULL COMMENT '产品生产源地',
  `product_life` int(3) DEFAULT NULL COMMENT '产品寿命',
  `product_image_id` int(8) DEFAULT NULL COMMENT '产品图片id',
  `product_image_url` varchar(100) DEFAULT NULL COMMENT '产品图片路径',
  `product_note` varchar(100) DEFAULT NULL COMMENT '产品备注',
  `user_id` int(8) DEFAULT NULL COMMENT '操作人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status_id` int(1) DEFAULT '1' COMMENT '状态：0-注销 1-有效',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品信息表';

/*Table structure for table `zx_warehouse_back` */

DROP TABLE IF EXISTS `zx_warehouse_back`;

CREATE TABLE `zx_warehouse_back` (
  `back_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_code` varchar(30) DEFAULT NULL COMMENT '订单编号',
  `back_time` datetime DEFAULT NULL COMMENT '退货日期',
  `back_note` varchar(100) DEFAULT NULL COMMENT '退货备注',
  `back_status` int(1) DEFAULT '1' COMMENT '退货状态：1-审批中 2-审批通过 3-审批不通过',
  `user_id` int(8) DEFAULT NULL COMMENT '操作人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status_id` int(1) DEFAULT '1' COMMENT '状态：0-注销 1-有效',
  `back_approval` varchar(100) DEFAULT NULL COMMENT '退货审批结果',
  PRIMARY KEY (`back_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品退货';

/*Table structure for table `zx_warehouse_join` */

DROP TABLE IF EXISTS `zx_warehouse_join`;

CREATE TABLE `zx_warehouse_join` (
  `join_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `order_code` varchar(30) DEFAULT NULL COMMENT '订单编号',
  `join_time` datetime DEFAULT NULL COMMENT '到货日期',
  `join_note` varchar(100) DEFAULT NULL COMMENT '入库备注',
  `user_id` int(8) DEFAULT NULL COMMENT '操作人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status_id` int(1) DEFAULT '1' COMMENT '状态：0-注销 1-有效',
  PRIMARY KEY (`join_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品入库';

/*Table structure for table `zx_warehouse_out` */

DROP TABLE IF EXISTS `zx_warehouse_out`;

CREATE TABLE `zx_warehouse_out` (
  `out_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id自增',
  `contract_code` varchar(30) DEFAULT NULL COMMENT '合同编号',
  `out_time` datetime DEFAULT NULL COMMENT '出货日期',
  `out_note` varchar(100) DEFAULT NULL COMMENT '出库备注',
  `user_id` int(8) DEFAULT NULL COMMENT '操作人id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `status_id` int(1) DEFAULT '1' COMMENT '状态：0-注销 1-有效',
  PRIMARY KEY (`out_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品出库';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
