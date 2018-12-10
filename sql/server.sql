CREATE DATABASE IF NOT EXISTS restaurant DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

USE restaurant;

-- 创建连锁集团实体表
CREATE TABLE IF NOT EXISTS shop_company(
  id int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
	code VARCHAR(32) NOT NULL UNIQUE COMMENT '编号',
	pwd VARCHAR(32) NOT NULL COMMENT '密码',
	name VARCHAR(32) NOT NULL COMMENT '名称',
	reg_time DATETIME NOT NULL COMMENT '注册时间',
	reg_tel INT UNSIGNED NOT NULL COMMENT '注册手机号',

	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='集团表';

-- 创建店铺实体表
CREATE TABLE IF NOT EXISTS restaurant(
	id int NOT NULL AUTO_INCREMENT COMMENT '自增主键',
	uuid VARCHAR(32) NOT NULL,
	code VARCHAR(32) NOT NULL UNIQUE COMMENT '编号',
	pwd VARCHAR(32) NOT NULL COMMENT '密码',
	name VARCHAR(32) NOT NULL COMMENT '名称',
	reg_time DATETIME NOT NULL COMMENT '注册时间',
	reg_tel INT UNSIGNED NOT NULL COMMENT '注册手机号',
	company_uuid VARCHAR(32) DEFAULT NULL COMMENT '集团uuid',

	PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺表';

-- 创建店铺员工表
CREATE TABLE IF NOT EXISTS shop_staff(
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `account` varchar(45) DEFAULT NULL COMMENT '账号',
  `password` varchar(45) DEFAULT NULL COMMENT '密码',
  `salt` varchar(45) DEFAULT NULL COMMENT 'md5密码盐',
  `name` varchar(45) DEFAULT NULL COMMENT '名字',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `sex` int(11) DEFAULT NULL COMMENT '性别（1：男 2：女）',
  `email` varchar(45) DEFAULT NULL COMMENT '电子邮件',
  `phone` varchar(45) DEFAULT NULL COMMENT '电话',
  `roleid` varchar(255) DEFAULT NULL COMMENT '角色id',
  `deptid` int(11) DEFAULT NULL COMMENT '部门id',
  `status` int(11) DEFAULT NULL COMMENT '状态(1：启用  2：冻结  3：删除）',
  `createtime` datetime DEFAULT NULL COMMENT '创建时间',
  `version` int(11) DEFAULT NULL COMMENT '保留字段',

	shop_uuid VARCHAR(32) NOT NULL COMMENT '店铺uuid',
  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='员工表';


-- 创建店铺员工角色表
CREATE TABLE IF NOT EXISTS shop_staff_role(
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '序号',
  `pid` int(11) DEFAULT NULL COMMENT '父角色id',
  `name` varchar(255) DEFAULT NULL COMMENT '角色名称',
  `deptid` int(11) DEFAULT NULL COMMENT '部门名称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  `version` int(11) DEFAULT NULL COMMENT '保留字段(暂时没用）',

	shop_uuid VARCHAR(32) NOT NULL COMMENT '店铺uuid',

  PRIMARY KEY (`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- 创建店铺部门表
CREATE TABLE IF NOT EXISTS `shop_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `num` int(11) DEFAULT NULL COMMENT '排序',
  `pid` int(11) DEFAULT NULL COMMENT '父部门id',
  `pids` varchar(255) DEFAULT NULL COMMENT '父级ids',
  `simplename` varchar(45) DEFAULT NULL COMMENT '简称',
  `fullname` varchar(255) DEFAULT NULL COMMENT '全称',
  `tips` varchar(255) DEFAULT NULL COMMENT '提示',
  `version` int(11) DEFAULT NULL COMMENT '版本（乐观锁保留字段）',

	shop_uuid VARCHAR(32) NOT NULL COMMENT '店铺uuid',

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

-- 桌台类型
CREATE TABLE IF NOT EXISTS dinning_table_type (
  id int AUTO_INCREMENT PRIMARY KEY,
  shop_id int COMMENT '店铺外键',
  code int COMMENT '编号',
  name int COMMENT '名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8


-- 桌台区域
CREATE TABLE IF NOT EXISTS dinning_table_area (
  id int AUTO_INCREMENT PRIMARY KEY,
  shop_id int COMMENT '店铺外键',
  code int COMMENT '编号',
  name int COMMENT '名称'
) ENGINE=InnoDB DEFAULT CHARSET=utf8

-- 桌台
CREATE TABLE IF NOT EXISTS dinning_table (
  id int AUTO_INCREMENT PRIMARY KEY COMMENT '自增主键',
  shop_id int COMMENT '店铺外键',
  code int COMMENT '编号',
  name int COMMENT '名称',
  bookable TINYINT COMMENT '可预订'
) ENGINE=InnoDB DEFAULT CHARSET=utf8

CREATE TABLE IF NOT EXISTS bill (
  id int AUTO_INCREMENT PRIMARY KEY,
  shop_id int,
  billID VARCHAR(16) COMMENT '消费单号',
  cash int COMMENT '金额',
  crt_time datetime COMMENT '创建时间'

)


