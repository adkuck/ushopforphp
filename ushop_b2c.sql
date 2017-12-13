# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.5-10.2.9-MariaDB)
# Database: niushop_b2c
# Generation Time: 2017-12-13 10:08:41 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table nc_cms_article
# ------------------------------------------------------------

DROP TABLE IF EXISTS `nc_cms_article`;

CREATE TABLE `nc_cms_article` (
  `article_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章编号',
  `title` varchar(50) NOT NULL COMMENT '文章标题',
  `class_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '文章分类编号',
  `short_title` varchar(50) NOT NULL DEFAULT '' COMMENT '文章短标题',
  `source` varchar(50) NOT NULL DEFAULT '' COMMENT '文章来源',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '文章来源链接',
  `author` varchar(50) NOT NULL COMMENT '文章作者',
  `summary` varchar(140) NOT NULL DEFAULT '' COMMENT '文章摘要',
  `content` text NOT NULL COMMENT '文章正文',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '文章标题图片',
  `keyword` varchar(255) NOT NULL DEFAULT '' COMMENT '文章关键字',
  `article_id_array` varchar(255) NOT NULL DEFAULT '' COMMENT '相关文章',
  `click` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '文章点击量',
  `sort` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '文章排序0-255',
  `commend_flag` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '文章推荐标志0-未推荐，1-已推荐',
  `comment_flag` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '文章是否允许评论1-允许，0-不允许',
  `status` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '0-草稿、1-待审核、2-已发布、-1-回收站',
  `attachment_path` text NOT NULL COMMENT '文章附件路径',
  `tag` varchar(255) NOT NULL DEFAULT '' COMMENT '文章标签',
  `comment_count` int(10) unsigned NOT NULL COMMENT '文章评论数',
  `share_count` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '文章分享数',
  `publisher_name` varchar(50) NOT NULL COMMENT '发布者用户名 ',
  `uid` int(10) unsigned NOT NULL COMMENT '发布者编号',
  `last_comment_time` int(11) DEFAULT 0 COMMENT '最新评论时间',
  `public_time` int(11) DEFAULT 0 COMMENT '发布时间',
  `create_time` int(11) DEFAULT 0 COMMENT '文章发布时间',
  `modify_time` int(11) DEFAULT 0 COMMENT '文章修改时间',
  PRIMARY KEY (`article_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=6553 COMMENT='CMS文章表';



# Dump of table nc_cms_article_class
# ------------------------------------------------------------

DROP TABLE IF EXISTS `nc_cms_article_class`;

CREATE TABLE `nc_cms_article_class` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类编号 ',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '上级分类',
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170 COMMENT='cms文章分类表';



# Dump of table nc_cms_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `nc_cms_comment`;

CREATE TABLE `nc_cms_comment` (
  `comment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论编号',
  `text` varchar(2000) NOT NULL COMMENT '评论内容',
  `uid` int(10) unsigned NOT NULL COMMENT '评论人编号',
  `quote_comment_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '评论引用',
  `up` int(10) unsigned NOT NULL COMMENT '点赞数量',
  `comment_time` int(10) unsigned NOT NULL COMMENT '评论时间',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='CMS评论表';



# Dump of table nc_cms_topic
# ------------------------------------------------------------

DROP TABLE IF EXISTS `nc_cms_topic`;

CREATE TABLE `nc_cms_topic` (
  `topic_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '专题编号',
  `instance_id` int(10) NOT NULL DEFAULT 0 COMMENT '店铺ID',
  `title` varchar(255) NOT NULL COMMENT '专题标题',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '专题封面',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '专题状态  0草稿  1发布',
  `content` text NOT NULL COMMENT '专题内容',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  `modify_time` int(11) DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专题';



# Dump of table ns_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_account`;

CREATE TABLE `ns_account` (
  `account_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '账户ID',
  `account_profit` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '平台的总营业额',
  `account_money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '平台资金总余额',
  `account_return` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '平台利润总额',
  `account_deposit` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '保证金总额',
  `account_order` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '商城订单总额',
  `account_withdraw` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '商城提现总额',
  `account_shop` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '店铺总余额',
  `account_shop_withdraw` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '店铺总提现',
  PRIMARY KEY (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='商城资金统计';



# Dump of table ns_account_assistant_records
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_account_assistant_records`;

CREATE TABLE `ns_account_assistant_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '对应金额',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `type_alis_id` int(11) NOT NULL COMMENT '关联ID',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='招商员支付记录';



# Dump of table ns_account_order_records
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_account_order_records`;

CREATE TABLE `ns_account_order_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '对应金额',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `type_alis_id` int(11) NOT NULL COMMENT '关联ID',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='金额账户记录';



# Dump of table ns_account_period
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_account_period`;

CREATE TABLE `ns_account_period` (
  `period_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '账户ID',
  `period_year` int(10) NOT NULL COMMENT '账期年份',
  `period_month` int(10) NOT NULL COMMENT '账期月份',
  `account_profit` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '账期总营业额',
  `account_money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '账期总发生余额',
  `account_return` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '账期利润总额',
  `account_deposit` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '账期保证金总额',
  `account_order` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '账期订单总额',
  `account_withdraw` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '账期店铺提现总额',
  `account_shop` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '账期店铺总发生额',
  `account_shop_withdraw` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '账期店铺总提现额',
  `start_time` int(11) DEFAULT 0 COMMENT '开始时间',
  `end_time` int(11) DEFAULT 0 COMMENT '结束时间',
  PRIMARY KEY (`period_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='商城账期结算表';



# Dump of table ns_account_records
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_account_records`;

CREATE TABLE `ns_account_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '对应金额',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `type_alis_id` int(11) NOT NULL COMMENT '关联ID',
  `is_display` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否显示',
  `is_calculate` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否参与计算',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1092 COMMENT='金额账户记录';



# Dump of table ns_account_return_records
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_account_return_records`;

CREATE TABLE `ns_account_return_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '金额',
  `return_type` int(11) NOT NULL DEFAULT 0 COMMENT '提成类型',
  `type_alis_id` int(11) NOT NULL DEFAULT 0 COMMENT '关联id',
  `is_display` int(11) NOT NULL DEFAULT 0 COMMENT '是否显示',
  `is_calculate` int(11) NOT NULL DEFAULT 0 COMMENT '是否计算',
  `remark` varchar(255) NOT NULL DEFAULT '0' COMMENT '备注',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=910 COMMENT='平台的利润的记录';



# Dump of table ns_account_withdraw_records
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_account_withdraw_records`;

CREATE TABLE `ns_account_withdraw_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '对应金额',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `type_alis_id` int(11) NOT NULL COMMENT '关联ID',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='金额账户记录';



# Dump of table ns_account_withdraw_user_records
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_account_withdraw_user_records`;

CREATE TABLE `ns_account_withdraw_user_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `serial_no` varchar(50) NOT NULL DEFAULT '' COMMENT '流水号',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '对应金额',
  `account_type` tinyint(1) NOT NULL COMMENT '账户类型',
  `type_alis_id` int(11) NOT NULL COMMENT '关联ID',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员提现记录表';



# Dump of table ns_attribute
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_attribute`;

CREATE TABLE `ns_attribute` (
  `attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品属性ID',
  `attr_name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性名称',
  `is_use` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否使用',
  `spec_id_array` varchar(255) NOT NULL DEFAULT '' COMMENT '关联规格',
  `sort` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  `modify_time` int(11) DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`attr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='商品相关属性';

LOCK TABLES `ns_attribute` WRITE;
/*!40000 ALTER TABLE `ns_attribute` DISABLE KEYS */;

INSERT INTO `ns_attribute` (`attr_id`, `attr_name`, `is_use`, `spec_id_array`, `sort`, `create_time`, `modify_time`)
VALUES
	(1,'女装',1,'10,11',1,1499333512,1499334572),
	(2,'男装',1,'',2,1499335282,0),
	(3,'箱包',1,'',3,1499336369,0),
	(4,'电视',1,'',4,1499339950,0),
	(5,'手机',1,'7',5,1499340904,0),
	(6,'笔记本',1,'9',6,1499341901,0),
	(7,'手机配件',1,'5,8',7,1499342567,0);

/*!40000 ALTER TABLE `ns_attribute` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_attribute_value
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_attribute_value`;

CREATE TABLE `ns_attribute_value` (
  `attr_value_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '属性值ID',
  `attr_value_name` varchar(50) NOT NULL DEFAULT '' COMMENT '属性值名称',
  `attr_id` int(11) NOT NULL COMMENT '属性ID',
  `value` varchar(1000) NOT NULL DEFAULT '' COMMENT '属性对应相关数据',
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '属性对应输入类型1.直接2.单选3.多选',
  `sort` int(11) NOT NULL DEFAULT 1999 COMMENT '排序号',
  `is_search` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否使用',
  PRIMARY KEY (`attr_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='商品属性值';

LOCK TABLES `ns_attribute_value` WRITE;
/*!40000 ALTER TABLE `ns_attribute_value` DISABLE KEYS */;

INSERT INTO `ns_attribute_value` (`attr_value_id`, `attr_value_name`, `attr_id`, `value`, `type`, `sort`, `is_search`)
VALUES
	(1,'尺码',1,'l,s,m,均码',3,1,1),
	(2,'颜色',1,'蓝色,粉色,红色,浅灰,黑色',3,2,1),
	(3,'尺码',2,'s,m,l,xl,2xl',3,1,1),
	(4,'颜色',2,'白色,花色',3,2,1),
	(5,'颜色',3,'白色,黑色,粉色',3,1,1),
	(6,'尺寸',4,'32寸,47寸',3,1,1),
	(7,'颜色',4,'黑色,白色',3,2,1),
	(8,'颜色',5,'玫瑰金,黑色,土豪金',3,1,1),
	(9,'尺寸',5,'4.7寸,5.0寸,5.5寸',3,2,1),
	(10,'颜色',6,'白色,灰色',3,1,1),
	(11,'颜色',7,'白色,粉色,金黄色',3,1,1);

/*!40000 ALTER TABLE `ns_attribute_value` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_cart
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_cart`;

CREATE TABLE `ns_cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车id',
  `buyer_id` int(11) NOT NULL DEFAULT 0 COMMENT '买家id',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `shop_name` varchar(100) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品id',
  `goods_name` varchar(200) NOT NULL COMMENT '商品名称',
  `sku_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品的skuid',
  `sku_name` varchar(200) NOT NULL DEFAULT '' COMMENT '商品的sku名称',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '商品价格',
  `num` smallint(5) NOT NULL DEFAULT 1 COMMENT '购买商品数量',
  `goods_picture` int(11) NOT NULL DEFAULT 0 COMMENT '商品图片',
  `bl_id` mediumint(8) NOT NULL DEFAULT 0 COMMENT '组合套装ID',
  PRIMARY KEY (`cart_id`),
  KEY `member_id` (`buyer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170 COMMENT='购物车表';

LOCK TABLES `ns_cart` WRITE;
/*!40000 ALTER TABLE `ns_cart` DISABLE KEYS */;

INSERT INTO `ns_cart` (`cart_id`, `buyer_id`, `shop_id`, `shop_name`, `goods_id`, `goods_name`, `sku_id`, `sku_name`, `price`, `num`, `goods_picture`, `bl_id`)
VALUES
	(5,5,0,'',5,'定制韩版宽松蝙蝠袖中长款套头卫衣胸前系带连衣裙',91,'xl 粉色 ',500.00,1,17,0);

/*!40000 ALTER TABLE `ns_cart` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_click_fabulous
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_click_fabulous`;

CREATE TABLE `ns_click_fabulous` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  `create_time` int(11) DEFAULT 0 COMMENT '点赞时间',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '点赞状态 0 未点赞 1 点赞',
  `number` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='商品点赞记录表';

LOCK TABLES `ns_click_fabulous` WRITE;
/*!40000 ALTER TABLE `ns_click_fabulous` DISABLE KEYS */;

INSERT INTO `ns_click_fabulous` (`id`, `uid`, `shop_id`, `goods_id`, `create_time`, `status`, `number`)
VALUES
	(1,5,0,5,1513011826,1,0.00);

/*!40000 ALTER TABLE `ns_click_fabulous` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_consult
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_consult`;

CREATE TABLE `ns_consult` (
  `consult_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '咨询编号',
  `goods_id` int(11) unsigned DEFAULT 0 COMMENT '商品编号',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '咨询发布者会员编号(0：游客)',
  `member_name` varchar(100) NOT NULL DEFAULT '' COMMENT '会员名称',
  `shop_id` int(11) unsigned NOT NULL DEFAULT 0 COMMENT '店铺编号',
  `shop_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `ct_id` int(10) unsigned NOT NULL COMMENT '咨询类型',
  `consult_content` varchar(255) NOT NULL DEFAULT '' COMMENT '咨询内容',
  `consult_reply` varchar(255) NOT NULL DEFAULT '' COMMENT '咨询回复内容',
  `isanonymous` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0表示不匿名 1表示匿名',
  `consult_addtime` int(11) DEFAULT 0 COMMENT '咨询发布时间',
  `consult_reply_time` int(11) DEFAULT 0 COMMENT '咨询回复时间',
  PRIMARY KEY (`consult_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638 COMMENT='咨询类型表';



# Dump of table ns_consult_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_consult_type`;

CREATE TABLE `ns_consult_type` (
  `ct_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '咨询类型id',
  `ct_name` varchar(50) NOT NULL DEFAULT '' COMMENT '咨询类型名称',
  `ct_introduce` text NOT NULL COMMENT '咨询类型详细介绍',
  `ct_sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`ct_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='咨询类型表';



# Dump of table ns_coupon
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_coupon`;

CREATE TABLE `ns_coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券id',
  `coupon_type_id` int(11) NOT NULL COMMENT '优惠券类型id',
  `shop_id` int(11) NOT NULL COMMENT '店铺Id',
  `coupon_code` varchar(255) NOT NULL DEFAULT '' COMMENT '优惠券编码',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '领用人',
  `use_order_id` int(11) NOT NULL DEFAULT 0 COMMENT '优惠券使用订单id',
  `create_order_id` int(11) NOT NULL DEFAULT 0 COMMENT '创建订单id(优惠券只有是完成订单发放的优惠券时才有值)',
  `money` decimal(10,2) NOT NULL COMMENT '面额',
  `state` tinyint(4) NOT NULL DEFAULT 0 COMMENT '优惠券状态 0未领用 1已领用（未使用） 2已使用 3已过期',
  `get_type` int(11) NOT NULL DEFAULT 0 COMMENT '获取方式1订单2.首页领取',
  `fetch_time` int(11) DEFAULT 0 COMMENT '领取时间',
  `use_time` int(11) DEFAULT 0 COMMENT '使用时间',
  `start_time` int(11) DEFAULT 0 COMMENT '有效期开始时间',
  `end_time` int(11) DEFAULT 0 COMMENT '有效期结束时间',
  PRIMARY KEY (`coupon_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=148 COMMENT='优惠券表';



# Dump of table ns_coupon_goods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_coupon_goods`;

CREATE TABLE `ns_coupon_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_type_id` int(11) NOT NULL COMMENT '优惠券类型id',
  `goods_id` int(11) NOT NULL COMMENT '商品id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=606 COMMENT='优惠券使用商品表';



# Dump of table ns_coupon_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_coupon_type`;

CREATE TABLE `ns_coupon_type` (
  `coupon_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券类型Id',
  `shop_id` int(11) NOT NULL DEFAULT 1 COMMENT '店铺ID',
  `coupon_name` varchar(50) NOT NULL DEFAULT '' COMMENT '优惠券名称',
  `money` decimal(10,2) NOT NULL COMMENT '发放面额',
  `count` int(11) NOT NULL COMMENT '发放数量',
  `max_fetch` int(11) NOT NULL DEFAULT 0 COMMENT '每人最大领取个数 0无限制',
  `at_least` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '满多少元使用 0代表无限制',
  `need_user_level` tinyint(4) NOT NULL DEFAULT 0 COMMENT '领取人会员等级',
  `range_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '使用范围0部分产品使用 1全场产品使用',
  `is_show` int(11) NOT NULL DEFAULT 0 COMMENT '是否允许首页显示0不显示1显示',
  `start_time` int(11) DEFAULT 0 COMMENT '有效日期开始时间',
  `end_time` int(11) DEFAULT 0 COMMENT '有效日期结束时间',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  `update_time` int(11) DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`coupon_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1365 COMMENT='优惠券类型表';



# Dump of table ns_express_company
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_express_company`;

CREATE TABLE `ns_express_company` (
  `co_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表序号',
  `shop_id` int(11) NOT NULL COMMENT '商铺id',
  `company_name` varchar(50) NOT NULL DEFAULT '' COMMENT '物流公司名称',
  `express_no` varchar(20) NOT NULL DEFAULT '' COMMENT '物流编号',
  `is_enabled` int(11) NOT NULL DEFAULT 1 COMMENT '使用状态',
  `image` varchar(255) DEFAULT '' COMMENT '物流公司模版图片',
  `phone` varchar(50) NOT NULL DEFAULT '' COMMENT '联系电话',
  `orders` int(11) DEFAULT NULL,
  `express_logo` varchar(255) DEFAULT '' COMMENT '公司logo',
  `is_default` int(11) NOT NULL DEFAULT 0 COMMENT '是否设置为默认 0未设置 1 默认',
  PRIMARY KEY (`co_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=420 COMMENT='物流公司';



# Dump of table ns_express_shipping
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_express_shipping`;

CREATE TABLE `ns_express_shipping` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT '运单模版id',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `template_name` varchar(255) NOT NULL DEFAULT '' COMMENT '模版名称',
  `co_id` int(11) NOT NULL DEFAULT 0 COMMENT '物流公司 id',
  `size_type` smallint(6) NOT NULL DEFAULT 1 COMMENT '尺寸类型 1像素px  2毫米mm',
  `width` smallint(6) NOT NULL DEFAULT 0 COMMENT '宽度',
  `height` smallint(6) NOT NULL DEFAULT 0 COMMENT '长度',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '快递单图片',
  PRIMARY KEY (`sid`),
  KEY `IDX_express_shipping_co_id` (`co_id`),
  KEY `IDX_express_shipping_shopId` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='运单模板';



# Dump of table ns_express_shipping_items
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_express_shipping_items`;

CREATE TABLE `ns_express_shipping_items` (
  `sid` int(11) NOT NULL DEFAULT 0 COMMENT '运单模版id',
  `field_name` varchar(30) NOT NULL COMMENT '字段名称',
  `field_display_name` varchar(255) NOT NULL COMMENT '打印项名称',
  `is_print` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否打印',
  `x` int(11) NOT NULL DEFAULT 0 COMMENT 'x',
  `y` int(11) NOT NULL DEFAULT 0 COMMENT 'y',
  PRIMARY KEY (`sid`,`field_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=420 COMMENT='物流模板打印项';

LOCK TABLES `ns_express_shipping_items` WRITE;
/*!40000 ALTER TABLE `ns_express_shipping_items` DISABLE KEYS */;

INSERT INTO `ns_express_shipping_items` (`sid`, `field_name`, `field_display_name`, `is_print`, `x`, `y`)
VALUES
	(1,'A1','订单编号',1,10,11),
	(1,'A10','收件人邮编',1,10,86),
	(1,'A11','货到付款物流编号',1,10,286),
	(1,'A12','代收金额',1,10,186),
	(1,'A13','备注',1,10,311),
	(1,'A2','发件人公司',1,10,36),
	(1,'A3','发件人地址',1,10,136),
	(1,'A4','发件人姓名',1,10,111),
	(1,'A5','发件人电话',1,10,211),
	(1,'A6','发件人邮编',1,10,236),
	(1,'A7','收件人地址',1,10,261),
	(1,'A8','收件人姓名',1,10,61),
	(1,'A9','收件人电话',1,10,161);

/*!40000 ALTER TABLE `ns_express_shipping_items` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_express_shipping_items_library
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_express_shipping_items_library`;

CREATE TABLE `ns_express_shipping_items_library` (
  `Id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物流模版打印项库ID',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `field_name` varchar(50) NOT NULL COMMENT '字段名',
  `field_display_name` varchar(50) NOT NULL COMMENT '字段显示名',
  `is_enabled` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否启用',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1260 COMMENT='物流模版打印项库';

LOCK TABLES `ns_express_shipping_items_library` WRITE;
/*!40000 ALTER TABLE `ns_express_shipping_items_library` DISABLE KEYS */;

INSERT INTO `ns_express_shipping_items_library` (`Id`, `shop_id`, `field_name`, `field_display_name`, `is_enabled`)
VALUES
	(1,0,'A1','订单编号',b'1'),
	(2,0,'A2','发件人公司',b'1'),
	(3,0,'A8','收件人姓名',b'1'),
	(4,0,'A10','收件人邮编',b'1'),
	(5,0,'A4','发件人姓名',b'1'),
	(6,0,'A3','发件人地址',b'1'),
	(7,0,'A9','收件人电话',b'1'),
	(8,0,'A12','代收金额',b'1'),
	(9,0,'A5','发件人电话',b'1'),
	(10,0,'A6','发件人邮编',b'1'),
	(11,0,'A7','收件人地址',b'1'),
	(12,0,'A11','货到付款物流编号',b'1'),
	(13,0,'A13','备注',b'1');

/*!40000 ALTER TABLE `ns_express_shipping_items_library` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_gift_grant_records
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_gift_grant_records`;

CREATE TABLE `ns_gift_grant_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `gift_id` int(11) NOT NULL COMMENT '赠送活动ID',
  `goods_id` int(11) NOT NULL COMMENT '赠送商品ID',
  `goods_name` varchar(50) NOT NULL DEFAULT '' COMMENT '赠送商品名称',
  `goods_img` varchar(255) NOT NULL DEFAULT '' COMMENT '赠送商品图片',
  `num` int(11) NOT NULL DEFAULT 1 COMMENT '赠送数量',
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '发放方式',
  `type_id` int(11) NOT NULL DEFAULT 0 COMMENT '发放相关ID',
  `memo` text NOT NULL COMMENT '备注',
  `create_time` int(11) DEFAULT 0 COMMENT '赠送时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='赠品发放记录';



# Dump of table ns_goods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_goods`;

CREATE TABLE `ns_goods` (
  `goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '商品id(SKU)',
  `goods_name` varchar(100) NOT NULL DEFAULT '' COMMENT '商品名称',
  `shop_id` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '店铺id',
  `category_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '商品分类id',
  `category_id_1` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '一级分类id',
  `category_id_2` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '二级分类id',
  `category_id_3` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '三级分类id',
  `brand_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '品牌id',
  `group_id_array` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分类id 首尾用,隔开',
  `promotion_type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '促销类型 0无促销，1团购，2限时折扣',
  `promote_id` int(11) NOT NULL DEFAULT 0 COMMENT '促销活动ID',
  `goods_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '实物或虚拟商品标志 1实物商品 0 虚拟商品 2 F码商品',
  `market_price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '市场价',
  `price` decimal(19,2) NOT NULL DEFAULT 0.00 COMMENT '商品原价格',
  `promotion_price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '商品促销价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT 0.00 COMMENT '成本价',
  `point_exchange_type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '积分兑换类型 0 非积分兑换 1 只能积分兑换 ',
  `point_exchange` int(11) NOT NULL DEFAULT 0 COMMENT '积分兑换',
  `give_point` int(11) NOT NULL DEFAULT 0 COMMENT '购买商品赠送积分',
  `is_member_discount` int(1) NOT NULL DEFAULT 0 COMMENT '参与会员折扣',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '运费 0为免运费',
  `shipping_fee_id` int(11) NOT NULL DEFAULT 0 COMMENT '售卖区域id 物流模板id  ns_order_shipping_fee 表id',
  `stock` int(10) NOT NULL DEFAULT 0 COMMENT '商品库存',
  `max_buy` int(11) NOT NULL DEFAULT 0 COMMENT '限购 0 不限购',
  `clicks` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '商品点击数量',
  `min_stock_alarm` int(11) NOT NULL DEFAULT 0 COMMENT '库存预警值',
  `sales` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '销售数量',
  `collects` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '收藏数量',
  `star` tinyint(3) unsigned NOT NULL DEFAULT 5 COMMENT '好评星级',
  `evaluates` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '评价数',
  `shares` int(11) NOT NULL DEFAULT 0 COMMENT '分享数',
  `province_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '一级地区id',
  `city_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '二级地区id',
  `picture` int(11) NOT NULL DEFAULT 0 COMMENT '商品主图',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '商品关键词',
  `introduction` varchar(255) NOT NULL DEFAULT '' COMMENT '商品简介，促销语',
  `description` text NOT NULL COMMENT '商品详情',
  `QRcode` varchar(255) NOT NULL DEFAULT '' COMMENT '商品二维码',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '商家编号',
  `is_stock_visible` int(1) NOT NULL DEFAULT 0 COMMENT '页面不显示库存',
  `is_hot` int(1) NOT NULL DEFAULT 0 COMMENT '是否热销商品',
  `is_recommend` int(1) NOT NULL DEFAULT 0 COMMENT '是否推荐',
  `is_new` int(1) NOT NULL DEFAULT 0 COMMENT '是否新品',
  `is_pre_sale` int(11) DEFAULT 0,
  `is_bill` int(1) NOT NULL DEFAULT 0 COMMENT '是否开具增值税发票 1是，0否',
  `state` tinyint(3) NOT NULL DEFAULT 1 COMMENT '商品状态 0下架，1正常，10违规（禁售）',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `img_id_array` varchar(1000) DEFAULT NULL COMMENT '商品图片序列',
  `sku_img_array` varchar(1000) DEFAULT NULL COMMENT '商品sku应用图片列表  属性,属性值，图片ID',
  `match_point` float(10,2) DEFAULT NULL COMMENT '实物与描述相符（根据评价计算）',
  `match_ratio` float(10,2) DEFAULT NULL COMMENT '实物与描述相符（根据评价计算）百分比',
  `real_sales` int(10) NOT NULL DEFAULT 0 COMMENT '实际销量',
  `goods_attribute_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品类型',
  `goods_spec_format` text NOT NULL COMMENT '商品规格',
  `goods_weight` decimal(8,2) NOT NULL DEFAULT 0.00 COMMENT '商品重量',
  `goods_volume` decimal(8,2) NOT NULL DEFAULT 0.00 COMMENT '商品体积',
  `shipping_fee_type` int(11) NOT NULL DEFAULT 1 COMMENT '计价方式1.重量2.体积3.计件',
  `extend_category_id` varchar(255) DEFAULT NULL,
  `extend_category_id_1` varchar(255) DEFAULT NULL,
  `extend_category_id_2` varchar(255) DEFAULT NULL,
  `extend_category_id_3` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL DEFAULT 0 COMMENT '供货商id',
  `sale_date` int(11) DEFAULT 0 COMMENT '上下架时间',
  `create_time` int(11) DEFAULT 0 COMMENT '商品添加时间',
  `update_time` int(11) DEFAULT 0 COMMENT '商品编辑时间',
  `min_buy` int(11) NOT NULL DEFAULT 0 COMMENT '最少买几件',
  `virtual_goods_type_id` int(11) DEFAULT 0 COMMENT '虚拟商品类型id',
  `production_date` int(11) NOT NULL DEFAULT 0 COMMENT '生产日期',
  `shelf_life` varchar(50) NOT NULL DEFAULT '' COMMENT '保质期',
  PRIMARY KEY (`goods_id`),
  KEY `UK_ns_goods_brand_id` (`brand_id`),
  KEY `UK_ns_goods_category_id` (`category_id`),
  KEY `UK_ns_goods_category_id_1` (`category_id_1`),
  KEY `UK_ns_goods_category_id_2` (`category_id_2`),
  KEY `UK_ns_goods_category_id_3` (`category_id_3`),
  KEY `UK_ns_goods_extend_category_id` (`extend_category_id`),
  KEY `UK_ns_goods_extend_category_id_1` (`extend_category_id_1`),
  KEY `UK_ns_goods_extend_category_id_2` (`extend_category_id_2`),
  KEY `UK_ns_goods_extend_category_id_3` (`extend_category_id_3`),
  KEY `UK_ns_goods_goods_attribute_id` (`goods_attribute_id`),
  KEY `UK_ns_goods_group_id_array` (`group_id_array`),
  KEY `UK_ns_goods_promotion_price` (`promotion_price`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16554 COMMENT='商品表';

LOCK TABLES `ns_goods` WRITE;
/*!40000 ALTER TABLE `ns_goods` DISABLE KEYS */;

INSERT INTO `ns_goods` (`goods_id`, `goods_name`, `shop_id`, `category_id`, `category_id_1`, `category_id_2`, `category_id_3`, `brand_id`, `group_id_array`, `promotion_type`, `promote_id`, `goods_type`, `market_price`, `price`, `promotion_price`, `cost_price`, `point_exchange_type`, `point_exchange`, `give_point`, `is_member_discount`, `shipping_fee`, `shipping_fee_id`, `stock`, `max_buy`, `clicks`, `min_stock_alarm`, `sales`, `collects`, `star`, `evaluates`, `shares`, `province_id`, `city_id`, `picture`, `keywords`, `introduction`, `description`, `QRcode`, `code`, `is_stock_visible`, `is_hot`, `is_recommend`, `is_new`, `is_pre_sale`, `is_bill`, `state`, `sort`, `img_id_array`, `sku_img_array`, `match_point`, `match_ratio`, `real_sales`, `goods_attribute_id`, `goods_spec_format`, `goods_weight`, `goods_volume`, `shipping_fee_type`, `extend_category_id`, `extend_category_id_1`, `extend_category_id_2`, `extend_category_id_3`, `supplier_id`, `sale_date`, `create_time`, `update_time`, `min_buy`, `virtual_goods_type_id`, `production_date`, `shelf_life`)
VALUES
	(3,'上衣女夏2017新款枣红色韩版灯笼袖压褶方领宽松半袖百搭雪纺衫',0,91,5,27,91,0,'',0,0,1,198.00,169.00,169.00,100.00,0,0,0,0,0.00,0,75000,0,0,200,0,0,0,0,0,0,0,8,'','1.单笔订单满88元免运费(不包邮地区：台湾;海外)；上不封顶！亲，快下手吧！','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>袖长:&nbsp;五分袖</p></li><li><p>货号:&nbsp;ek-6659#</p></li><li><p>服装版型:&nbsp;宽松</p></li><li><p>风格:&nbsp;通勤</p></li><li><p>通勤:&nbsp;韩版</p></li><li><p>穿着方式:&nbsp;套头</p></li><li><p>组合形式:&nbsp;单件</p></li><li><p>衣长:&nbsp;常规款</p></li><li><p>领型:&nbsp;方领</p></li><li><p>袖型:&nbsp;灯笼袖</p></li><li><p>图案:&nbsp;纯色</p></li><li><p>服装款式细节:&nbsp;抽褶</p></li><li><p>年份季节:&nbsp;2017年夏季</p></li><li><p>颜色分类:&nbsp;酒红色</p></li><li><p>尺码:&nbsp;均码</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img src=\"https://img.alicdn.com/imgextra/i4/2550345463/TB21.LEvR0kpuFjSsppXXcGTXXa_!!2550345463.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img src=\"https://img.alicdn.com/imgextra/i1/2550345463/TB29AlWvMJkpuFjSszcXXXfsFXa_!!2550345463.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/2550345463/TB26rqLvHtlpuFjSspfXXXLUpXa_!!2550345463.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/2550345463/TB2qaInvSFjpuFjSszhXXaBuVXa_!!2550345463.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/2550345463/TB2rsHdvMRkpuFjy1zeXXc.6FXa_!!2550345463.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"921\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/2550345463/TB2RMLBvHRkpuFjSspmXXc.9XXa_!!2550345463.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"957\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/2550345463/TB2AfvivS0jpuFjy0FlXXc0bpXa_!!2550345463.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"966\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_3.png','',1,0,0,0,0,0,1,0,'8,9,10,11,12','',NULL,NULL,0,1,'[{\"spec_name\":\"尺码\",\"spec_id\":10,\"value\":[{\"spec_value_name\":\"l\",\"spec_name\":\"尺码\",\"spec_id\":10,\"spec_value_id\":18,\"spec_show_type\":1,\"spec_value_data\":\"\"},{\"spec_value_name\":\"m\",\"spec_name\":\"尺码\",\"spec_id\":10,\"spec_value_id\":19,\"spec_show_type\":1,\"spec_value_data\":\"\"},{\"spec_value_name\":\"s\",\"spec_name\":\"尺码\",\"spec_id\":10,\"spec_value_id\":20,\"spec_show_type\":1,\"spec_value_data\":\"\"},{\"spec_value_name\":\"xl\",\"spec_name\":\"尺码\",\"spec_id\":10,\"spec_value_id\":21,\"spec_show_type\":1,\"spec_value_data\":\"\"},{\"spec_value_name\":\"2xl\",\"spec_name\":\"尺码\",\"spec_id\":10,\"spec_value_id\":22,\"spec_show_type\":1,\"spec_value_data\":\"\"}]},{\"spec_name\":\"衣服颜色\",\"spec_id\":11,\"value\":[{\"spec_value_name\":\"白色\",\"spec_name\":\"衣服颜色\",\"spec_id\":11,\"spec_value_id\":25,\"spec_show_type\":1,\"spec_value_data\":\"\"},{\"spec_value_name\":\"红色\",\"spec_name\":\"衣服颜色\",\"spec_id\":11,\"spec_value_id\":24,\"spec_show_type\":1,\"spec_value_data\":\"\"},{\"spec_value_name\":\"粉色\",\"spec_name\":\"衣服颜色\",\"spec_id\":11,\"spec_value_id\":23,\"spec_show_type\":1,\"spec_value_data\":\"\"}]}]',0.00,0.00,3,'0','0','0','0',0,1499333756,1499333756,1499409169,0,0,0,''),
	(4,'2017夏装新款名媛修身性感一字肩绣花时尚喇叭袖连衣裙短袖包臀裙',0,91,5,27,91,0,'',0,0,1,0.00,399.00,399.00,0.00,0,0,0,0,0.00,0,1000,0,0,100,0,0,0,0,0,0,0,13,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>廓形:&nbsp;X型</p></li><li><p>风格:&nbsp;通勤</p></li><li><p>通勤:&nbsp;韩版</p></li><li><p>组合形式:&nbsp;单件</p></li><li><p>裙长:&nbsp;短裙</p></li><li><p>款式:&nbsp;其他/other</p></li><li><p>袖长:&nbsp;五分袖</p></li><li><p>领型:&nbsp;一字领</p></li><li><p>袖型:&nbsp;喇叭袖</p></li><li><p>腰型:&nbsp;高腰</p></li><li><p>衣门襟:&nbsp;拉链</p></li><li><p>裙型:&nbsp;一步裙</p></li><li><p>图案:&nbsp;纯色</p></li><li><p>流行元素/工艺:&nbsp;荷叶边 绣花 拉链 蕾丝</p></li><li><p>面料:&nbsp;其他</p></li><li><p>成分含量:&nbsp;91%(含)-95%(含)</p></li><li><p>材质:&nbsp;棉</p></li><li><p>年份季节:&nbsp;2017年夏季</p></li><li><p>颜色分类:&nbsp;浅蓝色</p></li><li><p>尺码:&nbsp;S M L</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/1106073095/TB2G1g6AbBmpuFjSZFAXXaQ0pXa_!!1106073095.png\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/1106073095/TB2QYdIv9xjpuFjSszeXXaeMVXa_!!1106073095.png\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/1106073095/TB2Rb6ujCB0XKJjSZFsXXaxfpXa_!!1106073095.png\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><a href=\"https://item.taobao.com/item.htm?spm=686.1000925.0.0.3f11c9edDQlqNY&id=553628124924\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/1106073095/TB2IoI5vRNkpuFjy0FaXXbRCVXa_!!1106073095.png\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top;\"/></a><a href=\"https://item.taobao.com/item.htm?spm=686.1000925.0.0.3f11c9eduiP0Fp&id=552930293302\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/1106073095/TB2Mb9JvW8lpuFjy0FpXXaGrpXa_!!1106073095.png\" class=\"\" align=\"absmiddle\" width=\"380\" height=\"319\" style=\"border: 0px; vertical-align: top;\"/></a><img src=\"https://img.alicdn.com/imgextra/i4/1106073095/TB2pIbujCB0XKJjSZFsXXaxfpXa_!!1106073095.png\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"1035\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/1106073095/TB293YNAkqvpuFjSZFhXXaOgXXa_!!1106073095.png\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"1016\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/1106073095/TB2l1A6AbBmpuFjSZFAXXaQ0pXa_!!1106073095.png\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"692\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/1106073095/TB2.Odnu5C9MuFjSZFoXXbUzFXa_!!1106073095.png\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"716\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/1106073095/TB25V3HAdRopuFjSZFtXXcanpXa_!!1106073095.png\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"646\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/1106073095/TB2Rp7HAdRopuFjSZFtXXcanpXa_!!1106073095.png\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"827\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/1106073095/TB2rjeAvY8kpuFjy0FcXXaUhpXa_!!1106073095.png\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"1371\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/1106073095/TB2.5sIAhhmpuFjSZFyXXcLdFXa_!!1106073095.png\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"806\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/1106073095/TB2FLPyv3xlpuFjy0FoXXa.lXXa_!!1106073095.png\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"1151\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/1106073095/TB2j6IKfBU4h1JjSZFLXXaFMpXa_!!1106073095.png\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"716\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/1106073095/TB2zbQ9Ab4npuFjSZFmXXXl4FXa_!!1106073095.png\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"855\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/1106073095/TB2hiyXvYXlpuFjy1zbXXb_qpXa_!!1106073095.png\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"842\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_4.png','',1,0,0,0,0,0,1,0,'13,14,15,16','',NULL,NULL,0,1,'[]',0.00,0.00,3,'0','0','0','0',0,1499333985,1499333985,NULL,0,0,0,''),
	(5,'定制韩版宽松蝙蝠袖中长款套头卫衣胸前系带连衣裙',0,91,5,27,91,0,'',0,0,1,300.00,200.00,200.00,12.00,0,0,0,0,0.00,0,168,0,0,200,4,0,0,0,0,0,0,17,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>廓形:&nbsp;H型</p></li><li><p>货号:&nbsp;LKF0199</p></li><li><p>风格:&nbsp;通勤</p></li><li><p>通勤:&nbsp;韩版</p></li><li><p>组合形式:&nbsp;假两件</p></li><li><p>裙长:&nbsp;中裙</p></li><li><p>款式:&nbsp;其他/other</p></li><li><p>袖长:&nbsp;长袖</p></li><li><p>领型:&nbsp;连帽</p></li><li><p>袖型:&nbsp;插肩袖</p></li><li><p>腰型:&nbsp;中腰</p></li><li><p>衣门襟:&nbsp;套头</p></li><li><p>裙型:&nbsp;其他</p></li><li><p>图案:&nbsp;纯色</p></li><li><p>流行元素/工艺:&nbsp;铆钉 口袋 螺纹 绑带</p></li><li><p>面料:&nbsp;针织</p></li><li><p>成分含量:&nbsp;51%(含)-70%(含)</p></li><li><p>材质:&nbsp;棉</p></li><li><p>适用年龄:&nbsp;18-24周岁</p></li><li><p>年份季节:&nbsp;2017年春季</p></li><li><p>颜色分类:&nbsp;粉色 浅灰色</p></li><li><p>尺码:&nbsp;均码</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><a style=\"color: rgb(51, 102, 204); outline: 0px;\" name=\"shengejing_bbrecommend_start\"></a></p><table bgcolor=\"#000000\" height=\"28px\" width=\"746\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr class=\"firstRow\"><td style=\"margin: 0px; padding-top: 0px; padding-right: 0px; padding-bottom: 0px; color: rgb(255, 255, 255); font-weight: bold; font-size: 20px;\">进店必BUY 人气单品HOT</td></tr></tbody></table><table align=\"center\" background=\"https://item.taobao.com/item.htm?spm=a217f.8051907.312171.31.353deac36ABVeZ&amp;id=545263727234\" cellpadding=\"0\" cellspacing=\"0\" width=\"746\"><tbody><tr valign=\"top\" class=\"firstRow\"><td width=\"8\" style=\"margin: 0px; padding: 0px;\"><br/></td><td style=\"margin: 0px; padding: 0px;\"><br/></td><td style=\"margin: 0px; padding: 0px;\"><br/></td><td style=\"margin: 0px; padding: 0px;\"><br/></td><td style=\"margin: 0px; padding: 0px;\"><br/></td><td width=\"8\" style=\"margin: 0px; padding: 0px;\"><br/></td></tr><tr valign=\"top\"><td width=\"8\" style=\"margin: 0px; padding: 0px;\"><br/></td><td style=\"margin: 0px; padding: 0px;\"><br/></td><td style=\"margin: 0px; padding: 0px;\"><br/></td><td style=\"margin: 0px; padding: 0px;\"><br/></td><td style=\"margin: 0px; padding: 0px;\"><br/></td><td width=\"8\" style=\"margin: 0px; padding: 0px;\"><br/></td></tr></tbody></table><table align=\"center\" background=\"https://item.taobao.com/item.htm?spm=a217f.8051907.312171.31.353deac36ABVeZ&amp;id=545263727234\" cellpadding=\"0\" cellspacing=\"0\" width=\"746\"><tbody><tr valign=\"top\" class=\"firstRow\"><td width=\"8\" style=\"margin: 0px; padding: 0px;\"><br/></td><td style=\"margin: 0px; padding: 0px;\"><br/></td><td style=\"margin: 0px; padding: 0px;\"><br/></td><td style=\"margin: 0px; padding: 0px;\"><br/></td><td style=\"margin: 0px; padding: 0px;\"><br/></td><td width=\"8\" style=\"margin: 0px; padding: 0px;\"><br/></td></tr><tr valign=\"top\"><td width=\"8\" style=\"margin: 0px; padding: 0px;\"><br/></td><td style=\"margin: 0px; padding: 0px;\"><br/></td><td style=\"margin: 0px; padding: 0px;\"><br/></td><td width=\"8\" style=\"margin: 0px; padding: 0px;\"><br/></td><td width=\"8\" style=\"margin: 0px; padding: 0px;\"><br/></td><td width=\"8\" style=\"margin: 0px; padding: 0px;\"><br/></td></tr></tbody></table><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><a style=\"color: rgb(51, 102, 204); outline: 0px;\" name=\"shengejing_bbrecommend_end\"></a></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i4/904521978/TB2pJyWf4XlpuFjSsphXXbJOXXa_!!904521978.jpg\" class=\"\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; padding: 1px 0px; cursor: cell;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><a target=\"_blank\" href=\"http://cloud.video.taobao.com/play/u/904521978/p/1/e/6/t/1/50003904115.mp4\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/904521978/TB2VsM7eKJ8puFjy1XbXXagqVXa_!!904521978.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/></a></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_5.png','',1,0,0,0,0,0,1,0,'17,18,19','',NULL,NULL,4,1,'[{\"spec_name\":\"尺码\",\"spec_id\":10,\"value\":[{\"spec_value_name\":\"l\",\"spec_name\":\"尺码\",\"spec_id\":10,\"spec_value_id\":18,\"spec_show_type\":1,\"spec_value_data\":\"\"},{\"spec_value_name\":\"m\",\"spec_name\":\"尺码\",\"spec_id\":10,\"spec_value_id\":19,\"spec_show_type\":1,\"spec_value_data\":\"\"},{\"spec_value_name\":\"xl\",\"spec_name\":\"尺码\",\"spec_id\":10,\"spec_value_id\":21,\"spec_show_type\":1,\"spec_value_data\":\"\"}]},{\"spec_name\":\"衣服颜色\",\"spec_id\":11,\"value\":[{\"spec_value_name\":\"粉色\",\"spec_name\":\"衣服颜色\",\"spec_id\":11,\"spec_value_id\":23,\"spec_show_type\":1,\"spec_value_data\":\"\"}]}]',0.00,0.00,3,'','','','',0,1499334271,1499334271,1513011324,0,0,0,''),
	(6,'夏欧美性感气质名媛女高腰修身显瘦黑色不规则吊带背心无袖连衣裙',0,91,5,27,91,0,'',0,0,1,0.00,188.00,188.00,0.00,0,0,0,0,0.00,0,1000,0,0,100,0,0,0,0,0,0,0,20,'','单笔订单满228元免运费','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>廓形:&nbsp;A型</p></li><li><p>货号:&nbsp;0220Z9690</p></li><li><p>风格:&nbsp;街头</p></li><li><p>街头:&nbsp;欧美</p></li><li><p>组合形式:&nbsp;单件</p></li><li><p>裙长:&nbsp;短裙</p></li><li><p>款式:&nbsp;其他/other</p></li><li><p>袖长:&nbsp;无袖</p></li><li><p>领型:&nbsp;其他</p></li><li><p>腰型:&nbsp;高腰</p></li><li><p>衣门襟:&nbsp;拉链</p></li><li><p>裙型:&nbsp;大摆型</p></li><li><p>图案:&nbsp;纯色</p></li><li><p>流行元素/工艺:&nbsp;拼接 不对称 拉链</p></li><li><p>品牌:&nbsp;other/其他</p></li><li><p>面料:&nbsp;其他</p></li><li><p>成分含量:&nbsp;31%(含)-50%(含)</p></li><li><p>材质:&nbsp;其他</p></li><li><p>适用年龄:&nbsp;18-24周岁</p></li><li><p>年份季节:&nbsp;2017年春季</p></li><li><p>颜色分类:&nbsp;黑色</p></li><li><p>尺码:&nbsp;S M L</p></li></ul><p><a style=\"color: rgb(51, 102, 204); outline: 0px; font-size: 0px; height: 0px;\" name=\"elk_UserCode_1_8755_begin\"></a></p><p><a href=\"https://ezzezz.taobao.com/p/rd429245.htm?spm=a1z10.1-c-s.w5003-15691765216.1.6b66bb75e0AtOg&scene=taobao_shop\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/16438668/TB2iTcMzS8mpuFjSZFMXXaxpVXa_!!16438668.jpg\" width=\"750\" height=\"400\" alt=\"\" style=\"border: 0px; vertical-align: middle;\"/></a></p><table width=\"750\" height=\"800\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr class=\"firstRow\"><td colspan=\"4\" style=\"margin: 0px; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/16438668/TB2gzSBvrBkpuFjy1zkXXbSpFXa_!!16438668.jpg\" width=\"750\" height=\"149\" alt=\"\" style=\"border: 0px; vertical-align: top;\"/></td></tr><tr><td style=\"margin: 0px; padding: 0px;\"><a href=\"https://item.taobao.com/item.htm?spm=a21ag.7634349.0.0.zJ2Cxi&id=545090836415\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/16438668/TB2FbvLzUlnpuFjSZFjXXXTaVXa_!!16438668.jpg\" width=\"188\" height=\"326\" border=\"0\" alt=\"\" style=\"border: 0px; vertical-align: top;\"/></a></td><td style=\"margin: 0px; padding: 0px;\"><a href=\"https://item.taobao.com/item.htm?spm=a21ag.7634349.0.0.VVlC6q&id=551549675341\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/16438668/TB2W3kozS0mpuFjSZPiXXbssVXa_!!16438668.jpg\" width=\"187\" height=\"326\" border=\"0\" alt=\"\" style=\"border: 0px; vertical-align: top;\"/></a></td><td style=\"margin: 0px; padding: 0px;\"><a href=\"https://item.taobao.com/item.htm?spm=a21ag.7634349.0.0.0unMdt&id=552794454538\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/16438668/TB2fE2rvC0jpuFjy0FlXXc0bpXa_!!16438668.jpg\" class=\"\" width=\"188\" height=\"326\" border=\"0\" alt=\"\" style=\"border: 0px; vertical-align: top;\"/></a></td><td style=\"margin: 0px; padding: 0px;\"><a href=\"https://item.taobao.com/item.htm?spm=a21ag.7634349.0.0.28GiGI&id=528183883460\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i4/16438668/TB24xnFvuJ8puFjy1XbXXagqVXa_!!16438668.jpg\" class=\"\" width=\"187\" height=\"326\" border=\"0\" alt=\"\" style=\"border: 0px; vertical-align: top;\"/></a></td></tr><tr><td style=\"margin: 0px; padding: 0px;\"><a href=\"https://item.taobao.com/item.htm?spm=a21ag.7634349.0.0.czzRvZ&id=552142188872\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/16438668/TB29092vB0kpuFjy1zdXXXuUVXa_!!16438668.jpg\" class=\"\" width=\"188\" height=\"325\" border=\"0\" alt=\"\" style=\"border: 0px; vertical-align: top;\"/></a></td><td style=\"margin: 0px; padding: 0px;\"><a href=\"https://item.taobao.com/item.htm?spm=a21ag.7634349.0.0.VVlC6q&id=551410496983\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/16438668/TB25rh7vwJkpuFjSszcXXXfsFXa_!!16438668.jpg\" class=\"\" width=\"187\" height=\"325\" border=\"0\" alt=\"\" style=\"border: 0px; vertical-align: top;\"/></a></td><td style=\"margin: 0px; padding: 0px;\"><a href=\"https://item.taobao.com/item.htm?spm=a21ag.7634349.0.0.f43E8K&id=550911026627\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/16438668/TB2.1nOvB8lpuFjSspaXXXJKpXa_!!16438668.jpg\" class=\"\" width=\"188\" height=\"325\" border=\"0\" alt=\"\" style=\"border: 0px; vertical-align: top;\"/></a></td><td style=\"margin: 0px; padding: 0px;\"><a href=\"https://item.taobao.com/item.htm?spm=a21ag.7634349.0.0.0unMdt&id=552836019882\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/16438668/TB2mE9TvrtlpuFjSspfXXXLUpXa_!!16438668.jpg\" class=\"\" width=\"187\" height=\"325\" border=\"0\" alt=\"\" style=\"border: 0px; vertical-align: top;\"/></a></td></tr></tbody></table><p><a style=\"color: rgb(51, 102, 204); outline: 0px; font-size: 0px; height: 0px;\" name=\"elk_UserCode_1_8755_end\"></a></p><p><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/16438668/TB2WdpqfbBkpuFjy1zkXXbSpFXa_!!16438668.jpg\" class=\"\" width=\"750\" height=\"969\" style=\"border: 0px; vertical-align: middle;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/16438668/TB2kmAElCxjpuFjSszeXXaeMVXa_!!16438668.jpg\" class=\"\" width=\"750\" height=\"439\" style=\"border: 0px; vertical-align: middle; line-height: 19.0909px;\"/></p><p>&nbsp;</p><table height=\"930\" width=\"750\"><tbody><tr class=\"firstRow\"><td style=\"margin: 0px; padding: 0px;\"><img height=\"80\" width=\"750\" src=\"https://img.alicdn.com/imgextra/i4/16438668/TB2iLnUXcsa61BjSszcXXacMpXa_!!16438668.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/></td></tr><tr><td height=\"190\" style=\"margin: 0px; padding: 0px;\">&nbsp;&nbsp;Weight/产品克重约0.37KgSize/尺码S码、M码、L码Color/颜色黑色Fabric/面料涤纶混纺Explanation/特别说明建议通风处晾干Suggestions/洗涤建议建议轻柔水洗</td></tr><tr><td style=\"margin: 0px; padding: 0px;\"><img height=\"80\" width=\"750\" src=\"https://img.alicdn.com/imgextra/i4/16438668/TB2MCvUXhIX61BjSsplXXazrpXa_!!16438668.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/></td></tr><tr><td height=\"60\" style=\"margin: 0px; padding: 0px;\">△弹力无弹微弹高弹&nbsp;△厚度厚款适中薄款△版型紧身合体宽松&nbsp;△长度短款适中中长款</td></tr><tr><td style=\"margin: 0px; padding: 0px;\"><img height=\"80\" width=\"750\" src=\"https://img.alicdn.com/imgextra/i3/16438668/TB2WHrTXcwb61Bjy0FfXXXvlpXa_!!16438668.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/></td></tr><tr><td height=\"200\" style=\"margin: 0px; padding: 0px;\">尺码裙长建议胸围腰围臀围S8472-8065不限M8576-8469不限L8680-8873不限温馨提示:(因为测量手法不同及面料弹性问题 实际测量误差一般在1-3cm左右)</td></tr><tr><td style=\"margin: 0px; padding: 0px;\"><img height=\"80\" width=\"750\" src=\"https://img.alicdn.com/imgextra/i1/16438668/TB2PubVXnka61Bjy0FoXXb1sFXa_!!16438668.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/></td></tr><tr><td height=\"160\" style=\"margin: 0px; padding: 0px;\">身高cm\\体重kg404550556065155SSMLL-165SSMLL-170SSMML-温馨提示：由于每个人身材存在个体差异情况，所以推荐不保证准确，仅供参考。</td></tr></tbody></table><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img alt=\"\" src=\"https://img.alicdn.com/imgextra/i2/16438668/TB2KlW2acgd61BjSZFjXXbXspXa_!!16438668.jpg\" class=\"\" width=\"750\" height=\"80\" style=\"border: 0px; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><a target=\"_blank\" href=\"https://item.taobao.com/item.htm?id=545403681050\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img alt=\"\" src=\"https://img.alicdn.com/imgextra/i1/16438668/TB2NdRReYFlpuFjy0FgXXbRBVXa_!!16438668.jpg\" class=\"\" width=\"200\" height=\"200\" style=\"border: 0px; vertical-align: top; float: none; margin: 0px;\"/></a>&nbsp;<a target=\"_blank\" href=\"https://item.taobao.com/item.htm?id=546286206495\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img alt=\"\" src=\"https://img.alicdn.com/imgextra/i4/16438668/TB2_8asiohnpuFjSZFEXXX0PFXa_!!16438668.jpg\" class=\"\" width=\"200\" height=\"200\" style=\"border: 0px; vertical-align: top; float: none; margin: 0px;\"/></a>&nbsp;<a target=\"_blank\" href=\"https://item.taobao.com/item.htm?id=544529607138\" style=\"color: rgb(51, 102, 204); outline: 0px; line-height: 1.5;\"><img alt=\"\" src=\"https://img.alicdn.com/imgextra/i1/16438668/TB2XtngdS0mpuFjSZPiXXbssVXa_!!16438668.jpg\" class=\"\" width=\"200\" height=\"200\" style=\"border: 0px; vertical-align: top; float: none; margin: 0px;\"/></a></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img alt=\"\" src=\"https://img.alicdn.com/imgextra/i2/16438668/TB2DB12aiwd61BjSZFtXXai7XXa_!!16438668.jpg\" class=\"\" width=\"750\" height=\"120\" style=\"border: 0px; vertical-align: top;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_6.png','',1,0,0,0,0,0,1,0,'20,21,22,23','',NULL,NULL,0,1,'[]',0.00,0.00,3,'0','0','0','0',0,1499334466,1499334466,NULL,0,0,0,''),
	(7,'简约气质百搭复古 浅灰铜氨丝 吊带连衣裙',0,91,5,27,91,0,'',0,0,1,0.00,178.00,178.00,0.00,0,0,0,0,0.00,0,1000,0,0,200,0,0,0,0,0,0,0,24,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>廓形:&nbsp;A型</p></li><li><p>货号:&nbsp;FL20170321</p></li><li><p>风格:&nbsp;通勤</p></li><li><p>通勤:&nbsp;复古</p></li><li><p>组合形式:&nbsp;单件</p></li><li><p>裙长:&nbsp;中裙</p></li><li><p>款式:&nbsp;吊带</p></li><li><p>袖长:&nbsp;无袖</p></li><li><p>腰型:&nbsp;高腰</p></li><li><p>裙型:&nbsp;A字裙</p></li><li><p>图案:&nbsp;纯色</p></li><li><p>品牌:&nbsp;乔恩川黛</p></li><li><p>成分含量:&nbsp;91%(含)-95%(含)</p></li><li><p>材质:&nbsp;棉</p></li><li><p>年份季节:&nbsp;2017年春季</p></li><li><p>颜色分类:&nbsp;浅灰（24小时内发货）</p></li><li><p>尺码:&nbsp;S M L</p></li></ul><p><img class=\"hn_webmjs_1806235137\" src=\"https://img.alicdn.com/imgextra/i3/110545816/TB2HEOFe5lnpuFjSZFgXXbi7FXa_!!110545816.jpg?flg=hn_webmjs_1806235137\" style=\"border: 0px; vertical-align: middle;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/110545816/TB2eWsLjUhnpuFjSZFEXXX0PFXa_!!110545816.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/110545816/TB2MhJfphXlpuFjSsphXXbJOXXa_!!110545816.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/110545816/TB2VtPMibXlpuFjy1zbXXb_qpXa_!!110545816.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/110545816/TB2x6V5j5RnpuFjSZFCXXX2DXXa_!!110545816.jpg\" class=\"\" width=\"750\" height=\"534\" usemap=\"#Map\" border=\"0\" style=\"border: 0px; vertical-align: top;\"/><map name=\"Map\"><area shape=\"rect\" coords=\"58,54,251,245\" href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c-s.w4002-15485869936.53.GQSWAE&id=545005702399\"/><area shape=\"rect\" coords=\"295,54,483,243\" href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c-s.w4002-15485869936.47.GQSWAE&id=545023259570\"/><area shape=\"rect\" coords=\"517,285,708,477\" href=\"https://item.taobao.com/item.htm?spm=0.0.0.0.eHSGcD&id=546758145697\"/><area shape=\"rect\" coords=\"58,288,249,478\" href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c-s.w4002-15485869936.41.GQSWAE&id=545074967420\"/><area shape=\"circle\" coords=\"382,383,71\" href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c-s.w4002-15485869936.41.GQSWAE&id=545074967420\"/></map></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/110545816/TB2aQzzil0kpuFjy1zdXXXuUVXa_!!110545816.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/110545816/TB2SxLaigJkpuFjSszcXXXfsFXa_!!110545816.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_7.png','',1,0,0,0,0,0,1,0,'24,25','',NULL,NULL,0,1,'[]',0.00,0.00,3,'0','0','0','0',0,1499334666,1499334666,NULL,0,0,0,''),
	(8,'小鹿要飞背带牛仔裤女春夏季2017新款宽松高腰短裤小清新背带裤裙',0,91,5,27,91,0,'',0,0,1,0.00,188.00,188.00,0.00,0,0,0,0,0.00,0,1000,0,0,50,0,0,0,0,0,0,0,26,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>品牌:&nbsp;小鹿要飞</p></li><li><p>货号:&nbsp;Q17A1643</p></li><li><p>工艺:&nbsp;做旧 水洗 拉链 纽扣 贴布</p></li><li><p>款式:&nbsp;背带裤</p></li><li><p>裤长:&nbsp;短裤</p></li><li><p>腰型:&nbsp;高腰</p></li><li><p>面料分类:&nbsp;全棉牛仔布</p></li><li><p>适用年龄:&nbsp;18-24周岁</p></li><li><p>年份季节:&nbsp;2017年夏季</p></li><li><p>颜色:&nbsp;深色</p></li><li><p>颜色分类:&nbsp;牛仔蓝</p></li><li><p>尺寸:&nbsp;S M L XL 2XL</p></li><li><p>厚薄:&nbsp;薄款</p></li></ul><p><img src=\"https://assets.alicdn.com/s.gif?q=bwsoft_img_start_f24e0304-3ea7-42ab-b4f4-f381a7d26226\" style=\"border: 0px; vertical-align: middle;\"/></p><p><a style=\"color: rgb(51, 102, 204); outline: 0px;\" name=\"bwsoft_a_start_f24e0304-3ea7-42ab-b4f4-f381a7d26226\"></a></p><table height=\"17\"><tbody><tr class=\"firstRow\"><td style=\"margin: 0px; padding: 0px;\"><p>bwsoft_promotion_start_f24e0304-3ea7-42ab-b4f4-f381a7d26226</p><p><img src=\"https://img.alicdn.com/imgextra/i2/674634432/TB2xisFz.hnpuFjSZFpXXcpuXXa_!!674634432.jpg\" usemap=\"#Map_5959f8181d28a\" style=\"border: 0px; vertical-align: top;\"/><map name=\"Map_5959f8181d28a\"><area shape=\"rect\" coords=\"0,0,750,400\" href=\"https://xiaoluyaofei.taobao.com/\"/></map></p><p><img src=\"https://img.alicdn.com/imgextra/i1/674634432/TB2yKVWzUhnpuFjSZFEXXX0PFXa_!!674634432.jpg\" usemap=\"#Map_5955e9985e395\" style=\"border: 0px; vertical-align: top;\"/><map name=\"Map_5955e9985e395\"><area shape=\"rect\" coords=\"0,0,374,469\" href=\"https://meidian.play.m.jaeapp.com/?iid=522044&cpp=0\"/><area shape=\"rect\" coords=\"375,0,750,469\" href=\"https://meidian.play.m.jaeapp.com/?iid=522041&cpp=0\"/></map></p><p><img src=\"https://img.alicdn.com/imgextra/i3/674634432/TB2e78uvrJkpuFjy1zcXXa5FFXa_!!674634432.jpg\" usemap=\"#Map_5955eaac7c95a\" style=\"border: 0px; vertical-align: top;\"/><map name=\"Map_5955eaac7c95a\"><area shape=\"rect\" coords=\"0,149,188,342\" href=\"https://item.taobao.com/item.htm?spm=a1z10.3-c-s.w4002-16424345180.37.131b3747oVXzpt&id=552312147700\"/><area shape=\"rect\" coords=\"186,148,376,342\" href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c-s.w4002-16424345170.31.58088b25tj6s25&id=553738990535\"/><area shape=\"rect\" coords=\"376,146,567,341\" href=\"https://item.taobao.com/item.htm?spm=a1z10.3-c-s.w4002-16424345180.49.131b3747oVXzpt&id=553029390079\"/><area shape=\"rect\" coords=\"568,144,750,340\" href=\"https://item.taobao.com/item.htm?spm=a1z10.3-c-s.w4002-16424345180.94.131b3747oVXzpt&id=552907152473\"/><area shape=\"rect\" coords=\"0,342,188,590\" href=\"https://item.taobao.com/item.htm?spm=a1z10.3-c-s.w4002-16424345180.40.131b3747oVXzpt&id=552332199693\"/><area shape=\"rect\" coords=\"188,344,377,590\" href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c-s.w4002-16424345170.28.58088b25tj6s25&id=553741670744\"/><area shape=\"rect\" coords=\"378,342,563,590\" href=\"https://item.taobao.com/item.htm?spm=a1z10.3-c-s.w4002-16424345180.55.131b3747oVXzpt&id=553075443754\"/><area shape=\"rect\" coords=\"564,340,750,590\" href=\"https://item.taobao.com/item.htm?spm=a1z10.3-c-s.w4002-16424345180.34.131b3747oVXzpt&id=551319004199\"/></map></p><p>bwsoft_promotion_end_f24e0304-3ea7-42ab-b4f4-f381a7d26226</p></td></tr></tbody></table><p><a style=\"color: rgb(51, 102, 204); outline: 0px;\" name=\"bwsoft_a_end_f24e0304-3ea7-42ab-b4f4-f381a7d26226\"></a></p><p><img src=\"https://assets.alicdn.com/s.gif?q=bwsoft_img_end_f24e0304-3ea7-42ab-b4f4-f381a7d26226\" class=\"\" style=\"border: 0px; vertical-align: middle;\"/></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/674634432/TB2MnkMqhtmpuFjSZFqXXbHFpXa_!!674634432.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"629\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/674634432/TB2pFz_kdhvOuFjSZFBXXcZgFXa_!!674634432.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"462\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/674634432/TB2UjdzqrlmpuFjSZFlXXbdQXXa_!!674634432.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"374\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><a href=\"http://h5.m.taobao.com/detailplugin/mix.html?comboId=473810078&sellerId=674634432&itemId=549812797902&type=taobao\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/674634432/TB2ZGa5o3RkpuFjy1zeXXc.6FXa_!!674634432.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"584\" style=\"border: 0px; vertical-align: top;\"/></a><a href=\"https://item.taobao.com/item.htm?spm=686.1000925.0.0.zM5nEi&id=549812797902\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/674634432/TB2ZJmVoYFlpuFjy0FgXXbRBVXa_!!674634432.jpg\" class=\"\" align=\"absmiddle\" width=\"259\" height=\"301\" style=\"border: 0px; vertical-align: top;\"/></a><a href=\"https://item.taobao.com/item.htm?spm=2013.1.3.4.8rS3aL&id=549764320668\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/674634432/TB2udvqo88kpuFjSspeXXc7IpXa_!!674634432.jpg\" class=\"\" align=\"absmiddle\" width=\"251\" height=\"301\" style=\"border: 0px; vertical-align: top;\"/></a><a href=\"http://h5.m.taobao.com/detailplugin/mix.html?comboId=473810078&sellerId=674634432&itemId=549812797902&type=taobao\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/674634432/TB2t92soYFkpuFjy1XcXXclapXa_!!674634432.jpg\" class=\"\" align=\"absmiddle\" width=\"240\" height=\"301\" style=\"border: 0px; vertical-align: top;\"/></a><img src=\"https://img.alicdn.com/imgextra/i4/674634432/TB25EsOqYlmpuFjSZFlXXbdQXXa_!!674634432.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"733\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><a href=\"https://item.taobao.com/item.htm?id=549812797902\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/674634432/TB2dtU4qbJmpuFjSZFwXXaE4VXa_!!674634432.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"557\" style=\"border: 0px; vertical-align: top;\"/><img src=\"https://img.alicdn.com/imgextra/i2/674634432/TB2fw5Hq.hnpuFjSZFpXXcpuXXa_!!674634432.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"482\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></a></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_8.png','',1,0,0,0,0,0,1,0,'26,27,28','',NULL,NULL,0,1,'[]',0.00,0.00,3,'0','0','0','0',0,1499334789,1499334789,NULL,0,0,0,''),
	(9,'DOMO男士高端衬衣潮男雅痞英伦风大尖领湖蓝红色波点衬衣个性达人',0,94,5,28,94,0,'',0,0,1,0.00,986.00,986.00,0.00,0,0,0,0,0.00,0,1110,0,0,96,0,0,0,0,0,0,0,29,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>厚薄:&nbsp;常规</p></li><li><p>材质成分:&nbsp;桑蚕丝100%</p></li><li><p>袖长:&nbsp;长袖</p></li><li><p>版型:&nbsp;修身</p></li><li><p>领型:&nbsp;尖领（常规）</p></li><li><p>颜色:&nbsp;花色</p></li><li><p>尺码:&nbsp;S /165 15天发货 M /170 15天发货 L /175 15天发货 XL/180 15天发货 XXL/185 15天发货 XXXL/19015天发货</p></li><li><p>面料分类:&nbsp;绸缎</p></li><li><p>品牌:&nbsp;DOMO DOMO</p></li><li><p>适用场景:&nbsp;日常</p></li><li><p>适用季节:&nbsp;四季</p></li><li><p>基础风格:&nbsp;时尚都市</p></li></ul><p><a style=\"color: rgb(51, 102, 204); outline: 0px;\" name=\"hlg_list_1_16794744_start\"></a></p><table cellpadding=\"0\" cellspacing=\"0\"><tbody><tr class=\"firstRow\"><td style=\"margin: 0px; padding: 0px;\"><p><img src=\"https://img.alicdn.com/imgextra/i2/112181393/TB2g41EAb4npuFjSZFmXXXl4FXa_!!112181393.png\" width=\"750\" height=\"1862\" alt=\"欢乐逛海报\" usemap=\"#m_templet6582727\" border=\"0\" style=\"border: 0px; vertical-align: top;\"/><map name=\"m_templet6582727\"><area shape=\"rect\" coords=\"378.83441337439,181.92651761436,740.01750615381,612.39251218001\" href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c-s.w4002-16391852180.18.9828089MC55sE&id=546696560810\"/><area shape=\"rect\" coords=\"-0.51922920474289,634.97592937907,357.19724138349,1086.9406352614\" href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c-s.w4002-16391852180.16.9828089I2Ycg2&id=549371086188\"/><area shape=\"rect\" coords=\"368.96523914365,640.15204366635,751.44170973189,1096.4979260193\" href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c-s.w4002-16391852180.14.9828089DopW43&id=540918935842\"/><area shape=\"rect\" coords=\"561.45652878161,35.856749548708,757.73417584043,184.53439660754\" href=\"https://taoquan.taobao.com/coupon/unify_apply.htm?sellerId=112181393&activityId=48325976fb3a49f88bb03e3573d1c852\"/><area shape=\"rect\" coords=\"4.8237063721228,36.946280080396,173.03900048977,172.91804478628\" href=\"https://taoquan.taobao.com/coupon/unify_apply.htm?sellerId=112181393&activityId=d84a57772b8e4afdbbe1f5bddc5d7cd6\"/><area shape=\"rect\" coords=\"-4.4631149174461,1234.001574198,180.8615909649,1533.4674565509\" href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c-s.w4002-16391852180.20.9828089MC55sE&id=533031561073\"/><area shape=\"rect\" coords=\"184.83335567078,1240.2143966075,363.63570861196,1540.9685142546\" href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c-s.w4002-16391852180.44.9828089MC55sE&id=549386139838\"/><area shape=\"rect\" coords=\"367.56982625902,1233.3449848428,552.89453214137,1537.7026319016\" href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c-s.w4002-16391852180.29.pNDsok&id=549329905894\"/><area shape=\"rect\" coords=\"553.229945026,1229.4247473088,743.44641561424,1535.4129826029\" href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c-s.w4002-16391852180.28.9828089MC55sE&id=524849381306\"/><area shape=\"rect\" coords=\"8.1400581933778,1537.6993400239,186.94241113456,1833.9040459063\" href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c-s.w4002-16391852180.30.7ruHes&id=549431399897\"/><area shape=\"rect\" coords=\"178.89688508254,1536.8098094922,370.74394390607,1833.0145153746\" href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c-s.w4002-16391852180.22.7ruHes&id=549334220629\"/><area shape=\"rect\" coords=\"366.17359320475,1535.1354543112,553.1288873224,1831.3401601935\" href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c-s.w4002-16391852180.20.7ruHes&id=549327969517\"/><area shape=\"rect\" coords=\"176.3448828427,36.315691845098,367.39900048977,175.53804478628\" href=\"https://taoquan.taobao.com/coupon/unify_apply.htm?sellerId=112181393&activityId=08d64c7db2d643b2bfdd263c9bcdf295\"/><area shape=\"rect\" coords=\"369.63311813683,35.087456550974,558.31194166624,177.66745655097\" href=\"https://taoquan.taobao.com/coupon/unify_apply.htm?sellerId=112181393&activityId=4346162508e847b58a77482cb65b262f\"/><area shape=\"rect\" coords=\"560.90041449431,1538.4649848428,753.9215909649,1843.147337784\" href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c-s.w4002-16391852180.20.1OcxGI&id=550130548425\"/><area shape=\"rect\" coords=\"4.4613534309418,175.52522237677,372.94723578389,611.55934002383\" href=\"https://domomen.taobao.com/category-1053993135.htm?spm=a1z10.5-c-s.w5002-16391852138.4.9828089MC55sE&search=y&catName=%D5%E6%CB%BF%B3%C4%C9%C0\"/></map></p></td></tr></tbody></table><p><a style=\"color: rgb(51, 102, 204); outline: 0px;\" name=\"hlg_list_1_16794744_end\"></a></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><a href=\"https://item.taobao.com/item.htm?spm=a1z10.1-c-s.w5003-16490931200.2.WwAUyV&id=533031561073&scene=taobao_shop\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i4/112181393/TB2nzKNqCJjpuFjy0FdXXXmoFXa_!!112181393.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top;\"/></a><a href=\"https://taoquan.taobao.com/coupon/unify_apply.htm?sellerId=112181393&activityId=2886840cfce54d73b8dc67c5306181f4\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/112181393/TB2t4FZthxmpuFjSZFNXXXrRXXa_!!112181393.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top;\"/></a><a href=\"https://taoquan.taobao.com/coupon/unify_apply.htm?sellerId=112181393&activityId=2cccbfcc066c462099d55f14cabd7f80\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/112181393/TB2jtnMpYFlpuFjy0FgXXbRBVXa_!!112181393.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top;\"/></a><a href=\"https://taoquan.taobao.com/coupon/unify_apply.htm?sellerId=112181393&activityId=219c324b35394b619c0316d654b47f71\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/112181393/TB2NxW.p8NkpuFjy0FaXXbRCVXa_!!112181393.jpg\" class=\"\" align=\"absmiddle\" width=\"134\" height=\"117\" style=\"border: 0px; vertical-align: top;\"/></a><a href=\"https://taoquan.taobao.com/coupon/unify_apply.htm?sellerId=112181393&activityId=2c4b4836bebf47659fe7aa00376bfc8c\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/112181393/TB24LMqpY8kpuFjy0FcXXaUhpXa_!!112181393.jpg\" class=\"\" align=\"absmiddle\" width=\"191\" height=\"117\" style=\"border: 0px; vertical-align: top;\"/></a><a href=\"https://item.taobao.com/item.htm?spm=686.1000925.0.0.Fkc60H&id=549371086188\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/112181393/TB25nj3p3FkpuFjSspnXXb4qFXa_!!112181393.jpg\" class=\"\" align=\"absmiddle\" width=\"198\" height=\"274\" style=\"border: 0px; vertical-align: top;\"/></a><a href=\"https://item.taobao.com/item.htm?id=549331816460\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/112181393/TB2aOpZthxmpuFjSZFNXXXrRXXa_!!112181393.jpg\" class=\"\" align=\"absmiddle\" width=\"192\" height=\"274\" style=\"border: 0px; vertical-align: top;\"/></a><a href=\"https://item.taobao.com/item.htm?id=541205885243\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/112181393/TB2yoaZp3JkpuFjSszcXXXfsFXa_!!112181393.jpg\" class=\"\" align=\"absmiddle\" width=\"194\" height=\"274\" style=\"border: 0px; vertical-align: top;\"/></a><a href=\"https://item.taobao.com/item.htm?id=549327969517\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/112181393/TB26SiftbxmpuFjSZJiXXXauVXa_!!112181393.jpg\" class=\"\" align=\"absmiddle\" width=\"166\" height=\"274\" style=\"border: 0px; vertical-align: top;\"/></a><a href=\"https://item.taobao.com/item.htm?id=534747600012\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/112181393/TB28vszm0hvOuFjSZFBXXcZgFXa_!!112181393.jpg\" class=\"\" align=\"absmiddle\" width=\"154\" height=\"165\" style=\"border: 0px; vertical-align: top;\"/></a><a href=\"https://item.taobao.com/item.htm?spm=686.1000925.0.0.sCVS1K&id=546388460968\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/112181393/TB2Htuptb4npuFjSZFmXXXl4FXa_!!112181393.jpg\" class=\"\" align=\"absmiddle\" width=\"153\" height=\"165\" style=\"border: 0px; vertical-align: top;\"/></a><a href=\"https://item.taobao.com/item.htm?id=546696560810\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i4/112181393/TB2zjMCXsPRfKJjSZFOXXbKEVXa_!!112181393.jpg\" class=\"\" align=\"absmiddle\" width=\"167\" height=\"165\" style=\"border: 0px; vertical-align: top;\"/></a><a href=\"https://item.taobao.com/item.htm?spm=686.1000925.0.0.sCVS1K&id=43894454688\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/112181393/TB2YZkLXCvHfKJjSZFPXXbttpXa_!!112181393.jpg\" class=\"\" align=\"absmiddle\" width=\"147\" height=\"165\" style=\"border: 0px; vertical-align: top;\"/></a><a href=\"https://item.taobao.com/item.htm?spm=686.1000925.0.0.sCVS1K&id=546072800726\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/112181393/TB24Juptb4npuFjSZFmXXXl4FXa_!!112181393.jpg\" class=\"\" align=\"absmiddle\" width=\"129\" height=\"165\" style=\"border: 0px; vertical-align: top;\"/></a><img src=\"https://img.alicdn.com/imgextra/i3/112181393/TB2ODe_pmBjpuFjSsplXXa5MVXa_!!112181393.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"122\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><br/><img src=\"https://img.alicdn.com/imgextra/i3/112181393/TB2.2AwpipnpuFjSZFkXXc4ZpXa_!!112181393.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"325\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/112181393/TB2McARmR8lpuFjSspaXXXJKpXa_!!112181393.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"1080\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/112181393/TB2Bhc3mG8lpuFjy0FpXXaGrpXa_!!112181393.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"549\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/112181393/TB2QaUpmR0kpuFjy1zdXXXuUVXa_!!112181393.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"807\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/112181393/TB2MmoBmHtlpuFjSspoXXbcDpXa_!!112181393.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"1300\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/112181393/TB2jr3amShlpuFjSspkXXa1ApXa_!!112181393.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"1131\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/112181393/TB2ftMkmHXlpuFjSszfXXcSGXXa_!!112181393.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"1041\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/112181393/TB2AGL_mMNlpuFjy0FfXXX3CpXa_!!112181393.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"1098\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/112181393/TB2oegopohnpuFjSZFEXXX0PFXa_!!112181393.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"1035\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_9.png','',1,0,0,0,0,0,1,0,'29,30,31','',NULL,NULL,0,0,'[]',0.00,0.00,3,'0','0','0','0',0,1499335006,1499335006,NULL,0,0,0,''),
	(10,'男OVERSIZE宽松ins同款衬衫防晒夏季白衬衣外套',0,94,5,28,94,0,'',0,0,1,0.00,198.00,198.00,0.00,0,0,0,0,0.00,0,1400,0,0,50,0,0,0,0,0,0,0,32,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>厚薄:&nbsp;常规</p></li><li><p>材质成分:&nbsp;棉100%</p></li><li><p>袖长:&nbsp;长袖</p></li><li><p>货号:&nbsp;7CS046</p></li><li><p>版型:&nbsp;特宽</p></li><li><p>领型:&nbsp;方领</p></li><li><p>颜色:&nbsp;白色</p></li><li><p>尺码:&nbsp;下一批预售L15号后到货 S M L</p></li><li><p>面料分类:&nbsp;色织布</p></li><li><p>品牌:&nbsp;物空</p></li><li><p>材质:&nbsp;棉</p></li><li><p>棉含量:&nbsp;95%以上</p></li><li><p>上市时间:&nbsp;2017年</p></li><li><p>适用场景:&nbsp;其他休闲</p></li><li><p>适用季节:&nbsp;春季</p></li><li><p>适用对象:&nbsp;青少年</p></li><li><p>基础风格:&nbsp;青春流行</p></li><li><p>细分风格:&nbsp;潮</p></li><li><p>面料功能:&nbsp;免烫</p></li><li><p>图案:&nbsp;纯色</p></li><li><p>服饰工艺:&nbsp;免烫处理</p></li><li><p>服装款式细节:&nbsp;其他</p></li></ul><table cellpadding=\"0\" width=\"750\"><tbody><tr class=\"firstRow\"><td style=\"margin: 0px; padding: 0px; line-height: 0; font-size: 0px; word-break: break-all;\">@@[[27A::DESCRIPTION::BEGIN]]</td></tr><tr><td style=\"margin: 0px; padding: 0px; word-break: break-all;\"><p>-</p><p>-----------------------------</p><p>-</p><p>-</p><p><img src=\"https://img.alicdn.com/imgextra/i1/373624515/TB26P1ooXXXXXXpXXXXXXXXXXXX_!!373624515.jpg\" width=\"750\" style=\"border: 0px; vertical-align: top; display: block;\"/></p><p>&nbsp;</p><p><span style=\"font-size: 18px;\"></span></p><p>男模特身高180cm&nbsp;68kg&nbsp;试穿尺寸：L（宽松效果）</p><p>&nbsp;</p><p>&nbsp;</p><p><strong>size</strong></p><p>&nbsp;</p><p>&nbsp;</p><p>S：袖长54 胸围148 &nbsp;衣长79.5 &nbsp;肩宽57</p><p>&nbsp;</p><p>M：袖长56 &nbsp;胸围154 衣长84.5 肩宽59.5</p><p>&nbsp;</p><p>L：袖长58 胸围160 &nbsp;衣长89.5 &nbsp;肩宽61</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;&nbsp;<span style=\"color:#7f7f7f\">(单位cm）(均为人工手量&nbsp;有1-3cm左右误差属正常)</span></p><p>&nbsp;</p><p>*由于显示器不同，色差难以避免。请参考实拍图已经尽量调到和实物接近。</p><p></p><p>&nbsp;</p><p>-</p><p>-</p><p><img src=\"https://img.alicdn.com/imgextra/i2/373624515/TB2004OoXXXXXbIXpXXXXXXXXXX_!!373624515.jpg\" width=\"750\" style=\"border: 0px; vertical-align: top; display: block;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i2/373624515/TB221b3rrBkpuFjy1zkXXbSpFXa_!!373624515.jpg\" width=\"750\" style=\"border: 0px; vertical-align: top; display: block;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i2/373624515/TB2WABirG8lpuFjy0FpXXaGrpXa_!!373624515.jpg\" width=\"750\" style=\"border: 0px; vertical-align: top; display: block;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i1/373624515/TB2d924uZtnpuFjSZFvXXbcTpXa_!!373624515.jpg\" class=\"\" width=\"750\" style=\"border: 0px; vertical-align: top; display: block;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i2/373624515/TB2zcnWu.dnpuFjSZPhXXbChpXa_!!373624515.jpg\" class=\"\" width=\"750\" style=\"border: 0px; vertical-align: top; display: block;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i4/373624515/TB2_cwEjylnpuFjSZFgXXbi7FXa_!!373624515.jpg\" class=\"\" width=\"750\" style=\"border: 0px; vertical-align: top; display: block;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i3/373624515/TB2jkViar_0UKFjy1XaXXbKfXXa_!!373624515.jpg\" class=\"\" width=\"750\" style=\"border: 0px; vertical-align: top; display: block;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i3/373624515/TB2yv_Dh3JkpuFjSszcXXXfsFXa_!!373624515.jpg\" class=\"\" width=\"750\" style=\"border: 0px; vertical-align: top; display: block;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i1/373624515/TB2nAUUjrBmpuFjSZFAXXaQ0pXa_!!373624515.jpg\" class=\"\" width=\"750\" style=\"border: 0px; vertical-align: top; display: block;\"/></p><p></p><p>--------------------------</p><p>-</p></td></tr><tr><td style=\"margin: 0px; padding: 0px; line-height: 0; font-size: 0px; word-break: break-all;\">@@[[2</td></tr></tbody></table>','upload/goods_qrcode/goods_qrcode_10.png','',1,0,0,0,0,0,1,0,'32,33,34,35','',NULL,NULL,0,0,'[]',0.00,0.00,3,'0','0','0','0',0,1499335206,1499335206,NULL,0,0,0,''),
	(11,'夏天总要有件条纹T恤男bf风快手红人ins同款',0,94,5,28,94,0,'',0,0,1,0.00,188.00,188.00,0.00,0,0,0,0,0.00,0,1000,0,0,100,0,0,0,0,0,0,0,36,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>厚薄:&nbsp;常规</p></li><li><p>品牌类型:&nbsp;设计师品牌</p></li><li><p>材质成分:&nbsp;棉100%</p></li><li><p>袖长:&nbsp;短袖</p></li><li><p>货号:&nbsp;7DT096</p></li><li><p>领型:&nbsp;圆领</p></li><li><p>颜色:&nbsp;灰色 墨绿色 姜黄色</p></li><li><p>尺码:&nbsp;S 现货 M 现货 L 现货</p></li><li><p>面料分类:&nbsp;棉毛布</p></li><li><p>款式细节:&nbsp;印花</p></li><li><p>服饰工艺:&nbsp;免烫处理</p></li><li><p>品牌:&nbsp;物空</p></li><li><p>袖型:&nbsp;常规</p></li><li><p>花型图案:&nbsp;条纹</p></li><li><p>版型:&nbsp;标准</p></li><li><p>材质:&nbsp;棉</p></li><li><p>棉含量:&nbsp;95%以上</p></li><li><p>适用季节:&nbsp;夏季</p></li><li><p>上市时间:&nbsp;2017年</p></li><li><p>适用场景:&nbsp;其他休闲</p></li><li><p>适用对象:&nbsp;青少年</p></li><li><p>基础风格:&nbsp;青春流行</p></li><li><p>细分风格:&nbsp;潮</p></li></ul><table cellpadding=\"0\" width=\"750\"><tbody><tr class=\"firstRow\"><td style=\"margin: 0px; padding: 0px; line-height: 0; font-size: 0px;\">@@[[27A::DESCRIPTION::BEGIN]]</td></tr><tr><td style=\"margin: 0px; padding: 0px;\"><p>-</p><p>-----------------------------</p><p>-</p><p>-</p><p><img src=\"https://img.alicdn.com/imgextra/i1/373624515/TB26P1ooXXXXXXpXXXXXXXXXXXX_!!373624515.jpg\" width=\"750\" style=\"border: 0px; vertical-align: top; display: block;\"/></p><p>&nbsp;</p><p><span style=\"font-size: 20px;\"></span></p><p>&nbsp;</p><p>&nbsp;</p><span style=\"font-size: 20px;\"><p>模特身高180cm&nbsp;68kg&nbsp;试穿尺寸：L（宽松效果）</p><p>&nbsp;&nbsp;</p><p><strong>size</strong></p><p>&nbsp;</p></span><span style=\"font-size: 18px;\"><p>&nbsp;&nbsp;</p><p>&nbsp; &nbsp;S：袖长21 &nbsp; 胸围106 &nbsp;衣长63 &nbsp;肩宽51</p><p>&nbsp;</p><p>&nbsp; &nbsp; M：袖长22 胸围110 &nbsp;衣长66 肩宽52.5</p><p>&nbsp;</p><p>&nbsp; &nbsp; &nbsp;L：袖长23 &nbsp;胸围114 &nbsp; 衣长69 &nbsp;肩宽54</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p><strong>&nbsp;</strong></p><p>&nbsp;</p><p>&nbsp;</p><p><span style=\"color: rgb(127, 127, 127);\"><br/></span></p><p>&nbsp;</p></span><span style=\"font-size: 16px;\"><span style=\"font-size: 18px;\"><p>&nbsp;</p><p><span style=\"color: rgb(127, 127, 127);\">&nbsp;(单位cm）(均为人工手量&nbsp;有1-3cm左右误差属正常)</span></p><p><span style=\"color:#ff0000\">&nbsp;</span></p><p><span style=\"color:#ff0000\">*</span><span style=\"color:#7f7f7f\">由于显示器不同，色差难以避免。请参考实拍图已经尽量调到和实物接近</span></p><p><span style=\"color:#7f7f7f\">。</span></p><p><span style=\"color:#7f7f7f\"></span>&nbsp;</p></span></span><p></p><p>-</p><p>-</p><p><img src=\"https://img.alicdn.com/imgextra/i2/373624515/TB2vZatnbFkpuFjy1XcXXclapXa_!!373624515.jpg\" width=\"750\" style=\"border: 0px; vertical-align: top; display: block;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i4/373624515/TB2XoussCBjpuFjSsplXXa5MVXa_!!373624515.jpg\" width=\"750\" style=\"border: 0px; vertical-align: top; display: block;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i2/373624515/TB2zuwav4tmpuFjSZFqXXbHFpXa_!!373624515.jpg\" width=\"750\" style=\"border: 0px; vertical-align: top; display: block;\"/></p></td></tr></tbody></table><p><br/></p>','upload/goods_qrcode/goods_qrcode_11.png','',1,0,0,0,0,0,1,0,'36','',NULL,NULL,0,2,'[]',0.00,0.00,3,'0','0','0','0',0,1499335407,1499335407,NULL,0,0,0,''),
	(12,'西西里男装 夏季潮流男士日系纯色宽松T韩版不规则短袖圆领t恤',0,94,5,28,94,0,'',0,0,1,0.00,158.00,158.00,0.00,0,0,0,0,0.00,0,500,0,0,50,0,0,0,0,0,0,0,37,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>印花主题:&nbsp;其他</p></li><li><p>厚薄:&nbsp;薄</p></li><li><p>品牌类型:&nbsp;设计师品牌</p></li><li><p>袖长:&nbsp;短袖</p></li><li><p>领型:&nbsp;圆领</p></li><li><p>颜色:&nbsp;米白色 黑色</p></li><li><p>尺码:&nbsp;M L XL</p></li><li><p>面料分类:&nbsp;汗布</p></li><li><p>款式细节:&nbsp;不规则</p></li><li><p>服饰工艺:&nbsp;水洗</p></li><li><p>品牌:&nbsp;CHICERRO</p></li><li><p>袖型:&nbsp;常规</p></li><li><p>花型图案:&nbsp;纯色</p></li><li><p>版型:&nbsp;宽松</p></li><li><p>适用季节:&nbsp;夏季</p></li><li><p>上市时间:&nbsp;2017年</p></li><li><p>适用场景:&nbsp;其他休闲</p></li><li><p>适用对象:&nbsp;青少年</p></li><li><p>基础风格:&nbsp;青春流行</p></li><li><p>细分风格:&nbsp;潮</p></li></ul><table cellpadding=\"0\" width=\"750\"><tbody><tr class=\"firstRow\"><td style=\"margin: 0px; padding: 0px; line-height: 0; font-size: 0px;\">@@[[27A::DESCRIPTION::BEGIN]]</td></tr><tr><td style=\"margin: 0px; padding: 0px;\"><p>-</p><p><img src=\"https://img.alicdn.com/imgextra/i4/2030700931/TB28Xc7va8lpuFjy0FpXXaGrpXa_!!2030700931.jpg\" width=\"750\" style=\"border: 0px; vertical-align: top; display: block;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i3/2030700931/TB2JJ1SqgxlpuFjSszbXXcSVpXa_!!2030700931.jpg\" width=\"750\" style=\"border: 0px; vertical-align: top; display: block;\"/></p><p>-</p><p><img src=\"https://img.alicdn.com/imgextra/i2/867963725/TB2QnuegpXXXXc5XXXXXXXXXXXX-867963725.jpg\" width=\"750\" style=\"border: 0px; vertical-align: top; display: block;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i2/2030700931/TB2nq5zoCFjpuFjSszhXXaBuVXa_!!2030700931.jpg_620x10000.jpg\" width=\"330\" style=\"border: 0px; vertical-align: top; display: block;\"/></p><p><span style=\"font-family:宋体\"><br/></span><br/></p><p>&nbsp;</p><p><span style=\"font-family:Arial\"><strong><span style=\"font-size: 18px;\"></span></strong></span></p><p><strong>&nbsp;</strong></p><strong><span style=\"font-size: 20px;\"><p>又到一次上新的时候了</p><p>每次上新我都很激动</p><p>首先我当然是希望销量越高越好</p><p>因为这也是大家对我们的一个肯定</p><p>还有也是看我开发的商品的方向是否有错</p><p>&nbsp;</p><p>每次上新</p><p>对于我来说可以说和双11一样</p><p>平常我们都鲜少打折什么的</p><p>只有上新也有免邮特定的折扣</p><p>&nbsp;</p><p>&nbsp;</p></span></strong><p></p><p><span style=\"font-size: 16px;\"><span style=\"color:#666666\"><br/></span></span></p><p>&nbsp;</p><p><span style=\"color:#666666\"></span></p><p>&nbsp;</p><p></p><p><br/><br/></p><p><span style=\"font-size: 16px;\">◇SIZE(cm)</span></p><p><span style=\"font-size: 16px;\"><br/></span></p><p>&nbsp;</p><p><span style=\"font-size: 16px;\"></span></p><p>M：肩宽54 &nbsp;胸围116 &nbsp; 袖长32 &nbsp;衣长70</p><p></p><p>&nbsp;</p><p>&nbsp;</p><p><span style=\"font-size: 16px;\"></span></p><p>L：肩宽56 &nbsp;胸围110 &nbsp;袖长33 &nbsp;衣长72</p><p></p><p>&nbsp;</p><p>&nbsp;</p><p><span style=\"font-size: 16px;\"></span></p><p>XL：肩宽57 &nbsp;胸围114 &nbsp;袖长34 &nbsp;衣长74</p><p></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p><span style=\"font-size: 16px;\"></span></p><p><span style=\"font-size: 12px;\">以上为手工测量，可能与实物有1-2CM误差，请以收到的实物为准</span>！</p><p></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p><span style=\"font-size: 16px;\"></span></p><p>&nbsp;</p><span style=\"font-size: 16px;\"><p>◇模特试穿：&nbsp;</p></span><p></p><p>&nbsp;</p><p>&nbsp;</p><p><span style=\"font-size: 16px;\"></span></p><p>迟到先生 身高186cm&nbsp;体重68kg&nbsp;试穿XL 宽松</p><p>&nbsp;</p><p>&nbsp;</p><p></p><p><br/><br/></p><p>◇搭配推荐</p><p><img src=\"https://img.alicdn.com/imgextra/i4/2030700931/TB2Qx3paZPRfKJjSZFOXXbKEVXa_!!2030700931.jpg\" class=\"\" width=\"750\" style=\"border: 0px; vertical-align: top; display: block;\"/></p><p>--------</p><p>-</p><p><img src=\"https://img.alicdn.com/imgextra/i1/867963725/TB2X0CzgpXXXXXsXXXXXXXXXXXX-867963725.jpg\" class=\"\" width=\"750\" style=\"border: 0px; vertical-align: top; display: block;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i2/2030700931/TB29dyGrblmpuFjSZFlXXbdQXXa_!!2030700931.jpg\" class=\"\" width=\"750\" style=\"border: 0px; vertical-align: top; display: block;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i4/2030700931/TB2Ps9ermVmpuFjSZFFXXcZApXa_!!2030700931.jpg\" class=\"\" width=\"750\" style=\"border: 0px; vertical-align: top; display: block;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i2/2030700931/TB2YdiermVmpuFjSZFFXXcZApXa_!!2030700931.jpg\" class=\"\" width=\"750\" style=\"border: 0px; vertical-align: top; display: block;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i4/2030700931/TB240iYrm8mpuFjSZFMXXaxpVXa_!!2030700931.jpg\" class=\"\" width=\"750\" style=\"border: 0px; vertical-align: top; display: block;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i2/2030700931/TB2f0GLrdRopuFjSZFtXXcanpXa_!!2030700931.jpg\" class=\"\" width=\"750\" style=\"border: 0px; vertical-align: top; display: block;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i3/2030700931/TB2cOe8rhlmpuFjSZPfXXc9iXXa_!!2030700931.jpg\" class=\"\" width=\"750\" style=\"border: 0px; vertical-align: top; display: block;\"/></p><p><img src=\"https://img.alicdn.com/imgextra/i1/2030700931/TB29jGcor8kpuFjy0FcXXaUhpXa_!!2030700931.jpg\" class=\"\" width=\"750\" style=\"border: 0px; vertical-align: top; display: block;\"/></p></td></tr></tbody></table><p><br/></p>','upload/goods_qrcode/goods_qrcode_12.png','',1,0,0,0,0,0,1,0,'37,38,39,40','',NULL,NULL,0,0,'[]',0.00,0.00,3,'0','0','0','0',0,1499335532,1499335532,NULL,0,0,0,''),
	(13,'夏季港风oversize宽松粉色复古印花bf风短袖ulzzang衬衫男潮',0,94,5,28,94,0,'',0,0,1,0.00,200.00,200.00,0.00,0,0,0,0,0.00,0,995,0,0,97,0,0,0,0,0,0,0,41,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>厚薄:&nbsp;常规</p></li><li><p>袖长:&nbsp;短袖</p></li><li><p>版型:&nbsp;宽松</p></li><li><p>领型:&nbsp;其他</p></li><li><p>颜色:&nbsp;粉红色 现货秒发 白色 现货秒发</p></li><li><p>尺码:&nbsp;M L XL</p></li><li><p>品牌:&nbsp;其他/other</p></li><li><p>材质:&nbsp;其他</p></li><li><p>上市时间:&nbsp;2017年</p></li><li><p>适用场景:&nbsp;其他休闲</p></li><li><p>适用季节:&nbsp;夏季</p></li><li><p>适用对象:&nbsp;青少年</p></li><li><p>基础风格:&nbsp;青春流行</p></li><li><p>细分风格:&nbsp;潮</p></li><li><p>面料功能:&nbsp;免烫</p></li><li><p>图案:&nbsp;其他</p></li><li><p>服饰工艺:&nbsp;其他</p></li><li><p>服装款式细节:&nbsp;印花</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img src=\"https://img.alicdn.com/imgextra/i1/2189296059/TB28Q7AmOlnpuFjSZFgXXbi7FXa_!!2189296059.jpg\" alt=\"\" style=\"border: 0px; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\">&nbsp;</p><h3 style=\"margin: 0px; padding: 22px 0px 0px; font-size: 14px; font-weight: normal; text-align: center; height: 68px; color: rgb(43, 43, 43); background: rgb(247, 247, 247);\"><span class=\"en\" style=\"color: rgb(0, 0, 0); font-size: 16px;\">coordinate</span><br/><span class=\"cn\" style=\"color: rgb(111, 111, 111); font-weight: bold;\">相关商品</span></h3><table width=\"750\" cellspacing=\"0\" cellpadding=\"0\"><tbody><tr class=\"firstRow\"><td align=\"center\" style=\"margin: 0px; padding: 0px;\"><br/></td><td align=\"center\" style=\"margin: 0px; padding: 0px;\"><br/></td><td align=\"center\" style=\"margin: 0px; padding: 0px;\"><br/></td></tr></tbody></table><h3 style=\"margin: 0px; padding: 22px 0px 0px; font-size: 14px; font-weight: normal; text-align: center; height: 68px; color: rgb(43, 43, 43); background: rgb(247, 247, 247);\"><span class=\"en\" style=\"color: rgb(0, 0, 0); font-size: 16px;\">model info</span><br/><span class=\"cn\" style=\"color: rgb(111, 111, 111); font-weight: bold;\">模特信息</span></h3><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img src=\"https://img.alicdn.com/imgextra/i2/2189296059/TB2lGwJmOpnpuFjSZFkXXc4ZpXa_!!2189296059.jpg\" class=\"\" alt=\"\" width=\"250\" height=\"250\" style=\"border: 0px; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><strong><span style=\"color: rgb(102, 102, 102); font-family: verdana;\">男模身高 178cm，体重120 &nbsp;试穿尺码：M &nbsp;效果：合身&nbsp;</span></strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\">&nbsp;</p><h3 style=\"margin: 0px; padding: 22px 0px 0px; font-size: 14px; font-weight: normal; text-align: center; height: 68px; color: rgb(43, 43, 43); background: rgb(247, 247, 247);\"><span class=\"en\" style=\"color: rgb(0, 0, 0); font-size: 16px;\">size info</span><br/><span class=\"cn\" style=\"color: rgb(111, 111, 111); font-weight: bold;\">商品信息</span></h3><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><strong><img src=\"https://img.alicdn.com/imgextra/i3/2189296059/TB2l9NjuXXXXXcUXXXXXXXXXXXX_!!2189296059.png\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"9\" style=\"border: 0px; vertical-align: top; text-align: center; line-height: 1.5; max-width: 750px;\"/></strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><strong><br/></strong></p><table width=\"750\" align=\"center\" cellpadding=\"3\" cellspacing=\"1\" bgcolor=\"#e6e6e6\"><tbody><tr class=\"firstRow\"><td width=\"100\" height=\"30\" align=\"center\" valign=\"middle\" bgcolor=\"#f4f4f4\" style=\"margin: 0px; padding: 0px;\"><br/></td><td width=\"100\" align=\"center\" valign=\"middle\" bgcolor=\"#f4f4f4\" style=\"margin: 0px; padding: 0px;\">肩宽</td><td width=\"100\" align=\"center\" valign=\"middle\" bgcolor=\"#f4f4f4\" style=\"margin: 0px; padding: 0px;\">胸围</td><td width=\"100\" align=\"center\" valign=\"middle\" bgcolor=\"#f4f4f4\" style=\"margin: 0px; padding: 0px;\">长</td><td width=\"100\" align=\"center\" valign=\"middle\" bgcolor=\"#f4f4f4\" style=\"margin: 0px; padding: 0px;\">袖长</td></tr><tr><td width=\"100\" height=\"30\" align=\"center\" valign=\"middle\" bgcolor=\"#f4f4f4\" style=\"margin: 0px; padding: 0px;\">M</td><td width=\"100\" align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\" style=\"margin: 0px; padding: 0px;\">47</td><td width=\"100\" align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\" style=\"margin: 0px; padding: 0px;\">114</td><td width=\"100\" align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\" style=\"margin: 0px; padding: 0px;\">71</td><td width=\"100\" align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\" style=\"margin: 0px; padding: 0px;\">24</td></tr><tr><td width=\"100\" height=\"30\" align=\"center\" valign=\"middle\" bgcolor=\"#f4f4f4\" style=\"margin: 0px; padding: 0px;\">L</td><td width=\"100\" align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\" style=\"margin: 0px; padding: 0px;\">48.5</td><td width=\"100\" align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\" style=\"margin: 0px; padding: 0px;\">118</td><td width=\"100\" align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\" style=\"margin: 0px; padding: 0px;\">72.5</td><td width=\"100\" align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\" style=\"margin: 0px; padding: 0px;\">25</td></tr><tr><td width=\"100\" height=\"30\" align=\"center\" valign=\"middle\" bgcolor=\"#f4f4f4\" style=\"margin: 0px; padding: 0px;\"><p style=\"margin-top: 1.12em; margin-bottom: 1.12em;\">XL</p></td><td width=\"100\" align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\" style=\"margin: 0px; padding: 0px;\">50</td><td width=\"100\" align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\" style=\"margin: 0px; padding: 0px;\">122</td><td width=\"100\" align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\" style=\"margin: 0px; padding: 0px;\">74</td><td width=\"100\" align=\"center\" valign=\"middle\" bgcolor=\"#FFFFFF\" style=\"margin: 0px; padding: 0px;\">26</td></tr></tbody></table><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><strong>&nbsp;</strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><strong><span style=\"color: rgb(153, 153, 153); font-size: 12px;\">&nbsp;手工测量，误差允许在1-3cm左右，具体以实物为准，不作退换依据</span></strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><strong><img src=\"https://img.alicdn.com/imgextra/i1/2189296059/TB2Hi_8kHJkpuFjy1zcXXa5FFXa_!!2189296059.jpg\" class=\"\" alt=\"\" width=\"800\" height=\"68\" style=\"border: 0px; vertical-align: top;\"/>&nbsp;</strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\">&nbsp;</p><h3 style=\"margin: 0px; padding: 22px 0px 0px; font-size: 14px; font-weight: normal; text-align: center; height: 68px; color: rgb(43, 43, 43); background: rgb(247, 247, 247);\"><span class=\"en\" style=\"color: rgb(0, 0, 0); font-size: 16px;\">details</span><br/><span class=\"cn\" style=\"color: rgb(111, 111, 111); font-weight: bold;\">商品描述</span></h3><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><span style=\"font-family: &#39;microsoft yahei&#39;;\"><strong>粉色的衬衫并不多见，特别是男装。<br/></strong></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><strong><span style=\"font-family: &#39;microsoft yahei&#39;;\">透过有趣的手枪图案的重组排列，显得十分有趣，<br/></span></strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><strong><span style=\"font-family: &#39;microsoft yahei&#39;;\">衬衫其实是男性最需要投资的单品之一，<br/></span></strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><strong><span style=\"font-family: &#39;microsoft yahei&#39;;\">印花的衬衫没有素面衬衫的沉闷单调，<br/></span></strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><strong><span style=\"font-family: &#39;microsoft yahei&#39;;\">反而更增添一般可看性，<br/></span></strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><strong><span style=\"font-family: &#39;microsoft yahei&#39;;\">建议下身搭配黑色修身西裤或牛仔裤。<br/></span></strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><strong><span style=\"font-family: &#39;microsoft yahei&#39;;\">之前的版型较宽松，现新增m码和L码，<br/></span></strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><strong><span style=\"font-family: &#39;microsoft yahei&#39;;\">女生喜欢oversize或者bf风衬衫的可选择m码。</span></strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img src=\"https://img.alicdn.com/imgextra/i3/2189296059/TB2KlWueRU4h1JjSZFLXXaFMpXa_!!2189296059.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"750\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><span style=\"font-family: &#39;microsoft yahei&#39;;\"></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/2189296059/TB2E33ZmNBmpuFjSZFsXXcXpFXa_!!2189296059.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"1125\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/2189296059/TB2MWhpmYxmpuFjSZJiXXXauVXa_!!2189296059.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"750\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/2189296059/TB260E9mJFopuFjSZFHXXbSlXXa_!!2189296059.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"750\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/2189296059/TB2ksxdm0RopuFjSZFtXXcanpXa_!!2189296059.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"750\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/2189296059/TB2jQ4gm4hmpuFjSZFyXXcLdFXa_!!2189296059.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"750\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/2189296059/TB2d80xmY4npuFjSZFmXXXl4FXa_!!2189296059.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"750\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i4/2189296059/TB2rvNQhyC9MuFjSZFoXXbUzFXa_!!2189296059.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"500\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/2189296059/TB2Gto0mUlnpuFjSZFjXXXTaVXa_!!2189296059.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"500\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/2189296059/TB268oZmNBmpuFjSZFsXXcXpFXa_!!2189296059.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"500\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/2189296059/TB2dKoymNtmpuFjSZFqXXbHFpXa_!!2189296059.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"1125\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_13.png','',1,0,0,0,0,0,1,0,'41,42,43','',NULL,NULL,0,2,'[]',0.00,0.00,3,'0','0','0','0',0,1499335733,1499335733,NULL,0,0,0,''),
	(14,'夏装清爽字母印花纯棉青少年圆领短袖t恤男韩版修身男士体恤打底T',0,94,5,28,94,0,'',0,0,1,0.00,141.00,141.00,0.00,0,0,0,0,0.00,0,500,0,0,100,3,0,0,0,0,0,0,44,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>印花主题:&nbsp;文字思想</p></li><li><p>厚薄:&nbsp;薄</p></li><li><p>袖长:&nbsp;短袖</p></li><li><p>领型:&nbsp;圆领</p></li><li><p>颜色:&nbsp;白色 卡其色 浅蓝色 浅绿色</p></li><li><p>尺码:&nbsp;M L XL</p></li><li><p>面料分类:&nbsp;其他</p></li><li><p>款式细节:&nbsp;印花</p></li><li><p>品牌:&nbsp;其它/other</p></li><li><p>袖型:&nbsp;常规</p></li><li><p>花型图案:&nbsp;字母数字</p></li><li><p>版型:&nbsp;修身</p></li><li><p>材质:&nbsp;棉</p></li><li><p>棉含量:&nbsp;80%(含)-89%(含)</p></li><li><p>适用季节:&nbsp;夏季</p></li><li><p>上市时间:&nbsp;2017年</p></li><li><p>适用场景:&nbsp;日常</p></li><li><p>适用对象:&nbsp;青少年</p></li><li><p>基础风格:&nbsp;青春流行</p></li><li><p>细分风格:&nbsp;潮</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/2586662122/TB2c5lspMJlpuFjSspjXXcT.pXa_!!2586662122.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center; line-height: 23px;\"><strong style=\"line-height: 1.5;\"><span style=\"color: rgb(153, 153, 153);\">DESCRIPTION.</span></strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center; line-height: 23px;\"><strong><span style=\"color: rgb(153, 153, 153);\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style=\"font-size:10px\">—5.17</span></span></strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center; line-height: 23px;\"><strong><span style=\"color: rgb(153, 153, 153);\"><span style=\"font-size:10px\"></span></span></strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center; line-height: 23.33px;\"><strong style=\"color: rgb(255, 153, 153); line-height: 23.33px;\"><span style=\"font-size:10px\">洗涤方式：轻柔手洗 不可机洗 注意不可垂直晾干容易变形 建议对半挂晾干</span></strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center; line-height: 23.33px;\"><span style=\"color: rgb(255, 153, 153);\"><strong><span style=\"font-size:10px\">面料成分：韩国棉类</span></strong></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center; line-height: 23.33px;\"><span style=\"color:#ff9999;font-size:10px\"><strong>四色清爽颜色的小清新t 简单文字印花带点小亮点</strong></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center; line-height: 23px;\"><span style=\"color: rgb(102, 102, 102); line-height: 18px; font-size: 12px;\">男模特身高175cm 55kg 试穿尺寸：M码（修身效果）</span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center; line-height: 23px;\"><strong><span style=\"color: rgb(102, 102, 102);\"><span style=\"text-decoration:underline;\">size</span></span></strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center; line-height: 23.33px;\"><span style=\"color: rgb(102, 102, 102); line-height: 15px; font-size: 12px;\">&nbsp; &nbsp;M：</span><span style=\"color: rgb(102, 102, 102); line-height: 15px; font-size: 12px;\">肩宽40</span><span style=\"color: rgb(102, 102, 102); line-height: 15px; font-size: 12px;\">&nbsp; 胸围88 &nbsp; &nbsp;衣长63</span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center; line-height: 23.33px;\"><span style=\"color: rgb(102, 102, 102); line-height: 15px; font-size: 12px;\">&nbsp; &nbsp;L：</span><span style=\"color: rgb(102, 102, 102); line-height: 15px; font-size: 12px;\">肩宽41</span><span style=\"color: rgb(102, 102, 102); line-height: 15px; font-size: 12px;\">&nbsp; 胸围92 &nbsp; &nbsp;衣长64</span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center; line-height: 23.33px;\"><span style=\"color: rgb(102, 102, 102); font-size: 12px; line-height: 15px;\">&nbsp;XL：</span><span style=\"color: rgb(102, 102, 102); line-height: 15px; font-size: 12px;\">肩宽42</span><span style=\"color: rgb(102, 102, 102); line-height: 15px; font-size: 12px;\">&nbsp; 胸围96 &nbsp; 衣长65</span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center; line-height: 23px;\"><span style=\"color: rgb(102, 102, 102); line-height: 15px; font-size: 12px;\">XXL：肩宽43&nbsp; 胸围100 &nbsp; &nbsp;衣长66</span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center; line-height: 23px;\"><span style=\"line-height: 1.5;\">&nbsp;&nbsp;</span><span style=\"color: rgb(153, 153, 153); line-height: 1.5; font-size: 12px;\">(单位cm）(均为人工手量 有1-3cm左右误差属正常)</span><span style=\"line-height: 1.5;\">&nbsp;</span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center; line-height: 23px;\"><strong><span style=\"color: rgb(153, 153, 153);\">REFERENCE.</span></strong><span style=\"line-height: 1.5; font-size: 12px;\">&nbsp; &nbsp;</span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center; line-height: 23px;\"><span style=\"color: rgb(64, 64, 64); font-size: 12px; line-height: 1.5;\">*由于显示器不同，色差难以避免。请参考实拍图已经尽量调到和实物接近。</span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center; line-height: 23px;\"><span style=\"color: rgb(64, 64, 64); font-size: 12px; line-height: 1.5;\"><img src=\"https://img.alicdn.com/imgextra/i1/2586662122/TB2BDpwsJFopuFjSZFHXXbSlXXa_!!2586662122.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/2586662122/TB2PV7OsxtmpuFjSZFqXXbHFpXa_!!2586662122.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/2586662122/TB282fbnetTMeFjSZFOXXaTiVXa_!!2586662122.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/2586662122/TB247hNsItnpuFjSZFvXXbcTpXa_!!2586662122.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"650\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/2586662122/TB2LKBBsORnpuFjSZFCXXX2DXXa_!!2586662122.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"650\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/2586662122/TB2ptGsniC9MuFjSZFoXXbUzFXa_!!2586662122.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"650\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/2586662122/TB2lrNLsHlmpuFjSZFlXXbdQXXa_!!2586662122.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"650\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/2586662122/TB2NJt6sHBmpuFjSZFAXXaQ0pXa_!!2586662122.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"650\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></span></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_14.png','',1,0,0,0,0,0,1,0,'44,45','',NULL,NULL,3,2,'[]',0.00,0.00,3,'0','0','0','0',0,1499335890,1499335890,NULL,0,0,0,''),
	(15,'2017新款蝶舞品牌正品OL欧美女包时尚印花包包潮 女士单肩手提包',0,112,7,35,112,0,'',0,0,1,0.00,399.00,399.00,0.00,0,0,0,0,0.00,0,300,0,0,50,0,0,0,0,0,0,0,46,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>大小:&nbsp;中</p></li><li><p>流行款式名称:&nbsp;其他</p></li><li><p>款式:&nbsp;单肩包</p></li><li><p>背包方式:&nbsp;单肩手提</p></li><li><p>质地:&nbsp;PU</p></li><li><p>材质工艺:&nbsp;印花</p></li><li><p>提拎部件类型:&nbsp;软把</p></li><li><p>闭合方式:&nbsp;包盖式</p></li><li><p>内部结构:&nbsp;拉链暗袋 手机袋 证件袋 夹层拉链袋</p></li><li><p>流行元素:&nbsp;印花</p></li><li><p>图案:&nbsp;植物花卉</p></li><li><p>颜色分类:&nbsp;杏黄色 蓝灰色</p></li><li><p>有无夹层:&nbsp;无</p></li><li><p>箱包硬度:&nbsp;软</p></li><li><p>是否可折叠:&nbsp;否</p></li><li><p>成色:&nbsp;全新</p></li><li><p>适用场景:&nbsp;休闲</p></li><li><p>品牌:&nbsp;Butterfly Dance</p></li><li><p>货号:&nbsp;BD1-206</p></li><li><p>风格:&nbsp;欧美时尚</p></li><li><p>形状:&nbsp;横款方形</p></li><li><p>肩带样式:&nbsp;双根</p></li><li><p>里料材质:&nbsp;帆布</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><a target=\"_blank\" href=\"http://diewubag.taobao.com/p/rd070582.htm\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"></a></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/123465365/T2WI97XnRaXXXXXXXX_!!123465365.jpg\" style=\"border: 0px; vertical-align: top; line-height: 1.5;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/123465365/T2FH43XgBcXXXXXXXX_!!123465365.jpg\" style=\"border: 0px; vertical-align: top; margin: 0px; width: 375px; float: none;\"/><a target=\"_blank\" href=\"http://item.taobao.com/item.htm?spm=686.1000925.1000774.9.VjNYv0&id=8328718267\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/123465365/T2z_25XjpXXXXXXXXX_!!123465365.jpg\" style=\"border: 0px; vertical-align: top; margin: 0px; width: 373px; float: none;\"/></a></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><span style=\"line-height: 1.5;\">.</span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\">.</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\">.</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img align=\"absMiddle\" src=\"https://img.alicdn.com/imgextra/i4/123465365/T2ZFSiXeNXXXXXXXXX_!!123465365.jpg\" style=\"border: 0px; vertical-align: top; margin: 0px; width: 750px; float: none;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><span style=\"font-size: 36px;\"><span style=\"font-family: simhei;\"><strong><span style=\"color: rgb(255, 255, 255);\"><span style=\"background-color: rgb(255, 153, 0);\"><span style=\"background-color: rgb(255, 255, 255);\"><img id=\"ids-tag-m-224\" class=\"ke_anchor\" name=\"ids-tag-m-224\" src=\"https://assets.alicdn.com/kissy/1.0.0/build/imglazyload/spaceball.gif\" style=\"border: 0px; vertical-align: top; clear: both; display: block; width: 750px; height: 0px;\"/>～～</span></span></span></strong></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><strong><span style=\"color: rgb(0, 0, 255);\"><span style=\"font-size: 18px;\"><span style=\"font-size: 18pt; text-decoration: underline;\"><span style=\"font-size: 18pt; background-color: rgb(255, 255, 204);\"></span></span></span></span></strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/123465365/TB22l1sfpXXXXb6XXXXXXXXXXXX_!!123465365.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img align=\"absMiddle\" src=\"https://img.alicdn.com/imgextra/i4/123465365/T2YtCiXdlXXXXXXXXX_!!123465365.jpg\" class=\"\" style=\"border: 0px; vertical-align: top; margin: 0px; width: 750px; float: none;\"/>&nbsp;&nbsp;&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img align=\"absMiddle\" src=\"https://img.alicdn.com/imgextra/i1/123465365/T29JKiXdJXXXXXXXXX_!!123465365.jpg\" class=\"\" style=\"border: 0px; vertical-align: top; line-height: 1.5; margin: 0px; width: 750px; float: none;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/123465365/T2Mp6jXX4bXXXXXXXX_!!123465365.jpg\" class=\"\" style=\"border: 0px; vertical-align: top; margin: 0px; width: 750px; float: none;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img align=\"absMiddle\" src=\"https://img.alicdn.com/imgextra/i4/123465365/T2RdGiXfxXXXXXXXXX_!!123465365.jpg\" class=\"\" style=\"border: 0px; vertical-align: top; margin: 0px; width: 750px; float: none;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img align=\"absMiddle\" src=\"https://img.alicdn.com/imgextra/i1/123465365/T2XJKiXe8XXXXXXXXX_!!123465365.jpg\" class=\"\" style=\"border: 0px; vertical-align: top; margin: 0px; width: 750px; float: none;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img align=\"absMiddle\" src=\"https://img.alicdn.com/imgextra/i4/123465365/T2EtKiXetXXXXXXXXX_!!123465365.jpg\" class=\"\" style=\"border: 0px; vertical-align: top; margin: 0px; width: 750px; float: none;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/123465365/TB20tybfpXXXXcgXpXXXXXXXXXX_!!123465365.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img id=\"ids-tag-m-225\" class=\"ke_anchor\" name=\"ids-tag-m-225\" src=\"https://assets.alicdn.com/kissy/1.0.0/build/imglazyload/spaceball.gif\" style=\"border: 0px; vertical-align: top; clear: both; display: block; width: 750px; height: 0px;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img align=\"absMiddle\" src=\"https://img.alicdn.com/imgextra/i4/123465365/T2Wo1hXd0bXXXXXXXX_!!123465365.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_15.png','',1,0,0,0,0,0,1,0,'46,47','',NULL,NULL,0,0,'[]',0.00,0.00,3,'0','0','0','0',0,1499336232,1499336232,NULL,0,0,0,''),
	(16,'欧洲站2017时尚新款立体压花蝴蝶韩版百搭休闲简约手提单肩挎包女',0,112,7,35,112,0,'',0,0,1,0.00,888.00,888.00,0.00,0,0,0,0,0.00,0,500,0,0,100,0,0,0,0,0,0,0,48,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>大小:&nbsp;中</p></li><li><p>流行款式名称:&nbsp;其他</p></li><li><p>适用对象:&nbsp;青年</p></li><li><p>款式:&nbsp;单肩包</p></li><li><p>背包方式:&nbsp;单肩斜挎手提</p></li><li><p>质地:&nbsp;牛皮</p></li><li><p>皮革材质:&nbsp;头层牛皮</p></li><li><p>提拎部件类型:&nbsp;软把</p></li><li><p>闭合方式:&nbsp;拉链</p></li><li><p>内部结构:&nbsp;拉链暗袋 手机袋 证件袋</p></li><li><p>箱包外袋种类:&nbsp;内贴袋</p></li><li><p>流行元素:&nbsp;压花</p></li><li><p>图案:&nbsp;纯色</p></li><li><p>颜色分类:&nbsp;黑色</p></li><li><p>有无夹层:&nbsp;无</p></li><li><p>箱包硬度:&nbsp;软</p></li><li><p>是否可折叠:&nbsp;否</p></li><li><p>成色:&nbsp;全新</p></li><li><p>适用场景:&nbsp;休闲</p></li><li><p>品牌:&nbsp;other/其他</p></li><li><p>货号:&nbsp;5.12-a</p></li><li><p>风格:&nbsp;欧美时尚</p></li><li><p>形状:&nbsp;其他</p></li><li><p>肩带样式:&nbsp;单根</p></li><li><p>里料材质:&nbsp;帆布</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 18px;\"><strong><span style=\"font-size:24px\">收藏本店，新款不断，惊喜不断的！！</span></strong></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><strong style=\"line-height: 1.5;\"><span style=\"font-size:24px\">【材质】：头层牛皮</span></strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 18px;\"><strong><span style=\"font-size:24px\">【背法】：手提&nbsp;单肩 斜挎</span></strong></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 18px;\"><strong><span style=\"font-size:24px\">【尺寸】：底长：（27）cm&nbsp;&nbsp;&nbsp; 高：（20）cm&nbsp; 厚（13.5）cm</span></strong></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 18px;\"><strong><span style=\"font-size:24px\">（不同的人测量方式不同，会存在1-2cm左右的误差属正常）</span></strong></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/2243484660/TB2CLB1pm0jpuFjy0FlXXc0bpXa_!!2243484660.jpg\" align=\"middle\" style=\"border: 0px; vertical-align: top;\"/><img src=\"https://img.alicdn.com/imgextra/i4/2243484660/TB2S_7Fr.hnpuFjSZFpXXcpuXXa_!!2243484660.jpg\" align=\"middle\" style=\"border: 0px; vertical-align: top;\"/><img src=\"https://img.alicdn.com/imgextra/i3/2243484660/TB2uVprsb4npuFjSZFmXXXl4FXa_!!2243484660.jpg\" align=\"middle\" style=\"border: 0px; vertical-align: top;\"/><img src=\"https://img.alicdn.com/imgextra/i4/2243484660/TB2KMdXpmXlpuFjy0FeXXcJbFXa_!!2243484660.jpg\" align=\"middle\" style=\"border: 0px; vertical-align: top;\"/><img src=\"https://img.alicdn.com/imgextra/i4/2243484660/TB2ip1hpl8kpuFjSspeXXc7IpXa_!!2243484660.jpg\" class=\"\" align=\"middle\" style=\"border: 0px; vertical-align: top;\"/><img src=\"https://img.alicdn.com/imgextra/i2/2243484660/TB2ds8LwJ0opuFjSZFxXXaDNVXa_!!2243484660.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_16.png','',1,0,0,0,0,0,1,0,'48,49,50','',NULL,NULL,0,0,'[]',0.00,0.00,3,'0','0','0','0',0,1499336321,1499336321,NULL,0,0,0,''),
	(17,'浅米草2017秋冬真皮女包牛皮编织手提包单肩斜跨包水桶包休闲复古',0,112,7,35,112,0,'',0,0,1,0.00,354.00,354.00,0.00,0,0,0,0,0.00,0,500,0,0,50,0,0,0,0,0,0,0,51,'','','<p class=\"attr-list-hd tm-clear\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 20px; line-height: 22px; color: rgb(153, 153, 153);\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; float: left;\">产品参数：</span></p><ul id=\"J_AttrUL\" style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>上市时间:&nbsp;2016年秋季</p></li><li><p>大小:&nbsp;中</p></li><li><p>流行款式名称:&nbsp;水桶包</p></li><li><p>款式:&nbsp;单肩包</p></li><li><p>背包方式:&nbsp;单肩斜挎手提</p></li><li><p>质地:&nbsp;牛皮</p></li><li><p>皮革材质:&nbsp;牛皮</p></li><li><p>提拎部件类型:&nbsp;硬把</p></li><li><p>闭合方式:&nbsp;磁扣</p></li><li><p>流行元素:&nbsp;编织</p></li><li><p>颜色分类:&nbsp;棕色&nbsp;黑色&nbsp;墨绿&nbsp;酒红&nbsp;深蓝（预定）</p></li><li><p>有无夹层:&nbsp;有</p></li><li><p>箱包硬度:&nbsp;硬</p></li><li><p>成色:&nbsp;全新</p></li><li><p>品牌:&nbsp;浅米草</p></li><li><p>货号:&nbsp;1610014</p></li><li><p>风格:&nbsp;复古</p></li><li><p>形状:&nbsp;水桶形</p></li><li><p>肩带样式:&nbsp;单根</p></li></ul><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><span style=\"margin: 0px; padding: 0px;\"></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.4;\"><a href=\"https://detail.tmall.com/item.htm?spm=a1z10.1-b.w11085613-15494838521.1.bdsVJD&id=537823344485&skuId=3211568877166&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px;\"><img src=\"https://gdp.alicdn.com/imgextra/i1/2091202669/TB2KTW7cSiJ.eBjSszfXXa4bVXa_!!2091202669.jpg\" alt=\" 790-2.jpg\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></a></p><p></p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><span style=\"margin: 0px; padding: 0px;\"></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.4;\"><a href=\"https://detail.tmall.com/item.htm?spm=a1z10.1-b.w11085613-15495591476.1.bdsVJD&id=540411201882&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px;\"><img src=\"https://gdp.alicdn.com/imgextra/i2/2091202669/TB2vk0tdmmK.eBjSZPfXXce2pXa_!!2091202669.jpg\" alt=\" 790-1.jpg\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></a><br style=\"margin: 0px; padding: 0px;\"/></p><p></p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><span style=\"margin: 0px; padding: 0px;\"></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.4;\"><a href=\"https://detail.tmall.com/item.htm?spm=a1z10.1-b.w11085613-15495559893.1.bdsVJD&id=540446769618&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px;\"><img src=\"https://gdp.alicdn.com/imgextra/i4/2091202669/TB2cI6Scr1K.eBjSsphXXcJOXXa_!!2091202669.jpg\" alt=\" 790-3.jpg\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></a><br style=\"margin: 0px; padding: 0px;\"/></p><p></p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4; text-align: center;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2091202669/TB2gF8ot3FkpuFjSspnXXb4qFXa_!!2091202669.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2091202669/TB23.G.exlmpuFjSZPfXXc9iXXa_!!2091202669.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2091202669/TB2XM1xd9iJ.eBjSspiXXbqAFXa_!!2091202669.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2091202669/TB2NdyidZaJ.eBjy0FbXXcwrFXa_!!2091202669.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/></p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_17.png','',1,0,0,0,0,0,1,0,'51','',NULL,NULL,0,3,'[]',0.00,0.00,3,'0','0','0','0',0,1499336542,1499336542,NULL,0,0,0,''),
	(18,'定制 ROCKY | 独立设计 立体蝴蝶结 皮绳单肩/双肩包 可拆环扣 限量',0,112,7,35,112,0,'',0,0,1,0.00,588.00,588.00,0.00,0,0,0,0,0.00,0,900,0,0,200,0,0,0,0,0,0,0,52,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>流行款式名称:&nbsp;其他</p></li><li><p>款式:&nbsp;单肩包</p></li><li><p>背包方式:&nbsp;双肩单肩</p></li><li><p>质地:&nbsp;涤纶</p></li><li><p>颜色分类:&nbsp;白色微瑕疵清仓 白色</p></li><li><p>品牌:&nbsp;other/其他</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img alt=\"\" src=\"https://img.alicdn.com/imgextra/i1/2135285748/TB2Zy5stFXXXXcSXXXXXXXXXXXX_!!2135285748.jpg\" style=\"border: 0px; vertical-align: top;\"/><img alt=\"\" src=\"https://img.alicdn.com/imgextra/i2/2135285748/TB2OTuwaqi5V1Bjy1zkXXcL4VXa_!!2135285748.jpg\" style=\"border: 0px; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img alt=\"\" src=\"https://img.alicdn.com/imgextra/i2/2135285748/TB2cij.avbA11Bjy0FgXXXYEFXa_!!2135285748.jpg\" style=\"border: 0px; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img alt=\"\" src=\"https://img.alicdn.com/imgextra/i3/2135285748/TB26.gGazzB11BjSspaXXcJ0VXa_!!2135285748.jpg\" style=\"border: 0px; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img alt=\"\" src=\"https://img.alicdn.com/imgextra/i1/2135285748/TB2Te_5axLA11Bjy0FeXXbmzFXa_!!2135285748.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><strong>面料：立体提花面料</strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><br/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><strong>SIZE：</strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><strong>30*35cm</strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img alt=\"\" src=\"https://img.alicdn.com/imgextra/i1/2135285748/TB2GNr.aATB11BjSspbXXbhcVXa_!!2135285748.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2135285748/TB2aX4mh9JjpuFjy0FdXXXmoFXa_!!2135285748.jpg\" class=\"\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2135285748/TB2bzoKhR0kpuFjy1zdXXXuUVXa_!!2135285748.jpg\" class=\"\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2135285748/TB2JWE3jbBmpuFjSZFuXXaG_XXa_!!2135285748.jpg\" class=\"\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2135285748/TB2PFk9jb4npuFjSZFmXXXl4FXa_!!2135285748.jpg\" class=\"\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2135285748/TB2Zz3RjblmpuFjSZFlXXbdQXXa_!!2135285748.jpg\" class=\"\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2135285748/TB2HiZ2jm8mpuFjSZFMXXaxpVXa_!!2135285748.jpg\" class=\"\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2135285748/TB2ei7RjilnpuFjSZFgXXbi7FXa_!!2135285748.jpg\" class=\"\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2135285748/TB2IgwwjmVmpuFjSZFFXXcZApXa_!!2135285748.jpg\" class=\"\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2135285748/TB2hsN4ab_0UKFjy1XaXXbKfXXa_!!2135285748.jpg\" class=\"\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2135285748/TB2ds0pd5C9MuFjSZFoXXbUzFXa_!!2135285748.jpg\" class=\"\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img alt=\"\" src=\"https://img.alicdn.com/imgextra/i2/2135285748/TB2vsv4auzz11Bjy1XdXXbfqVXa_!!2135285748.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2135285748/TB284UQjohnpuFjSZFEXXX0PFXa_!!2135285748.jpg\" class=\"\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_18.png','',1,0,0,0,0,0,1,0,'52,53,54,55','',NULL,NULL,0,0,'[]',0.00,0.00,3,'0','0','0','0',0,1499336676,1499336676,NULL,0,0,0,''),
	(19,'真皮女包2017夏新款单肩斜跨包H扣鳄鱼纹时尚潮流百搭女士小方包',0,112,7,35,112,0,'',0,0,1,0.00,178.00,178.00,0.00,0,0,0,0,0.00,0,500,0,0,100,0,0,0,0,0,0,0,56,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>大小:&nbsp;小</p></li><li><p>流行款式名称:&nbsp;小方包</p></li><li><p>适用对象:&nbsp;青年</p></li><li><p>款式:&nbsp;斜挎包</p></li><li><p>背包方式:&nbsp;斜挎包</p></li><li><p>质地:&nbsp;牛皮</p></li><li><p>皮革材质:&nbsp;头层牛皮</p></li><li><p>闭合方式:&nbsp;磁扣</p></li><li><p>内部结构:&nbsp;拉链暗袋</p></li><li><p>流行元素:&nbsp;鳄鱼纹</p></li><li><p>图案:&nbsp;纯色</p></li><li><p>颜色分类:&nbsp;红色 灰色 蓝色 黑色</p></li><li><p>有无夹层:&nbsp;无</p></li><li><p>箱包硬度:&nbsp;软</p></li><li><p>是否可折叠:&nbsp;否</p></li><li><p>成色:&nbsp;全新</p></li><li><p>适用场景:&nbsp;休闲</p></li><li><p>品牌:&nbsp;other/其他</p></li><li><p>风格:&nbsp;时尚潮流</p></li><li><p>形状:&nbsp;方盒形</p></li><li><p>肩带样式:&nbsp;单根</p></li><li><p>里料材质:&nbsp;涤棉</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/2942624708/TB2uBtbActnpuFjSZFKXXalFFXa_!!2942624708.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/2942624708/TB2mbHJvMRkpuFjy1zeXXc.6FXa_!!2942624708.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/2942624708/TB2f6lSAhhmpuFjSZFyXXcLdFXa_!!2942624708.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/2942624708/TB2q60UfBU4h1JjSZFLXXaFMpXa_!!2942624708.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/2942624708/TB2QU3uz4tmpuFjSZFqXXbHFpXa_!!2942624708.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/2942624708/TB22E7uz4tmpuFjSZFqXXbHFpXa_!!2942624708.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_19.png','',1,0,0,0,0,0,1,0,'56,57','',NULL,NULL,0,0,'[]',0.00,0.00,3,'0','0','0','0',0,1499336753,1499336753,NULL,0,0,0,''),
	(20,'旅游双肩包女欧洲站2016新款立体蝴蝶轻便时尚百搭欧美高档背包潮',0,112,7,35,112,0,'',0,0,1,0.00,500.00,500.00,0.00,0,0,0,0,0.00,0,991,0,0,100,0,0,0,0,0,0,0,58,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>大小:&nbsp;大</p></li><li><p>适用对象:&nbsp;青年</p></li><li><p>防水程度:&nbsp;防泼水</p></li><li><p>性别:&nbsp;女</p></li><li><p>质地:&nbsp;牛皮</p></li><li><p>皮革材质:&nbsp;牛皮+牛津布</p></li><li><p>提拎部件类型:&nbsp;硬把</p></li><li><p>闭合方式:&nbsp;拉链</p></li><li><p>内部结构:&nbsp;拉链暗袋 手机袋 证件袋</p></li><li><p>箱包外袋种类:&nbsp;内贴袋</p></li><li><p>流行元素:&nbsp;撞色</p></li><li><p>图案:&nbsp;纯色</p></li><li><p>颜色分类:&nbsp;黑色随机</p></li><li><p>有无夹层:&nbsp;无</p></li><li><p>箱包硬度:&nbsp;软</p></li><li><p>是否可折叠:&nbsp;否</p></li><li><p>成色:&nbsp;全新</p></li><li><p>适用场景:&nbsp;休闲</p></li><li><p>品牌:&nbsp;other/其他</p></li><li><p>货号:&nbsp;4.20c</p></li><li><p>风格:&nbsp;欧美时尚</p></li><li><p>形状:&nbsp;其他</p></li><li><p>肩带样式:&nbsp;三根</p></li><li><p>里料材质:&nbsp;帆布</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 18px;\"><strong><span style=\"font-size:24px\"></span></strong></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 18px;\"><strong><span style=\"font-size:24px\">收藏本店，新款不断，惊喜不断的！！</span></strong></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><strong style=\"line-height: 1.5;\"><span style=\"font-size:24px\">【材质】：头层牛皮</span></strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 18px;\"><strong><span style=\"font-size:24px\">【背法】：双肩 单肩</span></strong></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 18px;\"><strong><span style=\"font-size:24px\">【尺寸】：底长：（30）cm&nbsp;&nbsp;&nbsp; 高：（35）cm&nbsp; 厚：（14）cm</span></strong></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 18px;\"><strong><span style=\"font-size:24px\">（不同的人测量方式不同，会存在1-2cm左右的误差属正常）</span></strong></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i2/3160923447/TB25Bu5mCJjpuFjy0FdXXXmoFXa_!!3160923447.jpg\" style=\"border: 0px; vertical-align: top;\"/><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i4/3160923447/TB2Psv8oNtmpuFjSZFqXXbHFpXa_!!3160923447.jpg\" style=\"border: 0px; vertical-align: top;\"/><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i1/3160923447/TB2wU7OoJ0opuFjSZFxXXaDNVXa_!!3160923447.jpg\" style=\"border: 0px; vertical-align: top;\"/><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i1/3160923447/TB2hQJZmChlpuFjSspkXXa1ApXa_!!3160923447.jpg\" style=\"border: 0px; vertical-align: top;\"/><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i2/3160923447/TB2gr9mmB4lpuFjy1zjXXcAKpXa_!!3160923447.jpg\" class=\"\" width=\"750\" height=\"499\" style=\"border: 0px; vertical-align: top;\"/><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i4/3160923447/TB2XPpYmxdkpuFjy0FbXXaNnpXa_!!3160923447.jpg\" class=\"\" width=\"750\" height=\"1127\" style=\"border: 0px; vertical-align: top;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_20.png','',1,0,0,0,0,0,1,0,'58,59,60,61','',NULL,NULL,0,3,'[]',0.00,0.00,3,'0','0','0','0',0,1499336895,1499336895,NULL,0,0,0,''),
	(21,'德国brita碧然德即热净水吧家用厨房自来水过滤壶电热直饮净水器',0,84,4,24,84,0,'',0,0,1,0.00,510.00,510.00,0.00,0,0,0,0,0.00,0,100,0,0,20,0,0,0,0,0,0,0,62,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>产品名称:&nbsp;BRITA/碧然德 即热净水吧</p></li><li><p>净水器品牌:&nbsp;BRITA/碧然德</p></li><li><p>型号:&nbsp;即热净水吧</p></li><li><p>分类:&nbsp;净水壶 过滤水壶 净水杯 净水设备</p></li><li><p>智能类型:&nbsp;阿里小智</p></li><li><p>货号:&nbsp;BRD0032</p></li><li><p>颜色分类:&nbsp;即热净水吧（一机一芯）顺丰包邮 即热净水吧（一机一芯）圆通包邮</p></li><li><p>额定出水量:&nbsp;60L/h</p></li><li><p>工作原理:&nbsp;活性炭</p></li><li><p>滤芯:&nbsp;活性炭+超滤</p></li><li><p>使用位置:&nbsp;终端净水</p></li><li><p>功效:&nbsp;直饮</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><span style=\"font-size: 18px;\"><span style=\"color: rgb(255, 0, 0);\"></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 24px;\">（可开正规机打发票，需要发票的联系客服，或订单留言发票抬头）</span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 18px; line-height: 1.5;\">&nbsp; &nbsp; &nbsp; &nbsp;备注：没有联系客服和未留言发票抬头默认不开票哦</span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><strong><strong style=\"line-height: 1.5; color: rgb(0, 0, 255);\"><span style=\"font-size: 24px;\">净水吧凭发票和质保卡可享受碧然德官方一年免费质保</span></strong></strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/753957799/TB24pq3ct4opuFjSZFLXXX8mXXa-753957799.jpg\" alt=\" 750-500.jpg\" style=\"border: 0px; vertical-align: top;\"/></p><p><a href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c-s.w4002-14464934839.27.qusgMV&id=543745667439\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/753957799/TB2LhIRgR0lpuFjSszdXXcdxFXa-753957799.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: middle;\"/></a><a href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c-s.w4002-14464934839.39.qusgMV&id=543730750070\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/753957799/TB2MimKidFopuFjSZFHXXbSlXXa-753957799.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: middle;\"/></a><a href=\"https://item.taobao.com/item.htm?spm=2013.1.w5001-14464934798.2.n07e26&id=528384353675&scene=taobao_shop\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/753957799/TB2Aqe7ib4npuFjSZFmXXXl4FXa-753957799.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: middle;\"/><img src=\"https://img.alicdn.com/imgextra/i4/753957799/TB2c.oaxblmpuFjSZFlXXbdQXXa_!!753957799.jpg\" class=\"\" align=\"absmiddle\" width=\"375\" height=\"328\" style=\"border: 0px; vertical-align: middle;\"/></a><br/><br/><img src=\"https://img.alicdn.com/imgextra/i2/753957799/TB2yMZ_rVXXXXcEXXXXXXXXXXXX-753957799.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"662\" style=\"border: 0px; vertical-align: middle; line-height: 1.5; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/753957799/TB2KIBasXXXXXX1XXXXXXXXXXXX-753957799.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"693\" style=\"border: 0px; vertical-align: middle; line-height: 1.5; max-width: 750px;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/753957799/TB2zRejepXXXXX5XpXXXXXXXXXX-753957799.jpg_q90.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/753957799/TB2OyLvyCVmpuFjSZFFXXcZApXa_!!753957799.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"433\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/753957799/TB2UbkfystnpuFjSZFvXXbcTpXa_!!753957799.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"269\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/753957799/TB2ef.Rf9FjpuFjSspbXXXagVXa-753957799.jpg_q90.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/><br/><img src=\"https://img.alicdn.com/imgextra/i2/753957799/TB2UGY5yypnpuFjSZFIXXXh2VXa_!!753957799.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"250\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/753957799/TB2FtjsyAqvpuFjSZFhXXaOgXXa_!!753957799.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"738\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/753957799/TB2wIGxeZPRfKJjSZFOXXbKEVXa_!!753957799.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"759\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><a target=\"_blank\" href=\"https://purewaylife.taobao.com/category-402114160.htm?spm=a1z10.1-c.w5002-4731072012.3.bQuFzA&search=y&catName=%5B%B5%C2%5DBrita%B1%CC%C8%BB%B5%C2\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px; text-align: center;\"></a></p><p><span style=\"line-height: 1.5;\"><img src=\"https://img.alicdn.com/imgextra/i2/753957799/TB2Zwoff3JkpuFjSszcXXXfsFXa-753957799.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"536\" style=\"border: 0px; vertical-align: middle; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/753957799/TB2Kf.yf9tkpuFjy0FhXXXQzFXa-753957799.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"668\" style=\"border: 0px; vertical-align: middle; max-width: 750px;\"/></span></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_21.png','',1,0,0,0,0,0,1,0,'62,63,64','',NULL,NULL,0,0,'[]',0.00,0.00,3,'0','0','0','0',0,1499337154,1499337154,NULL,0,0,0,''),
	(22,'飞利浦空气炸锅HD9233家用智能无油多功能电炸锅大容量HD9627正品',0,84,4,24,84,0,'',0,0,1,0.00,999.00,999.00,0.00,0,0,0,0,0.00,0,1000,0,0,100,0,0,0,0,0,0,0,65,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>CCC证书编号:&nbsp;<a href=\"https://baike.taobao.com/view.htm?wd=2013010712631704&ac=29\" target=\"blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\">2013010712631704</a></p></li><li><p>产品名称:&nbsp;Philips/飞利浦 HD9233</p></li><li><p>品牌:&nbsp;Philips/飞利浦</p></li><li><p>型号:&nbsp;HD9233</p></li><li><p>采购地:&nbsp;中国大陆</p></li><li><p>颜色分类:&nbsp;HD9233白色</p></li><li><p>电炸锅类型:&nbsp;空气炸锅</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/55859635/TB2Wnz1zH4npuFjSZFmXXXl4FXa_!!55859635.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/55859635/TB2OWrHe_AKh1JjSZFDXXbKlFXa_!!55859635.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/55859635/TB2ONuvugNlpuFjy0FfXXX3CpXa_!!55859635.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/55859635/TB2RO5Uul0kpuFjSsziXXa.oVXa_!!55859635.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/55859635/TB2B8bjugRkpuFjy1zeXXc.6FXa_!!55859635.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"688\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/55859635/TB2ks6AueJ8puFjy1XbXXagqVXa_!!55859635.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"1038\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/55859635/TB2Xua_ubFlpuFjy0FgXXbRBVXa_!!55859635.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"786\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_22.png','',1,0,0,0,0,0,1,0,'65,66,67','',NULL,NULL,0,0,'[]',0.00,0.00,3,'0','0','0','0',0,1499337367,1499337367,NULL,0,0,0,''),
	(23,'天天特价小熊养生壶全自动加厚玻璃多功能煮花茶壶正品官方煮茶器',0,84,4,24,84,0,'',0,0,1,0.00,179.00,179.00,0.00,0,0,0,0,0.00,0,500,0,0,100,0,0,0,0,0,0,0,68,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>CCC证书编号:&nbsp;<a href=\"https://baike.taobao.com/view.htm?wd=2016010717884705&ac=29\" target=\"blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\">2016010717884705</a></p></li><li><p>产品名称:&nbsp;Bear/小熊 YSH-A15E1</p></li><li><p>品牌:&nbsp;Bear/小熊</p></li><li><p>型号:&nbsp;YSH-A15E1</p></li><li><p>智能类型:&nbsp;不支持智能</p></li><li><p>采购地:&nbsp;中国大陆</p></li><li><p>颜色分类:&nbsp;粉色</p></li><li><p>材质:&nbsp;高硼硅玻璃</p></li><li><p>容量:&nbsp;2L及以下</p></li></ul><p><img class=\"logo\" title=\"服务承诺\" src=\"https://img.alicdn.com/tps/TB1BjBpOVXXXXXCaXXXXXXXXXXX-78-22.png\" srcset=\"//img.alicdn.com/tps/TB1wGBEOVXXXXavXFXXXXXXXXXX-156-44.png\" style=\"border-width: 0px 1px 0px 0px; border-right-style: solid; border-right-color: rgb(0, 0, 0); vertical-align: middle; display: inline-block; height: 22px; margin-right: 5px; padding-right: 10px;\"/>&nbsp;<span style=\"display: inline-block; vertical-align: middle; line-height: 30px;\">专享服务承诺</span></p><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p><img class=\"icon\" src=\"https://img.alicdn.com/tps/TB17DgYOFXXXXbmXXXXXXXXXXXX-48-48.png\" srcset=\"//img.alicdn.com/tps/TB1DwclOFXXXXawapXXXXXXXXXX-96-96.png\" style=\"border: 0px; vertical-align: middle; display: inline-block; width: 48px; height: 48px;\"/></p></li><ul style=\"margin: 0px 40px 0px 0px; padding: 0px; color: rgb(51, 51, 51); overflow: hidden;\" class=\" list-paddingleft-2\"><li><p>全国包邮</p></li><li><p>卖家承担从卖家处发货到您收货地址处的大陆非偏远地区首次发货的运费。</p></li></ul><li><p><img class=\"icon\" src=\"https://img.alicdn.com/tps/TB1jhB5OVXXXXX1XpXXXXXXXXXX-48-48.png\" srcset=\"//img.alicdn.com/tps/TB1K4XKOVXXXXbhXVXXXXXXXXXX-96-96.png\" style=\"border: 0px; vertical-align: middle; display: inline-block; width: 48px; height: 48px;\"/></p></li><ul style=\"margin: 0px 40px 0px 0px; padding: 0px; color: rgb(51, 51, 51); overflow: hidden;\" class=\" list-paddingleft-2\"><li><p>退货运费险</p></li><li><p>卖家承诺提供退货运费险，在交易成功前，消费者发起退货请求，保险公司对退货产生的单程运费提供保险服务。</p></li></ul><li><p><img class=\"icon\" src=\"https://img.alicdn.com/tps/TB1sS3DOFXXXXcUXFXXXXXXXXXX-48-48.png\" srcset=\"//img.alicdn.com/tps/TB1hVZoOFXXXXXmapXXXXXXXXXX-96-96.png\" style=\"border: 0px; vertical-align: middle; display: inline-block; width: 48px; height: 48px;\"/></p></li><ul style=\"margin: 0px 40px 0px 0px; padding: 0px; color: rgb(51, 51, 51); overflow: hidden;\" class=\" list-paddingleft-2\"><li><p>48小时发货</p></li><li><p>卖家承诺在您付款后的48小时内完成发货，以快递公司系统内揽件记录的时间为准（定制、预售、大家电、家具等特殊类目除外）。</p></li></ul><li><p><img class=\"icon\" src=\"https://img.alicdn.com/tps/TB1jy3COFXXXXXsXVXXXXXXXXXX-48-48.png\" srcset=\"//img.alicdn.com/tps/TB1jHZuOFXXXXXgaXXXXXXXXXXX-96-96.png\" style=\"border: 0px; vertical-align: middle; display: inline-block; width: 48px; height: 48px;\"/></p></li><ul style=\"margin: 0px 40px 0px 0px; padding: 0px; color: rgb(51, 51, 51); overflow: hidden;\" class=\" list-paddingleft-2\"><li><p>质无忧</p></li><li><p>商家承诺所售商品如因“不喜欢/不想要/不适合”或质量问题发生退货退款，可向交易诚信记录良好的消费者提供闪电退货和极速退款服务。</p></li></ul><li><p><img class=\"icon\" src=\"https://img.alicdn.com/tps/TB1evsgOFXXXXchapXXXXXXXXXX-48-48.png\" srcset=\"//img.alicdn.com/tps/TB18ZIGOFXXXXb_XFXXXXXXXXXX-96-96.png\" style=\"border: 0px; vertical-align: middle; display: inline-block; width: 48px; height: 48px;\"/></p></li><ul style=\"margin: 0px 40px 0px 0px; padding: 0px; color: rgb(51, 51, 51); overflow: hidden;\" class=\" list-paddingleft-2\"><li><p>十五天无理由退货</p></li><li><p>卖家承诺提供15天无理由退货服务，即您签收货物后15天内，在不影响商家的二次销售的情况下，可以无条件申请退货的服务。</p></li></ul></ul><p><a style=\"color: rgb(51, 102, 204); outline: 0px;\" name=\"begin_upTpl242740\"></a></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><a target=\"_blank\" href=\"https://taoquan.taobao.com/coupon/unify_apply.htm?sellerId=2730531117&activityId=090a5bf9214f46d5ad097e791b0c2ca8\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2730531117/TB2nwoonctnpuFjSZFKXXalFFXa_!!2730531117.jpg\" style=\"border: 0px; vertical-align: top; float: none; margin: 0px;\"/></a><img src=\"https://img.alicdn.com/imgextra/i4/2730531117/TB2r0jQv9tkpuFjy0FhXXXQzFXa_!!2730531117.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top;\"/><img src=\"https://img.alicdn.com/imgextra/i4/2730531117/TB2zATqv3NlpuFjy0FfXXX3CpXa_!!2730531117.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top;\"/><img src=\"https://img.alicdn.com/imgextra/i2/2730531117/TB2TqQnvYXlpuFjy1zbXXb_qpXa_!!2730531117.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2730531117/TB2FAElkrJmpuFjSZFwXXaE4VXa_!!2730531117.jpg\" class=\"\" width=\"750\" height=\"900\" style=\"border: 0px; vertical-align: top; float: none; margin: 0px;\"/><img usemap=\"#Map1\" src=\"https://img.alicdn.com/imgextra/i4/2730531117/TB2qOQDabBnpuFjSZFGXXX51pXa_!!2730531117.jpg\" class=\"\" width=\"750\" height=\"1050\" style=\"border: 0px; vertical-align: top;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_23.png','',1,0,0,0,0,0,1,0,'68,69','',NULL,NULL,0,0,'[]',0.00,0.00,3,'0','0','0','0',0,1499337512,1499337512,NULL,0,0,0,''),
	(24,'小狗家用吸尘器大功率小型桶式静音地毯商用强力手持式D-807',0,84,4,24,84,0,'',0,0,1,0.00,299.00,299.00,0.00,0,0,0,0,0.00,0,1000,0,0,200,0,0,0,0,0,0,0,70,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>CCC证书编号:&nbsp;<a href=\"https://baike.taobao.com/view.htm?wd=2016010708910041&ac=29\" target=\"blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\">2016010708910041</a></p></li><li><p>产品名称:&nbsp;小狗 D-807</p></li><li><p>功率:&nbsp;1400W</p></li><li><p>吸尘器品牌:&nbsp;小狗</p></li><li><p>小狗吸尘器型号:&nbsp;D-807</p></li><li><p>最大噪音:&nbsp;72dB</p></li><li><p>采购地:&nbsp;中国大陆</p></li><li><p>颜色分类:&nbsp;深红色</p></li><li><p>功能:&nbsp;干湿两用式</p></li><li><p>吸尘器类型:&nbsp;立式(含筒式)</p></li><li><p>储尘类型:&nbsp;尘盒</p></li><li><p>线长:&nbsp;10m及以上</p></li><li><p>特殊吸嘴类型:&nbsp;扁吸嘴，圆毛刷，升级版高效地刷 刮水刷</p></li><li><p>功率:&nbsp;1400W</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/2473867179/TB26D04yipnpuFjSZFIXXXh2VXa_!!2473867179.jpg\" style=\"border: 0px; vertical-align: top; display: block; margin: 0px auto; padding: 1px 0px; cursor: cell;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img align=\"absmiddle\" style=\"border: 0px; vertical-align: top; width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2473867179/TB2paitg9hlpuFjSspkXXa1ApXa_!!2473867179.jpg\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2473867179/TB2NB3ZibBmpuFjSZFuXXaG_XXa_!!2473867179.jpg\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2473867179/TB2FP_Ul9hlpuFjSspkXXa1ApXa_!!2473867179.jpg\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2473867179/TB2.NdooEhnpuFjSZFEXXX0PFXa_!!2473867179.jpg\" class=\"\" width=\"790\" height=\"633\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2473867179/TB2oRRrg9B0XKJjSZFsXXaxfpXa_!!2473867179.jpg\" class=\"\" width=\"790\" height=\"900\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2473867179/TB20Kk.rthvOuFjSZFBXXcZgFXa_!!2473867179.jpg\" class=\"\" width=\"790\" height=\"779\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2473867179/TB2fE9rxUdnpuFjSZPhXXbChpXa_!!2473867179.jpg\" class=\"\" width=\"790\" height=\"692\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2473867179/TB2DquFxJRopuFjSZFtXXcanpXa_!!2473867179.jpg\" class=\"\" width=\"790\" height=\"650\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_24.png','',1,0,0,0,0,0,1,0,'70,71','',NULL,NULL,0,0,'[]',0.00,0.00,3,'0','0','0','0',0,1499337621,1499337621,NULL,0,0,0,''),
	(25,'美的取暖器 电暖器家用 对流节能烤火炉立式婴儿浴室宝宝洗澡暖气',0,84,4,24,84,0,'',0,0,1,0.00,209.00,209.00,0.00,0,0,0,0,0.00,0,1000,0,0,100,0,0,0,0,0,0,0,72,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>CCC证书编号:&nbsp;<a href=\"https://baike.taobao.com/view.htm?wd=2015010707796819&ac=29\" target=\"blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\">2015010707796819</a></p></li><li><p>产品名称:&nbsp;Midea/美的 NDK20-16H1W</p></li><li><p>取暖器加热方式:&nbsp;电热丝</p></li><li><p>品牌:&nbsp;Midea/美的</p></li><li><p>美的取暖器型号:&nbsp;NDK20-16H1W</p></li><li><p>智能类型:&nbsp;不支持智能</p></li><li><p>最大采暖面积(平方米):&nbsp;20m^2以下</p></li><li><p>电暖器最大功率:&nbsp;1200W(含)-2000W(含)</p></li><li><p>采购地:&nbsp;中国大陆</p></li><li><p>颜色分类:&nbsp;香槟色</p></li><li><p>适用面积:&nbsp;11m^2 (含)-20m^2 (含)</p></li><li><p>档位:&nbsp;3档</p></li></ul><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 0px; height: 0px; overflow: hidden;\"><img src=\"https://img.alicdn.com/imgextra/i4/T2s4moXH8XXXXXXXXX-350475995.png?p=hb_v3_client_751411_start_top_1\" style=\"border: 0px; vertical-align: top;\"/></p><p style=\"margin-top: 0px; padding: 0px; width: 0px; height: 0px; overflow: hidden;\"><br/><img src=\"https://img.alicdn.com/imgextra/i4/T2s4moXH8XXXXXXXXX-350475995.png?p=hb_v3_client_751411_end_top_1\" style=\"border: 0px; vertical-align: top;\"/></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 0px; height: 0px; overflow: hidden;\"><br/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); text-align: center;\"><span style=\"margin: 0px; padding: 0px; font-size: 36px;\"><span style=\"margin: 0px; padding: 0px; font-family: lisu;\"><span style=\"margin: 0px; padding: 0px; color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; font-weight: 700;\"><span style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; background-color: rgb(111, 168, 220);\"><span style=\"margin: 0px; padding: 0px; background-color: rgb(68, 68, 68);\"><span style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; background-color: rgb(38, 38, 38);\">美的取暖器</span></span></span><span style=\"margin: 0px; padding: 0px; background-color: rgb(153, 0, 0);\">品质有保障</span></span></span></span></span></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); text-align: center;\">&nbsp; &nbsp;<span style=\"margin: 0px; padding: 0px; color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; font-size: 24px;\"><span style=\"margin: 0px; padding: 0px; font-family: lisu;\"><span style=\"margin: 0px; padding: 0px; background-color: rgb(153, 0, 0);\">美的对流取暖器</span></span></span></span><span style=\"margin: 0px; padding: 0px; font-family: lisu;\"><span style=\"margin: 0px; padding: 0px; font-size: 24px;\"><span style=\"margin: 0px; padding: 0px; color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; background-color: rgb(153, 0, 0);\"><span style=\"margin: 0px; padding: 0px; line-height: 36px;\">！消费者明智的选择</span></span></span></span></span><span style=\"color:#ff0000;margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; font-size: 36px; background-color: rgb(255, 255, 0);\"><img class=\"img-ks-lazyload\" src=\"https://assets.alicdn.com/sys/wangwang/smiley/48x48/12.gif\" style=\"border: none; vertical-align: top; margin: 0px; padding: 0px; opacity: 1; float: none;\"/></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64); text-align: center;\"><span style=\"color:#ff0000;margin: 0px; padding: 0px;\"></span>&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64);\"><span style=\"margin: 0px; padding: 0px; color: rgb(38, 38, 38); font-size: 24px; line-height: 33.6px;\"><span style=\"margin: 0px; padding: 0px; color: rgb(255, 255, 255); line-height: 33.6px; background-color: rgb(153, 0, 0);\">【品牌直降】</span>品牌大促！限量血亏！购即送运费险，如此优惠，还等什么？（一个ID限购五台）</span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64);\"><span style=\"margin: 0px; padding: 0px; line-height: 1.4; color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; font-size: 24px;\"><span style=\"margin: 0px; padding: 0px; background-color: rgb(153, 0, 0);\">【品牌保障】</span></span></span><span style=\"margin: 0px; padding: 0px; font-size: 24px;\"><span style=\"margin: 0px; padding: 0px; color: rgb(38, 38, 38);\">美的知名品牌，市场知名度高。<span style=\"margin: 0px; padding: 0px; color: rgb(153, 0, 0);\">质量过硬</span>。送礼体面、家用放心！</span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64);\"><span style=\"line-height: 1.4; margin: 0px; padding: 0px; color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5;\"><span style=\"margin: 0px; padding: 0px; font-size: 24px;\"><span style=\"margin: 0px; padding: 0px; background-color: rgb(153, 0, 0);\">【售后无忧<span style=\"margin: 0px; padding: 0px; line-height: 19.6px;\">】</span></span></span></span></span><span style=\"margin: 0px; padding: 0px; font-size: 24px;\"><span style=\"margin: 0px; padding: 0px; color: rgb(38, 38, 38);\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5;\">8天无理由退货、<span style=\"margin: 0px; padding: 0px; color: rgb(153, 0, 0);\">一年保修</span>，让您用的舒心！</span></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64);\"><span style=\"margin: 0px; padding: 0px; font-size: 24px;\"><span style=\"margin: 0px; padding: 0px; color: rgb(38, 38, 38);\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5;\"><span style=\"margin: 0px; padding: 0px; line-height: 19.6px; color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px;\"><span style=\"margin: 0px; padding: 0px; background-color: rgb(153, 0, 0);\">【关于发货】</span></span></span><span style=\"margin: 0px; padding: 0px; color: rgb(64, 64, 64); line-height: 19.6px;\"><span style=\"color:#404040;margin: 0px; padding: 0px;\">&nbsp;</span></span></span></span></span><span style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-size: 24px; line-height: 33.6px;\">品牌实力见证！快速发货，按订单拍下付款依次发货，好产品不让您多等一分钟！</span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4; color: rgb(64, 64, 64);\"><span style=\"line-height: 1.4; text-align: center; margin: 0px; padding: 0px; color: rgb(255, 255, 255);\"><span style=\"margin: 0px; padding: 0px; line-height: 1.5;\"><span style=\"margin: 0px; padding: 0px; font-size: 24px;\"><span style=\"margin: 0px; padding: 0px; background-color: rgb(153, 0, 0);\">【产品功能】</span></span></span></span><span style=\"text-align: center; margin: 0px; padding: 0px; font-size: 24px;\"><span style=\"margin: 0px; padding: 0px; color: rgb(38, 38, 38);\"><span style=\"margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: 宋体; line-height: 33.6px;\">800-1200-2000W功率，三档调节，居浴两用，安全防水，</span></span></span><span style=\"text-align: center; color: rgb(0, 0, 0); font-family: 宋体; line-height: 33.6px; font-size: 24px;\">便捷烘衣，快速散热，静音取暖！<img src=\"https://img.alicdn.com/imgextra/i1/3001491082/TB2uShVb.hnpuFjSZFPXXb_4XXa_!!3001491082.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i4/3001491082/TB24GvVXhMb61BjSZFuXXaERXXa_!!3001491082.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/3001491082/TB2KGPIXnka61Bjy0FgXXbPpVXa_!!3001491082.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/3001491082/TB2RMPUXbQc61BjSZFrXXcnOpXa_!!3001491082.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/3001491082/TB2fdzUXcgd61BjSZFjXXbXspXa_!!3001491082.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/3001491082/TB23UTIXnka61Bjy0FoXXb1sFXa_!!3001491082.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/3001491082/TB2KG_UXngc61BjSZFkXXcTkFXa_!!3001491082.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/3001491082/TB2SvLJXcwX61BjSspaXXXLrpXa_!!3001491082.gif\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/3001491082/TB2ZozTXcgd61BjSZFpXXcaSVXa_!!3001491082.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/3001491082/TB240bTXbQc61BjSZFOXXbZ2pXa_!!3001491082.gif\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/3001491082/TB2Wt_IXhoa61Bjy0FaXXcHwpXa_!!3001491082.gif\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/3001491082/TB2PoHTXcgd61BjSZFpXXcaSVXa_!!3001491082.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/3001491082/TB21x_TXbMc61BjSZFFXXaDLFXa_!!3001491082.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/3001491082/TB2kNYTXgQc61BjSZFGXXa1DFXa_!!3001491082.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_25.png','',1,0,0,0,0,0,1,0,'72,73','',NULL,NULL,0,0,'[]',0.00,0.00,3,'0','0','0','0',0,1499337720,1499337720,NULL,0,0,0,''),
	(26,'钛古 IC-A2102超薄静音触摸屏家用大火力火锅电磁炉电磁灶电池炉',0,84,4,24,84,0,'',0,0,1,0.00,349.00,349.00,0.00,0,0,0,0,0.00,0,2000,0,0,100,0,0,0,0,0,0,0,74,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>CCC证书编号:&nbsp;<a href=\"https://baike.taobao.com/view.htm?wd=2016180711002027&ac=29\" target=\"blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\">2016180711002027</a></p></li><li><p>产品厚度:&nbsp;3.9cm</p></li><li><p>功率:&nbsp;2100W</p></li><li><p>智能类型:&nbsp;不支持智能</p></li><li><p>电磁炉品牌:&nbsp;Taigroo</p></li><li><p>型号:&nbsp;钛古 IC-A2102</p></li><li><p>货号:&nbsp;IC-A2102.S</p></li><li><p>采购地:&nbsp;中国大陆</p></li><li><p>颜色分类:&nbsp;月光银裸机</p></li><li><p>电磁炉炉头:&nbsp;1个</p></li><li><p>功能:&nbsp;炒菜 蒸煮 煲汤 火锅 烧水 煎炸</p></li><li><p>电磁炉面板类型:&nbsp;NEG面板</p></li><li><p>功率:&nbsp;120W(含)-2100W(含)</p></li><li><p>售后服务:&nbsp;店铺三包</p></li><li><p>操作方式:&nbsp;整版触摸式</p></li><li><p>火力档位:&nbsp;10档</p></li><li><p>是否有预约功能:&nbsp;无</p></li><li><p>是否防水:&nbsp;是</p></li></ul><p><img class=\"logo\" title=\"服务承诺\" src=\"https://img.alicdn.com/tps/TB1BjBpOVXXXXXCaXXXXXXXXXXX-78-22.png\" srcset=\"//img.alicdn.com/tps/TB1wGBEOVXXXXavXFXXXXXXXXXX-156-44.png\" style=\"border-width: 0px 1px 0px 0px; border-right-style: solid; border-right-color: rgb(0, 0, 0); vertical-align: middle; display: inline-block; height: 22px; margin-right: 5px; padding-right: 10px;\"/>&nbsp;<span style=\"display: inline-block; vertical-align: middle; line-height: 30px;\">专享服务承诺</span></p><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p><img class=\"icon\" src=\"https://img.alicdn.com/tps/TB17DgYOFXXXXbmXXXXXXXXXXXX-48-48.png\" srcset=\"//img.alicdn.com/tps/TB1DwclOFXXXXawapXXXXXXXXXX-96-96.png\" style=\"border: 0px; vertical-align: middle; display: inline-block; width: 48px; height: 48px;\"/></p></li><ul style=\"margin: 0px 40px 0px 0px; padding: 0px; color: rgb(51, 51, 51); overflow: hidden;\" class=\" list-paddingleft-2\"><li><p>全国包邮</p></li><li><p>卖家承担从卖家处发货到您收货地址处的大陆非偏远地区首次发货的运费。</p></li></ul><li><p><img class=\"icon\" src=\"https://img.alicdn.com/tps/TB1jhB5OVXXXXX1XpXXXXXXXXXX-48-48.png\" srcset=\"//img.alicdn.com/tps/TB1K4XKOVXXXXbhXVXXXXXXXXXX-96-96.png\" style=\"border: 0px; vertical-align: middle; display: inline-block; width: 48px; height: 48px;\"/></p></li><ul style=\"margin: 0px 40px 0px 0px; padding: 0px; color: rgb(51, 51, 51); overflow: hidden;\" class=\" list-paddingleft-2\"><li><p>退货运费险</p></li><li><p>卖家承诺提供退货运费险，在交易成功前，消费者发起退货请求，保险公司对退货产生的单程运费提供保险服务。</p></li></ul><li><p><img class=\"icon\" src=\"https://img.alicdn.com/tps/TB1sS3DOFXXXXcUXFXXXXXXXXXX-48-48.png\" srcset=\"//img.alicdn.com/tps/TB1hVZoOFXXXXXmapXXXXXXXXXX-96-96.png\" style=\"border: 0px; vertical-align: middle; display: inline-block; width: 48px; height: 48px;\"/></p></li><ul style=\"margin: 0px 40px 0px 0px; padding: 0px; color: rgb(51, 51, 51); overflow: hidden;\" class=\" list-paddingleft-2\"><li><p>48小时发货</p></li><li><p>卖家承诺在您付款后的48小时内完成发货，以快递公司系统内揽件记录的时间为准（定制、预售、大家电、家具等特殊类目除外）。</p></li></ul><li><p><img class=\"icon\" src=\"https://img.alicdn.com/tps/TB1jy3COFXXXXXsXVXXXXXXXXXX-48-48.png\" srcset=\"//img.alicdn.com/tps/TB1jHZuOFXXXXXgaXXXXXXXXXXX-96-96.png\" style=\"border: 0px; vertical-align: middle; display: inline-block; width: 48px; height: 48px;\"/></p></li><ul style=\"margin: 0px 40px 0px 0px; padding: 0px; color: rgb(51, 51, 51); overflow: hidden;\" class=\" list-paddingleft-2\"><li><p>质无忧</p></li><li><p>商家承诺所售商品如因“不喜欢/不想要/不适合”或质量问题发生退货退款，可向交易诚信记录良好的消费者提供闪电退货和极速退款服务。</p></li></ul><li><p><img class=\"icon\" src=\"https://img.alicdn.com/tps/TB1evsgOFXXXXchapXXXXXXXXXX-48-48.png\" srcset=\"//img.alicdn.com/tps/TB18ZIGOFXXXXb_XFXXXXXXXXXX-96-96.png\" style=\"border: 0px; vertical-align: middle; display: inline-block; width: 48px; height: 48px;\"/></p></li><ul style=\"margin: 0px 40px 0px 0px; padding: 0px; color: rgb(51, 51, 51); overflow: hidden;\" class=\" list-paddingleft-2\"><li><p>十五天无理由退货</p></li><li><p>卖家承诺提供15天无理由退货服务，即您签收货物后15天内，在不影响商家的二次销售的情况下，可以无条件申请退货的服务。</p></li></ul></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2949233034/TB2ruNWeMJlpuFjSspjXXcT.pXa_!!2949233034.jpg\" style=\"border: 0px; vertical-align: top; width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2949233034/TB2m334c4eI.eBjSsplXXX6GFXa_!!2949233034.jpg\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2949233034/TB2BARfdmqJ.eBjy1zbXXbx8FXa_!!2949233034.jpg\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2949233034/TB27MExX0FopuFjSZFHXXbSlXXa_!!2949233034.jpg\" style=\"border: 0px; vertical-align: top;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2949233034/TB2dYWzX90mpuFjSZPiXXbssVXa_!!2949233034.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2949233034/TB2QqyVcLTJXuFjSspeXXapipXa_!!2949233034.jpg\" class=\"\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2949233034/TB2NCgzdICO.eBjSZFzXXaRiVXa_!!2949233034.jpg\" class=\"\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2949233034/TB28rAudQ5M.eBjSZFrXXXPgVXa_!!2949233034.jpg\" class=\"\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2949233034/TB2I53vdUOO.eBjSZFLXXcxmXXa_!!2949233034.jpg\" class=\"\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2949233034/TB28oQvdMCN.eBjSZFoXXXj0FXa_!!2949233034.jpg\" class=\"\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2949233034/TB2uUUvdMCN.eBjSZFoXXXj0FXa_!!2949233034.jpg\" class=\"\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2949233034/TB2XSQfdOGO.eBjSZFpXXb3tFXa_!!2949233034.jpg\" class=\"\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_26.png','',1,0,0,0,0,0,1,0,'74,75','',NULL,NULL,0,0,'[]',0.00,0.00,3,'0','0','0','0',0,1499337832,1499337832,NULL,0,0,0,''),
	(27,'Haier/海尔 BCD-206STPA 206升三门冷藏家用节能小冰箱 软冷冻',0,131,1,130,131,0,'',0,0,1,0.00,929.00,929.00,0.00,0,0,0,0,0.00,0,2000,0,0,100,0,0,0,0,0,0,0,76,'','','<ul style=\"margin: 0px; padding: 0px;\" class=\" list-paddingleft-2\"><li><p><img src=\"https://img.alicdn.com/tps/TB1hWz.IXXXXXbNXXXXXXXXXXXX.png\" alt=\"品质保障\" style=\"border: 0px; vertical-align: middle; float: left; margin-right: 10px;\"/></p><p style=\"margin-top: 2px; margin-bottom: 0px; padding: 0px; font-size: 16px; color: rgb(51, 51, 51);\">品质保障</p><p><span style=\"color: rgb(153, 153, 153);\">权威机构鉴定</span></p></li><li><p><a data-src=\"//img.alicdn.com/imgextra/i1/1029692622/TB2_s4zabBkpuFjy1zkXXbSpFXa_!!1029692622.jpg\" data-name=\"\" data-spm-click=\"gostr=/tbdetail;locaid=d0;name=&amp;itemid=35849659812\" style=\"color: rgb(102, 102, 102); outline: 0px; float: left; text-align: center; width: 80px; height: 50px; margin-top: 2px;\"><img class=\"tb-qualification-items-icon\" src=\"https://img.alicdn.com/tps/TB1PCT_IXXXXXcAXXXXXXXXXXXX.png\" alt=\"\" style=\"border: 0px; vertical-align: middle; width: 24px; height: 24px;\"/></a></p><p class=\"tb-qualification-items-type\" style=\"margin-top: 2px; margin-bottom: 0px; padding: 0px;\"><a data-src=\"//img.alicdn.com/imgextra/i1/1029692622/TB2_s4zabBkpuFjy1zkXXbSpFXa_!!1029692622.jpg\" data-name=\"\" data-spm-click=\"gostr=/tbdetail;locaid=d0;name=&amp;itemid=35849659812\" style=\"color: rgb(102, 102, 102); outline: 0px; float: left; text-align: center; width: 80px; height: 50px; margin-top: 2px;\">机构认证</a></p><p><br/></p></li></ul><ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>CCC证书编号:&nbsp;<a href=\"https://baike.taobao.com/view.htm?wd=2009010701372489&ac=29\" target=\"blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\">2009010701372489</a></p></li><li><p>产品名称:&nbsp;Haier/海尔 BCD-206STPA</p></li><li><p>上市时间:&nbsp;2013-1</p></li><li><p>冰箱冰柜品牌:&nbsp;Haier/海尔</p></li><li><p>海尔冰箱型号:&nbsp;BCD-206STPA</p></li><li><p>冷冻室容积:&nbsp;53L</p></li><li><p>冷藏室容积:&nbsp;110L</p></li><li><p>净重:&nbsp;59kg</p></li><li><p>包装尺寸:&nbsp;579x565x1739mm</p></li><li><p>噪声:&nbsp;38dB</p></li><li><p>堆码层数极限:&nbsp;2层</p></li><li><p>尺寸:&nbsp;564x550x1739mm</p></li><li><p>总容量:&nbsp;206L</p></li><li><p>总容量范围:&nbsp;181-210升</p></li><li><p>是否变频:&nbsp;非变频</p></li><li><p>智能类型:&nbsp;不支持智能</p></li><li><p>最大容积:&nbsp;206L</p></li><li><p>毛重:&nbsp;70kg</p></li><li><p>耗电量:&nbsp;0.59Kwh/24h</p></li><li><p>能效备案号:&nbsp;201609-1-1-689664715591</p></li><li><p>采购地:&nbsp;中国大陆</p></li><li><p>冰箱冷柜机型:&nbsp;冷藏冷冻冰箱</p></li><li><p>制冷方式:&nbsp;直冷</p></li><li><p>箱门结构:&nbsp;三门式</p></li><li><p>面板类型:&nbsp;PPM</p></li><li><p>能效等级:&nbsp;二级</p></li><li><p>售后服务:&nbsp;全国联保</p></li><li><p>同城服务:&nbsp;同城卖家送货上门</p></li><li><p>颜色分类:&nbsp;BCD-206STPA/206升三门 统帅BCD-206LSTPF/206升三门 BCD-137TMPF/137升双门 咨询在线客服 预售/现货</p></li><li><p>制冷控制系统:&nbsp;机械温控</p></li></ul><h1 style=\"margin: 0px; padding: 0px; font-size: 16px; min-height: 21px; color: rgb(60, 60, 60);\"><span style=\"font-family: &#39;microsoft yahei&#39;;\"><span style=\"font-size: 24px;\"><strong><span style=\"color: rgb(34, 34, 34); font-weight: normal; line-height: 1.5;\"><span style=\"color: rgb(255, 0, 0);\"><span style=\"background-color: rgb(255, 255, 0);\">温馨提示：</span></span><span style=\"color: rgb(0, 0, 0);\">本店商品都是就近大库发货，拍之前必须联系在线客服确认当地是否为现货才可以下</span>单，<span style=\"color: rgb(255, 0, 0);\"><span style=\"background-color: rgb(255, 255, 0);\">用户自拍的机 器 一律为预售单</span></span><span style=\"color: rgb(0, 0, 0);\">，发货时间一般</span></span></strong>预计4周左右<span style=\"color: rgb(34, 34, 34); font-weight: normal; line-height: 1.5;\"><span style=\"color: rgb(0, 0, 0);\">，</span></span><strong><span style=\"color: rgb(34, 34, 34); font-weight: normal; line-height: 1.5;\"><span style=\"color: rgb(0, 0, 0);\">具体时间不定！不能等的用户切记不要下单。</span><span style=\"color: rgb(255, 0, 0);\"><span style=\"background-color: rgb(255, 255, 0);\">下单退款的用户 退款原因只支持协商一致退款</span></span><span style=\"color: rgb(0, 0, 0);\">，不接受缺货！！谢谢配合，</span></span><span style=\"color: rgb(34, 34, 34); font-weight: normal; line-height: 1.5;\"><span style=\"color: rgb(0, 0, 0);\">以免耽误你的使用！！！</span></span></strong></span></span><img alt=\"\" height=\"89\" width=\"750\" src=\"https://img.alicdn.com/imgextra/i1/1029692622/TB2uxjRlpXXXXbcXXXXXXXXXXXX_!!1029692622.png\" style=\"border: 0px; vertical-align: middle; color: rgb(34, 34, 34); font-weight: normal; font-size: 14.44px; line-height: 1px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1029692622/TB2VOiMtFXXXXcnXpXXXXXXXXXX_!!1029692622.jpg\" style=\"border: 0px; vertical-align: middle; float: none; margin: 0px;\"/></h1><table width=\"750\" height=\"884\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 751px;\"><tbody><tr class=\"firstRow\"><td colspan=\"8\" style=\"margin: 0px; padding: 0px;\"><img width=\"750\" height=\"324\" alt=\"\" src=\"https://img.alicdn.com/imgextra/i1/1029692622/TB2B0eUhl8lpuFjSspaXXXJKpXa_!!1029692622.png\" style=\"border: 0px; vertical-align: top; float: none; margin: 0px;\"/><a target=\"_blank\" href=\"https://item.taobao.com/item.htm?id=35849659812\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img width=\"190\" height=\"237\" alt=\"\" src=\"https://img.alicdn.com/imgextra/i4/1029692622/TB2ufAmeW8lpuFjy0FpXXaGrpXa_!!1029692622.png\" style=\"border: 0px; vertical-align: top; float: none; margin: 0px;\"/></a><a target=\"_blank\" href=\"https://item.taobao.com/item.htm?id=37630692325\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img width=\"185\" height=\"237\" alt=\"\" src=\"https://img.alicdn.com/imgextra/i4/1029692622/TB2RBYWe8NkpuFjy0FaXXbRCVXa_!!1029692622.png\" class=\"\" style=\"border: 0px; vertical-align: top; float: none; margin: 0px;\"/></a><a target=\"_blank\" href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c.w4002-7366396885.25.f7KU63&id=45615342314\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img width=\"182\" height=\"237\" alt=\"\" src=\"https://img.alicdn.com/imgextra/i3/1029692622/TB2W3Qbe84lpuFjy1zjXXcAKpXa_!!1029692622.png\" class=\"\" style=\"border: 0px; vertical-align: top; float: none; margin: 0px;\"/></a><a target=\"_blank\" href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c.w4002-7366396885.17.5SadxI&id=521643629976\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img width=\"193\" height=\"237\" alt=\"\" src=\"https://img.alicdn.com/imgextra/i4/1029692622/TB251cbe3RkpuFjy1zeXXc.6FXa_!!1029692622.png\" class=\"\" style=\"border: 0px; vertical-align: top; float: none; margin: 0px;\"/></a><a target=\"_blank\" href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c.w4002-7366396885.19.P1fvKf&id=522885884784\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img width=\"190\" height=\"238\" alt=\"\" src=\"https://img.alicdn.com/imgextra/i3/1029692622/TB2fqlCaOC9MuFjSZFoXXbUzFXa_!!1029692622.png\" class=\"\" style=\"border: 0px; vertical-align: top; float: none; margin: 0px;\"/></a><a target=\"_blank\" href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c.w4002-7366396885.55.rDNjJB&id=35926492970\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img width=\"185\" height=\"238\" alt=\"\" src=\"https://img.alicdn.com/imgextra/i4/1029692622/TB2Q5k9f0RopuFjSZFtXXcanpXa_!!1029692622.png\" class=\"\" style=\"border: 0px; vertical-align: top; float: none; margin: 0px;\"/></a><a target=\"_blank\" href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c.w4002-7366396885.20.u3ISpv&id=533969972884\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img width=\"182\" height=\"238\" alt=\"\" src=\"https://img.alicdn.com/imgextra/i4/1029692622/TB25aNdgbBmpuFjSZFuXXaG_XXa_!!1029692622.png\" class=\"\" style=\"border: 0px; vertical-align: top; float: none; margin: 0px;\"/></a><a target=\"_blank\" href=\"https://item.taobao.com/item.htm?spm=a1z10.5-c.w4002-7366396885.16.h5ShSn&id=23647136129\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img width=\"193\" height=\"238\" alt=\"\" src=\"https://img.alicdn.com/imgextra/i3/1029692622/TB2eqpCaOC9MuFjSZFoXXbUzFXa_!!1029692622.png\" class=\"\" style=\"border: 0px; vertical-align: top; float: none; margin: 0px;\"/></a><a target=\"_blank\" href=\"https://shop73400634.taobao.com/category-610339876.htm?spm=a1z10.5-c.w4002-7366396885.14.iZDMJ3&_ksTS=1484796142909_112&callback=jsonp113&mid=w-7366396885-0&wid=7366396885&path=%2Fcategory-610339876.htm&catName=%B1%F9%CF%E4&catId=610339876&orderType=hotsell_desc\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img width=\"123\" height=\"84\" alt=\"\" src=\"https://img.alicdn.com/imgextra/i2/1029692622/TB2HZEvf7qvpuFjSZFhXXaOgXXa_!!1029692622.png\" class=\"\" style=\"border: 0px; vertical-align: top; float: none; margin: 0px;\"/></a><a target=\"_blank\" href=\"https://shop73400634.taobao.com/category-610339877.htm?spm=a1z10.5-c.w4002-7366396885.12.pED8xe&_ksTS=1484794742716_115&callback=jsonp116&mid=w-7366396885-0&wid=7366396885&path=%2Fcategory-610339877.htm&catName=%CF%B4%D2%C2%BB%FA&catId=610339877&orderType=hotsell_desc\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img width=\"124\" height=\"84\" alt=\"\" src=\"https://img.alicdn.com/imgextra/i2/1029692622/TB26JRdgbxmpuFjSZJiXXXauVXa_!!1029692622.png\" class=\"\" style=\"border: 0px; vertical-align: top; float: none; margin: 0px;\"/></a><a target=\"_blank\" href=\"https://shop73400634.taobao.com/category-610339879.htm?spm=a1z10.5-c.w4002-7366396885.14.QQnIvI&_ksTS=1484796162025_115&callback=jsonp116&mid=w-7366396885-0&wid=7366396885&path=%2Fcategory-610339879.htm&catName=%BF%D5%B5%F7&catId=610339879&orderType=hotsell_desc\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img width=\"128\" height=\"84\" alt=\"\" src=\"https://img.alicdn.com/imgextra/i2/1029692622/TB2jchhgb4npuFjSZFmXXXl4FXa_!!1029692622.png\" class=\"\" style=\"border: 0px; vertical-align: top; float: none; margin: 0px;\"/></a><a target=\"_blank\" href=\"https://shop73400634.taobao.com/category-610339878.htm?spm=a1z10.5-c.w4002-7366396885.15.jjuxO0&_ksTS=1484796243246_115&callback=jsonp116&mid=w-7366396885-0&wid=7366396885&path=%2Fcategory-610339878.htm&catName=%B5%E7%CA%D3&catId=610339878&orderType=hotsell_desc\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img width=\"128\" height=\"84\" alt=\"\" src=\"https://img.alicdn.com/imgextra/i2/1029692622/TB22GQ_f4hmpuFjSZFyXXcLdFXa_!!1029692622.png\" class=\"\" style=\"border: 0px; vertical-align: top; float: none; margin: 0px;\"/></a><a target=\"_blank\" href=\"https://shop73400634.taobao.com/category-610339880.htm?spm=a1z10.5-c.w4002-7366396885.11.t4d5yo&_ksTS=1484796263056_115&callback=jsonp116&mid=w-7366396885-0&wid=7366396885&path=%2Fcategory-610339880.htm&catName=%C8%C8%CB%AE%C6%F7&catId=610339880&orderType=hotsell_desc\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img width=\"126\" height=\"84\" alt=\"\" src=\"https://img.alicdn.com/imgextra/i1/1029692622/TB26ys9f0RopuFjSZFtXXcanpXa_!!1029692622.png\" class=\"\" style=\"border: 0px; vertical-align: top; float: none; margin: 0px;\"/></a><a target=\"_blank\" href=\"https://shop73400634.taobao.com/category-628592214.htm?spm=a1z10.5-c.w4002-7366396885.11.0AJ9Kk&_ksTS=1484796295162_115&callback=jsonp116&mid=w-7366396885-0&wid=7366396885&path=%2Fcategory-628592214.htm&catName=%B3%F8%B7%BF%B5%E7%C6%F7&catId=628592214&orderType=hotsell_desc\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img width=\"121\" height=\"84\" alt=\"\" src=\"https://img.alicdn.com/imgextra/i2/1029692622/TB2.Q_aaKtTMeFjSZFOXXaTiVXa_!!1029692622.png\" class=\"\" style=\"border: 0px; vertical-align: top; float: none; margin: 0px;\"/></a><img alt=\" 购前须知.jpg\" src=\"https://img.alicdn.com/imgextra/i1/1029692622/TB2NRPGkFXXXXXkXpXXXXXXXXXX_!!1029692622.jpg\" class=\"\" width=\"750\" height=\"715\" style=\"border: 0px; vertical-align: top; line-height: 1px; font-size: 14.44px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1029692622/TB2C0_leVXXXXaAXpXXXXXXXXXX-1029692622.jpg\" class=\"\" width=\"790\" height=\"100\" style=\"border: 0px; vertical-align: top; font-size: 14.44px; line-height: 23px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1029692622/TB2WZoybOpnpuFjSZFIXXXh2VXa_!!1029692622.jpg\" class=\"\" width=\"790\" height=\"1081\" style=\"border: 0px; vertical-align: top; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1029692622/TB2mH30sNxmpuFjSZFNXXXrRXXa_!!1029692622.jpg\" class=\"\" width=\"790\" height=\"799\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1029692622/TB2DfY6sNtmpuFjSZFqXXbHFpXa_!!1029692622.jpg\" class=\"\" width=\"790\" height=\"432\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1029692622/TB2JxgWsOlnpuFjSZFgXXbi7FXa_!!1029692622.jpg\" class=\"\" width=\"790\" height=\"989\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1029692622/TB2rY.0sNxmpuFjSZFNXXXrRXXa_!!1029692622.jpg\" class=\"\" width=\"790\" height=\"776\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1029692622/TB201ZDsItnpuFjSZFKXXalFFXa_!!1029692622.jpg\" class=\"\" width=\"790\" height=\"773\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></td></tr></tbody></table><p><br/></p>','upload/goods_qrcode/goods_qrcode_27.png','',1,0,0,0,0,0,1,0,'76,77','',NULL,NULL,0,0,'[]',0.00,0.00,3,'0','0','0','0',0,1499338186,1499338186,1499338346,0,0,0,''),
	(28,'Haier/海尔 EG7012B29W 7公斤 变频全自动 滚筒洗衣机 消毒洗',0,131,1,130,131,0,'',0,0,1,0.00,1388.00,1388.00,0.00,0,0,0,0,0.00,0,1000,0,0,200,0,0,0,0,0,0,0,78,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>CCC证书编号:&nbsp;<a href=\"https://baike.taobao.com/view.htm?wd=2015010705782248&ac=29\" target=\"blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\">2015010705782248</a></p></li><li><p>产品名称:&nbsp;Haier/海尔 EG7012B29W</p></li><li><p>上市时间:&nbsp;2015-9</p></li><li><p>产地:&nbsp;中国大陆</p></li><li><p>净重:&nbsp;64kg</p></li><li><p>功率:&nbsp;200W</p></li><li><p>包装尺寸:&nbsp;577x665x932mm</p></li><li><p>堆码层数极限:&nbsp;3层</p></li><li><p>尺寸:&nbsp;595x510x850mm</p></li><li><p>毛重:&nbsp;70kg</p></li><li><p>洗涤公斤量:&nbsp;7kg</p></li><li><p>洗衣机品牌:&nbsp;Haier/海尔</p></li><li><p>海尔洗衣机型号:&nbsp;EG7012B29W</p></li><li><p>能效备案号:&nbsp;2015-31-2242-1232915</p></li><li><p>脱水功率:&nbsp;500W</p></li><li><p>颜色分类:&nbsp;海尔EG7012B29W 统帅@G7012B16W 咨询在线客服 现货预售 海尔EG7012B29W/7.7号陆续发货</p></li><li><p>产品类型:&nbsp;滚筒洗衣机</p></li><li><p>使用方式:&nbsp;全自动</p></li><li><p>同城服务:&nbsp;同城卖家送货上门</p></li><li><p>洗衣程序:&nbsp;棉麻洗 快洗 单甩 牛仔洗 筒自洁</p></li><li><p>能效等级:&nbsp;一级</p></li><li><p>箱体材质:&nbsp;渗锌钢板</p></li><li><p>内桶材质:&nbsp;不锈钢</p></li><li><p>电机类型:&nbsp;BLDC变频电机</p></li><li><p>排水方式:&nbsp;上排水</p></li><li><p>开合方式:&nbsp;前开式</p></li></ul><p><span style=\"color: rgb(255, 0, 0); font-family: &#39;microsoft yahei&#39;; font-size: 18px; line-height: 27px;\">本店商品都是就近大库发货，拍之前必须联系在线客服确认当地是否为现货才可以下单，用户自拍的机器 一律为预售单，发货时间一般预计4周左右，具体时间不定！不能等的用户切记不要下单。下单退款的 用户 退款原因只支持协商一致退款，不接受缺货！！谢谢配合，以免耽误你的使用！</span><span style=\"color: rgb(255, 0, 0); font-family: &#39;microsoft yahei&#39;; font-size: 18px; line-height: 1.5;\">&nbsp;</span><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2949511761/TB2bsP2dbJmpuFjSZFwXXaE4VXa_!!2949511761.jpg\" style=\"border: 0px; vertical-align: middle; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2949511761/TB2hugFbm4mpuFjSZFOXXaUqpXa_!!2949511761.jpg\" style=\"border: 0px; vertical-align: middle;\"/></p><table width=\"750\" height=\"607\" cellpadding=\"0\" cellspacing=\"0\" style=\"width: 751px;\"><tbody><tr class=\"firstRow\"><td colspan=\"2\" style=\"margin: 0px; padding: 0px;\"><a href=\"https://item.taobao.com/item.htm?spm=686.1000925.0.0.pjRnGH&id=536534815514\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img width=\"375\" height=\"351\" alt=\"\" src=\"https://img.alicdn.com/imgextra/i1/2949511761/TB2z6mgXazyQeBjSszfXXX7OVXa_!!2949511761.jpg\" style=\"border: 0px; vertical-align: top;\"/></a></td><td colspan=\"2\" style=\"margin: 0px; padding: 0px;\"><a href=\"https://item.taobao.com/item.htm?spm=686.1000925.0.0.tX2Ugb&id=536596826658\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img width=\"375\" height=\"351\" alt=\"\" src=\"https://img.alicdn.com/imgextra/i3/2949511761/TB2PsWhXanyQeBjSspeXXa8WpXa_!!2949511761.jpg\" style=\"border: 0px; vertical-align: top;\"/></a></td></tr><tr><td style=\"margin: 0px; padding: 0px;\"><a href=\"https://item.taobao.com/item.htm?spm=686.1000925.0.0.Ly0p5s&id=536603198222\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img width=\"249\" height=\"255\" alt=\"\" src=\"https://img.alicdn.com/imgextra/i1/2949511761/TB2Z1GgXhvxQeBjy0FiXXXioXXa_!!2949511761.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/></a></td><td colspan=\"2\" style=\"margin: 0px; padding: 0px;\"><a href=\"https://item.taobao.com/item.htm?spm=686.1000925.0.0.5muc7v&id=536530223616\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img width=\"252\" height=\"255\" alt=\"\" src=\"https://img.alicdn.com/imgextra/i3/2949511761/TB2G6mgXl6xQeBjSsziXXXxVVXa_!!2949511761.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/></a></td><td style=\"margin: 0px; padding: 0px;\"><a href=\"https://item.taobao.com/item.htm?spm=686.1000925.0.0.jsvOan&id=536647665663\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img width=\"249\" height=\"255\" alt=\"\" src=\"https://img.alicdn.com/imgextra/i4/2949511761/TB2n2GhXhfxQeBjSsppXXXeoFXa_!!2949511761.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/></a></td></tr></tbody></table><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2949511761/TB2gygccCtkpuFjy0FhXXXQzFXa_!!2949511761.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2949511761/TB2LuIlcCFjpuFjSspbXXXagVXa_!!2949511761.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2949511761/TB24bEmcrRkpuFjSspmXXc.9XXa_!!2949511761.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2949511761/TB2n1KodbJmpuFjSZFwXXaE4VXa_!!2949511761.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2949511761/TB2NagncB8lpuFjy0FnXXcZyXXa_!!2949511761.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2949511761/TB2DqGpdmVmpuFjSZFFXXcZApXa_!!2949511761.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2949511761/TB2MNGsdhBmpuFjSZFsXXcXpFXa_!!2949511761.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2949511761/TB2_9SxddRopuFjSZFtXXcanpXa_!!2949511761.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2949511761/TB2BIqGdd4opuFjSZFLXXX8mXXa_!!2949511761.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2949511761/TB2uo1xdohnpuFjSZFEXXX0PFXa_!!2949511761.gif\" class=\"\" style=\"border: 0px; vertical-align: top;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_28.png','',1,0,0,0,0,0,1,0,'78,79','',NULL,NULL,0,0,'[]',0.00,0.00,3,'0','0','0','0',0,1499338521,1499338521,1499339165,0,0,0,''),
	(29,'智能家居电动窗帘遥控wifi自动智能窗帘电机电动遥控窗帘轨道',0,131,1,130,131,0,'',0,0,1,0.00,396.00,396.00,0.00,0,0,0,0,0.00,0,1000,0,0,100,0,0,0,0,0,0,0,83,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>品牌:&nbsp;MEEYA/米亚</p></li><li><p>型号:&nbsp;MT900</p></li><li><p>智能类型:&nbsp;其他</p></li><li><p>颜色分类:&nbsp;智能静音wifi电机(送遥控器） 1米内套餐(电机+遥控器+轨道） 1.5米内套餐(电机+遥控器+轨道） 2米内套餐(电机+遥控器+轨道） 2.5米内套餐(电机+遥控器+轨道） 3米内套餐（电机+遥控器+轨道） 3.5米内套餐(电机+遥控器+轨道） 4米内套餐(电机+遥控器+轨道） 4.5米内套餐(电机+遥控器+轨道） 5米内套餐(电机+遥控器+轨道） 5.5米内套餐(电机+遥控器+轨道） 6米内套餐（电机+遥控器+轨道） 6.5米内套餐(电机+遥控器+轨道） 7米内套餐(电机+遥控器+轨道） 7.5米内套餐(电机+遥控器+轨道） 8米内套餐(电机+遥控器+轨道）</p></li><li><p>额定电压:&nbsp;100-240V</p></li><li><p>额定功率:&nbsp;80w</p></li><li><p>安全负载:&nbsp;60kg</p></li><li><p>运行速度:&nbsp;每秒16cm</p></li><li><p>电机尺寸:&nbsp;316*68*53mm</p></li></ul><p><img class=\"logo\" title=\"服务承诺\" src=\"https://img.alicdn.com/tps/TB1betHOVXXXXaiXpXXXXXXXXXX-75-22.png\" srcset=\"//img.alicdn.com/tps/TB17mJKOVXXXXboXXXXXXXXXXXX-150-44.png\" style=\"border-width: 0px 1px 0px 0px; border-right-style: solid; border-right-color: rgb(0, 0, 0); vertical-align: middle; display: inline-block; height: 22px; margin-right: 5px; padding-right: 10px;\"/>&nbsp;<span style=\"display: inline-block; vertical-align: middle; line-height: 30px;\">专享服务承诺</span></p><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p><img class=\"icon\" src=\"https://img.alicdn.com/tps/TB1zMlzOVXXXXbBXpXXXXXXXXXX-48-48.png\" srcset=\"//img.alicdn.com/tps/TB1Zq.8OFXXXXXTapXXXXXXXXXX-96-96.png\" style=\"border: 0px; vertical-align: middle; display: inline-block; width: 48px; height: 48px;\"/></p></li><ul style=\"margin: 0px 40px 0px 0px; padding: 0px; color: rgb(51, 51, 51); overflow: hidden;\" class=\" list-paddingleft-2\"><li><p>运费险</p></li><li><p>买卖双方在交易未完结前，买家发起退货请求时，保险公司会对退货产生的单程运费提供保险服务。<a target=\"_blank\" href=\"https://www.jiyoujia.com/markets/youjia/customer-information-desk-12\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px; cursor: pointer;\">点此查看详情</a></p></li></ul></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><img src=\"https://img.alicdn.com/imgextra/i4/283109782/TB2OvUNrAqvpuFjSZFhXXaOgXXa_!!283109782.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/283109782/TB2b1gmActnpuFjSZFvXXbcTpXa_!!283109782.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/283109782/TB2LzQ2AhlmpuFjSZPfXXc9iXXa_!!283109782.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/283109782/TB26HETAbBmpuFjSZFAXXaQ0pXa_!!283109782.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/283109782/TB205Nak3JlpuFjSspjXXcT.pXa_!!283109782.jpg\" class=\"\" align=\"absmiddle\" width=\"790\" height=\"437\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/283109782/TB2VKQ4kHplpuFjSspiXXcdfFXa_!!283109782.jpg\" class=\"\" align=\"absmiddle\" width=\"790\" height=\"607\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/283109782/TB2sPswkMNlpuFjy0FfXXX3CpXa_!!283109782.jpg\" class=\"\" align=\"absmiddle\" width=\"790\" height=\"1225\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/283109782/TB2tKIAkNXlpuFjSsphXXbJOXXa_!!283109782.jpg\" class=\"\" align=\"absmiddle\" width=\"790\" height=\"444\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/283109782/TB2Gqg8kHRkpuFjSspmXXc.9XXa_!!283109782.jpg\" class=\"\" align=\"absmiddle\" width=\"788\" height=\"875\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/283109782/TB2dD7UkMxlpuFjSszbXXcSVpXa_!!283109782.jpg\" class=\"\" align=\"absmiddle\" width=\"790\" height=\"873\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/283109782/TB2SPo3kMFkpuFjSspnXXb4qFXa_!!283109782.jpg\" class=\"\" align=\"absmiddle\" width=\"815\" height=\"893\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/283109782/TB2_5MKkR0kpuFjy1zdXXXuUVXa_!!283109782.jpg\" class=\"\" align=\"absmiddle\" width=\"790\" height=\"668\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/283109782/TB2VFvMdilnpuFjSZFgXXbi7FXa_!!283109782.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"520\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/283109782/TB2drHWdhlmpuFjSZPfXXc9iXXa_!!283109782.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"505\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_29.png','',1,0,0,0,0,0,1,0,'83,81','',NULL,NULL,0,0,'[]',0.00,0.00,3,'0','0','0','0',0,1499339297,1499339297,NULL,0,0,0,''),
	(30,'浴霸智能开关 触摸86型卫生间风暖通用防水4四五合一5开开关面板',0,131,1,130,131,0,'',0,0,1,0.00,180.00,180.00,0.00,0,0,0,0,0.00,0,500,0,0,100,0,0,0,0,0,0,0,84,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>质保年限:&nbsp;2年</p></li><li><p>颜色:&nbsp;黑色</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; color: rgb(64, 64, 64); orphans: 2; widows: 2;\"><strong style=\"color: rgb(255, 0, 0); font-size: xx-large; line-height: 48px;\">郑重申明：2年内保修（坏直接换新）<span style=\"background-color: rgb(255, 255, 0);\">拒绝山寨，认准正品！</span></strong><span style=\"font-size:32px\"></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; color: rgb(64, 64, 64); orphans: 2; widows: 2;\"><span style=\"color: rgb(255, 0, 0);\"><strong style=\"font-size: xx-large; line-height: 48px;\"><span style=\"background-color: rgb(255, 255, 0);\">【切记此开关需要接入零线才能使用，此问题退货请承担来回运费】</span></strong></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; color: rgb(64, 64, 64); orphans: 2; widows: 2;\"><span style=\"font-size:32px\"><strong>默认<span style=\"color: rgb(255, 0, 0);\">黑色</span>&nbsp;如需<span style=\"color: rgb(255, 0, 0);\">白色、土豪金</span>留言备注！</strong></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; color: rgb(64, 64, 64); orphans: 2; widows: 2;\"><span style=\"font-size:32px\"><strong>双电机开关：吹风+换气可以同时启动<span style=\"color: rgb(255, 0, 0);\">（吹风、换气2个按钮）</span></strong></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; color: rgb(64, 64, 64); orphans: 2; widows: 2;\"><span style=\"font-size:32px\"><strong>单电机开关：吹风+换气 只能启动1种功能(如奥普浴霸等，<span style=\"color: rgb(255, 0, 0);\">吹风、换气1个按钮</span>)</strong></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; color: rgb(64, 64, 64); orphans: 2; widows: 2;\"><span style=\"color: rgb(255, 0, 0);\"><span style=\"font-size:32px\"><strong>注：<span style=\"color: rgb(0, 0, 0);\">开关有2个版本，需要哪个请留言备注！默认双电机！</span>单电机浴霸无法使用双电机开关，否则会烧毁浴霸电机，后果自负，请一定要确认好浴霸双电机，还是单电机！</strong></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; color: rgb(64, 64, 64); text-align: center; orphans: 2; widows: 2;\"><span style=\"font-size: 48px;\"><span style=\"color: rgb(255, 0, 0);\"></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; color: rgb(64, 64, 64); orphans: 2; widows: 2;\"><img src=\"https://img.alicdn.com/imgextra/i3/1882007054/TB2c_1hXGi5V1BjSszbXXb0hVXa_!!1882007054.jpg\" align=\"absMiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/1882007054/TB2mU9gXGi5V1BjSszgXXbHLpXa_!!1882007054.jpg\" align=\"middle\" style=\"border: 0px; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i4/1882007054/TB29wGgXGi5V1BjSspfXXapiXXa_!!1882007054.jpg\" align=\"absMiddle\" style=\"border: 0px; vertical-align: top;\"/><img src=\"https://img.alicdn.com/imgextra/i1/1882007054/TB20vChXF15V1Bjy1XaXXaPqVXa_!!1882007054.jpg\" align=\"absMiddle\" style=\"border: 0px; vertical-align: top; line-height: 1.5;\"/><img src=\"https://img.alicdn.com/imgextra/i3/1882007054/TB2eoyiXF55V1Bjy0FpXXXhDpXa_!!1882007054.jpg\" class=\"\" align=\"absMiddle\" style=\"border: 0px; vertical-align: top; line-height: 1.5;\"/><img src=\"https://img.alicdn.com/imgextra/i2/1882007054/TB2ob1iXGi5V1BjSspiXXXGBFXa_!!1882007054.jpg\" class=\"\" align=\"absMiddle\" style=\"border: 0px; vertical-align: top; line-height: 1.5;\"/><img src=\"https://img.alicdn.com/imgextra/i1/1882007054/TB2Xe1lXF55V1Bjy0FoXXbVjFXa_!!1882007054.jpg\" class=\"\" align=\"absMiddle\" style=\"border: 0px; vertical-align: top; line-height: 1.5;\"/><img src=\"https://img.alicdn.com/imgextra/i1/1882007054/TB2l2efXF95V1Bjy0FeXXXyfpXa_!!1882007054.jpg\" class=\"\" align=\"absMiddle\" style=\"border: 0px; vertical-align: top; line-height: 1.5;\"/><img src=\"https://img.alicdn.com/imgextra/i1/1882007054/TB2KQegXGm5V1BjSspoXXa8VXXa_!!1882007054.jpg\" class=\"\" align=\"absMiddle\" style=\"border: 0px; vertical-align: top; line-height: 1.5;\"/><img src=\"https://img.alicdn.com/imgextra/i3/1882007054/TB2NzmfXF55V1Bjy0FjXXbikXXa_!!1882007054.jpg\" class=\"\" align=\"absMiddle\" style=\"border: 0px; vertical-align: top; line-height: 1.5;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_30.png','',1,0,0,0,0,0,1,0,'84,85','',NULL,NULL,0,0,'[]',0.00,0.00,3,'0','0','0','0',0,1499339446,1499339446,NULL,0,0,0,''),
	(31,'蓝斯顿 智能楼宇对讲系统设备直按小高层刷卡门禁门铃套装高清',0,131,1,130,131,0,'',0,0,1,0.00,388.00,388.00,0.00,0,0,0,0,0.00,0,500,0,0,100,0,0,0,0,0,0,0,86,'','','<p>品牌名称：<a class=\"J_EbrandLogo\" target=\"_blank\" href=\"https://brand.tmall.com/brandInfo.htm?brandId=16757316&type=0&scm=1048.1.1.4\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(51, 85, 170); outline: 0px;\">蓝斯顿</a></p><p><a class=\"tm-collectBtn j_DetailBrand\" data-brandid=\"16757316\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b.w4011-8645506485.42.3274345aJVEJuO&id=538310509748&rn=abbabba3f6db8aba1df9d369c39f446b#\" hidefocus=\"true\" style=\"margin: 0px; padding: 0px; color: rgb(255, 255, 255); outline: 0px; position: relative; display: inline-block; height: 22px; width: 75px; border-radius: 11px; line-height: 22px; text-align: center; white-space: nowrap; cursor: pointer; transition: all 0.2s ease-in; text-decoration: none !important; background-color: rgb(255, 0, 54);\"><em style=\"margin: 0px 0px -2px; padding: 0px; display: inline-block; width: 12px; height: 12px; line-height: 12px; overflow: hidden; transition: none; background-image: url(&quot;//img-tmdetail.alicdn.com/tps/i3/T1F05SXB4cXXcGdY6f-38-12.png&quot;); background-position: 0px 0px; background-repeat: no-repeat;\"></em><span style=\"margin: 0px 0px 0px 4px; padding: 0px;\">关注</span></a></p><p class=\"attr-list-hd tm-clear\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 20px; line-height: 22px; color: rgb(153, 153, 153);\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; float: left;\">产品参数：</span></p><ul id=\"J_AttrUL\" style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>品牌:&nbsp;蓝斯顿</p></li><li><p>型号:&nbsp;LSD-892PC(ID)</p></li><li><p>智能类型:&nbsp;其他</p></li><li><p>颜色分类:&nbsp;LSD-892PC（ID）-3&nbsp;LSD-892PC（ID）-4&nbsp;LSD-892PC（ID）-6&nbsp;LSD-892PC（ID）-7&nbsp;LSD-892PC（ID）-8&nbsp;LSD-892RPC（ID)-14&nbsp;LSD-892R42PC&nbsp;LSD-892R11PC&nbsp;LSD-892R90PC&nbsp;LSD-892R90DVP&nbsp;4路解码器&nbsp;P18V01电源&nbsp;线材RVV5*0.5</p></li><li><p>对讲类型:&nbsp;彩色可视</p></li></ul><p><a href=\"https://pages.tmall.com/wow/jz/act/fuwuchengjie\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(51, 85, 170); outline: 0px;\"><img src=\"https://img.alicdn.com/tfs/TB130GaSXXXXXbMaXXXXXXXXXXX-790-180.jpg\" width=\"790\" height=\"180\" style=\"margin: 0px; padding: 0px; border: 0px;\"/></a></p><p><img src=\"https://img.alicdn.com/tps/i1/TB16JNVIXXXXXXSXpXXkgL.4FXX-725-56.png\" width=\"717\" height=\"56\" alt=\"天猫家装服务承诺\" style=\"margin: 0px auto; padding: 0px; border: 0px; display: block; width: 725px;\"/></p><p><span class=\"mui-decor-detail-text-icon mui-decor-detail-text-icon-first\" style=\"margin: 20px 16px 0px 0px; padding: 0px; display: block; width: 42px; height: 42px; float: left; background: url(&quot;//img.alicdn.com/tfs/TB18o1BRpXXXXbHXFXXXXXXXXXX-42-42.png&quot;) no-repeat;\"></span></p><p><span class=\"mui-decor-detail-text-title\" style=\"margin: 0px; padding: 0px; display: block; line-height: 32px; font-size: 14px; font-weight: bolder; color: rgb(0, 0, 0);\">正品保障</span></p><p class=\"mui-decor-detail-text-text\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 21px; color: rgb(102, 102, 102);\">1.天猫家装承诺所有商品均为正品！</p><p class=\"mui-decor-detail-text-text\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 21px; color: rgb(102, 102, 102);\">2.若消费者购买到非正品商品，则有权获得退回实际支付的商品价款并增加赔偿其受到的损失，增加赔偿的金额为消费者实际支付商品价款的四倍。</p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><span style=\"margin: 0px; padding: 0px;\"></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.4;\"><map name=\"iju\" style=\"margin: 0px; padding: 0px;\"><area coords=\"6,149,395,492\" href=\"https://detail.tmall.com/item.htm?spm=a220o.1000855.1998025129.1.KxoFo0&id=521237679621&pvid=7445537a-73b0-4fb0-a2ce-fca5e7fedf3b&abbucket=_AB-M32_B6&acm=03054.1003.1.587829&aldid=qOPGo3QZ&abtest=_AB-LR32-PR32&scm=1007.12559.23636.100200300000000&pos=1&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px;\"/><area coords=\"400,149,786,492\" href=\"https://detail.tmall.com/item.htm?spm=a220o.1000855.w5001-9881696605.4.CJU3de&id=527909335359&rn=65280abd91d00e0ff004d53dc87a29c3&abbucket=9&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px;\"/><area coords=\"7,496,394,838\" href=\"https://detail.tmall.com/item.htm?spm=a220o.1000855.1998025129.3.nAGzUC&id=521546882090&pvid=f74cb7fd-837b-4847-a934-b7bd8ac79e53&abbucket=_AB-M32_B6&acm=03054.1003.1.587829&aldid=G7mk7IBD&abtest=_AB-LR32-PR32&scm=1007.12559.23636.100200300000000&pos=3&skuId=3107218533156&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px;\"/><area coords=\"400,496,791,840\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.1-b.w4004-12167004263.24.jq0GH5&id=522076029842&pvid=cae8313f-3ba2-474c-87df-c90a8cd801b3&abbucket=_AB-M73_B6&acm=03068.1003.1.702815&aldid=Q3y0d9LM&abtest=_AB-LR73-PR73&scm=1007.12941.28169.100200300000000&pos=9&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px;\"/><area coords=\"8,843,393,1193\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.1-b.w4004-11007092168.4.jq0GH5&id=45517279235&pvid=a3f1fb8b-9634-40f2-9797-1fbe934abf7b&abbucket=_AB-M73_B6&acm=03068.1003.1.702815&aldid=G6Fdsikz&abtest=_AB-LR73-PR73&scm=1007.12941.28169.100200300000000&pos=4&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px;\"/><area coords=\"398,844,785,1196\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.1-b.w4004-11007092168.22.jq0GH5&id=520140784319&pvid=a3f1fb8b-9634-40f2-9797-1fbe934abf7b&abbucket=_AB-M73_B6&acm=03068.1003.1.702815&aldid=G6Fdsikz&abtest=_AB-LR73-PR73&scm=1007.12941.28169.100200300000000&pos=11&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px;\"/></map></p><p></p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><img class=\"desc_anchor img-ks-lazyload\" id=\"desc-module-1\" src=\"https://assets.alicdn.com/kissy/1.0.0/build/imglazyload/spaceball.gif\" style=\"margin: 0px; padding: 0px; border: 0px; height: 1px; display: block; clear: both; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2178455930/TB2uEzNXXPcZ1BjSZFlXXb3PVXa_!!2178455930.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/></p><p><img class=\"desc_anchor img-ks-lazyload\" id=\"desc-module-2\" src=\"https://assets.alicdn.com/kissy/1.0.0/build/imglazyload/spaceball.gif\" style=\"margin: 0px; padding: 0px; border: 0px; height: 1px; display: block; clear: both; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2178455930/TB2W5ztaqi5V1BjSsphXXaEpXXa_!!2178455930.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2178455930/TB2Jxbsaqm5V1BjSszfXXXjxXXa_!!2178455930.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2178455930/TB2nuYzaqm5V1BjSszhXXcMtXXa_!!2178455930.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2178455930/TB2rw_saqm5V1BjSszfXXXjxXXa_!!2178455930.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2178455930/TB2nxYuaqm5V1Bjy1zeXXcTCFXa_!!2178455930.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2178455930/TB2EH6sap95V1Bjy0FfXXXvlFXa_!!2178455930.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2178455930/TB2kLnvaqi5V1BjSspnXXa.3XXa_!!2178455930.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_31.png','',1,0,0,0,0,0,1,0,'86','',NULL,NULL,0,0,'[]',0.00,0.00,3,'0','0','0','0',0,1499339585,1499339585,NULL,0,0,0,''),
	(32,'82TN电动窗帘电机智能家居遥控自动WIFI窗帘轨道镁铝合金加厚静音',0,131,1,130,131,0,'',0,0,1,0.00,397.00,397.00,0.00,0,0,0,0,0.00,0,500,0,0,50,0,0,0,0,0,0,0,87,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>品牌:&nbsp;尚飞</p></li><li><p>型号:&nbsp;s型</p></li><li><p>智能类型:&nbsp;阿里小智</p></li><li><p>颜色分类:&nbsp;KT82TN电机 KT82TV电机 DT82TN电机 DT82TV电机 1米内套餐 1.5米内套餐 2米内套餐 2.5米内套餐 3米内套餐 3.5米内套餐 4米内套餐 4.5米内套餐 5米内套餐 5.5米内套餐 6米内套餐 6.5米内套餐 7米内套餐 7.5米内套餐 WIFI电机加150 适配DT82型号加100 普通轨道 尚飞轨道 加厚静音轨道 镁铝合金加厚静音轨道</p></li><li><p>电机型号:&nbsp;KT82TN KT82TV</p></li><li><p>电机型号:&nbsp;DT82</p></li><li><p>智能电机:&nbsp;KT82TV WIFI版</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/2150818237/TB2k_S_ml0kpuFjSsppXXcGTXXa_!!2150818237.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/2150818237/TB2SRyDmb0kpuFjy0FjXXcBbVXa_!!2150818237.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/2150818237/TB23GOjjetTMeFjSZFOXXaTiVXa_!!2150818237.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/2150818237/TB2ljifmgJkpuFjSszcXXXfsFXa_!!2150818237.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/2150818237/TB2gCMIoypnpuFjSZFkXXc4ZpXa_!!2150818237.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/2150818237/TB2RD4yoHlmpuFjSZFlXXbdQXXa_!!2150818237.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/2150818237/TB2b20joUhnpuFjSZFpXXcpuXXa_!!2150818237.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/2150818237/TB2jyZVorBnpuFjSZFGXXX51pXa_!!2150818237.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/2150818237/TB2xoz_orJmpuFjSZFwXXaE4VXa_!!2150818237.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/2150818237/TB2l5wKotBopuFjSZPcXXc9EpXa_!!2150818237.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/2150818237/TB2QZi3mm0jpuFjy0FlXXc0bpXa_!!2150818237.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/2150818237/TB2BOGHml0kpuFjSsziXXa.oVXa_!!2150818237.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/2150818237/TB2YVzemgJlpuFjSspjXXcT.pXa_!!2150818237.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/2150818237/TB2n4zqixRDOuFjSZFzXXcIipXa_!!2150818237.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/2150818237/TB2rmCGmbtlpuFjSspfXXXLUpXa_!!2150818237.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/2150818237/TB2_9zUoxtmpuFjSZFqXXbHFpXa_!!2150818237.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_32.png','',1,0,0,0,0,0,1,0,'87,88','',NULL,NULL,0,0,'[]',0.00,0.00,3,'0','0','0','0',0,1499339673,1499339673,NULL,0,0,0,''),
	(33,'Hisense/海信 LED32EC320A高清32吋智能WIFI网络平板液晶电视机40',0,55,1,14,55,0,'',0,0,1,0.00,1399.00,1399.00,0.00,0,0,0,0,0.00,0,2000,0,0,200,0,0,0,0,0,0,0,89,'','','<p>品牌名称：<a class=\"J_EbrandLogo\" target=\"_blank\" href=\"https://brand.tmall.com/brandInfo.htm?brandId=11599&type=0&scm=1048.1.1.4\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(51, 85, 170); outline: 0px;\">Hisense/海信</a></p><p><a class=\"tm-collectBtn j_DetailBrand\" data-brandid=\"11599\" href=\"https://detail.tmall.com/item.htm?spm=a230r.1.14.3.ebb2eb2CAjiHU&id=537999675746&cm_id=140105335569ed55e27b&abbucket=15&skuId=3212983491977#\" hidefocus=\"true\" style=\"margin: 0px; padding: 0px; color: rgb(255, 255, 255); outline: 0px; position: relative; display: inline-block; height: 22px; width: 75px; border-radius: 11px; line-height: 22px; text-align: center; white-space: nowrap; cursor: pointer; transition: all 0.2s ease-in; text-decoration: none !important; background-color: rgb(255, 0, 54);\"><em style=\"margin: 0px 0px -2px; padding: 0px; display: inline-block; width: 12px; height: 12px; line-height: 12px; overflow: hidden; transition: none; background-image: url(&quot;//img-tmdetail.alicdn.com/tps/i3/T1F05SXB4cXXcGdY6f-38-12.png&quot;); background-position: 0px 0px; background-repeat: no-repeat;\"></em><span style=\"margin: 0px 0px 0px 4px; padding: 0px;\">关注</span></a></p><p class=\"attr-list-hd tm-clear\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 20px; line-height: 22px; color: rgb(153, 153, 153);\"><a class=\"ui-more-nbg tm-MRswitchAttrs\" href=\"https://detail.tmall.com/item.htm?spm=a230r.1.14.3.ebb2eb2CAjiHU&id=537999675746&cm_id=140105335569ed55e27b&abbucket=15&skuId=3212983491977#J_Attrs\" style=\"margin: 0px; padding: 0px 28px 0px 10px; text-decoration: none; color: rgb(153, 153, 153); outline: 0px; display: inline-block; position: relative; height: 20px; float: right;\">更多参数<em class=\"ui-more-nbg-arrow tm-MRswitchAttrs\" style=\"margin: 0px; padding: 0px; top: 6px; right: 10px; width: 13px; position: absolute; display: inline-block; height: 13px; line-height: 13px; overflow: hidden; background-image: url(&quot;//assets.alicdn.com/apps/tmall/mui/more/img/more.png&quot;); background-position: 0px -26px; background-repeat: no-repeat;\"></em></a><span style=\"margin: 0px; padding: 0px; font-weight: 700; float: left;\">产品参数：</span></p><ul id=\"J_AttrUL\" style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>证书编号：2015010808831843</p></li><li><p>证书状态：有效</p></li><li><p>申请人名称：青岛海信电器股份有限公司</p></li><li><p>制造商名称：青岛海信电器股份有限公司</p></li><li><p>产品名称：液晶电视</p></li><li><p>3C产品型号：LED32K3100、LED32EC320A</p></li><li><p>3C规格型号：LED32K3100、LED32EC320A：220VAC 50Hz 50W</p></li><li><p>产品名称：Hisense/海信 LED32EC320...</p></li><li><p>品牌:&nbsp;Hisense/海信</p></li><li><p>型号:&nbsp;LED32EC320A</p></li><li><p>分辨率:&nbsp;1366x768</p></li><li><p>3D类型:&nbsp;无</p></li><li><p>能效等级:&nbsp;三级</p></li><li><p>网络连接方式:&nbsp;全部支持</p></li><li><p>操作系统:&nbsp;VIDAA</p></li></ul><p><a style=\"margin: 0px; padding: 0px; color: rgb(51, 85, 170); outline: 0px;\"><img src=\"https://img.alicdn.com/tps/i3/T18rwmFuJbXXXt0DDB-790-250.png\" style=\"margin: 0px; padding: 0px; border: 0px;\"/></a></p><p><img src=\"https://img.alicdn.com/tps/i4/TB1rzDAFVXXXXaPXVXX.YoD8pXX-790-60.png\" alt=\"电器城Detail服务\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: top;\"/></p><p><a href=\"https://dianqi.tmall.com/page/helpcenter.htm?second=jcbz&spm=0.0.0.0.IPSUwh&third=shsm&first=psbz&scm=1003.4.lb-tms-1290929-40698.OTHER_2_100687\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(51, 85, 170); outline: 0px;\"><img src=\"https://img.alicdn.com/tps/i2/TB1WJaJGXXXXXbXaXXXLYQE8pXX-790-64.png\" alt=\"电器城Detail-送货入门\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: top;\"/></a></p><p><a href=\"https://dianqi.tmall.com/page/helpcenter.htm?scm=1003.4.lb-tms-1290897-40693.OTHER_2_100666\" target=\"_blank\" class=\"c3detail-server-link\" style=\"margin: 0px auto; padding: 0px; text-decoration: none; color: rgb(51, 85, 170); outline: 0px; width: 144px; height: 42px; display: block; overflow: hidden; background: url(&quot;//img.alicdn.com/tps/i4/TB1_wyNGXXXXXc5XFXXNC4_FVXX-150-86.jpg&quot;) no-repeat;\"></a></p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><span style=\"margin: 0px; padding: 0px;\"><img src=\"https://gdp.alicdn.com/imgextra/i3/429413615/TB2oVvCvYBkpuFjy1zkXXbSpFXa_!!429413615.jpg\" alt=\" 日常-固定区790.jpg\" usemap=\"#df790\" border=\"0\" style=\"margin: 0px; padding: 0px; border: none; vertical-align: middle; display: inline-block;\"/><map name=\"df790\" style=\"margin: 0px; padding: 0px;\"><area coords=\"28,29,256,264\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.1-b-s.w5003-16537689397.1.1DskVs&id=538822738664&skuId=3219794373369&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px;\"/><area coords=\"273,31,519,262\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.1-b-s.w5003-16537689397.2.1DskVs&id=538914941462&skuId=3220160785660&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px;\"/><area coords=\"531,31,775,264\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.1-b-s.w5003-16537689397.3.1DskVs&id=538950252649&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px;\"/><area coords=\"26,291,252,516\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.1-b-s.w5003-16537689397.4.1DskVs&id=552326143070&sku_properties=5919063:6536025&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px;\"/><area coords=\"282,292,516,520\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.1-b-s.w5003-16537689397.6.1DskVs&id=538946368612&sku_properties=5919063:6536025&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px;\"/><area coords=\"537,289,773,522\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.1-b-s.w5003-16537689397.8.1DskVs&id=544049841513&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px;\"/></map></span></p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><img class=\"desc_anchor img-ks-lazyload\" id=\"desc-module-1\" src=\"https://assets.alicdn.com/kissy/1.0.0/build/imglazyload/spaceball.gif\" style=\"margin: 0px; padding: 0px; border: 0px; height: 1px; display: block; clear: both; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4;\"><img alt=\"关于价格3.jpg\" src=\"https://img.alicdn.com/imgextra/i4/429413615/TB2tc2_qXXXXXbjXXXXXXXXXXXX_!!429413615.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img alt=\"B2C版-32-EC320-2017.3_01.jpg\" src=\"https://img.alicdn.com/imgextra/i4/429413615/TB2Ui6SrypnpuFjSZFIXXXh2VXa_!!429413615.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_33.png','',1,0,0,0,0,0,1,0,'89','',NULL,NULL,0,0,'[]',0.00,0.00,3,'0','0','0','0',0,1499339876,1499339876,NULL,0,0,0,''),
	(34,'乐视TV 超4 X50 50英寸超级电视机液晶 高清智能wifi网络平板彩电',0,55,1,14,55,0,'',0,0,1,0.00,3787.00,3787.00,0.00,0,0,0,0,0.00,0,2000,0,0,100,0,0,0,0,0,0,0,90,'','','<p class=\"attr-list-hd tm-clear\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 20px; line-height: 22px; color: rgb(153, 153, 153);\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; float: left;\">产品参数：</span></p><ul id=\"J_AttrUL\" style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>证书编号：2016010808856342</p></li><li><p>证书状态：有效</p></li><li><p>申请人名称：冠捷科技（青岛）有限公司</p></li><li><p>制造商名称：乐视致新电子科技（天津）有限公司</p></li><li><p>产品名称：液晶彩色电视</p></li><li><p>3C产品型号：L504LN、L504L5、L504L6、L504L7、L504L8、L504AN、 L504A5、...</p></li><li><p>3C规格型号：L504LN、L504L5、L504L6、L504L7、L504L8、L504AN、 L504A5、...</p></li><li><p>产品名称：乐视TV 超4 X50</p></li><li><p>品牌:&nbsp;乐视TV</p></li><li><p>型号:&nbsp;超4 X50</p></li><li><p>分辨率:&nbsp;1920x1080</p></li><li><p>3D类型:&nbsp;无</p></li><li><p>能效等级:&nbsp;二级</p></li><li><p>网络连接方式:&nbsp;全部支持</p></li><li><p>操作系统:&nbsp;EUI TV版</p></li></ul><p><a style=\"margin: 0px; padding: 0px; color: rgb(51, 85, 170); outline: 0px;\"><img src=\"https://img.alicdn.com/tps/i3/T18rwmFuJbXXXt0DDB-790-250.png\" style=\"margin: 0px; padding: 0px; border: 0px;\"/></a></p><p><img src=\"https://img.alicdn.com/tps/i4/TB1rzDAFVXXXXaPXVXX.YoD8pXX-790-60.png\" alt=\"电器城Detail服务\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: top;\"/></p><p><a href=\"https://dianqi.tmall.com/page/helpcenter.htm?second=jcbz&spm=0.0.0.0.IPSUwh&third=shsm&first=psbz&scm=1003.4.lb-tms-1290929-40698.OTHER_2_100687\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(51, 85, 170); outline: 0px;\"><img src=\"https://img.alicdn.com/tps/i2/TB1WJaJGXXXXXbXaXXXLYQE8pXX-790-64.png\" alt=\"电器城Detail-送货入门\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: top;\"/></a></p><p><a href=\"https://dianqi.tmall.com/page/helpcenter.htm?second=jcbz&spm=0.0.0.0.8stOh9&third=qglb&first=shbz&scm=1003.4.lb-tms-1290924-40696.OTHER_2_100681\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(51, 85, 170); outline: 0px;\"><img src=\"https://img.alicdn.com/tps/i4/TB1rNqPGXXXXXXxaXXXLYQE8pXX-790-64.png\" alt=\"电器城Detail-全国联保\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: top;\"/></a></p><p><a href=\"https://dianqi.tmall.com/page/helpcenter.htm?scm=1003.4.lb-tms-1290897-40693.OTHER_2_100666\" target=\"_blank\" class=\"c3detail-server-link\" style=\"margin: 0px auto; padding: 0px; text-decoration: none; color: rgb(51, 85, 170); outline: 0px; width: 144px; height: 42px; display: block; overflow: hidden; background: url(&quot;//img.alicdn.com/tps/i4/TB1_wyNGXXXXXc5XFXXNC4_FVXX-150-86.jpg&quot;) no-repeat;\"></a></p><p><img class=\"desc_anchor img-ks-lazyload\" id=\"desc-module-1\" src=\"https://assets.alicdn.com/kissy/1.0.0/build/imglazyload/spaceball.gif\" style=\"margin: 0px; padding: 0px; border: 0px; height: 1px; display: block; clear: both; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4;\"><a href=\"https://detail.tmall.com/item.htm?spm=a220z.1000880.0.0.KTOg6s&id=545547927912\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(51, 85, 170); outline: 0px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2091259345/TB20fk.zm0mpuFjSZPiXXbssVXa_!!2091259345.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/></a><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2091259345/TB2VMo0yJBopuFjSZPcXXc9EpXa_!!2091259345.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2091259345/TB2wJuyyYBmpuFjSZFuXXaG_XXa_!!2091259345.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img src=\"https://img.alicdn.com/imgextra/i4/2091259345/TB2s5jkAylnpuFjSZFgXXbi7FXa_!!2091259345.jpg\" align=\"absmiddle\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/></p><p><img class=\"desc_anchor img-ks-lazyload\" id=\"desc-module-2\" src=\"https://assets.alicdn.com/kissy/1.0.0/build/imglazyload/spaceball.gif\" style=\"margin: 0px; padding: 0px; border: 0px; height: 1px; display: block; clear: both; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2091259345/TB2i0t7c80kpuFjy1XaXXaFkVXa_!!2091259345.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2091259345/TB2jsV6cYVkpuFjSspcXXbSMVXa_!!2091259345.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_34.png','',1,0,0,0,0,0,1,0,'90,91','',NULL,NULL,0,0,'[]',0.00,0.00,3,'0','0','0','0',0,1499340078,1499340078,NULL,0,0,0,''),
	(35,'Sharp/夏普 LCD-70SU665A 70英寸高清4K网络智能液晶平板电视机65',0,55,1,14,55,0,'',0,0,1,0.00,4200.00,4200.00,0.00,0,0,0,0,0.00,0,2000,0,0,100,0,0,0,0,0,0,0,92,'','','<p><a class=\"tm-collectBtn j_DetailBrand\" data-brandid=\"10590\" href=\"https://detail.tmall.com/item.htm?spm=a230r.1.14.3.ebb2eb2sagHEE&id=542912666088&cm_id=140105335569ed55e27b&abbucket=15&skuId=3265053617513#\" hidefocus=\"true\" style=\"margin: 0px; padding: 0px; color: rgb(255, 255, 255); outline: 0px; position: relative; display: inline-block; height: 22px; width: 75px; border-radius: 11px; line-height: 22px; text-align: center; white-space: nowrap; cursor: pointer; transition: all 0.2s ease-in; text-decoration: none !important; background-color: rgb(255, 0, 54);\"><em style=\"margin: 0px 0px -2px; padding: 0px; display: inline-block; width: 12px; height: 12px; line-height: 12px; overflow: hidden; transition: none; background-image: url(&quot;//img-tmdetail.alicdn.com/tps/i3/T1F05SXB4cXXcGdY6f-38-12.png&quot;); background-position: 0px 0px; background-repeat: no-repeat;\"></em><span style=\"margin: 0px 0px 0px 4px; padding: 0px;\">关注</span></a></p><p class=\"attr-list-hd tm-clear\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 20px; line-height: 22px; color: rgb(153, 153, 153);\"><a class=\"ui-more-nbg tm-MRswitchAttrs\" href=\"https://detail.tmall.com/item.htm?spm=a230r.1.14.3.ebb2eb2sagHEE&id=542912666088&cm_id=140105335569ed55e27b&abbucket=15&skuId=3265053617513#J_Attrs\" style=\"margin: 0px; padding: 0px 28px 0px 10px; text-decoration: none; color: rgb(153, 153, 153); outline: 0px; display: inline-block; position: relative; height: 20px; float: right;\">更多参数<em class=\"ui-more-nbg-arrow tm-MRswitchAttrs\" style=\"margin: 0px; padding: 0px; top: 6px; right: 10px; width: 13px; position: absolute; display: inline-block; height: 13px; line-height: 13px; overflow: hidden; background-image: url(&quot;//assets.alicdn.com/apps/tmall/mui/more/img/more.png&quot;); background-position: 0px -26px; background-repeat: no-repeat;\"></em></a><span style=\"margin: 0px; padding: 0px; font-weight: 700; float: left;\">产品参数：</span></p><ul id=\"J_AttrUL\" style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>证书编号：2016010808881616</p></li><li><p>证书状态：有效</p></li><li><p>产品名称：液晶彩色电视机</p></li><li><p>3C规格型号：LCD-70SU660A,LCD-70SU661A,LCD-70TX73A,LCD-70MY73A,...</p></li><li><p>产品名称：Sharp/夏普 LCD-70SU665...</p></li><li><p>品牌:&nbsp;Sharp/夏普</p></li><li><p>夏普LED型号:&nbsp;LCD-70SU665A</p></li><li><p>分辨率:&nbsp;3840x2160</p></li><li><p>3D类型:&nbsp;无</p></li><li><p>能效等级:&nbsp;二级</p></li><li><p>网络连接方式:&nbsp;全部支持</p></li><li><p>操作系统:&nbsp;安卓</p></li></ul><p><a style=\"margin: 0px; padding: 0px; color: rgb(51, 85, 170); outline: 0px;\"><img src=\"https://img.alicdn.com/tps/i3/T18rwmFuJbXXXt0DDB-790-250.png\" style=\"margin: 0px; padding: 0px; border: 0px;\"/></a></p><p><img src=\"https://img.alicdn.com/tps/i4/TB1rzDAFVXXXXaPXVXX.YoD8pXX-790-60.png\" alt=\"电器城Detail服务\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: top;\"/></p><p><a href=\"https://dianqi.tmall.com/page/helpcenter.htm?second=jcbz&spm=0.0.0.0.IPSUwh&third=shsm&first=psbz&scm=1003.4.lb-tms-1290929-40698.OTHER_2_100687\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(51, 85, 170); outline: 0px;\"><img src=\"https://img.alicdn.com/tps/i2/TB1WJaJGXXXXXbXaXXXLYQE8pXX-790-64.png\" alt=\"电器城Detail-送货入门\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: top;\"/></a></p><p><a href=\"https://dianqi.tmall.com/page/helpcenter.htm?scm=1003.4.lb-tms-1290897-40693.OTHER_2_100666\" target=\"_blank\" class=\"c3detail-server-link\" style=\"margin: 0px auto; padding: 0px; text-decoration: none; color: rgb(51, 85, 170); outline: 0px; width: 144px; height: 42px; display: block; overflow: hidden; background: url(&quot;//img.alicdn.com/tps/i4/TB1_wyNGXXXXXc5XFXXNC4_FVXX-150-86.jpg&quot;) no-repeat;\"></a></p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><span style=\"margin: 0px; padding: 0px;\"><area coords=\"6,5,783,351\" href=\"https://sharp.tmall.com/?scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px;\"/><area coords=\"7,359,277,494\" href=\"https://taoquan.taobao.com/coupon/unify_apply.htm?spm=a1z10.1-b-s.w5003-15948235488.2.yx67Jo&sellerId=2993567440&activityId=9ae7a2cb5207464baadf5f801adeaa1d&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px;\"/><area coords=\"536,357,787,493\" href=\"https://sharp.tmall.com/p/rd343535.htm?scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px;\"/><area coords=\"281,360,527,494\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.4-b-s.w5001-15158917759.3.5473fd36ineYx&id=539740554571&rn=b7b8c7468da244d481eff1f0e0a80cbc&abbucket=6&skuId=3198954723367&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px;\"/><area coords=\"7,500,260,846\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.1-b-s.w5003-15948235488.3.yx67Jo&id=546667018339&rn=b7b8c7468da244d481eff1f0e0a80cbc&abbucket=6&skuId=3305538245932&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px;\"/><area coords=\"265,501,524,847\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.1-b-s.w5003-15948235488.5.yx67Jo&abtest=_AB-LR32-PR32&pvid=53423b56-c3ee-4a87-94ff-7cc3072c3e13&pos=1&abbucket=_AB-M32_B18&acm=03054.1003.1.1539344&id=539422766176&scm=1007.12144.81309.23864_0&skuId=3232168584764&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px;\"/><area coords=\"527,500,790,846\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.1-b-s.w5003-15948235488.4.yx67Jo&id=539740554571&rn=b7b8c7468da244d481eff1f0e0a80cbc&abbucket=6&skuId=3198954723367&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px;\"/><area coords=\"7,848,260,1207\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-15158917778.133.316811b9WVLJgr&id=546667370332&rn=815521e26c90e0a980f7005329f4aaf8&abbucket=6&skuId=3305294872241&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px;\"/><area coords=\"264,851,525,1206\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-15158917778.138.316811b9WVLJgr&id=542871252080&rn=815521e26c90e0a980f7005329f4aaf8&abbucket=6&sku_properties=5919063:6536025&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px;\"/><area coords=\"528,851,787,1206\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-15158917778.148.316811b9WVLJgr&id=542910941431&rn=815521e26c90e0a980f7005329f4aaf8&abbucket=6&skuId=3428933650785&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px;\"/></span></p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><img class=\"desc_anchor img-ks-lazyload\" id=\"desc-module-1\" src=\"https://assets.alicdn.com/kissy/1.0.0/build/imglazyload/spaceball.gif\" style=\"margin: 0px; padding: 0px; border: 0px; height: 1px; display: block; clear: both; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4;\"><span style=\"margin: 0px; padding: 0px; color: rgb(255, 255, 255);\">edgfgfgfgfg</span></p><p><img class=\"desc_anchor img-ks-lazyload\" id=\"desc-module-2\" src=\"https://assets.alicdn.com/kissy/1.0.0/build/imglazyload/spaceball.gif\" style=\"margin: 0px; padding: 0px; border: 0px; height: 1px; display: block; clear: both; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/><img class=\"desc_anchor img-ks-lazyload\" id=\"desc-module-3\" src=\"https://assets.alicdn.com/kissy/1.0.0/build/imglazyload/spaceball.gif\" style=\"margin: 0px; padding: 0px; border: 0px; height: 1px; display: block; clear: both; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/></p><p><a href=\"https://shop.m.taobao.com/shop/coupon.htm?sellerId=2993567440&activityId=46742a52985e485388012c2eacff1dc5\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(51, 85, 170); outline: 0px;\"></a><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2993567440/TB2FS_ZkHJkpuFjy1zcXXa5FFXa_!!2993567440.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2993567440/TB2KWhTydBopuFjSZPcXXc9EpXa_!!2993567440.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/><a href=\"https://shop.m.taobao.com/shop/coupon.htm?sellerId=2993567440&activityId=46742a52985e485388012c2eacff1dc5\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(51, 85, 170); outline: 0px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2993567440/TB2Ali6bYlmpuFjSZFlXXbdQXXa_!!2993567440.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/></a><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2993567440/TB2xBQCzypnpuFjSZFkXXc4ZpXa_!!2993567440.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/><a style=\"margin: 0px; padding: 0px; color: rgb(51, 85, 170); outline: 0px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2993567440/TB28gtHjd0opuFjSZFxXXaDNVXa_!!2993567440.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/></a><a href=\"https://shop.m.taobao.com/shop/coupon.htm?sellerId=2993567440&activityId=46742a52985e485388012c2eacff1dc5\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(51, 85, 170); outline: 0px;\"></a><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2993567440/TB2.e6vvShlpuFjSspkXXa1ApXa_!!2993567440.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/><a style=\"margin: 0px; padding: 0px; color: rgb(51, 85, 170); outline: 0px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2993567440/TB2aEzTbCBjpuFjy1XdXXaooVXa_!!2993567440.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/></a></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_35.png','',1,0,0,0,0,0,1,0,'92,93','',NULL,NULL,0,4,'[]',0.00,0.00,3,'0','0','0','0',0,1499340221,1499340221,NULL,0,0,0,''),
	(36,'Xiaomi/小米 小米电视3s 55英寸 4k壁挂智能液晶平板电视机50 60',0,55,1,14,55,0,'',0,0,1,0.00,2396.00,2396.00,0.00,0,0,0,0,0.00,0,1500,0,0,98,0,0,0,0,0,0,0,94,'','','<p class=\"attr-list-hd tm-clear\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 20px; line-height: 22px; color: rgb(153, 153, 153);\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; float: left;\">产品参数：</span></p><ul id=\"J_AttrUL\" style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>证书编号：2016010808887304</p></li><li><p>证书状态：有效</p></li><li><p>申请人名称：北京小米电子产品有限公司</p></li><li><p>制造商名称：北京小米电子产品有限公司</p></li><li><p>产品名称：小米电视</p></li><li><p>3C产品型号：L55M5-AA：200~240V~50/60Hz 160W</p></li><li><p>3C规格型号：L55M5-AA ：200-240V～ 50/60Hz 160W</p></li><li><p>产品名称：Xiaomi/小米 小米电视3s ...</p></li><li><p>品牌:&nbsp;Xiaomi/小米</p></li><li><p>型号:&nbsp;小米电视3s 55英寸</p></li><li><p>分辨率:&nbsp;3840x2160</p></li><li><p>3D类型:&nbsp;无</p></li><li><p>能效等级:&nbsp;三级</p></li><li><p>网络连接方式:&nbsp;全部支持</p></li><li><p>操作系统:&nbsp;MIUI</p></li></ul><p><a style=\"margin: 0px; padding: 0px; color: rgb(51, 85, 170); outline: 0px;\"><img src=\"https://img.alicdn.com/tps/i3/T18rwmFuJbXXXt0DDB-790-250.png\" style=\"margin: 0px; padding: 0px; border: 0px;\"/></a></p><p><img src=\"https://img.alicdn.com/tps/i4/TB1rzDAFVXXXXaPXVXX.YoD8pXX-790-60.png\" alt=\"电器城Detail服务\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: top;\"/></p><p><a href=\"https://dianqi.tmall.com/page/helpcenter.htm?second=jcbz&spm=0.0.0.0.IPSUwh&third=shsm&first=psbz&scm=1003.4.lb-tms-1290929-40698.OTHER_2_100687\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(51, 85, 170); outline: 0px;\"><img src=\"https://img.alicdn.com/tps/i2/TB1WJaJGXXXXXbXaXXXLYQE8pXX-790-64.png\" alt=\"电器城Detail-送货入门\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: top;\"/></a></p><p><a href=\"https://dianqi.tmall.com/page/helpcenter.htm?second=jcbz&spm=0.0.0.0.8stOh9&third=qglb&first=shbz&scm=1003.4.lb-tms-1290924-40696.OTHER_2_100681\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(51, 85, 170); outline: 0px;\"><img src=\"https://img.alicdn.com/tps/i4/TB1rNqPGXXXXXXxaXXXLYQE8pXX-790-64.png\" alt=\"电器城Detail-全国联保\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: top;\"/></a></p><p><a href=\"https://dianqi.tmall.com/page/helpcenter.htm?scm=1003.4.lb-tms-1290897-40693.OTHER_2_100666\" target=\"_blank\" class=\"c3detail-server-link\" style=\"margin: 0px auto; padding: 0px; text-decoration: none; color: rgb(51, 85, 170); outline: 0px; width: 144px; height: 42px; display: block; overflow: hidden; background: url(&quot;//img.alicdn.com/tps/i4/TB1_wyNGXXXXXc5XFXXNC4_FVXX-150-86.jpg&quot;) no-repeat;\"></a></p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><span style=\"margin: 0px; padding: 0px;\"></span></p><p><a class=\"jdb abs ap5Nk-0Rag\" href=\"https://detail.tmall.com/item.htm?id=546610949845&sku_properties=5919063:6536025&scene=taobao_shop\" target=\"_blank\" data-linkmode=\"ptlink\" data-appid=\"ap5Nk-0Rag\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; position: absolute; border: none; display: block; width: 790px; height: 300px; top: 617px; left: 0px; z-index: 10; background: url(&quot;//gdp.alicdn.com/imgextra/i4/1714128138/TB2l9OpvrFkpuFjy1XcXXclapXa-1714128138.jpg&quot;) 50% 50% no-repeat;\"></a><a class=\"jsib abs a2kim-2cA0\" href=\"https://xiaomi.tmall.com/p/rd655212.htm?\" target=\"_blank\" data-linkmode=\"ptlink\" data-appid=\"a2kim-2cA0\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: rgb(255, 255, 255) 0px; position: absolute; border: none; display: block; width: 790px; height: 350px; top: 0px; left: 0px; z-index: 10; background: url(&quot;//gdp.alicdn.com/imgextra/i3/1714128138/TB2AE8mi9B0XKJjSZFsXXaxfpXa-1714128138.jpg&quot;) 50% 50% no-repeat;\"></a><a class=\"jdb abs asTIl-1BB0\" target=\"_blank\" data-linkmode=\"ptlink\" data-appid=\"asTIl-1BB0\" style=\"margin: 0px; padding: 0px; color: rgb(41, 83, 166); outline: 0px; position: absolute; border: none; display: block; width: 790px; height: 268px; top: 349px; left: 0px; z-index: 10; cursor: default; background: url(&quot;//gdp.alicdn.com/imgextra/i3/1714128138/TB27GBtubRkpuFjSspmXXc.9XXa-1714128138.jpg&quot;) 50% 50% no-repeat;\"></a><a class=\"jdb abs aQK6Z-ro1X\" href=\"https://xiaomi.tmall.com/p/rd020756.htm?\" target=\"_blank\" data-linkmode=\"ptlink\" data-appid=\"aQK6Z-ro1X\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; position: absolute; border: none; display: block; width: 389px; height: 254px; top: 356px; left: 6px; z-index: 10;\"></a><a class=\"jdb abs aQK6Z-XyDC\" href=\"https://xiaomi.tmall.com/p/rd417282.htm?scene=taobao_shop\" target=\"_blank\" data-linkmode=\"ptlink\" data-appid=\"aQK6Z-XyDC\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; position: absolute; border: none; display: block; width: 389px; height: 258px; top: 354px; left: 398px; z-index: 10;\"></a></p><p></p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><img class=\"desc_anchor img-ks-lazyload\" id=\"desc-module-1\" src=\"https://assets.alicdn.com/kissy/1.0.0/build/imglazyload/spaceball.gif\" style=\"margin: 0px; padding: 0px; border: 0px; height: 1px; display: block; clear: both; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4; text-align: center;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1714128138/TB2.KEEebBnpuFjSZFGXXX51pXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2W_._bxeK.eBjSZFuXXcT4FXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2y2g2bA1M.eBjSZFFXXc3vVXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2RLAAc91I.eBjy0FjXXabfXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB21Rc5bzm2.eBjSZFtXXX56VXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1714128138/TB2R3Q8bwCN.eBjSZFoXXXj0FXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB28PjybmiJ.eBjSspfXXbBKFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1714128138/TB2f6_BbmuJ.eBjy0FgXXXBBXXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1714128138/TB2uDrCbhmJ.eBjy0FhXXbBdFXa-1714128138.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_36.png','',1,0,0,0,0,0,1,0,'94','',NULL,NULL,0,4,'[]',0.00,0.00,3,'0','0','0','0',0,1499340312,1499340312,NULL,0,0,0,''),
	(37,'新品TCL 49A660U 49英寸4K金属纤薄高清智能LED液晶网络平板电视',0,55,1,14,55,0,'',0,0,1,0.00,3496.00,3496.00,0.00,0,0,0,0,0.00,0,200,0,0,100,0,0,0,0,0,0,0,95,'','','<p class=\"attr-list-hd tm-clear\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 20px; line-height: 22px; color: rgb(153, 153, 153);\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; float: left;\">产品参数：</span></p><ul id=\"J_AttrUL\" style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>证书编号：2016010808880009</p></li><li><p>证书状态：有效</p></li><li><p>产品名称：液晶电视机</p></li><li><p>3C规格型号：L49P1-UD、 L49P2-UD、 L49P3-UD、L49P4-UD、 L49P5-UD、 L...</p></li><li><p>产品名称：TCL 49A660U</p></li><li><p>品牌:&nbsp;TCL</p></li><li><p>TCL LED型号:&nbsp;49A660U</p></li><li><p>分辨率:&nbsp;3840x2160</p></li><li><p>3D类型:&nbsp;无</p></li><li><p>能效等级:&nbsp;三级</p></li><li><p>网络连接方式:&nbsp;全部支持</p></li><li><p>操作系统:&nbsp;安卓</p></li></ul><p><a style=\"margin: 0px; padding: 0px; color: rgb(51, 85, 170); outline: 0px;\"><img src=\"https://img.alicdn.com/tps/i3/T18rwmFuJbXXXt0DDB-790-250.png\" style=\"margin: 0px; padding: 0px; border: 0px;\"/></a></p><p><img src=\"https://img.alicdn.com/tps/i4/TB1rzDAFVXXXXaPXVXX.YoD8pXX-790-60.png\" alt=\"电器城Detail服务\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: top;\"/></p><p><a href=\"https://dianqi.tmall.com/page/helpcenter.htm?second=jcbz&spm=0.0.0.0.IPSUwh&third=shsm&first=psbz&scm=1003.4.lb-tms-1290929-40698.OTHER_2_100687\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(51, 85, 170); outline: 0px;\"><img src=\"https://img.alicdn.com/tps/i2/TB1WJaJGXXXXXbXaXXXLYQE8pXX-790-64.png\" alt=\"电器城Detail-送货入门\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: top;\"/></a></p><p><a href=\"https://dianqi.tmall.com/page/helpcenter.htm?scm=1003.4.lb-tms-1290897-40693.OTHER_2_100666\" target=\"_blank\" class=\"c3detail-server-link\" style=\"margin: 0px auto; padding: 0px; text-decoration: none; color: rgb(51, 85, 170); outline: 0px; width: 144px; height: 42px; display: block; overflow: hidden; background: url(&quot;//img.alicdn.com/tps/i4/TB1_wyNGXXXXXc5XFXXNC4_FVXX-150-86.jpg&quot;) no-repeat;\"></a></p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><span style=\"margin: 0px; padding: 0px;\"></span></p><p><a class=\"itemareachild abs june-box-fadein\" href=\"https://detail.tmall.com/item.htm?id=549584040450&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; position: absolute; opacity: 0; border: 1px solid rgb(247, 40, 98); display: block; top: -1px; left: -1px; width: 250px; height: 286px; border-radius: 0px; box-shadow: rgb(0, 0, 0) 0px 0px 0px 0px;\"></a><a class=\"abs jibbg\" data-e=\"none;\" href=\"https://detail.tmall.com/item.htm?id=549584040450&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; position: absolute; border-width: 0px; display: block; overflow: hidden; width: 250px; height: 250px; top: 0px; left: 0px; background: url(&quot;//gdp.alicdn.com/imgextra/i3/TB1Xa5wSXXXXXa9XVXXXXXXXXXX_!!0-item_pic.jpg_250x250.jpg&quot;) 50% 50% no-repeat;\"></a></p><p>&nbsp;</p><p><a class=\"abs jibtitle\" href=\"https://detail.tmall.com/item.htm?id=549584040450&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(138, 138, 138); outline: 0px; position: absolute; border-width: 0px; display: block; overflow: hidden; width: 220px; height: 26px; top: 255px; left: 10px; text-align: center; font-family: 微软雅黑; font-size: 17px; line-height: 22px;\">65吋高端曲面巨幕影院</a></p><p><a class=\"itemareachild abs june-box-fadein\" href=\"https://detail.tmall.com/item.htm?id=548074501486&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; position: absolute; opacity: 0; border: 1px solid rgb(247, 40, 98); display: block; top: -1px; left: -1px; width: 250px; height: 286px; border-radius: 0px; box-shadow: rgb(0, 0, 0) 0px 0px 0px 0px;\"></a><a class=\"abs jibbg\" data-e=\"none;\" href=\"https://detail.tmall.com/item.htm?id=548074501486&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; position: absolute; border-width: 0px; display: block; overflow: hidden; width: 250px; height: 250px; top: 0px; left: 0px; background: url(&quot;//gdp.alicdn.com/imgextra/i3/TB1UQK4SXXXXXblXXXXXXXXXXXX_!!0-item_pic.jpg_250x250.jpg&quot;) 50% 50% no-repeat;\"></a></p><p>&nbsp;</p><p><a class=\"abs jibtitle\" href=\"https://detail.tmall.com/item.htm?id=548074501486&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(138, 138, 138); outline: 0px; position: absolute; border-width: 0px; display: block; overflow: hidden; width: 220px; height: 26px; top: 255px; left: 10px; text-align: center; font-family: 微软雅黑; font-size: 17px; line-height: 22px;\">55吋高端影院级曲面</a></p><p><a class=\"itemareachild abs june-box-fadein\" href=\"https://detail.tmall.com/item.htm?id=545437601392&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; position: absolute; opacity: 0; border: 1px solid rgb(247, 40, 98); display: block; top: -1px; left: -1px; width: 250px; height: 286px; border-radius: 0px; box-shadow: rgb(0, 0, 0) 0px 0px 0px 0px;\"></a><a class=\"abs jibbg\" data-e=\"none;\" href=\"https://detail.tmall.com/item.htm?id=545437601392&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; position: absolute; border-width: 0px; display: block; overflow: hidden; width: 250px; height: 250px; top: 0px; left: 0px; background: url(&quot;//gdp.alicdn.com/imgextra/i4/TB1vaxvSXXXXXcSaXXXXXXXXXXX_!!0-item_pic.jpg_250x250.jpg&quot;) 50% 50% no-repeat;\"></a></p><p>&nbsp;</p><p><a class=\"abs jibtitle\" href=\"https://detail.tmall.com/item.htm?id=545437601392&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(138, 138, 138); outline: 0px; position: absolute; border-width: 0px; display: block; overflow: hidden; width: 220px; height: 26px; top: 255px; left: 10px; text-align: center; font-family: 微软雅黑; font-size: 17px; line-height: 22px;\">65吋人工智能纤薄30核</a></p><p><a class=\"jsib abs alvAq-h8D3\" target=\"_blank\" data-linkmode=\"ptlink\" data-appid=\"alvAq-h8D3\" style=\"margin: 0px; padding: 0px; color: rgb(41, 83, 166); outline: rgb(255, 255, 255) 0px; position: absolute; border: none; display: block; width: 790px; height: 312px; top: 0px; left: 0px; z-index: 10; cursor: default; background: url(&quot;//gdp.alicdn.com/imgextra/i2/395601843/TB2LARKAypnpuFjSZFkXXc4ZpXa_!!395601843.jpg&quot;) 50% 50% no-repeat;\"></a><a class=\"jdb abs aIGkP-D82p\" href=\"https://detail.tmall.com/item.htm?id=549584040450&scene=taobao_shop\" target=\"_blank\" data-linkmode=\"ptlink\" data-appid=\"aIGkP-D82p\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; position: absolute; border: none; display: block; width: 223px; height: 216px; top: 64px; left: 382px; z-index: 10;\"></a><a class=\"jdb abs aIGkP-DDTX\" href=\"https://detail.tmall.com/item.htm?id=531262077196&scene=taobao_shop\" target=\"_blank\" data-linkmode=\"ptlink\" data-appid=\"aIGkP-DDTX\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; position: absolute; border: none; display: block; width: 185px; height: 198px; top: 82px; left: 605px; z-index: 10;\"></a><a class=\"jsib abs aEfeA-2xnb\" href=\"https://detail.tmall.com/item.htm?spm=a230r.1.14.3.ebb2eb20fbfvy&id=545431396995&cm_id=140105335569ed55e27b&abbucket=15&skuId=3455346967929#\" target=\"_blank\" data-linkmode=\"ptlink\" data-appid=\"aEfeA-2xnb\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: rgb(255, 255, 255) 0px; position: absolute; border: none; display: block; width: 790px; height: 113px; top: 309px; left: 0px; z-index: 10; background: url(&quot;//gdp.alicdn.com/imgextra/i3/395601843/TB2CCBQfTAKh1JjSZFDXXbKlFXa_!!395601843.jpg&quot;) 50% 50% no-repeat;\"></a></p><p><a class=\"itemareachild abs june-box-fadein\" href=\"https://detail.tmall.com/item.htm?id=531262077196&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; position: absolute; opacity: 0; border: 1px solid rgb(247, 40, 98); display: block; top: -1px; left: -1px; width: 250px; height: 285px; border-radius: 0px; box-shadow: rgb(0, 0, 0) 0px 0px 0px 0px;\"></a><a class=\"abs jibbg\" data-e=\"none;\" href=\"https://detail.tmall.com/item.htm?id=531262077196&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; position: absolute; border-width: 0px; display: block; overflow: hidden; width: 250px; height: 250px; top: 0px; left: 0px; background: url(&quot;//gdp.alicdn.com/imgextra/i1/TB16T5TSXXXXXaoXpXXXXXXXXXX_!!0-item_pic.jpg_250x250.jpg&quot;) 50% 50% no-repeat;\"></a></p><p>&nbsp;</p><p><a class=\"abs jibtitle\" href=\"https://detail.tmall.com/item.htm?id=531262077196&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(138, 138, 138); outline: 0px; position: absolute; border-width: 0px; display: block; overflow: hidden; width: 226px; height: 31px; top: 255px; left: 9px; text-align: center; font-family: 微软雅黑; font-size: 17px; line-height: 22px;\">55吋4K曲面30核机皇</a></p><p><a class=\"itemareachild abs june-box-fadein\" href=\"https://detail.tmall.com/item.htm?id=545431396995&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; position: absolute; opacity: 0; border: 1px solid rgb(247, 40, 98); display: block; top: -1px; left: -1px; width: 250px; height: 285px; border-radius: 0px; box-shadow: rgb(0, 0, 0) 0px 0px 0px 0px;\"></a><a class=\"abs jibbg\" data-e=\"none;\" href=\"https://detail.tmall.com/item.htm?id=545431396995&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; position: absolute; border-width: 0px; display: block; overflow: hidden; width: 250px; height: 250px; top: 0px; left: 0px; background: url(&quot;//gdp.alicdn.com/imgextra/i3/TB1gTGmSXXXXXavaXXXXXXXXXXX_!!0-item_pic.jpg_250x250.jpg&quot;) 50% 50% no-repeat;\"></a></p><p>&nbsp;</p><p><a class=\"abs jibtitle\" href=\"https://detail.tmall.com/item.htm?id=545431396995&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(138, 138, 138); outline: 0px; position: absolute; border-width: 0px; display: block; overflow: hidden; width: 226px; height: 31px; top: 255px; left: 9px; text-align: center; font-family: 微软雅黑; font-size: 17px; line-height: 22px;\">49吋4K金属纤薄30核</a></p><p><a class=\"itemareachild abs june-box-fadein\" href=\"https://detail.tmall.com/item.htm?id=550081689407&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; position: absolute; opacity: 0; border: 1px solid rgb(247, 40, 98); display: block; top: -1px; left: -1px; width: 250px; height: 285px; border-radius: 0px; box-shadow: rgb(0, 0, 0) 0px 0px 0px 0px;\"></a><a class=\"abs jibbg\" data-e=\"none;\" href=\"https://detail.tmall.com/item.htm?id=550081689407&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; position: absolute; border-width: 0px; display: block; overflow: hidden; width: 250px; height: 250px; top: 0px; left: 0px; background: url(&quot;//gdp.alicdn.com/imgextra/i4/TB17gR6SXXXXXXQXFXXXXXXXXXX_!!0-item_pic.jpg_250x250.jpg&quot;) 50% 50% no-repeat;\"></a></p><p>&nbsp;</p><p><a class=\"abs jibtitle\" href=\"https://detail.tmall.com/item.htm?id=550081689407&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(138, 138, 138); outline: 0px; position: absolute; border-width: 0px; display: block; overflow: hidden; width: 226px; height: 31px; top: 255px; left: 9px; text-align: center; font-family: 微软雅黑; font-size: 17px; line-height: 22px;\">55吋高端旗舰级音响电视</a></p><p></p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><span style=\"margin: 0px; padding: 0px;\"></span></p><p><img src=\"https://gdp.alicdn.com/imgextra/i4/395601843/TB2OtpPohRDOuFjSZFzXXcIipXa_!!395601843.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: none; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: middle; display: block; width: 790px; height: 254px;\"/></p><p>买前必看</p><p>1、收货地址确认（下单后不支持修改地址）</p><p>本店订单流转均为系统自动完成，故不支持下单后修改收集信息哦！</p><p>2、验货流程(签收前一定要通电验机)</p><p>由于电视为贵重且易碎物品，请亲确保您的收货地点具备通电验机条件，在签收前务必开箱 通电验机。如您开箱通电验机器后发现电视机外观</p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.4;\"><img src=\"https://gdp.alicdn.com/imgextra/i3/395601843/TB2.OwuystnpuFjSZFvXXbcTpXa_!!395601843.jpg\" alt=\"\" style=\"margin: 0px; padding: 0px; border: none; vertical-align: middle; display: inline-block;\"/></p><p></p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><img class=\"desc_anchor img-ks-lazyload\" id=\"desc-module-1\" src=\"https://assets.alicdn.com/kissy/1.0.0/build/imglazyload/spaceball.gif\" style=\"margin: 0px; padding: 0px; border: 0px; height: 1px; display: block; clear: both; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/395601843/TB211YEv80kpuFjSsppXXcGTXXa_!!395601843.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/395601843/TB2yvXIAEhnpuFjSZFpXXcpuXXa_!!395601843.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/></p><p><img class=\"desc_anchor img-ks-lazyload\" id=\"desc-module-2\" src=\"https://assets.alicdn.com/kissy/1.0.0/build/imglazyload/spaceball.gif\" style=\"margin: 0px; padding: 0px; border: 0px; height: 1px; display: block; clear: both; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4;\"><span style=\"margin: 0px; padding: 0px; color: rgb(255, 255, 255);\">------</span></p><p><img class=\"desc_anchor img-ks-lazyload\" id=\"desc-module-3\" src=\"https://assets.alicdn.com/kissy/1.0.0/build/imglazyload/spaceball.gif\" style=\"margin: 0px; padding: 0px; border: 0px; height: 1px; display: block; clear: both; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/395601843/TB2ejZArrBkpuFjy1zkXXbSpFXa_!!395601843.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/395601843/TB2J8EDu4xmpuFjSZFNXXXrRXXa_!!395601843.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/395601843/TB23z5hrSFjpuFjSszhXXaBuVXa_!!395601843.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/395601843/TB24K.7uYBmpuFjSZFAXXaQ0pXa_!!395601843.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/395601843/TB2SWsZrCtkpuFjy0FhXXXQzFXa_!!395601843.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/395601843/TB2BBJurHplpuFjSspiXXcdfFXa_!!395601843.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/395601843/TB2tzFTrG8lpuFjy0FpXXaGrpXa_!!395601843.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/395601843/TB2qNgKrCBjpuFjSsplXXa5MVXa_!!395601843.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/395601843/TB26cprrHXlpuFjy1zbXXb_qpXa_!!395601843.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/395601843/TB2Y6JTrG8lpuFjy0FpXXaGrpXa_!!395601843.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/395601843/TB2pssyrwNlpuFjy0FfXXX3CpXa_!!395601843.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/395601843/TB2mkihrSFjpuFjSszhXXaBuVXa_!!395601843.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/395601843/TB2bPRTrG8lpuFjy0FpXXaGrpXa_!!395601843.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/395601843/TB2TxQqrCXlpuFjy0FeXXcJbFXa_!!395601843.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/395601843/TB2X80urHplpuFjSspiXXcdfFXa_!!395601843.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/395601843/TB2o4AUrrtlpuFjSspfXXXLUpXa_!!395601843.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/395601843/TB297DpbCvHfKJjSZFPXXbttpXa_!!395601843.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/395601843/TB2LSI1uYxmpuFjSZJiXXXauVXa_!!395601843.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/395601843/TB2MZc_uY4npuFjSZFmXXXl4FXa_!!395601843.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_37.png','',1,0,0,0,0,0,1,0,'95','',NULL,NULL,0,4,'[]',0.00,0.00,3,'0','0','0','0',0,1499340425,1499340425,NULL,0,0,0,''),
	(38,'Skyworth/创维 55V9E 55吋4K超高清智能网络平板LED液晶电视机 60',0,55,1,14,55,0,'',0,0,1,0.00,2600.00,2600.00,0.00,0,0,0,0,0.00,0,1200,0,0,100,0,0,0,0,0,0,0,96,'','','<p class=\"attr-list-hd tm-clear\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 20px; line-height: 22px; color: rgb(153, 153, 153);\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; float: left;\">产品参数：</span></p><ul id=\"J_AttrUL\" style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>证书编号：2016010808838323</p></li><li><p>证书状态：有效</p></li><li><p>产品名称：彩色液晶电视机</p></li><li><p>3C规格型号：55G6：220V～ 50Hz 150W</p></li><li><p>产品名称：Skyworth/创维 55V9E</p></li><li><p>品牌:&nbsp;Skyworth/创维</p></li><li><p>创维LED型号:&nbsp;55V9E</p></li><li><p>分辨率:&nbsp;3840x2160</p></li><li><p>3D类型:&nbsp;无</p></li><li><p>能效等级:&nbsp;二级</p></li><li><p>网络连接方式:&nbsp;全部支持</p></li><li><p>操作系统:&nbsp;酷开系统</p></li></ul><p><a style=\"margin: 0px; padding: 0px; color: rgb(51, 85, 170); outline: 0px;\"><img src=\"https://img.alicdn.com/tps/i3/T18rwmFuJbXXXt0DDB-790-250.png\" style=\"margin: 0px; padding: 0px; border: 0px;\"/></a></p><p><img src=\"https://img.alicdn.com/tps/i4/TB1rzDAFVXXXXaPXVXX.YoD8pXX-790-60.png\" alt=\"电器城Detail服务\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: top;\"/></p><p><a href=\"https://dianqi.tmall.com/page/helpcenter.htm?second=jcbz&spm=0.0.0.0.IPSUwh&third=shsm&first=psbz&scm=1003.4.lb-tms-1290929-40698.OTHER_2_100687\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(51, 85, 170); outline: 0px;\"><img src=\"https://img.alicdn.com/tps/i2/TB1WJaJGXXXXXbXaXXXLYQE8pXX-790-64.png\" alt=\"电器城Detail-送货入门\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: top;\"/></a></p><p><a href=\"https://dianqi.tmall.com/page/helpcenter.htm?second=jcbz&spm=0.0.0.0.8stOh9&third=qglb&first=shbz&scm=1003.4.lb-tms-1290924-40696.OTHER_2_100681\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(51, 85, 170); outline: 0px;\"><img src=\"https://img.alicdn.com/tps/i4/TB1rNqPGXXXXXXxaXXXLYQE8pXX-790-64.png\" alt=\"电器城Detail-全国联保\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: top;\"/></a></p><p><a href=\"https://dianqi.tmall.com/page/helpcenter.htm?scm=1003.4.lb-tms-1290897-40693.OTHER_2_100666\" target=\"_blank\" class=\"c3detail-server-link\" style=\"margin: 0px auto; padding: 0px; text-decoration: none; color: rgb(51, 85, 170); outline: 0px; width: 144px; height: 42px; display: block; overflow: hidden; background: url(&quot;//img.alicdn.com/tps/i4/TB1_wyNGXXXXXc5XFXXNC4_FVXX-150-86.jpg&quot;) no-repeat;\"></a></p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><span style=\"margin: 0px; padding: 0px;\"></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.4;\"><a href=\"https://skyworth.tmall.com/?spm=a1z10.5-b-s.w5001-14573815167.12.HLhNIT&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px;\"><img src=\"https://gdp.alicdn.com/imgextra/i4/113462038/TB2Jn.Nz0FopuFjSZFHXXbSlXXa-113462038.jpg\" alt=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></a><a href=\"https://detail.tmall.com/item.htm?spm=a1z10.1-b-s.w5001-14573815167.3.58a96159CfySC3&id=539312641695&skuId=3194942262952&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px;\"><img src=\"https://gdp.alicdn.com/imgextra/i3/113462038/TB2Lo3czYJmpuFjSZFwXXaE4VXa-113462038.jpg\" alt=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></a><a href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-14573815216.61.58a961596f10hP&id=535059516878&rn=9ca0c870376f5f85c75967afee411ea3&abbucket=3&sku_properties=5919063:6536025&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px;\"><img src=\"https://gdp.alicdn.com/imgextra/i1/113462038/TB28n.Nz0FopuFjSZFHXXbSlXXa-113462038.jpg\" alt=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></a><a href=\"https://detail.tmall.com/item.htm?spm=a1z10.4-b-s.w5003-16697820701.1.708b0642BKfrog&id=551875300487&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px;\"><img src=\"https://gdp.alicdn.com/imgextra/i3/113462038/TB2JCxvAbBmpuFjSZFAXXaQ0pXa-113462038.jpg\" alt=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></a><a href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-14573815216.61.58a96159f1uAje&id=527694030502&rn=3d5714569ec34de6029649ead3a9a0f4&abbucket=3&sku_properties=5919063:6536025&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px;\"><img src=\"https://gdp.alicdn.com/imgextra/i2/113462038/TB2fMzjgsPRfKJjSZFOXXbKEVXa-113462038.jpg\" alt=\"\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: middle;\"/></a></p><p></p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><span style=\"margin: 0px; padding: 0px;\"></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.4;\"><a href=\"https://detail.tmall.com/item.htm?id=522542547850&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; line-height: 1.5;\"></a></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.4;\"><a href=\"https://marsdrinks.tmall.com/?scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px;\"></a></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.4;\"><a href=\"https://marsdrinks.tmall.com/?scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px;\"></a></p><p></p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><span style=\"margin: 0px; padding: 0px;\"></span></p><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; line-height: 1.4;\"><a href=\"https://detail.tmall.com/item.htm?id=539312641695&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px;\"></a></p><p></p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><img class=\"desc_anchor img-ks-lazyload\" id=\"desc-module-1\" src=\"https://assets.alicdn.com/kissy/1.0.0/build/imglazyload/spaceball.gif\" style=\"margin: 0px; padding: 0px; border: 0px; height: 1px; display: block; clear: both; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/113462038/TB2VPSdk3JlpuFjSspjXXcT.pXa-113462038.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4;\"><img alt=\"\" src=\"https://img.alicdn.com/imgextra/i3/113462038/TB2qnG1uXXXXXXVXpXXXXXXXXXX-113462038.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/></p><p><img class=\"desc_anchor img-ks-lazyload\" id=\"desc-module-2\" src=\"https://assets.alicdn.com/kissy/1.0.0/build/imglazyload/spaceball.gif\" style=\"margin: 0px; padding: 0px; border: 0px; height: 1px; display: block; clear: both; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4;\"><img alt=\"店内公告现在(1).jpg\" src=\"https://img.alicdn.com/imgextra/i1/113462038/TB2nlSKfH8kpuFjy0FcXXaUhpXa-113462038.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/></p><p><img class=\"desc_anchor img-ks-lazyload\" id=\"desc-module-3\" src=\"https://assets.alicdn.com/kissy/1.0.0/build/imglazyload/spaceball.gif\" style=\"margin: 0px; padding: 0px; border: 0px; height: 1px; display: block; clear: both; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/113462038/TB2moaLswxlpuFjSszbXXcSVpXa-113462038.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/113462038/TB2iMkDihBmpuFjSZFsXXcXpFXa-113462038.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_38.png','',1,0,0,0,0,0,1,0,'96','',NULL,NULL,0,4,'[]',0.00,0.00,3,'0','0','0','0',0,1499340523,1499340523,NULL,0,0,0,''),
	(39,'Apple/苹果 iPhone 7苹果7手机4.7寸7代港版 国行 美版三网4G现货',0,64,2,17,64,0,'',0,0,1,0.00,4498.00,4498.00,0.00,0,0,0,0,0.00,0,2000,0,0,100,0,0,0,0,0,0,0,97,'','','<h3 data-spm=\"spu-attributes-more\" class=\"tb-attributes-title\" style=\"margin: 0px 15px 15px; padding: 0px; font-size: 12px; font-weight: normal;\">产品参数<a data-spm-click=\"gostr=/tbdetail;locaid=d1\" class=\"tb-attributes-more\" style=\"text-decoration: underline; color: rgb(153, 153, 153); outline: 0px; float: right;\">更多参数</a></h3><ul class=\"tb-attributes-list tb-attributes-fix list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB1hRW7IpXXXXXHXpXX760XFXXX\" alt=\"基本信息\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"Apple/苹果\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">品牌: Apple/苹果</p><p title=\"iPhone 7\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">Apple型号: iPhone 7</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB14LG.IpXXXXbfXpXX760XFXXX\" alt=\"屏幕\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"1334 x 750 像素分辨率，326 ppi\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">分辨率: 1334 x 750 像素分辨率，326 ppi</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB1kW11IpXXXXbVXFXX760XFXXX\" alt=\"网络\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"4G+全网通\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">网络类型: 4G+全网通</p><p title=\"蜂窝网络和无线连接\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">网络模式: 蜂窝网络和无线连接</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB1LfniIpXXXXaYXXXX760XFXXX\" alt=\"CPU信息\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"不详\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">核心数: 不详</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB13LiTIpXXXXbPXVXX760XFXXX\" alt=\"存储\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"不详\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">运行内存RAM: 不详</p><p title=\"32GB 128GB 256GB\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">存储容量: 32GB 128GB 256GB</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB10U53IpXXXXbrXFXX760XFXXX\" alt=\"拍照\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"1200 万像素摄像头\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">后置摄像头: 1200 万像素摄像头</p><p title=\"1200 万像素摄像头\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">摄像头类型: 1200 万像素摄像头</p></li><li><p>机身颜色: 白银现货 玫瑰金现货 亮黑现货 金色现货 磨砂黑现货 大红色现货</p></li><li><p>套餐类型: 官方标配 套餐一</p></li><li><p>售后服务: 店铺三包</p></li><li><p>版本类型: 港澳台 韩国 美国 中国大陆</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i4/387784786/TB2UbhWkNhmpuFjSZFyXXcLdFXa_!!387784786.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/387784786/TB24LNigm8mpuFjSZFMXXaxpVXa_!!387784786.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/387784786/TB2OgnhcNRDOuFjSZFzXXcIipXa_!!387784786.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/387784786/TB2ShwieYXlpuFjy1zbXXb_qpXa_!!387784786.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><table width=\"350\" height=\"300\"><tbody><tr class=\"firstRow\"><td style=\"margin: 0px; padding: 0px;\"><a href=\"https://item.taobao.com/item.htm?id=537938786531\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/387784786/TB2pOowbXHzQeBjSZFuXXanUpXa_!!387784786.gif\" class=\"\" align=\"absmiddle\" width=\"375\" height=\"344\" style=\"border: 0px; vertical-align: top;\"/></a></td><td style=\"margin: 0px; padding: 0px;\"><a href=\"https://item.taobao.com/item.htm?id=537981429640\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i4/387784786/TB2dM6EXTnB11BjSspdXXaTIpXa_!!387784786.gif\" class=\"\" align=\"absmiddle\" width=\"375\" height=\"344\" style=\"border: 0px; vertical-align: top;\"/></a></td></tr></tbody></table><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i4/387784786/TB2GvHbcJhvOuFjSZFBXXcZgFXa_!!387784786.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"356\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/387784786/TB2Ja6udDcCL1FjSZFPXXXZgpXa_!!387784786.jpg\" class=\"\" align=\"absmiddle\" width=\"743\" height=\"1620\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/387784786/TB2KNYFXU_C11Bjy1zeXXXtGpXa_!!387784786.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"260\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/387784786/TB2GtMybXHzQeBjSZFmXXbcDVXa_!!387784786.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"439\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/387784786/TB25AYFXU_C11Bjy1zeXXXtGpXa_!!387784786.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"531\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/387784786/TB26nDTaDnB11BjSspdXXaTIpXa_!!387784786.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"754\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/387784786/TB2MBRChwxlpuFjSszgXXcJdpXa_!!387784786.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"1003\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/387784786/TB2u1syiUhnpuFjSZFpXXcpuXXa_!!387784786.jpg\" class=\"\" align=\"absmiddle\" width=\"758\" height=\"256\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/387784786/TB2ohWlhwxlpuFjy0FoXXa.lXXa_!!387784786.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"500\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/387784786/TB2cIj1atfB11BjSspmXXctQVXa_!!387784786.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"2785\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/387784786/TB29B9nb8LzQeBjSZFjXXcscpXa_!!387784786.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"624\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_39.png','',1,0,0,0,0,0,1,0,'97,98,99','',NULL,NULL,0,5,'[]',0.00,0.00,3,'0','0','0','0',0,1499340989,1499340989,NULL,0,0,0,'');

INSERT INTO `ns_goods` (`goods_id`, `goods_name`, `shop_id`, `category_id`, `category_id_1`, `category_id_2`, `category_id_3`, `brand_id`, `group_id_array`, `promotion_type`, `promote_id`, `goods_type`, `market_price`, `price`, `promotion_price`, `cost_price`, `point_exchange_type`, `point_exchange`, `give_point`, `is_member_discount`, `shipping_fee`, `shipping_fee_id`, `stock`, `max_buy`, `clicks`, `min_stock_alarm`, `sales`, `collects`, `star`, `evaluates`, `shares`, `province_id`, `city_id`, `picture`, `keywords`, `introduction`, `description`, `QRcode`, `code`, `is_stock_visible`, `is_hot`, `is_recommend`, `is_new`, `is_pre_sale`, `is_bill`, `state`, `sort`, `img_id_array`, `sku_img_array`, `match_point`, `match_ratio`, `real_sales`, `goods_attribute_id`, `goods_spec_format`, `goods_weight`, `goods_volume`, `shipping_fee_type`, `extend_category_id`, `extend_category_id_1`, `extend_category_id_2`, `extend_category_id_3`, `supplier_id`, `sale_date`, `create_time`, `update_time`, `min_buy`, `virtual_goods_type_id`, `production_date`, `shelf_life`)
VALUES
	(40,'现货Huawei/华为 Mate 9 双卡全网通4g 全新正品 智能手机 mate9',0,64,2,17,64,0,'',0,0,1,0.00,2688.00,2688.00,0.00,0,0,0,0,0.00,0,5000,0,0,200,0,0,0,0,0,0,0,100,'','','<h3 data-spm=\"spu-attributes-more\" class=\"tb-attributes-title\" style=\"margin: 0px 15px 15px; padding: 0px; font-size: 12px; font-weight: normal;\">产品参数<a data-spm-click=\"gostr=/tbdetail;locaid=d1\" class=\"tb-attributes-more\" style=\"text-decoration: underline; color: rgb(153, 153, 153); outline: 0px; float: right;\">更多参数</a></h3><ul class=\"tb-attributes-list tb-attributes-fix list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB1hRW7IpXXXXXHXpXX760XFXXX\" alt=\"基本信息\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"Huawei/华为\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">品牌: Huawei/华为</p><p title=\"Mate 9\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">华为型号: Mate 9</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB14LG.IpXXXXbfXpXX760XFXXX\" alt=\"屏幕\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"FHD 1920*1080\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">分辨率: FHD 1920*1080</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB1kW11IpXXXXbVXFXX760XFXXX\" alt=\"网络\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"4G全网通\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">网络类型: 4G全网通</p><p title=\"双卡双待单通\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">网络模式: 双卡双待单通</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB1LfniIpXXXXaYXXXX760XFXXX\" alt=\"CPU信息\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"八核+微智核i6\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">核心数: 八核+微智核i6</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB13LiTIpXXXXbPXVXX760XFXXX\" alt=\"存储\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"4GB\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">运行内存RAM: 4GB</p><p title=\"32GB 64GB 128GB\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">存储容量: 32GB 64GB 128GB</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB10U53IpXXXXbrXFXX760XFXXX\" alt=\"拍照\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"2000万黑白+1200万彩色，F2.2光圈，徕卡镜头\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">后置摄像头: 2000万黑白+1200万彩色，F2.2光圈，徕卡镜头</p><p title=\"三摄像头（后双）\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">摄像头类型: 三摄像头（后双）</p></li><li><p>机身颜色: 月光银 苍穹灰 香槟金 摩卡金 陶瓷白 托帕蓝 黑色</p></li><li><p>套餐类型: 官方标配 套餐一 套餐二 套餐三 套餐四 套餐五</p></li><li><p>售后服务: 全国联保</p></li><li><p>版本类型: 中国大陆</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/206362892/TB2p.gddmmK.eBjSZPfXXce2pXa_!!206362892.jpg_q90.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/206362892/TB2Tj1dwHBmpuFjSZFAXXaQ0pXa_!!206362892.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/206362892/TB2ymRXa_cCL1FjSZFPXXXZgpXa_!!206362892.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/206362892/TB2POWtaJ4opuFjSZFLXXX8mXXa_!!206362892.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/206362892/TB2zNBTaQqvpuFjSZFhXXaOgXXa_!!206362892.jpg_q90.jpg_q90.jpg_q90.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/206362892/TB2scIleYJmpuFjSZFBXXXaZXXa_!!206362892.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"1670\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/206362892/TB2qabfaodnpuFjSZPhXXbChpXa_!!206362892.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"520\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/206362892/TB2diTfad0opuFjSZFxXXaDNVXa_!!206362892.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"453\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/206362892/TB22mAccmKI.eBjy1zcXXXIOpXa_!!206362892.jpg_q90.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/206362892/TB2LSH5cmOI.eBjy1zkXXadxFXa_!!206362892.jpg_q90.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/206362892/TB2CPt.X00opuFjSZFxXXaDNVXa_!!206362892.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"838\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/206362892/TB2twuaX5BnpuFjSZFzXXaSrpXa_!!206362892.jpg_q90.jpg_q90.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/206362892/TB2YPuwdhmJ.eBjy0FhXXbBdFXa_!!206362892.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"555\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/206362892/TB2TKOIdmCI.eBjy1XbXXbUBFXa_!!206362892.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"422\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/206362892/TB2iQqSdhuI.eBjy0FdXXXgbVXa_!!206362892.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"422\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/206362892/TB24BWtdm1I.eBjy0FjXXabfXXa_!!206362892.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"422\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/206362892/TB2dLuqdheI.eBjSsplXXX6GFXa_!!206362892.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"422\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/206362892/TB2R8apdb5K.eBjy0FfXXbApVXa_!!206362892.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"422\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/206362892/TB2Vyavdg1I.eBjSszeXXc2hpXa_!!206362892.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"422\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/206362892/TB2nIqEdmqJ.eBjy1zbXXbx8FXa_!!206362892.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"422\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/206362892/TB2iMWfdbaI.eBjy1XdXXcoqXXa_!!206362892.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"422\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/206362892/TB2lYW5cdAvbeFjSspbXXbcOFXa_!!206362892.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"422\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/206362892/TB2JIqEdmqJ.eBjy1zbXXbx8FXa_!!206362892.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"422\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/206362892/TB2nyevdg1I.eBjSszeXXc2hpXa_!!206362892.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"422\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/206362892/TB2JnGrdmiJ.eBjSspfXXbBKFXa_!!206362892.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"295\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/206362892/TB2UZWvdmuJ.eBjy0FgXXXBBXXa_!!206362892.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"335\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/206362892/TB20d8qXI2DjeFjSspnXXb20XXa_!!206362892.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"292\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_40.png','',1,0,0,0,0,0,1,0,'100,101','',NULL,NULL,0,5,'[]',0.00,0.00,3,'0','0','0','0',0,1499341088,1499341088,NULL,0,0,0,''),
	(41,'三星5Samsung/三星 Galaxy On5 SM-G5700双卡4G全网G5510 G5528',0,64,2,17,64,0,'',0,0,1,1800.00,1699.00,1699.00,1000.00,0,0,0,0,0.00,0,9000,0,0,100,0,0,0,0,0,0,0,102,'','','<h3 data-spm=\"spu-attributes-more\" class=\"tb-attributes-title\" style=\"margin: 0px 15px 15px; padding: 0px; font-size: 12px; font-weight: normal;\">产品参数<a data-spm-click=\"gostr=/tbdetail;locaid=d1\" class=\"tb-attributes-more\" style=\"text-decoration: underline; color: rgb(153, 153, 153); outline: 0px; float: right;\">更多参数</a></h3><ul class=\"tb-attributes-list tb-attributes-fix list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB1hRW7IpXXXXXHXpXX760XFXXX\" alt=\"基本信息\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"Samsung/三星\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">品牌: Samsung/三星</p><p title=\"Galaxy On5 SM-G5700\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">三星型号: Galaxy On5 SM-G5700</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB14LG.IpXXXXbfXpXX760XFXXX\" alt=\"屏幕\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"720x1280\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">分辨率: 720x1280</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB1kW11IpXXXXbVXFXX760XFXXX\" alt=\"网络\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"4G全网通\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">网络类型: 4G全网通</p><p title=\"双卡多模\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">网络模式: 双卡多模</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB1LfniIpXXXXaYXXXX760XFXXX\" alt=\"CPU信息\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"八核\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">核心数: 八核</p><p title=\"1.5G HZ\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">八核CPU频率: 1.5G HZ</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB13LiTIpXXXXbPXVXX760XFXXX\" alt=\"存储\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"3GB\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">运行内存RAM: 3GB</p><p title=\"16GB 32GB\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">存储容量: 16GB 32GB</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB10U53IpXXXXbrXFXX760XFXXX\" alt=\"拍照\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"1300万像素\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">后置摄像头: 1300万像素</p><p title=\"双摄像头（前后）\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">摄像头类型: 双摄像头（前后）</p></li><li><p>机身颜色: 金色青春版 粉色青春版 粉色（前白后粉） 黑色（前黑后灰） 金色（前白后金） 全金色（展示机） 金色</p></li><li><p>套餐类型: 官方标配</p></li><li><p>售后服务: 全国联保</p></li><li><p>版本类型: 中国大陆</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i4/60826753/TB29.WargRkpuFjy1zeXXc.6FXa_!!60826753.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><a href=\"https://favorite.taobao.com/popup/add_collection.htm?spm=2013.1.0.0.BJvSEv&id=34474605&itemid=34474605&itemtype=0&sellerid=60826753&scjjc=2\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/60826753/TB2vaPXrmFjpuFjSszhXXaBuVXa_!!60826753.gif\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></a><a href=\"https://taoquan.taobao.com/coupon/unify_apply.htm?sellerId=60826753&activityId=94fbb7b4329742f4baa45368b0f872d9\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/60826753/TB22M8VrgxlpuFjSszgXXcJdpXa_!!60826753.gif\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></a><a href=\"https://taoquan.taobao.com/coupon/unify_apply.htm?sellerId=60826753&activityId=ebffd5082e8546b5ace8647ab45cc0d2\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/60826753/TB2qIyMra8lpuFjy0FpXXaGrpXa_!!60826753.gif\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></a><a href=\"https://taoquan.taobao.com/coupon/unify_apply.htm?sellerId=60826753&activityId=dae18ff8b71a4af996b45dbcaf0bc267\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i4/60826753/TB2cR4krmXlpuFjy0FeXXcJbFXa_!!60826753.gif\" class=\"\" align=\"absmiddle\" width=\"237\" height=\"111\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></a><img src=\"https://img.alicdn.com/imgextra/i4/60826753/TB244YxqY0kpuFjy0FjXXcBbVXa_!!60826753.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"684\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/60826753/TB2v3MsrYFlpuFjy0FgXXbRBVXa_!!60826753.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"1092\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/60826753/TB2JgfYrYBkpuFjy1zkXXbSpFXa_!!60826753.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"2973\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/60826753/TB2uUz7r9BjpuFjSsplXXa5MVXa_!!60826753.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"3472\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/60826753/TB2tbMpr9xjpuFjSszeXXaeMVXa_!!60826753.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"2439\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_41.png','',1,0,0,0,0,0,1,0,'102,103','',NULL,NULL,0,5,'[{\"spec_name\":\"颜色\",\"spec_id\":7,\"value\":[{\"spec_value_name\":\"黑色\",\"spec_name\":\"颜色\",\"spec_id\":7,\"spec_value_id\":12,\"spec_show_type\":1,\"spec_value_data\":\"\"},{\"spec_value_name\":\"玫瑰金\",\"spec_name\":\"颜色\",\"spec_id\":7,\"spec_value_id\":11,\"spec_show_type\":1,\"spec_value_data\":\"\"},{\"spec_value_name\":\"土豪金\",\"spec_name\":\"颜色\",\"spec_id\":7,\"spec_value_id\":13,\"spec_show_type\":1,\"spec_value_data\":\"\"}]}]',0.00,0.00,3,'0','0','0','0',0,1499341167,1499341167,1499408574,0,0,0,''),
	(42,'Xiaomi/小米 红米4A 全网通4X智能手机老年',0,64,2,17,64,0,'',0,0,1,1300.00,1268.00,1268.00,655.00,0,0,0,0,0.00,0,9000,0,0,200,0,0,0,0,0,0,0,104,'','','<h3 data-spm=\"spu-attributes-more\" class=\"tb-attributes-title\" style=\"margin: 0px 15px 15px; padding: 0px; font-size: 12px; font-weight: normal;\">产品参数<a data-spm-click=\"gostr=/tbdetail;locaid=d1\" class=\"tb-attributes-more\" style=\"text-decoration: underline; color: rgb(153, 153, 153); outline: 0px; float: right;\">更多参数</a></h3><ul class=\"tb-attributes-list tb-attributes-fix list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB1hRW7IpXXXXXHXpXX760XFXXX\" alt=\"基本信息\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"Xiaomi/小米\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">品牌: Xiaomi/小米</p><p title=\"红米4A\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">型号: 红米4A</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB14LG.IpXXXXbfXpXX760XFXXX\" alt=\"屏幕\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"1280x720像素\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">分辨率: 1280x720像素</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB1kW11IpXXXXbVXFXX760XFXXX\" alt=\"网络\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"4G全网通\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">网络类型: 4G全网通</p><p title=\"双卡多模\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">网络模式: 双卡多模</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB1LfniIpXXXXaYXXXX760XFXXX\" alt=\"CPU信息\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"四核\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">核心数: 四核</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB13LiTIpXXXXbPXVXX760XFXXX\" alt=\"存储\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"2GB\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">运行内存RAM: 2GB</p><p title=\"16GB 32GB\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">存储容量: 16GB 32GB</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB10U53IpXXXXbrXFXX760XFXXX\" alt=\"拍照\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"1300万像素\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">后置摄像头: 1300万像素</p><p title=\"双摄像头(前后)\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">摄像头类型: 双摄像头(前后)</p></li><li><p>机身颜色: 红米4A【香槟金】现货当天发 红米4A【玫瑰金】现货当天发 红米4A【深空灰】现货当天发 香槟金 玫瑰金 合约机预售 红米4X【香槟金】现货当天发 红米4X【樱花粉】现货当天发 红米4【金色】现货当天发 红米4【银色】现货当天发</p></li><li><p>套餐类型: 官方标配</p></li><li><p>售后服务: 全国联保</p></li><li><p>版本类型: 中国大陆</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/61079537/TB23WALbt0opuFjSZFxXXaDNVXa_!!61079537.jpg\" style=\"border: 0px; vertical-align: top;\"/><img src=\"https://img.alicdn.com/imgextra/i1/61079537/TB2hWGFt80lpuFjSszdXXcdxFXa_!!61079537.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/61079537/TB2O5VEr80kpuFjSsziXXa.oVXa_!!61079537.jpg\" style=\"border: 0px; vertical-align: top;\"/><img src=\"https://img.alicdn.com/imgextra/i1/61079537/TB2XknLzylnpuFjSZFgXXbi7FXa_!!61079537.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/61079537/TB2TfW8bxxmpuFjSZFNXXXrRXXa_!!61079537.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/><img src=\"https://img.alicdn.com/imgextra/i2/61079537/TB2t8O_t3RkpuFjy1zeXXc.6FXa_!!61079537.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/61079537/TB2FM_StY8kpuFjy0FcXXaUhpXa_!!61079537.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/61079537/TB2oieov4XlpuFjSsphXXbJOXXa_!!61079537.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/61079537/TB2boh8eC8mpuFjSZFMXXaxpVXa_!!61079537.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/61079537/TB2V_ATnS8mpuFjSZFMXXaxpVXa_!!61079537.jpg\" class=\"\" style=\"border: 0px; vertical-align: top; line-height: 1.5;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"color: rgb(255, 255, 255); line-height: 1.5;\">要加详</span><img src=\"https://img.alicdn.com/imgextra/i2/61079537/TB2dVxIb9iJ.eBjSspoXXcpMFXa_!!61079537.png\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; line-height: 1.5; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/61079537/TB2BXdMb9iJ.eBjSspiXXbqAFXa_!!61079537.png\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; line-height: 1.5; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/61079537/TB2nOVFbYaI.eBjSszdXXaB6XXa_!!61079537.png\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; line-height: 1.5; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/61079537/TB2DRJNb9GI.eBjSspcXXcVjFXa_!!61079537.png\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; line-height: 1.5; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/61079537/TB2QS0QbZaK.eBjSspjXXXL.XXa_!!61079537.png\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; line-height: 1.5; max-width: 750px;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_42.png','',1,0,0,0,0,0,1,0,'104,105','',NULL,NULL,0,0,'[{\"spec_name\":\"尺寸\",\"spec_id\":6,\"value\":[{\"spec_value_name\":\"4.5寸\",\"spec_name\":\"尺寸\",\"spec_id\":6,\"spec_value_id\":8,\"spec_show_type\":1,\"spec_value_data\":\"\"},{\"spec_value_name\":\"4.7寸\",\"spec_name\":\"尺寸\",\"spec_id\":6,\"spec_value_id\":9,\"spec_show_type\":1,\"spec_value_data\":\"\"},{\"spec_value_name\":\"5.0寸\",\"spec_name\":\"尺寸\",\"spec_id\":6,\"spec_value_id\":10,\"spec_show_type\":1,\"spec_value_data\":\"\"}]}]',0.00,0.00,3,'0','0','0','0',0,1499341256,1499341256,1499408255,0,0,0,''),
	(43,'送礼华为honor/荣耀 畅玩5移动版正品全网通4G智能手机',0,64,2,17,64,0,'',0,0,1,0.00,1288.00,1288.00,0.00,0,0,0,0,0.00,0,1000,0,0,200,0,0,0,0,0,0,0,107,'','','<h3 data-spm=\"spu-attributes-more\" class=\"tb-attributes-title\" style=\"margin: 0px 15px 15px; padding: 0px; font-size: 12px; font-weight: normal;\">产品参数<a data-spm-click=\"gostr=/tbdetail;locaid=d1\" class=\"tb-attributes-more\" style=\"text-decoration: underline; color: rgb(153, 153, 153); outline: 0px; float: right;\">更多参数</a></h3><ul class=\"tb-attributes-list tb-attributes-fix list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB1hRW7IpXXXXXHXpXX760XFXXX\" alt=\"基本信息\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"honor/荣耀\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">品牌: honor/荣耀</p><p title=\"畅玩5移动版\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">型号: 畅玩5移动版</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB14LG.IpXXXXbfXpXX760XFXXX\" alt=\"屏幕\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"1280x720\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">分辨率: 1280x720</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB1kW11IpXXXXbVXFXX760XFXXX\" alt=\"网络\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"4G全网通\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">网络类型: 4G全网通</p><p title=\"双卡双待\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">网络模式: 双卡双待</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB1LfniIpXXXXaYXXXX760XFXXX\" alt=\"CPU信息\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"四核\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">核心数: 四核</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB13LiTIpXXXXbPXVXX760XFXXX\" alt=\"存储\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"2GB\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">运行内存RAM: 2GB</p><p title=\"16GB\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">存储容量: 16GB</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB10U53IpXXXXbrXFXX760XFXXX\" alt=\"拍照\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"800万\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">后置摄像头: 800万</p><p title=\"双摄像头（前后）\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">摄像头类型: 双摄像头（前后）</p></li><li><p>机身颜色: 移动版金色 移动版白色 移动版黑色 全网通金色 全网通白色 全网通黑色</p></li><li><p>套餐类型: 官方标配 套餐一 套餐二 套餐三 套餐四</p></li><li><p>售后服务: 全国联保</p></li><li><p>版本类型: 中国大陆</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; color: rgb(60, 60, 60); font-size: 12px; line-height: 18px;\"><img src=\"https://img.alicdn.com/imgextra/imgextra/i2/95460827/TB2oabmXai5V1BjSsplXXaVYpXa_!!95460827.jpg?time=1476436423000\" style=\"border: 0px; vertical-align: middle;\"/><img src=\"https://img.alicdn.com/imgextra/imgextra/i3/95460827/TB2t3.PXRLzQeBjSZFDXXc5MXXa_!!95460827.jpg?t=1472288084000?time=1476436423000\" style=\"border: 0px; vertical-align: middle;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; color: rgb(60, 60, 60); font-size: 12px; line-height: 18px;\"><img src=\"https://img.alicdn.com/imgextra/imgextra/i2/95460827/TB2jTVma1TyQeBjSspmXXazkXXa_!!95460827.jpg?time=1476436423000\" style=\"border: 0px; vertical-align: middle;\"/><img src=\"https://img.alicdn.com/imgextra/imgextra/i3/95460827/TB2b68haWryQeBjSszdXXaL.XXa_!!95460827.jpg?time=1476436423000\" style=\"border: 0px; vertical-align: middle;\"/><img src=\"https://img.alicdn.com/imgextra/imgextra/i4/95460827/TB2.laRXkNwVeBjy0FhXXc0lpXa_!!95460827.jpg?time=1476436423000\" class=\"\" style=\"border: 0px; vertical-align: middle;\"/><img src=\"https://img.alicdn.com/imgextra/imgextra/i1/95460827/TB22bAOXF_AQeBjSZPhXXXt5pXa_!!95460827.jpg?t=1472286027000?time=1476436423000\" class=\"\" style=\"border: 0px; vertical-align: middle;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; color: rgb(60, 60, 60); font-size: 12px; line-height: 18px;\"><img src=\"https://img.alicdn.com/imgextra/imgextra/i1/95460827/TB2Lo6lXai5V1BjSszdXXXUJXXa_!!95460827.jpg?t=1472530037000?time=1476436423000\" class=\"\" style=\"border: 0px; vertical-align: middle;\"/><img src=\"https://img.alicdn.com/imgextra/imgextra/i3/95460827/TB2nlDmXX95V1Bjy0FfXXXvlFXa_!!95460827.jpg?t=1472530035000?time=1476436423000\" class=\"\" style=\"border: 0px; vertical-align: middle;\"/><img src=\"https://img.alicdn.com/imgextra/imgextra/i1/95460827/TB2Fzm3uXXXXXaNXpXXXXXXXXXX_!!95460827.jpg?time=1476436423000\" class=\"\" align=\"absMiddle\" style=\"border: 0px; vertical-align: middle; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/imgextra/i2/95460827/TB2_C2buXXXXXXzXpXXXXXXXXXX_!!95460827.jpg?time=1476436423000\" class=\"\" align=\"absMiddle\" style=\"border: 0px; vertical-align: middle; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/imgextra/i4/95460827/TB2s0TcuXXXXXXzXpXXXXXXXXXX_!!95460827.jpg?time=1476436423000\" class=\"\" align=\"absMiddle\" style=\"border: 0px; vertical-align: middle; max-width: 750px;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_43.png','',1,0,0,0,0,0,1,0,'107','',NULL,NULL,0,0,'[]',0.00,0.00,3,'0','0','0','0',0,1499341351,1499341351,NULL,0,0,0,''),
	(44,'正品现货送电源64G卡蓝牙Huawei/华为 Mate 9全网通智能手机mate9',0,64,2,17,64,0,'',0,0,1,0.00,1258.00,1258.00,0.00,0,0,0,0,0.00,0,1000,0,0,200,0,0,0,0,0,0,0,108,'','','<h3 data-spm=\"spu-attributes-more\" class=\"tb-attributes-title\" style=\"margin: 0px 15px 15px; padding: 0px; font-size: 12px; font-weight: normal;\">产品参数<a data-spm-click=\"gostr=/tbdetail;locaid=d1\" class=\"tb-attributes-more\" style=\"text-decoration: underline; color: rgb(153, 153, 153); outline: 0px; float: right;\">更多参数</a></h3><ul class=\"tb-attributes-list tb-attributes-fix list-paddingleft-2\" style=\"list-style-type: none;\"><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB1hRW7IpXXXXXHXpXX760XFXXX\" alt=\"基本信息\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"Huawei/华为\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">品牌: Huawei/华为</p><p title=\"Mate 9\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">华为型号: Mate 9</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB14LG.IpXXXXbfXpXX760XFXXX\" alt=\"屏幕\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"FHD 1920*1080\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">分辨率: FHD 1920*1080</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB1kW11IpXXXXbVXFXX760XFXXX\" alt=\"网络\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"4G全网通\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">网络类型: 4G全网通</p><p title=\"双卡双待单通\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">网络模式: 双卡双待单通</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB1LfniIpXXXXaYXXXX760XFXXX\" alt=\"CPU信息\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"八核+微智核i6\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">核心数: 八核+微智核i6</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB13LiTIpXXXXbPXVXX760XFXXX\" alt=\"存储\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"4GB\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">运行内存RAM: 4GB</p><p title=\"32GB 64GB 128GB\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">存储容量: 32GB 64GB 128GB</p></li><li><p><img src=\"https://gd1.alicdn.com/bao/uploaded/TB10U53IpXXXXbrXFXX760XFXXX\" alt=\"拍照\" style=\"border: 0px; vertical-align: middle; width: 32px; height: 32px; margin: 4px 0px 4px -32px; float: left;\"/></p><p title=\"2000万黑白+1200万彩色，F2.2光圈，徕卡镜头\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">后置摄像头: 2000万黑白+1200万彩色，F2.2光圈，徕卡镜头</p><p title=\"三摄像头（后双）\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; overflow: hidden; white-space: nowrap; text-overflow: ellipsis;\">摄像头类型: 三摄像头（后双）</p></li><li><p>机身颜色: 月光银 苍穹灰 香槟金 摩卡金 陶瓷白 玛瑙红 托帕蓝 移动全网通香槟金 月光银（纯净版） 苍穹灰（纯净版） 香槟金（纯净版） 摩卡金（纯净版） 陶瓷白（纯净版） 黑色（纯净版） 黑色</p></li><li><p>套餐类型: 官方标配 套餐一 套餐二 套餐三 套餐四 套餐五</p></li><li><p>售后服务: 全国联保</p></li><li><p>版本类型: 中国大陆</p></li></ul><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/22911646/TB2hLdxc4XlpuFjSsphXXbJOXXa-22911646.png\" alt=\" 赶紧下单.png\" style=\"border: 0px; vertical-align: top;\"/><img src=\"https://img.alicdn.com/imgextra/i2/22911646/TB2Hd2IgFXXXXXSXXXXXXXXXXXX-22911646.jpg\" alt=\" 品牌授权标.jpg\" style=\"border: 0px; vertical-align: top;\"/><img src=\"https://img.alicdn.com/imgextra/i2/22911646/TB2Nv44diC9MuFjSZFoXXbUzFXa-22911646.jpg\" border=\"0\" align=\"\" usemap=\"#Map618\" style=\"border: 0px; vertical-align: top;\"/><a href=\"https://sztongbu.taobao.com/p/rd080329.htm\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/22911646/TB2ygvDzylnpuFjSZFgXXbi7FXa-22911646.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></a><img src=\"https://img.alicdn.com/imgextra/i2/22911646/TB2CvLzp3xlpuFjSszgXXcJdpXa-22911646.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"275\" style=\"border: 0px; vertical-align: top; line-height: 1.5; max-width: 750px;\"/><a href=\"https://item.taobao.com/item.htm?id=546405866554\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px; line-height: 1.5;\"><img src=\"https://img.alicdn.com/imgextra/i2/22911646/TB2E7kSghdkpuFjy0FbXXaNnpXa-22911646.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"350\" style=\"border: 0px; vertical-align: top;\"/></a><a href=\"https://item.taobao.com/item.htm?id=543227082953\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px; line-height: 1.5;\"><img alt=\" Mate9-预定750-1.jpg\" src=\"https://img.alicdn.com/imgextra/i4/22911646/TB2U5HbdMCN.eBjSZFoXXXj0FXa-22911646.jpg\" class=\"\" width=\"750\" height=\"303\" style=\"border: 0px; vertical-align: top;\"/></a><a href=\"https://item.taobao.com/item.htm?id=553272342949&qq-pf-to=pcqq.group\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px; font-size: medium; line-height: normal;\"><img src=\"https://img.alicdn.com/imgextra/i2/22911646/TB20wDZrJBopuFjSZPcXXc9EpXa-22911646.jpg\" class=\"\" align=\"absmiddle\" width=\"381\" height=\"330\" style=\"border: 0px; vertical-align: top;\"/></a><a href=\"https://item.taobao.com/item.htm?id=552353571089\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px; line-height: 1.5;\"><img src=\"https://img.alicdn.com/imgextra/i1/22911646/TB2iOyafb8kpuFjy0FcXXaUhpXa-22911646.jpg\" class=\"\" alt=\" 关联促销_04.jpg\" border=\"0\" width=\"383\" height=\"330\" style=\"border: 0px; vertical-align: top;\"/></a><img src=\"https://img.alicdn.com/imgextra/i3/22911646/TB28nSTdk5M.eBjSZFrXXXPgVXa-22911646.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; line-height: 1.5; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/22911646/TB23Yv8a8U4h1JjSZFLXXaFMpXa-22911646.gif\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"392\" style=\"border: 0px; vertical-align: top; line-height: 1.5; max-width: 750px;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_44.png','',1,0,0,0,0,0,1,0,'108,109','',NULL,NULL,0,5,'[]',0.00,0.00,3,'0','0','0','0',0,1499341557,1499341557,NULL,0,0,0,''),
	(45,'Dell/戴尔 Alienware 17 ALW17E-1828T 4738 R4外星人笔记本范范',0,73,3,21,73,0,'',0,0,1,0.00,4588.00,4588.00,0.00,0,0,0,0,0.00,0,2000,0,0,200,0,0,0,0,0,0,0,110,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>产品名称:&nbsp;Dell/戴尔 Alienware 17 ALW17E-1828T</p></li><li><p>厚度:&nbsp;20.0mm及以上</p></li><li><p>是否PC平板二合一:&nbsp;否</p></li><li><p>机身重量（含电池）:&nbsp;4.5kg</p></li><li><p>版本类型:&nbsp;美国</p></li><li><p>能效等级:&nbsp;三级</p></li><li><p>品牌:&nbsp;Dell/戴尔</p></li><li><p>系列:&nbsp;Alienware 17</p></li><li><p>型号:&nbsp;ALW17E-1828T</p></li><li><p>屏幕尺寸:&nbsp;17.3英寸</p></li><li><p>屏幕比例:&nbsp;16:9</p></li><li><p>CPU平台:&nbsp;Intel Core i7-4980HQ</p></li><li><p>显卡类型:&nbsp;独立显卡 NVIDIA GeForce GTX 980M</p></li><li><p>显存容量:&nbsp;4GB</p></li><li><p>机械硬盘容量:&nbsp;1TB</p></li><li><p>固态硬盘:&nbsp;512G</p></li><li><p>内存容量:&nbsp;16G</p></li><li><p>光驱类型:&nbsp;无光驱</p></li><li><p>适用场景:&nbsp;家庭影音 高清游戏 尊贵旗舰</p></li><li><p>重量:&nbsp;2.5kg及以上</p></li><li><p>锂电池电芯数量:&nbsp;8芯锂电池</p></li><li><p>售后服务:&nbsp;全国联保</p></li><li><p>颜色分类:&nbsp;配置1 配置2 配置3 配置4 配置6 配置7 配置8 配置9 配置10 配置11 配置12 配置13 配置14 配置15 配置16 配置17 配置18 配置19 配置0 配置20 配置22 配置23 配置24</p></li><li><p>上市时间:&nbsp;2015年3月</p></li><li><p>操作系统:&nbsp;windows 8.1</p></li><li><p>通信技术类型:&nbsp;无线网卡 蓝牙</p></li><li><p>输入设备:&nbsp;触摸板 触摸屏</p></li><li><p>套餐类型:&nbsp;标准套餐</p></li><li><p>是否超极本:&nbsp;否</p></li><li><p>分辨率:&nbsp;1920x1080</p></li><li><p>是否触摸屏:&nbsp;触摸屏</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><span style=\"font-size: 18px; font-family: &#39;microsoft yahei&#39;; line-height: 1.5;\"><span style=\"color: rgb(255, 0, 0);\"><span style=\"background-color: rgb(255, 255, 0);\"><span style=\"background-color: rgb(255, 255, 255);\"></span><span style=\"color:#000000;font-size:24px\"></span></span></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><span style=\"font-size: 18px; font-family: &#39;microsoft yahei&#39;; line-height: 1.5;\"><span style=\"color: rgb(255, 0, 0);\"><span style=\"background-color: rgb(255, 255, 0);\"><span style=\"background-color: rgb(255, 255, 255);\"></span><span style=\"color:#000000;font-size:24px\"></span></span></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><span style=\"font-size: 18px; font-family: &#39;microsoft yahei&#39;; line-height: 1.5;\"><span style=\"color: rgb(255, 0, 0);\"><span style=\"background-color: rgb(255, 255, 0);\"><span style=\"background-color: rgb(255, 255, 255);\"></span><span style=\"color:#000000;font-size:24px\"><span style=\"color: rgb(255, 0, 0);\"><span style=\"font-size: 18px;\"><span style=\"line-height: 1.5;\"><span style=\"background-color: rgb(255, 255, 255);\"></span><span style=\"color:#000000;font-size:24px\"></span></span></span></span></span></span></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><br/></p><p><span style=\"color: rgb(204, 0, 0);\"><strong><span style=\"font-size: 18px;\"><span style=\"font-family: &#39;microsoft yahei&#39;;\"><span style=\"font-size: 24px;\">▲</span>以上宝贝属性参数为淘宝默认，和实物参数存在偏差，请以详情介绍为准</span></span></strong></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/123505594/TB2uIKdubFlpuFjy0FgXXbRBVXa_!!123505594.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><a target=\"_blank\" href=\"https://item.taobao.com/item.htm?spm=686.1000924.0.0.FQiC1z&id=21291671806\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px; line-height: 1.5; margin: 0px; padding: 0px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/123505594/TB25pbJeFXXXXXiXXXXXXXXXXXX_!!123505594.jpg\" style=\"border: 0px; vertical-align: middle; margin: 0px; padding: 0px; float: none;\"/></a></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/123505594/TB2XWPjmJhvOuFjSZFBXXcZgFXa_!!123505594.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/123505594/TB2cIcVfDAKh1JjSZFDXXbKlFXa_!!123505594.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p style=\"text-align:center;margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-family: &#39;microsoft yahei&#39;; font-size: 24px; line-height: 1.5;\">&lt; 发货时间 &gt;</span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-family: &#39;microsoft yahei&#39;; font-size: 16px; line-height: 1; color: rgb(255, 0, 0);\"><strong>具体要看戴尔的生产进度</strong></span><span style=\"font-family: &#39;microsoft yahei&#39;; font-size: 16px; line-height: 1;\">。会和戴尔公司保持联络，有消息通知各位亲。</span></p><h3 style=\"margin: 1em 0px; padding: 0px;\">&nbsp;<span style=\"font-family: &#39;microsoft yahei&#39;; font-size: 16px; font-weight: normal; line-height: 1.5;\">所有订单官网下单后不做任何修改和退换。特别是</span><span style=\"font-family: &#39;microsoft yahei&#39;; font-size: 16px; font-weight: normal; line-height: 1.5; color: rgb(255, 0, 0);\"><strong>定制版本</strong></span><span style=\"font-family: &#39;microsoft yahei&#39;; font-size: 16px; font-weight: normal; line-height: 1.5;\">，请互相理解！</span></h3><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"color: rgb(255, 255, 255);\"><span style=\"font-family: &#39;microsoft yahei&#39;;\"><span style=\"font-size: 36px;\"><span style=\"background-color: rgb(0, 0, 0);\">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ===实物拍摄=== &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</span></span></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i4/123505594/TB2SI9AoR8lpuFjSspaXXXJKpXa_!!123505594.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"4257\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_45.png','',1,0,0,0,0,0,1,0,'110','',NULL,NULL,0,0,'[]',0.00,0.00,3,'0','0','0','0',0,1499341791,1499341791,NULL,0,0,0,''),
	(46,'Lenovo/联想Yoga BOOK WiFi平板二合一超薄笔记本电脑yoga book',0,73,3,21,73,0,'',0,0,1,0.00,5888.00,5888.00,0.00,0,0,0,0,0.00,0,3000,0,0,300,0,0,0,0,0,0,0,111,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>CCC证书编号:&nbsp;<a href=\"https://baike.taobao.com/view.htm?wd=2012010902583758&ac=29\" target=\"blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\">2012010902583758</a></p></li><li><p>产品名称:&nbsp;Lenovo/联想 Yoga BOOK</p></li><li><p>厚度:&nbsp;10.0mm以下</p></li><li><p>屏幕类型:&nbsp;IPS LED 显示屏</p></li><li><p>是否PC平板二合一:&nbsp;是</p></li><li><p>机身重量（含电池）:&nbsp;0.69kg</p></li><li><p>毛重:&nbsp;1.478kg</p></li><li><p>版本类型:&nbsp;中国大陆</p></li><li><p>能效等级:&nbsp;一级</p></li><li><p>品牌:&nbsp;Lenovo/联想</p></li><li><p>系列:&nbsp;Yoga</p></li><li><p>型号:&nbsp;BOOK</p></li><li><p>屏幕尺寸:&nbsp;10.1英寸</p></li><li><p>屏幕比例:&nbsp;16:9</p></li><li><p>CPU:&nbsp;Intel? Atom? x5-Z8550 Processor</p></li><li><p>显卡类型:&nbsp;英特尔 HD Graphics (Cherry Trail)</p></li><li><p>显存容量:&nbsp;共享内存容量</p></li><li><p>机械硬盘容量:&nbsp;无</p></li><li><p>固态硬盘:&nbsp;64g</p></li><li><p>内存容量:&nbsp;4G</p></li><li><p>光驱类型:&nbsp;无光驱</p></li><li><p>适用场景:&nbsp;轻薄便携</p></li><li><p>重量:&nbsp;1kg以下</p></li><li><p>锂电池电芯数量:&nbsp;8500mAh</p></li><li><p>售后服务:&nbsp;全国联保</p></li><li><p>颜色分类:&nbsp;yogabook 雅黑色10.1英寸 安卓 yogabook傲灰色10.1英寸 安卓 yogabook耀金色10.1英寸 安卓 yogabook雅黑色10.1英寸WIN10 yoga a12 心动粉 12英寸 安卓</p></li><li><p>上市时间:&nbsp;2016年</p></li><li><p>月份:&nbsp;9月</p></li><li><p>操作系统:&nbsp;windows 10</p></li><li><p>通信技术类型:&nbsp;无线网卡</p></li><li><p>输入设备:&nbsp;触摸板 触摸屏</p></li><li><p>套餐类型:&nbsp;套餐一 套餐二 官方标配</p></li><li><p>是否超极本:&nbsp;是</p></li><li><p>分辨率:&nbsp;1920x1200</p></li><li><p>是否触摸屏:&nbsp;触摸屏</p></li></ul><p><a target=\"_blank\" href=\"http://item.taobao.com/item.htm?id=551592376595\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px; display: inline-block; width: 210px; height: 280px; float: left; margin-left: 12px; margin-top: 15px; padding: 5px; border: 1px solid rgb(221, 221, 221); background-color: rgb(255, 255, 255);\"><span style=\"display: inline-block; width: 210px; height: 210px;\"><img src=\"https://img.alicdn.com/bao/uploaded/i1/93153681/TB2BozqqH8kpuFjy0FcXXaUhpXa_!!93153681.png\" id=\"picUrl1\" style=\"border: 0px; vertical-align: middle; max-width: 210px; max-height: 210px;\"/></span><span style=\"display: inline-block; width: 210px; height: 35px; margin-top: 5px; font-size: 12px; color: rgb(102, 102, 102);\">正品8G micro SD卡 适用于V22蓝牙音箱 插卡音响内存卡</span><span style=\"display: inline-block; width: 210px; height: 40px; font-size: 17px; color: rgb(255, 94, 94); text-align: center;\">￥&nbsp;<em>25.0</em></span></a></p><p><span style=\"display: table-cell; font-size: 30px; color: rgb(255, 94, 94); vertical-align: middle; font-weight: bold;\">+</span></p><p><a target=\"_blank\" href=\"http://item.taobao.com/item.htm?id=548579203302\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px; display: inline-block; width: 210px; height: 280px; float: left; margin-top: 15px; padding: 5px; border: 1px solid rgb(221, 221, 221); background-color: rgb(255, 255, 255);\"><span style=\"display: inline-block; width: 210px; height: 210px;\"><img src=\"https://img.alicdn.com/bao/uploaded/i2/93153681/TB2uv2npxdkpuFjy0FbXXaNnpXa_!!93153681.jpg\" id=\"picUrl2\" style=\"border: 0px; vertical-align: middle; max-width: 210px; max-height: 210px;\"/></span><span style=\"display: inline-block; width: 210px; height: 35px; margin-top: 5px; font-size: 12px; color: rgb(102, 102, 102);\">Amoi/夏新 V22无线蓝牙音箱户外迷你低音炮便携式手机小钢炮音响</span><span style=\"display: inline-block; width: 210px; height: 40px; font-size: 17px; color: rgb(255, 94, 94); text-align: center;\">￥&nbsp;<em>86.0</em></span></a></p><p><span style=\"display: table-cell; font-size: 30px; color: rgb(255, 94, 94); vertical-align: middle; font-weight: bold;\">=</span></p><p><a target=\"_blank\" href=\"https://promotion.ews.m.jaeapp.com/meal.htm?itemIds=&mealPrice=&token=&a=5920439\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px; display: inline-block; width: 220px; height: 290px; float: left; margin-top: 15px; border: 1px solid rgb(221, 221, 221); background-color: rgb(255, 255, 255);\"><span class=\"tmpl-title\" style=\"display: inline-block; width: 220px; margin-top: 24px; margin-bottom: 60px; font-size: 23px; color: rgb(255, 94, 94); font-weight: bold; text-align: center;\">搭配在一起更划算</span><span style=\"display: inline-block; width: 220px; height: 67px; margin-bottom: 15px; background-color: rgb(255, 94, 94);\"><span style=\"display: inline-block; width: 143px; height: 67px;\"><span class=\"tmpl-title\" style=\"display: block; font-size: 12px; margin: 8px 0px 0px 10px; color: rgb(255, 255, 255); font-weight: bold;\">套餐价：</span><span style=\"display: inline-block; font-size: 24px; margin-left: 4px; color: rgb(255, 255, 255); font-weight: bold;\">￥&nbsp;105</span></span>&nbsp;<span class=\"tmpl-title\" style=\"display: inline-block; font-size: 13px; padding: 3px 7px; color: rgb(255, 94, 94); vertical-align: top; margin-top: 34px; border-radius: 2px; background-color: rgb(255, 255, 255);\">马上抢购</span></span><span style=\"display: inline-block; width: 220px; text-align: center;\"><img class=\"adultImg\" src=\"https://img.alicdn.com/imgextra/i4/17157061/TB2cTdIcpXXXXcyXpXXXXXXXXXX-17157061.png\" style=\"border: 0px; vertical-align: middle; width: 150px; height: 49px;\"/></span></a></p><p>&nbsp;&nbsp;<img src=\"https://img.alicdn.com/imgextra/i4/871727117/TB2Z150aXXXXXaQXXXXXXXXXXXX-871727117.jpg_q90.jpg?q=START_SYB_MJS_ID_2965705466_START\" style=\"border: 0px; vertical-align: middle;\"/>&nbsp;<img src=\"https://img.alicdn.com/imgextra/i3/93153681/TB25uZ_lgNlpuFjy0FfXXX3CpXa_!!93153681.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: middle; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/93153681/TB2l4j9mJ4opuFjSZFLXXX8mXXa_!!93153681.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: middle; max-width: 750px;\"/><a href=\"https://item.taobao.com/item.htm?spm=a230r.1.14.253.SwQRJE&id=545197999585&ns=1&abbucket=10#detail\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/93153681/TB2vE8Fg0hvOuFjSZFBXXcZgFXa_!!93153681.png\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: middle; max-width: 750px;\"/></a></p><p><a target=\"_blank\" style=\"color: rgb(51, 102, 204); outline: 0px;\"><img alt=\"\" src=\"https://gd4.alicdn.com/imgextra/i4/696944147/T2bvZ6XjBaXXXXXXXX-696944147.png\" class=\"\" style=\"border: 0px; vertical-align: middle;\"/></a></p><p style=\"margin-top: 10px; margin-bottom: 10px; padding: 5px 20px; float: left; display: inline; line-height: 20px; font-size: 15px; border-right-width: 1px; border-right-style: solid; border-right-color: rgb(205, 205, 205);\"><strong style=\"color: rgb(102, 102, 102);\"><span style=\"color: rgb(255, 84, 0);\"></span>黑色星期三&nbsp;</strong><br/><span style=\"font-size: 13px; color: rgb(153, 153, 153);\">2017-09-18 11:00:00截止</span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px 0px 0px 20px; float: left; display: inline; line-height: 70px;\"><span style=\"font-size: 13px; color: rgb(153, 153, 153);\">数量有限，赶快抢购吧</span></p><p>单笔订单:</p><p>满&nbsp;<strong style=\"display: inline-block; margin-left: 1em; color: rgb(255, 84, 0); font-size: 20px;\">2999</strong>&nbsp;<span style=\"display: inline-block; margin-left: 1em;\">元</span>&nbsp;:</p><p>减&nbsp;<strong style=\"color: rgb(255, 84, 0); font-size: 20px;\">10&nbsp;</strong>元&nbsp;<span style=\"display: inline-block; margin-left: 2em; color: rgb(153, 153, 153);\"><strong style=\"color: rgb(255, 84, 0); font-size: 20px;\">送礼物:&nbsp;</strong><span style=\"display: inline-block; margin-left: 2em; font-size: 16px;\">有线精美游戏鼠标一个</span></span></p><p style=\"margin-bottom: 0px; padding: 5px 0px 0px; line-height: 20px; border-top-width: 1px; border-top-style: solid; border-top-color: rgb(207, 207, 207);\"><span style=\"color: rgb(153, 153, 153);\">本活动不累加，一个ID只有一个，解释权归卓越京猫联想体验馆所有。</span></p><p><img src=\"https://img.alicdn.com/imgextra/i4/871727117/TB2Z150aXXXXXaQXXXXXXXXXXXX-871727117.jpg_q90.jpg?q=END_SYB_MJS_ID_2965705466_END\" class=\"\" style=\"border: 0px; vertical-align: middle;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 24px;\"></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><br/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/93153681/TB216kqhxdkpuFjy0FbXXaNnpXa_!!93153681.jpg\" class=\"\" width=\"750\" height=\"754\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><table align=\"left\" width=\"750\"><tbody><tr class=\"firstRow\"><td style=\"margin: 0px; padding: 0px;\"><strong><span style=\"font-family: simhei;\"><span style=\"font-size: 24px;\">官方 标配</span></span></strong></td><td style=\"margin: 0px; padding: 0px;\"><strong><span style=\"font-family: simhei;\"><span style=\"font-size: 24px;\">全新未开封机器(主机+保修卡+说明书+电源适配器+手写笔+手写纸)+正规机打发票</span></span></strong></td></tr><tr><td style=\"margin: 0px; padding: 0px;\"><span style=\"font-family: simhei;\"><span style=\"font-size: 24px;\">套餐一</span></span></td><td style=\"margin: 0px; padding: 0px;\"><span style=\"color: rgb(204, 0, 0);\"><span style=\"font-family: simhei;\"><span style=\"font-size: 24px;\">官方标配+专用皮套+高清贴膜+OTG转接线+micro HDMI转HDMI线+micro USB转网口+32G储存卡</span></span></span></td></tr><tr><td style=\"margin: 0px; padding: 0px;\"><span style=\"font-family: simhei;\"><span style=\"font-size: 24px;\">套餐二</span></span></td><td style=\"margin: 0px; padding: 0px;\"><span style=\"color: rgb(204, 0, 0);\"><span style=\"font-family: simhei;\"><span style=\"font-size: 24px;\">官方标配+专用皮套+高清贴膜+OTG转接线+micro HDMI转HDMI线+micro USB转网口+64G储存卡</span></span></span></td></tr></tbody></table><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"font-size: 0px; line-height: 1.5;\">模板保护代<img src=\"https://img.alicdn.com/imgextra/i4/93153681/TB293Y6kwRkpuFjy1zeXXc.6FXa_!!93153681.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"739\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/>码<img src=\"https://img.alicdn.com/imgextra/i4/93153681/TB2kn_1s.hnpuFjSZFEXXX0PFXa_!!93153681.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"857\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/93153681/TB2P96Ws00opuFjSZFxXXaDNVXa_!!93153681.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"858\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/93153681/TB2YPn7sZtnpuFjSZFvXXbcTpXa_!!93153681.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"857\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/93153681/TB20Urgs7qvpuFjSZFhXXaOgXXa_!!93153681.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"857\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/93153681/TB2kQknsYBmpuFjSZFAXXaQ0pXa_!!93153681.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"858\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/93153681/TB2Q3H_s90mpuFjSZPiXXbssVXa_!!93153681.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"857\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></span></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_46.png','',1,0,0,0,0,0,1,0,'111,112','',NULL,NULL,0,0,'[]',0.00,0.00,3,'0','0','0','0',0,1499341866,1499341866,NULL,0,0,0,''),
	(47,'神舟战神Z7-KP7S1/K670D-G4D1/Z7M/T6TI 1060 学生游戏笔记本电脑',0,73,3,21,73,0,'',0,0,1,0.00,4500.00,4500.00,0.00,0,0,0,0,0.00,0,2000,0,0,100,0,0,0,0,0,0,0,113,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>CCC证书编号:&nbsp;<a href=\"https://baike.taobao.com/view.htm?wd=2013010902637208&ac=29\" target=\"blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\">2013010902637208</a></p></li><li><p>厚度:&nbsp;20.0mm及以上</p></li><li><p>屏幕类型:&nbsp;宽屏</p></li><li><p>是否PC平板二合一:&nbsp;否</p></li><li><p>机身重量（含电池）:&nbsp;2.5kg</p></li><li><p>版本类型:&nbsp;中国大陆</p></li><li><p>能效等级:&nbsp;一级</p></li><li><p>品牌:&nbsp;Hasee/神舟</p></li><li><p>神舟系列型号:&nbsp;战神系列</p></li><li><p>型号:&nbsp;K650C-i7 D3</p></li><li><p>屏幕尺寸:&nbsp;15.6英寸</p></li><li><p>屏幕比例:&nbsp;16:9</p></li><li><p>CPU:&nbsp;英特尔 酷睿 i5-4210M</p></li><li><p>显卡类型:&nbsp;NVIDIA GeForce GTX950</p></li><li><p>显存容量:&nbsp;2GB</p></li><li><p>机械硬盘容量:&nbsp;无机械硬盘</p></li><li><p>固态硬盘:&nbsp;无</p></li><li><p>内存容量:&nbsp;8GB</p></li><li><p>光驱类型:&nbsp;无光驱</p></li><li><p>适用场景:&nbsp;家庭影音 学生 商务办公 高清游戏 尊贵旗舰 家庭娱乐</p></li><li><p>重量:&nbsp;2kg(含)-2.5kg(不含)</p></li><li><p>锂电池电芯数量:&nbsp;4芯锂电池</p></li><li><p>售后服务:&nbsp;全国联保</p></li><li><p>颜色分类:&nbsp;K670D-G4D1 K670D-G4D1高配版（72色域） K670D-G5D1 K670D-G5D1高配版（72色域） K670E-G6D1 K670E-G6D1高配版（72色域） K680D-G4D1 K680D-G4D1高配版 K680E-G6D1 T6-X5战斗版 T6-X5标配版 T6-X5高配版（72色域） T6TI-X5S战斗版（全彩） T6TI-X5S（全彩） Z7-KP7D2 Z7-KP7D2高配版（72色域） Z7-SP5D1 Z7-SP5D1高配版（72色域） Z7-KP7D1 Z7-KP7D1高配版（72色域） Z7-KP7S1 Z7-KP7S1高配版（72色域） Z7-PRO标配版（金属） Z7-PRO高配版（金属72色域） 乳白色 米白色 灰色 黑色 玫红色 红色 藕色 西瓜红 酒红色 卡其色 姜黄色 明黄色 杏色 橙色 金色 浅绿色 翠绿色 荧光绿 青色 天蓝色 孔雀蓝 宝蓝色 粉色</p></li><li><p>上市时间:&nbsp;2015年</p></li><li><p>操作系统:&nbsp;DOS</p></li><li><p>通信技术类型:&nbsp;无线网卡</p></li><li><p>输入设备:&nbsp;触摸板</p></li><li><p>套餐类型:&nbsp;套餐一 套餐二 套餐三 套餐四 官方标配</p></li><li><p>是否超极本:&nbsp;否</p></li><li><p>分辨率:&nbsp;1920x1080</p></li><li><p>是否触摸屏:&nbsp;非触摸屏</p></li></ul><p><img src=\"https://img.alicdn.com/imgextra/i1/262188958/TB2XPATlFXXXXbLXXXXXXXXXXXX_!!262188958.gif\" style=\"border: 0px; vertical-align: middle;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/262188958/TB2FK7zzAqvpuFjSZFhXXaOgXXa_!!262188958.jpg\" style=\"border: 0px; vertical-align: middle;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/262188958/TB2x8u0u9xjpuFjSszeXXaeMVXa_!!262188958.jpg\" style=\"border: 0px; vertical-align: middle;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/262188958/TB2Hlfku90jpuFjy0FlXXc0bpXa_!!262188958.jpg\" style=\"border: 0px; vertical-align: middle;\"/><a style=\"color: rgb(51, 102, 204); outline: 0px;\">&nbsp;<img src=\"https://img.alicdn.com/imgextra/i4/262188958/TB2KNqag9vHfKJjSZFPXXbttpXa_!!262188958.jpg\" class=\"\" align=\"absmiddle\" style=\"border: 0px; vertical-align: middle;\"/></a><a style=\"color: rgb(51, 102, 204); outline: 0px;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/262188958/TB2C9wlu9JjpuFjy0FdXXXmoFXa_!!262188958.jpg\" class=\"\" style=\"border: 0px; vertical-align: middle;\"/></a><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/262188958/TB25TXesYFkpuFjy1XcXXclapXa_!!262188958.jpg\" class=\"\" style=\"border: 0px; vertical-align: middle; width: 750px;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/262188958/TB2_wn0nYtlpuFjSspfXXXLUpXa_!!262188958.jpg\" class=\"\" width=\"750\" height=\"900\" style=\"border: 0px; vertical-align: middle;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_47.png','',1,0,0,0,0,0,1,0,'113,114','',NULL,NULL,0,6,'[]',0.00,0.00,3,'0','0','0','0',0,1499342007,1499342007,NULL,0,0,0,''),
	(48,'Asus/华硕 X540 X540LJ4005 酷睿i3轻薄独显15.6寸手提笔记本电脑',0,73,3,21,73,0,'',0,0,1,0.00,4266.00,4266.00,0.00,0,0,0,0,0.00,0,2200,0,0,100,0,0,0,0,0,0,0,115,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>CCC证书编号:&nbsp;<a href=\"https://baike.taobao.com/view.htm?wd=2013010902601399&ac=29\" target=\"blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\">2013010902601399</a></p></li><li><p>产品名称:&nbsp;Asus/华硕 X540 X540LJ4005</p></li><li><p>包装体积:&nbsp;X540LJ5005</p></li><li><p>厚度:&nbsp;20.0mm及以上</p></li><li><p>是否PC平板二合一:&nbsp;否</p></li><li><p>机身重量（含电池）:&nbsp;2.2kg</p></li><li><p>版本类型:&nbsp;中国大陆</p></li><li><p>能效等级:&nbsp;一级</p></li><li><p>品牌:&nbsp;Asus/华硕</p></li><li><p>系列:&nbsp;X540</p></li><li><p>型号:&nbsp;X540LJ4005</p></li><li><p>屏幕尺寸:&nbsp;15.6英寸</p></li><li><p>屏幕比例:&nbsp;16:9</p></li><li><p>CPU:&nbsp;英特尔 酷睿 i3-5005U</p></li><li><p>显卡类型:&nbsp;GT920M</p></li><li><p>显存容量:&nbsp;2GB</p></li><li><p>机械硬盘容量:&nbsp;500GB</p></li><li><p>固态硬盘:&nbsp;无</p></li><li><p>内存容量:&nbsp;4GB</p></li><li><p>光驱类型:&nbsp;DVD-ROM</p></li><li><p>适用场景:&nbsp;家庭影音 女性定位 轻薄便携 学生 商务办公 高清游戏 尊贵旗舰 家庭娱乐</p></li><li><p>重量:&nbsp;2kg(含)-2.5kg(不含)</p></li><li><p>锂电池电芯数量:&nbsp;6芯锂电池</p></li><li><p>售后服务:&nbsp;全国联保</p></li><li><p>颜色分类:&nbsp;外棕黑内金色</p></li><li><p>上市时间:&nbsp;2016年</p></li><li><p>月份:&nbsp;1月</p></li><li><p>操作系统:&nbsp;windows 10</p></li><li><p>通信技术类型:&nbsp;无线网卡</p></li><li><p>输入设备:&nbsp;触摸板</p></li><li><p>套餐类型:&nbsp;标准套餐 套餐一 套餐二 套餐三 套餐四</p></li><li><p>是否超极本:&nbsp;否</p></li><li><p>分辨率:&nbsp;1366x768</p></li><li><p>是否触摸屏:&nbsp;非触摸屏</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"widows: 2; border-collapse: separate; font-stretch: normal; font-size: medium; line-height: normal; font-family: simsun; orphans: 2;\"><span style=\"line-height: 21px; font-size: 14px;\"><span style=\"border-collapse: separate; font-stretch: normal; font-size: medium; line-height: normal;\"><span style=\"line-height: 21px; font-size: 14px;\"><span style=\"font-family: 宋体; font-size: 15pt;\"><span style=\"border-collapse: separate; font-stretch: normal; font-size: medium; line-height: normal; font-family: simsun;\"><span style=\"line-height: 21px; font-size: 14px;\"><span style=\"border-collapse: separate; font-stretch: normal; font-size: medium; line-height: normal;\"><span style=\"line-height: 21px; font-size: 14px;\"><span style=\"font-family: 宋体; font-size: 15pt;\"><span style=\"font-size:18px\"></span><span style=\"font-size:18px\"></span><span style=\"color:#0000ff;font-size:18px\"><span style=\"font-family:宋体;line-height: 13.5pt; color: rgb(0, 0, 0); font-size: 10.5pt; font-weight: bold;\"></span></span></span></span></span></span></span></span></span></span></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><span style=\"widows: 2; border-collapse: separate; font-stretch: normal; font-size: medium; line-height: normal; font-family: simsun; orphans: 2;\"><span style=\"line-height: 21px; font-size: 14px;\"><span style=\"border-collapse: separate; font-stretch: normal; font-size: medium; line-height: normal;\"><span style=\"line-height: 21px; font-size: 14px;\"><span style=\"font-family: 宋体; font-size: 15pt;\"><span style=\"border-collapse: separate; font-stretch: normal; font-size: medium; line-height: normal; font-family: simsun;\"><span style=\"line-height: 21px; font-size: 14px;\"><span style=\"border-collapse: separate; font-stretch: normal; font-size: medium; line-height: normal;\"><span style=\"line-height: 21px; font-size: 14px;\"><span style=\"font-family: 宋体; font-size: 15pt;\"><span style=\"font-size:18px\"></span><span style=\"font-size:18px\"></span><span style=\"color:#0000ff;font-size:18px\"><span style=\"font-family:宋体;line-height: 13.5pt; color: rgb(0, 0, 0); font-size: 10.5pt; font-weight: bold;\"><span style=\"font-size: 24px;\"><span style=\"color:#404040;font-family:Tahoma\"><img src=\"https://img.alicdn.com/imgextra/i4/25628539/TB2h.QAoChlpuFjSspkXXa1ApXa_!!25628539.jpg\" style=\"border: 0px; vertical-align: top;\"/><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i3/25628539/TB2GudNxHBmpuFjSZFAXXaQ0pXa_!!25628539.jpg\" style=\"border: 0px; vertical-align: top;\"/><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i3/25628539/TB2trkhm5C9MuFjSZFoXXbUzFXa_!!25628539.jpg\" style=\"border: 0px; vertical-align: top;\"/><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i2/25628539/TB2WV2_oVXXXXXbXFXXXXXXXXXX_!!25628539.jpg\" style=\"border: 0px; vertical-align: top;\"/><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i4/25628539/TB2VAMGoVXXXXaLXXXXXXXXXXXX_!!25628539.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/></span></span></span></span></span></span></span></span></span></span></span></span></span></span><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i2/25628539/TB2cL8jlpXXXXanXpXXXXXXXXXX_!!25628539.jpg\" class=\"\" width=\"791\" height=\"517\" style=\"border: 0px; vertical-align: top; width: 747px; height: 486px;\"/><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i2/25628539/TB2_3MMXYDD11BjSszfXXbwoFXa_!!25628539.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i3/25628539/TB2CPsubBPzQeBjSZFhXXbRpFXa_!!25628539.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i3/25628539/TB26d6SoVXXXXaqXFXXXXXXXXXX_!!25628539.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i4/25628539/TB2EFMXoVXXXXcvXpXXXXXXXXXX_!!25628539.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i1/25628539/TB2EngNXZHA11Bjy0FiXXckfVXa_!!25628539.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i4/25628539/TB2Jj4MlpXXXXXDXXXXXXXXXXXX_!!25628539.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i1/25628539/TB2P20zlpXXXXcuXXXXXXXXXXXX_!!25628539.jpg\" class=\"\" style=\"border: 0px; vertical-align: top;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_48.png','',1,0,0,0,0,0,1,0,'115','',NULL,NULL,0,6,'[]',0.00,0.00,3,'0','0','0','0',0,1499342080,1499342080,NULL,0,0,0,''),
	(49,'14.1英寸轻薄刀锋四核笔记本电脑手提固态商务学生游戏上网本分期',0,73,3,21,73,0,'',0,0,1,0.00,5600.00,5600.00,0.00,0,0,0,0,0.00,0,2000,0,0,200,0,0,0,0,0,0,0,116,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>CCC证书编号:&nbsp;<a href=\"https://baike.taobao.com/view.htm?wd=2016010902887403&ac=29\" target=\"blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\">2016010902887403</a></p></li><li><p>厚度:&nbsp;10.0mm(含)-15.0mm(不含)</p></li><li><p>机身重量（含电池）:&nbsp;1.49kg</p></li><li><p>版本类型:&nbsp;中国大陆</p></li><li><p>品牌:&nbsp;TOPOSH</p></li><li><p>屏幕尺寸:&nbsp;14.1英寸</p></li><li><p>屏幕比例:&nbsp;16:9</p></li><li><p>CPU:&nbsp;英特尔 赛扬 J1900</p></li><li><p>显卡类型:&nbsp;英特尔 HD Graphics (Bay Trail)</p></li><li><p>显存容量:&nbsp;共享内存容量</p></li><li><p>机械硬盘容量:&nbsp;无机械硬盘</p></li><li><p>固态硬盘:&nbsp;64g</p></li><li><p>内存容量:&nbsp;4GB</p></li><li><p>光驱类型:&nbsp;无光驱</p></li><li><p>适用场景:&nbsp;家庭影音 女性定位 轻薄便携 学生 商务办公 高清游戏 家庭娱乐</p></li><li><p>锂电池电芯数量:&nbsp;6芯锂电池</p></li><li><p>售后服务:&nbsp;店铺三包</p></li><li><p>颜色分类:&nbsp;四核固态银色 四核固态白色 四核固态金色 四核固态黑色 四核双盘银色 四核双盘白色 四核双盘金色 四核双盘黑色 升级版固态银色 升级版固态白色 升级版固态金色 升级版固态黑色 I5固态银色 z8300银色4G120G z8300银色4G60G z8300金色4G60G Z8300黑色 Z8300双盘黑色 Z8300双盘白色 Z8300白色</p></li><li><p>上市时间:&nbsp;2016年4月</p></li><li><p>操作系统:&nbsp;windows 10</p></li><li><p>通信技术类型:&nbsp;无线网卡</p></li><li><p>输入设备:&nbsp;触摸板</p></li><li><p>套餐类型:&nbsp;标准套餐 套餐一 套餐二 套餐三 套餐四 官方标配</p></li><li><p>分辨率:&nbsp;1366x768</p></li></ul><p><img src=\"https://img.alicdn.com/imgextra/i1/268915712/TB2Tu4JvR8lpuFjy0FnXXcZyXXa_!!268915712.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: middle; max-width: 750px;\"/><br/><img src=\"https://img.alicdn.com/imgextra/i3/268915712/TB2nIl3t80kpuFjSsziXXa.oVXa_!!268915712.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: middle; max-width: 750px;\"/><a href=\"https://favorite.taobao.com/popup/add_collection.htm?spm=a1z10.1-c-s.0.0.biI0aG&id=58648106&itemid=58648106&itemtype=0&sellerid=268915712&scjjc=2\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i4/268915712/TB2A6cNvxXkpuFjy0FiXXbUfFXa_!!268915712.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: middle; max-width: 750px;\"/></a><a href=\"https://favorite.taobao.com/popup/add_collection.htm?spm=a1z10.1-c-s.0.0.biI0aG&id=58648106&itemid=58648106&itemtype=0&sellerid=268915712&scjjc=2\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/268915712/TB2Zbuqt3RkpuFjy1zeXXc.6FXa_!!268915712.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: middle; max-width: 750px;\"/></a></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/268915712/TB2.XQbq3xlpuFjSszbXXcSVpXa_!!268915712.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"332\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/268915712/TB2S3Pjq30kpuFjSspdXXX4YXXa_!!268915712.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"426\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/268915712/TB2972HqY0kpuFjy0FjXXcBbVXa_!!268915712.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"451\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/268915712/TB2Y5nLqYtlpuFjSspfXXXLUpXa_!!268915712.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"464\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/268915712/TB2EkzsqYBkpuFjy1zkXXbSpFXa_!!268915712.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"448\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/268915712/TB2ndwCwstnpuFjSZFKXXalFFXa_!!268915712.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"908\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_49.png','',1,0,0,0,0,0,1,0,'116,117','',NULL,NULL,0,0,'[]',0.00,0.00,3,'0','0','0','0',0,1499342154,1499342154,NULL,0,0,0,''),
	(50,'Asus/华硕 X555 X555YI 四核超薄独显15.6英寸游戏手提笔记本电脑',0,73,3,21,73,0,'',0,0,1,0.00,5300.00,5300.00,0.00,0,0,0,0,0.00,0,1500,0,0,300,0,0,0,0,0,0,0,118,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>CCC证书编号:&nbsp;<a href=\"https://baike.taobao.com/view.htm?wd=2014010902691580&ac=29\" target=\"blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\">2014010902691580</a></p></li><li><p>包装体积:&nbsp;X555YI7110</p></li><li><p>厚度:&nbsp;20.0mm及以上</p></li><li><p>屏幕类型:&nbsp;宽屏</p></li><li><p>是否PC平板二合一:&nbsp;否</p></li><li><p>机身重量（含电池）:&nbsp;2.2kg</p></li><li><p>版本类型:&nbsp;中国大陆</p></li><li><p>能效等级:&nbsp;一级</p></li><li><p>品牌:&nbsp;Asus/华硕</p></li><li><p>系列:&nbsp;X550VC</p></li><li><p>屏幕尺寸:&nbsp;15.6英寸</p></li><li><p>屏幕比例:&nbsp;16:9</p></li><li><p>CPU:&nbsp;AMD E2-7110</p></li><li><p>显卡类型:&nbsp;AMD Radeon R5 M320</p></li><li><p>显存容量:&nbsp;2GB</p></li><li><p>机械硬盘容量:&nbsp;500GB</p></li><li><p>固态硬盘:&nbsp;无</p></li><li><p>内存容量:&nbsp;4GB</p></li><li><p>光驱类型:&nbsp;无光驱</p></li><li><p>适用场景:&nbsp;家庭影音 轻薄便携 学生 商务办公 高清游戏</p></li><li><p>重量:&nbsp;2kg(含)-2.5kg(不含)</p></li><li><p>锂电池电芯数量:&nbsp;锂聚合物电池</p></li><li><p>售后服务:&nbsp;全国联保</p></li><li><p>颜色分类:&nbsp;黑色 7110四核CPU 白色 7110四核CPU 黑色 7410四核CPU 白色 7410四核CPU</p></li><li><p>上市时间:&nbsp;2016年</p></li><li><p>月份:&nbsp;6月</p></li><li><p>操作系统:&nbsp;windows 10</p></li><li><p>通信技术类型:&nbsp;无线网卡</p></li><li><p>输入设备:&nbsp;触摸板</p></li><li><p>套餐类型:&nbsp;标准套餐 套餐一 套餐二 套餐三 套餐四</p></li><li><p>是否超极本:&nbsp;否</p></li><li><p>分辨率:&nbsp;1366x768</p></li><li><p>是否触摸屏:&nbsp;非触摸屏</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i3/25628539/TB2kzFwrEdnpuFjSZPhXXbChpXa_!!25628539.jpg\" style=\"border: 0px; vertical-align: top;\"/><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i3/25628539/TB2MV85XHdvt1JjSZFuXXXG0FXa_!!25628539.jpg\" style=\"border: 0px; vertical-align: top;\"/><a href=\"http://item.taobao.com/item.htm?id=25225432002\" target=\"_blank\" style=\"text-decoration: none; color: rgb(51, 102, 204); outline: 0px;\"></a><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i4/25628539/TB2ZO6qsVXXXXXKXpXXXXXXXXXX_!!25628539.png\" style=\"border: 0px; vertical-align: top;\"/><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i3/25628539/TB2kru5tFXXXXctXXXXXXXXXXXX_!!25628539.jpg\" style=\"border: 0px; vertical-align: top;\"/><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i1/25628539/TB2yzwCoFXXXXcjXXXXXXXXXXXX_!!25628539.jpg\" class=\"\" width=\"749\" height=\"561\" style=\"border: 0px; vertical-align: top;\"/><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i4/25628539/TB2FqcGoFXXXXb0XXXXXXXXXXXX_!!25628539.jpg\" class=\"\" width=\"749\" height=\"693\" style=\"border: 0px; vertical-align: top;\"/><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i4/25628539/TB2kKEooFXXXXbnXpXXXXXXXXXX_!!25628539.jpg\" class=\"\" width=\"749\" height=\"745\" style=\"border: 0px; vertical-align: top;\"/><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i3/25628539/TB2CPsBoFXXXXbRXXXXXXXXXXXX_!!25628539.jpg\" class=\"\" width=\"749\" height=\"702\" style=\"border: 0px; vertical-align: top;\"/><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i1/25628539/TB2LUcMoFXXXXaKXXXXXXXXXXXX_!!25628539.jpg\" class=\"\" width=\"749\" height=\"745\" style=\"border: 0px; vertical-align: top;\"/><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i4/25628539/TB2jOOdX3RkpuFjy1zeXXc.6FXa_!!25628539.jpg\" class=\"\" width=\"750\" height=\"703\" style=\"border: 0px; vertical-align: top;\"/><img align=\"middle\" src=\"https://img.alicdn.com/imgextra/i1/25628539/TB2mcgeoFXXXXbAXpXXXXXXXXXX_!!25628539.jpg\" class=\"\" width=\"749\" height=\"687\" style=\"border: 0px; vertical-align: top;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_50.png','',1,0,0,0,0,0,1,0,'118,119','',NULL,NULL,0,6,'[]',0.00,0.00,3,'0','0','0','0',0,1499342229,1499342229,NULL,0,0,0,''),
	(51,'古尚古 懒人手机支架 手机通用指环创意卡扣粘贴式全金属卡通配件',0,70,2,20,70,0,'',0,0,1,16.00,15.00,15.00,5.00,0,0,0,0,0.00,0,3000,0,0,100,0,0,0,0,0,0,0,120,'','','<p class=\"attr-list-hd tm-clear\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 20px; line-height: 22px; color: rgb(153, 153, 153);\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; float: left;\">产品参数：</span></p><ul id=\"J_AttrUL\" style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>品牌:&nbsp;GUSGU/古尚古</p></li><li><p>适用场景:&nbsp;桌面</p></li><li><p>颜色分类:&nbsp;极光银【金属升级版小熊指环支架】&nbsp;玫瑰金【金属升级版小熊指环支架】&nbsp;土豪金【金属升级版小熊指环支架】</p></li><li><p>货号:&nbsp;金属指环支架小熊</p></li></ul><p><a style=\"margin: 0px; padding: 0px; color: rgb(51, 85, 170); outline: 0px;\" name=\"hlg_list_1_16696005_start\"></a></p><table cellpadding=\"0\" cellspacing=\"0\"><tbody style=\"margin: 0px; padding: 0px;\"><tr style=\"margin: 0px; padding: 0px;\" class=\"firstRow\"><td style=\"margin: 0px; padding: 0px; border-color: rgb(0, 0, 0);\"><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; line-height: 1.4;\"><img src=\"https://img.alicdn.com/imgextra/i3/2024058652/TB2SxemsC8mpuFjSZFMXXaxpVXa_!!2024058652.jpg\" alt=\" 9.9zhijia.jpg\" usemap=\"#youhuiquan\" border=\"0\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: top; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; float: none;\"/><map name=\"youhuiquan\" style=\"margin: 0px; padding: 0px;\"><area shape=\"rect\" coords=\"2,249,264,354\" href=\"https://taoquan.taobao.com/coupon/unify_apply.htm?sellerId=2024058652&activityId=ef00e30b519b49d0b6d25d7f5fc18509\" style=\"margin: 0px; padding: 0px;\"/><area shape=\"rect\" coords=\"265,250,527,354\" href=\"https://taoquan.taobao.com/coupon/unify_apply.htm?sellerId=2024058652&activityId=23082d04da8542638f83f5a9224cd804\" style=\"margin: 0px; padding: 0px;\"/><area shape=\"rect\" coords=\"528,249,787,354\" href=\"https://taoquan.taobao.com/coupon/unify_apply.htm?sellerId=2024058652&activityId=7d6c5f6fdcc340998e12538fd622dc70\" style=\"margin: 0px; padding: 0px;\"/><area shape=\"rect\" coords=\"2,360,787,670\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b.w4011-16031137462.101.SB0Z1G&id=551847632551&rn=f1ebe2a5d7249faf9b4d6a6b4faab4d1&abbucket=5\" style=\"margin: 0px; padding: 0px;\"/><area shape=\"rect\" coords=\"1,942,393,1189\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-16031137462.90.UH7JVO&id=520387010111&rn=3a915715a5e04aed48bb2848afa2b02f&abbucket=17\" style=\"margin: 0px; padding: 0px;\"/><area shape=\"rect\" coords=\"393,941,788,1188\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-16031137462.94.UH7JVO&id=526570592290&rn=3a915715a5e04aed48bb2848afa2b02f&abbucket=17\" style=\"margin: 0px; padding: 0px;\"/><area shape=\"rect\" coords=\"2,671,395,938\" href=\"http://detail.tmall.com/item.htm?spm=a1z10.3-b.w4011-9688295034.221.WHswTS&id=528742000049&rn=d60c0fc65db649daf2eef841d385e05f&abbucket=19\" style=\"margin: 0px; padding: 0px;\"/><area shape=\"rect\" coords=\"396,672,789,940\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b.w4011-9688295034.78.orRltZ&id=552435370880&rn=458a4ee34de1ea916fe2b55d053feb1f&abbucket=5\" style=\"margin: 0px; padding: 0px;\"/></map></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; line-height: 1.4;\"><img src=\"https://img.alicdn.com/imgextra/i1/2024058652/TB2fhmkgxBmpuFjSZFDXXXD8pXa_!!2024058652.jpg\" alt=\" 1_02.jpg\" usemap=\"#xiliemo\" border=\"0\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; vertical-align: top; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; float: none;\"/><map name=\"xiliemo\" style=\"margin: 0px; padding: 0px;\"><area shape=\"rect\" coords=\"2,209,195,301\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b.w4011-9688295034.101.j5X2Xc&id=41006014012&rn=c8ddec7256f0174d588efcc9d9f725f5&abbucket=19\" style=\"margin: 0px; padding: 0px;\"/><area shape=\"rect\" coords=\"3,109,196,203\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b.w4011-9688295034.110.MJwjR5&id=41006014012&rn=2c49472e4673ed9c77a81ac6ba9e3098&abbucket=19\" style=\"margin: 0px; padding: 0px;\"/><area shape=\"rect\" coords=\"200,108,392,204\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b.w4011-9688295034.114.37lYg4&id=538660697656&rn=27db494bb013011afc840c79f1f3ca3e&abbucket=19\" style=\"margin: 0px; padding: 0px;\"/><area shape=\"rect\" coords=\"397,108,590,203\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b.w4011-9688295034.130.37lYg4&id=537388595948&rn=27db494bb013011afc840c79f1f3ca3e&abbucket=19\" style=\"margin: 0px; padding: 0px;\"/><area shape=\"rect\" coords=\"593,108,786,204\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b.w4011-9688295034.110.37lYg4&id=538701368461&rn=27db494bb013011afc840c79f1f3ca3e&abbucket=19\" style=\"margin: 0px; padding: 0px;\"/><area shape=\"rect\" coords=\"4,309,195,401\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b.w4011-9688295034.113.j5X2Xc&id=41437478446&rn=c8ddec7256f0174d588efcc9d9f725f5&abbucket=19\" style=\"margin: 0px; padding: 0px;\"/><area shape=\"rect\" coords=\"201,208,393,303\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b.w4011-9688295034.205.kH3KwT&id=520792435196&rn=eaf11c400a70c47cdaa7a1dc66a7f28d&abbucket=19\" style=\"margin: 0px; padding: 0px;\"/><area shape=\"rect\" coords=\"201,307,393,400\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b.w4011-9688295034.233.kH3KwT&id=520798954763&rn=eaf11c400a70c47cdaa7a1dc66a7f28d&abbucket=19\" style=\"margin: 0px; padding: 0px;\"/><area shape=\"rect\" coords=\"396,207,589,301\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b.w4011-9688295034.76.YV4OM5&id=45362190930&rn=d3479fa8f03ae73d5cd42ce1000f9f51&abbucket=19\" style=\"margin: 0px; padding: 0px;\"/><area shape=\"rect\" coords=\"594,207,786,301\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b.w4011-9688295034.88.YV4OM5&id=528536846324&rn=d3479fa8f03ae73d5cd42ce1000f9f51&abbucket=19\" style=\"margin: 0px; padding: 0px;\"/><area shape=\"rect\" coords=\"594,307,785,400\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b.w4011-9688295034.92.YV4OM5&id=528715253509&rn=d3479fa8f03ae73d5cd42ce1000f9f51&abbucket=19\" style=\"margin: 0px; padding: 0px;\"/><area shape=\"rect\" coords=\"4,407,195,500\" href=\"https://detail.tmall.com/item.htm?spm=0.0.0.0.jH4rvm&id=38277448771\" style=\"margin: 0px; padding: 0px;\"/><area shape=\"rect\" coords=\"200,406,392,500\" href=\"https://detail.tmall.com/item.htm?spm=0.0.0.0.jH4rvm&id=520812003514&skuId=3103785639934\" style=\"margin: 0px; padding: 0px;\"/><area shape=\"rect\" coords=\"399,407,589,501\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b.w4011-9688295034.121.lYhLa8&id=38472518088&rn=3ccf04414125d70bfae2ca95718e9286&abbucket=19\" style=\"margin: 0px; padding: 0px;\"/><area shape=\"rect\" coords=\"595,407,786,499\" href=\"https://gusgu.m.tmall.com/shop/shop_auction_search.htm?spm=a320p.7692363.0.0&sort=default&shop_cn=%C6%BB%B9%FB%20IPAD&ascid=972016517&scid=972016517\" style=\"margin: 0px; padding: 0px;\"/><area shape=\"rect\" coords=\"398,308,589,402\" href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b.w4011-9688295034.102.mOItkl&id=43287446224&rn=d6518aad4d77612a732d58f519ffe8d5&abbucket=19\" style=\"margin: 0px; padding: 0px;\"/></map></p></td></tr></tbody></table><p><a style=\"margin: 0px; padding: 0px; color: rgb(51, 85, 170); outline: 0px;\" name=\"hlg_list_1_16696005_end\"></a></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2024058652/TB2.aJkrVXXXXbZXpXXXXXXXXXX_!!2024058652.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2024058652/TB2PINorVXXXXbuXpXXXXXXXXXX_!!2024058652.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2024058652/TB2fLxNrVXXXXb1XXXXXXXXXXXX_!!2024058652.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2024058652/TB2dL40rVXXXXXIXXXXXXXXXXXX_!!2024058652.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2024058652/TB2r1pfrVXXXXcgXpXXXXXXXXXX_!!2024058652.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2024058652/TB2nglSrVXXXXa.XXXXXXXXXXXX_!!2024058652.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2024058652/TB22qA4rFXXXXcPXpXXXXXXXXXX_!!2024058652.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2024058652/TB2MqVyrVXXXXcoXXXXXXXXXXXX_!!2024058652.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2024058652/TB2kkNdrXXXXXXXXFXXXXXXXXXX_!!2024058652.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2024058652/TB2q3XlrVXXXXbBXpXXXXXXXXXX_!!2024058652.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/2024058652/TB28O8yrVXXXXXaXpXXXXXXXXXX_!!2024058652.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/2024058652/TB2ZgRVrVXXXXXNXXXXXXXXXXXX_!!2024058652.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2024058652/TB2yghCrVXXXXcVXXXXXXXXXXXX_!!2024058652.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_51.png','',1,0,0,0,0,0,1,0,'120','',NULL,NULL,0,7,'[{\"spec_name\":\"颜色\",\"spec_id\":8,\"value\":[{\"spec_value_name\":\"土豪金\",\"spec_name\":\"颜色\",\"spec_id\":8,\"spec_value_id\":16,\"spec_show_type\":1,\"spec_value_data\":\"\"}]}]',0.00,0.00,3,'0','0','0','0',0,1499342525,1499342525,1499408823,0,0,0,''),
	(52,'iPhone6s手机双卡双待神器ikos蓝牙苹果皮7plus双享号副卡配件',0,70,2,20,70,0,'',0,0,1,160.00,158.00,158.00,99.00,0,0,0,0,0.00,0,9000,0,0,46,0,0,0,0,0,0,0,121,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>颜色分类:&nbsp;金色 黑色</p></li><li><p>品牌:&nbsp;ikos</p></li><li><p>型号:&nbsp;ikos苹果3代</p></li><li><p>售后服务:&nbsp;店铺三包</p></li></ul><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i1/1965798713/TB2BTN8lS8mpuFjSZFMXXaxpVXa_!!1965798713.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><span style=\"color: rgb(255, 0, 0); font-size: 36px; line-height: 1.5;\">拍下279元，送高品质蓝牙无线运动耳机</span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><span style=\"font-size: 36px;\"><span style=\"color: rgb(255, 0, 0);\">限量促销！</span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><span style=\"font-size: 24px;\">IKOS苹果双卡专业品牌，保修2年，售后无忧！</span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/1965798713/TB2HA0JlUhnpuFjSZFpXXcpuXXa_!!1965798713.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\"><img src=\"https://img.alicdn.com/imgextra/i2/1965798713/TB2VOqdzCVmpuFjSZFFXXcZApXa_!!1965798713.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/1965798713/TB2YbqrzElnpuFjSZFjXXXTaVXa_!!1965798713.jpg\" align=\"absmiddle\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/1965798713/TB2VQtEf9vHfKJjSZFPXXbttpXa_!!1965798713.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"968\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/1965798713/TB2iqW5zypnpuFjSZFkXXc4ZpXa_!!1965798713.jpg\" class=\"\" align=\"absmiddle\" width=\"790\" height=\"1112\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/1965798713/TB2bU9gkC0mpuFjSZPiXXbssVXa_!!1965798713.jpg\" class=\"\" align=\"absmiddle\" width=\"790\" height=\"1139\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/1965798713/TB2cMjhiSXlpuFjy0FeXXcJbFXa_!!1965798713.jpg\" class=\"\" align=\"absmiddle\" width=\"790\" height=\"1139\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/1965798713/TB2IPmnkC8mpuFjSZFMXXaxpVXa_!!1965798713.jpg\" class=\"\" align=\"absmiddle\" width=\"790\" height=\"1139\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i3/1965798713/TB2dzaskrBmpuFjSZFAXXaQ0pXa_!!1965798713.jpg\" class=\"\" align=\"absmiddle\" width=\"790\" height=\"1139\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/1965798713/TB2H2V_kEdnpuFjSZPhXXbChpXa_!!1965798713.jpg\" class=\"\" align=\"absmiddle\" width=\"790\" height=\"1139\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_52.png','',1,0,0,0,0,0,1,0,'121,122','',NULL,NULL,0,7,'[{\"spec_name\":\"颜色\",\"spec_id\":8,\"value\":[{\"spec_value_name\":\"白色\",\"spec_name\":\"颜色\",\"spec_id\":8,\"spec_value_id\":15,\"spec_show_type\":1,\"spec_value_data\":\"\"},{\"spec_value_name\":\"土豪金\",\"spec_name\":\"颜色\",\"spec_id\":8,\"spec_value_id\":16,\"spec_show_type\":1,\"spec_value_data\":\"\"},{\"spec_value_name\":\"粉色\",\"spec_name\":\"颜色\",\"spec_id\":8,\"spec_value_id\":14,\"spec_show_type\":1,\"spec_value_data\":\"\"}]}]',0.00,0.00,3,'0','0','0','0',0,1499342657,1499342657,1499408782,0,0,0,''),
	(53,'一拖四一拖三数据线多功能伸缩三合一通用多头华为安卓苹果充电器',0,70,2,20,70,0,'',0,0,1,0.00,1000.00,1000.00,0.00,0,0,0,0,0.00,0,500,0,0,49,0,0,0,0,0,0,0,123,'','','<p class=\"attr-list-hd tm-clear\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 20px; line-height: 22px; color: rgb(153, 153, 153);\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; float: left;\">产品参数：</span></p><ul id=\"J_AttrUL\" style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>分线接头数量:&nbsp;一拖四</p></li><li><p>品牌:&nbsp;柏斯奇</p></li><li><p>长度:&nbsp;1m</p></li><li><p>颜色分类:&nbsp;A 1米蓝色&nbsp;A 1米绿色&nbsp;A 1米玫红&nbsp;A 1米橙色&nbsp;A加长版1.5米玫红&nbsp;A加长版1.5米蓝色&nbsp;A加长版1.5米绿色&nbsp;A加长版1.5米橙色&nbsp;A【伸缩】1米橙色&nbsp;A【伸缩】1米玫红&nbsp;A【伸缩】1米绿色&nbsp;A【伸缩】1米蓝色&nbsp;B带TYPE-C接口1米蓝色&nbsp;B带TYPE-C接口1米绿色&nbsp;B带TYPE-C接口1米玫红&nbsp;B带TYPE-C接口1米橙色&nbsp;B【伸缩】带TYPE-C接口1米蓝色&nbsp;B【伸缩】带TYPE-C接口1米绿色&nbsp;B【伸缩】带TYPE-C接口1米玫红&nbsp;B【伸缩】带TYPE-C接口1米橙色&nbsp;【收藏+加购物车可享受优先发货，此项勿拍】</p></li><li><p>接口类型:&nbsp;Apple 30-pin&nbsp;apple lighting&nbsp;Mini USB&nbsp;Micro USB</p></li></ul><div id=\"mall-banner\" style=\"margin: 0px; padding: 0px; color: rgb(64, 64, 64); font-family: tahoma, arial, 微软雅黑, sans-serif; font-size: 12px; line-height: 18px; white-space: normal; background-color: rgb(255, 255, 255);\"></div><p><img border=\"0\" height=\"536\" src=\"https://img.alicdn.com/imgextra/i1/2271135060/TB2TbBVkdhvOuFjSZFBXXcZgFXa_!!2271135060.jpg\" usemap=\"#Map5\" width=\"790\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/><map name=\"Map5\" style=\"margin: 0px; padding: 0px;\"><area coords=\"404,11,776,303\" href=\"https://detail.tmall.com/item.htm?spm=a220z.1000880.0.0.opAfVA&id=549167313832\" shape=\"rect\" style=\"margin: 0px; padding: 0px;\"/><area coords=\"7,316,189,521\" href=\"https://detail.tmall.com/item.htm?spm=a220z.1000880.0.0.opAfVA&id=539874977445\" shape=\"rect\" style=\"margin: 0px; padding: 0px;\"/><area coords=\"204,316,384,523\" href=\"https://detail.tmall.com/item.htm?spm=a220z.1000880.0.0.opAfVA&id=534735156860\" shape=\"rect\" style=\"margin: 0px; padding: 0px;\"/><area coords=\"401,316,584,522\" href=\"https://detail.tmall.com/item.htm?spm=a220z.1000880.0.0.opAfVA&id=536405786942\" shape=\"rect\" style=\"margin: 0px; padding: 0px;\"/><area coords=\"595,316,779,526\" href=\"https://detail.tmall.com/item.htm?spm=a220z.1000880.0.0.opAfVA&id=549592773666&skuId=3342991905915\" shape=\"rect\" style=\"margin: 0px; padding: 0px;\"/></map><img border=\"0\" height=\"478\" src=\"https://img.alicdn.com/imgextra/i1/2271135060/TB2dkkoruJ8puFjy1XbXXagqVXa_!!2271135060.jpg\" usemap=\"#Map7\" width=\"790\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top;\"/><map name=\"Map7\" style=\"margin: 0px; padding: 0px;\"><area coords=\"4,8,782,234\" href=\"https://mdetail.tmall.com/comboMeal.htm?spm=0.0.0.0.ZnN5be&comboId=250600000054010455&mainItemId=524015521317\" shape=\"rect\" style=\"margin: 0px; padding: 0px;\"/><area coords=\"10,241,775,464\" href=\"https://mdetail.tmall.com/comboMeal.htm?spm=0.0.0.0.ZnN5be&comboId=250600000053143498&mainItemId=524015521317\" shape=\"rect\" style=\"margin: 0px; padding: 0px;\"/></map></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2271135060/TB2ej3ispXXXXcFXXXXXXXXXXXX_!!2271135060.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/2271135060/TB2O0g7X.hnpuFjSZFEXXX0PFXa_!!2271135060.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/2271135060/TB2pp1EXYJkpuFjy1zcXXa5FFXa_!!2271135060.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none; line-height: 1.5;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_53.png','',1,0,0,0,0,0,1,0,'123','',NULL,NULL,0,7,'[]',0.00,0.00,3,'0','0','0','0',0,1499342792,1499342792,NULL,0,0,0,''),
	(54,'home指纹识别 苹果6s按键贴iphone7plus按键贴5s手机配件可爱卡通',0,70,2,20,70,0,'',0,0,1,33.00,29.00,29.00,12.00,0,0,0,0,0.00,0,1000,0,0,50,0,0,0,0,0,0,0,124,'','','<ul class=\"attributes-list list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>品牌:&nbsp;膜法先生</p></li><li><p>贴纸颜色:&nbsp;1号指纹贴 2号指纹贴 3号指纹贴 4号指纹贴 5号指纹贴 6号指纹贴 7号指纹贴 8号指纹贴</p></li></ul><p style=\"margin-top: 0px; margin-bottom: 0px; padding: 0px; width: 0px; height: 0px; overflow: hidden;\"><img src=\"https://img.alicdn.com/imgextra/i4/T2s4moXH8XXXXXXXXX-350475995.png?p=recommend_v2_discount_1704081415037562265_start_top_1\" style=\"border: 0px; vertical-align: top;\"/></p><table width=\"750\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\"><tbody><tr class=\"firstRow\"><td style=\"margin: 0px; padding: 0px;\">&nbsp;送礼就送健康&nbsp;</td></tr><tr><td height=\"8\" style=\"margin: 0px; padding: 0px;\"><br/></td></tr><tr><td style=\"margin: 0px; padding: 0px;\">动漫海贼王iPhone6卡通钢化膜苹果7路飞前膜6splus彩膜全屏防爆膜￥15.80已热卖&nbsp;0&nbsp;件&nbsp;可爱iphone6s plus钢化膜7P防爆膜iPhone6高清彩膜KT卡通前膜浮雕￥15.80已热卖&nbsp;0&nbsp;件&nbsp;全屏潮3D软边iphone6s手机膜可爱猫水冰月苹果7 6plus防爆钢化膜￥15.80已热卖&nbsp;0&nbsp;件&nbsp;iPhone6卡通前膜浮雕透明苹果6s钢化膜小清新7plus防爆玻璃膜可爱￥15.80已热卖&nbsp;0&nbsp;件</td></tr></tbody></table><p style=\"margin-top: 0px; padding: 0px; width: 0px; height: 0px; overflow: hidden;\"><img src=\"https://img.alicdn.com/imgextra/i4/T2s4moXH8XXXXXXXXX-350475995.png?p=recommend_v2_discount_1704081415037562265_end_top_1\" style=\"border: 0px; vertical-align: top;\"/></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\">&nbsp;</p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><span style=\"font-size: 36px;\"><strong>不影响指纹识别</strong></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><span style=\"font-size: 36px;\"><span style=\"font-family: simhei;\"><span style=\"color: rgb(224, 102, 102);\">&nbsp;&nbsp;</span></span></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><strong><span style=\"font-size: 24px;\">氧化工艺，金属环不掉色哦</span></strong></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><span style=\"font-size: 18px;\"><strong>使用出口级按键贴，选用出口日本的工厂加工，指纹识别率高！撕掉无胶水痕迹</strong></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; text-align: center;\"><strong style=\"font-size: 18px;\">适合：iPhone5s/5s/6/6s/6plus/6splus/7/7plus &nbsp; &nbsp;ipadmini3/mini4/air2/pro<img src=\"https://img.alicdn.com/imgextra/i2/2265956376/TB2_m_.qMFkpuFjSspnXXb4qFXa_!!2265956376.jpg\" class=\"\" align=\"absmiddle\" width=\"790\" height=\"499\" style=\"border: 0px; vertical-align: top; max-width: 750px;\"/></strong></p><p><img src=\"https://img.alicdn.com/imgextra/i3/2265956376/TB2eL7hmS8mpuFjSZFMXXaxpVXa_!!2265956376.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"907\" style=\"border: 0px; vertical-align: middle; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/2265956376/TB2u568mHlmpuFjSZFlXXbdQXXa_!!2265956376.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"907\" style=\"border: 0px; vertical-align: middle; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i2/2265956376/TB2YCzSmUhnpuFjSZFpXXcpuXXa_!!2265956376.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"907\" style=\"border: 0px; vertical-align: middle; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i1/2265956376/TB27gPPmItnpuFjSZFKXXalFFXa_!!2265956376.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"907\" style=\"border: 0px; vertical-align: middle; max-width: 750px;\"/><img src=\"https://img.alicdn.com/imgextra/i4/2265956376/TB2HUwmmHBmpuFjSZFAXXaQ0pXa_!!2265956376.jpg\" class=\"\" align=\"absmiddle\" width=\"750\" height=\"906\" style=\"border: 0px; vertical-align: middle; max-width: 750px;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_54.png','',1,0,0,0,0,0,1,0,'124','',NULL,NULL,0,7,'[{\"spec_name\":\"颜色\",\"spec_id\":8,\"value\":[{\"spec_value_name\":\"粉色\",\"spec_name\":\"颜色\",\"spec_id\":8,\"spec_value_id\":14,\"spec_show_type\":1,\"spec_value_data\":\"\"}]}]',0.00,0.00,3,'0','0','0','0',0,1499342886,1499342886,1499408728,0,0,0,''),
	(55,'华为p9手机壳p9Plus套硅胶磨砂硬壳puls超薄防摔全包外壳女男配件',0,70,2,20,70,0,'',0,0,1,42.00,38.88,38.88,15.00,0,0,0,0,0.00,0,6000,0,0,50,0,0,0,0,0,0,0,125,'','','<p class=\"attr-list-hd tm-clear\" style=\"margin-top: 0px; margin-bottom: 0px; padding: 5px 20px; line-height: 22px; color: rgb(153, 153, 153);\"><span style=\"margin: 0px; padding: 0px; font-weight: 700; float: left;\">产品参数：</span></p><ul id=\"J_AttrUL\" style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>保护套质地:&nbsp;塑料</p></li><li><p>款式:&nbsp;保护壳</p></li><li><p>颜色分类:&nbsp;【简约款】香槟金★P9 PLUS&nbsp;【简约款】玫瑰金★P9 PLUS&nbsp;【简约款】香槟金★P9&nbsp;【简约款】深邃蓝★P9&nbsp;【简约款】深邃蓝★P9 PLUS&nbsp;【简约款】星空黑★P9&nbsp;【岩砂款】深海蓝★P9 PLUS&nbsp;【岩砂款】墨绿色★P9&nbsp;【岩砂款】深海蓝★P9&nbsp;【岩砂款】墨绿色★P9 PLUS&nbsp;【岩砂款】石墨黑★P9 PLUS&nbsp;【简约款】玫瑰金★P9&nbsp;【岩砂款】石墨黑★P9&nbsp;【岩砂款】香槟金★P9&nbsp;【岩砂款】玫瑰金★P9&nbsp;【简约款】星空黑★P9 PLUS&nbsp;【岩砂款】香槟金★P9 PLUS&nbsp;【岩砂款】玫瑰金★P9 PLUS&nbsp;【此项勿拍】【—我只是个调皮的分割线—】【请选对应型号颜色】</p></li><li><p>风格:&nbsp;简约</p></li><li><p>适用手机机型:&nbsp;Huawei/华为</p></li><li><p>华为型号:&nbsp;P9/P9 PLUS</p></li><li><p>品牌:&nbsp;monqiqi/蒙奇奇</p></li><li><p>型号:&nbsp;华为p9手机壳p9Plus保护套标准版磨砂硅胶防摔软超薄硬壳男女</p></li></ul><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><span style=\"margin: 0px; padding: 0px;\"></span></p><p><a href=\"https://favoritemaster.shopmodule.jaeapp.com/?s=107693828&t=c&a=856357&type=sclink&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; width: 237px; height: 148px; border: none; display: block; z-index: 26; background: none;\"></a></p><p><a href=\"https://favoritemaster.shopmodule.jaeapp.com/?s=107693828&t=c&a=824919&type=sclink&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; width: 265px; height: 151px; border: none; display: block; z-index: 26; background: none;\"></a></p><p><a href=\"https://favoritemaster.shopmodule.jaeapp.com/?s=107693828&t=c&a=824935&type=sclink&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; width: 267px; height: 150px; border: none; display: block; z-index: 26; background: none;\"></a></p><p><br/></p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p><span style=\"margin: 0px; padding: 0px;\"></span></p><p><a href=\"https://detail.tmall.com/item.htm?spm=a1z10.1-b-s.w5001-15505979473.4.tA0XEl&id=527632400286&rn=e1b3340ae8d81bea191bd4f07624b463&abbucket=10&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; width: 92px; height: 32px; border: none; display: block; z-index: 26; background: none;\"></a></p><p><a href=\"https://detail.tmall.com/item.htm?spm=a1z10.5-b-s.w4011-15505979534.130.MU0gW5&id=537209279049&rn=dee374883bfb405aa3c40279573d7c9a&abbucket=14&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; width: 93px; height: 33px; border: none; display: block; z-index: 26; background: none;\"></a></p><p><a href=\"https://detail.tmall.com/item.htm?spm=a1z10.5-b-s.w4011-15505979534.120.MU0gW5&id=41717628989&rn=dee374883bfb405aa3c40279573d7c9a&abbucket=14&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; width: 94px; height: 33px; border: none; display: block; z-index: 26; background: none;\"></a></p><p><a href=\"https://detail.tmall.com/item.htm?spm=a1z10.5-b-s.w4011-15505979534.67.UTPvYT&id=535642211431&rn=1df8d80382b3179acbae378ad18ac99b&abbucket=14&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; width: 108px; height: 34px; border: none; display: block; z-index: 26; background: none;\"></a></p><p><a href=\"https://detail.tmall.com/item.htm?spm=a1z10.5-b-s.w4011-15505979534.57.UTPvYT&id=537686783463&rn=1df8d80382b3179acbae378ad18ac99b&abbucket=14&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; width: 110px; height: 32px; border: none; display: block; z-index: 26; background: none;\"></a></p><p><a href=\"https://detail.tmall.com/item.htm?spm=a1z10.5-b-s.w4011-15505979534.62.UTPvYT&id=537034300465&rn=1df8d80382b3179acbae378ad18ac99b&abbucket=14&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; width: 99px; height: 31px; border: none; display: block; z-index: 26; background: none;\"></a></p><p><a href=\"https://detail.tmall.com/item.htm?spm=a1z10.5-b-s.w4011-15505979534.87.UTPvYT&id=535476412831&rn=1df8d80382b3179acbae378ad18ac99b&abbucket=14&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; width: 104px; height: 33px; border: none; display: block; z-index: 26; background: none;\"></a></p><p><a href=\"https://detail.tmall.com/item.htm?spm=a1z10.3-b-s.w4011-15505979537.108.nFYyMJ&id=545609396967&rn=8116095d8656a10551bd1305e8619f5b&abbucket=14&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; width: 104px; height: 34px; border: none; display: block; z-index: 26; background: none;\"></a></p><p><a href=\"https://detail.tmall.com/item.htm?spm=a1z10.5-b-s.w4011-15505979534.77.UTPvYT&id=535522396440&rn=1df8d80382b3179acbae378ad18ac99b&abbucket=14&scene=taobao_shop\" target=\"_blank\" style=\"margin: 0px; padding: 0px; text-decoration: none; color: rgb(41, 83, 166); outline: 0px; width: 110px; height: 34px; border: none; display: block; z-index: 26; background: none;\"></a></p><p><br/></p><p><span style=\"margin: 0px; padding: 0px;text-decoration:line-through;\"><strong style=\"margin: 0px; padding: 0px;\"></strong></span></p><p style=\"margin-top: 1.12em; margin-bottom: 1.12em; padding: 0px; line-height: 1.4;\"><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1888429789/TB2Dp1CbrtlpuFjSspoXXbcDpXa_!!1888429789.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i4/1888429789/TB2sO9xbwNlpuFjy0FfXXX3CpXa_!!1888429789.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1888429789/TB2tHyzbrtlpuFjSspfXXXLUpXa_!!1888429789.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1888429789/TB2NTiybxXkpuFjy0FiXXbUfFXa_!!1888429789.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i1/1888429789/TB2bmSDbrXlpuFjy1zbXXb_qpXa_!!1888429789.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i3/1888429789/TB2LZaNbwxlpuFjy0FoXXa.lXXa_!!1888429789.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/><img align=\"absmiddle\" src=\"https://img.alicdn.com/imgextra/i2/1888429789/TB2ekyEbrVkpuFjSspcXXbSMVXa_!!1888429789.jpg\" class=\"img-ks-lazyload\" style=\"margin: 0px; padding: 0px; border: 0px; animation: ks-fadeIn 350ms linear 0ms 1 normal both; opacity: 1; vertical-align: top; float: none;\"/></p><p><br/></p>','upload/goods_qrcode/goods_qrcode_55.png','',1,0,0,0,0,0,1,0,'125','',NULL,NULL,0,7,'[{\"spec_name\":\"颜色\",\"spec_id\":8,\"value\":[{\"spec_value_name\":\"粉色\",\"spec_name\":\"颜色\",\"spec_id\":8,\"spec_value_id\":14,\"spec_show_type\":1,\"spec_value_data\":\"\"},{\"spec_value_name\":\"白色\",\"spec_name\":\"颜色\",\"spec_id\":8,\"spec_value_id\":15,\"spec_show_type\":1,\"spec_value_data\":\"\"}]}]',0.00,0.00,3,'','','','',0,1499342977,1499342977,1513014059,0,0,0,'');

/*!40000 ALTER TABLE `ns_goods` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_goods_attribute
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_goods_attribute`;

CREATE TABLE `ns_goods_attribute` (
  `attr_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺ID',
  `attr_value_id` int(11) NOT NULL COMMENT '属性值id',
  `attr_value` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值名称',
  `attr_value_name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值对应数据值',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`attr_id`),
  KEY `UK_ns_goods_attribute_attr_value_id` (`attr_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=315 COMMENT='商品属性表';

LOCK TABLES `ns_goods_attribute` WRITE;
/*!40000 ALTER TABLE `ns_goods_attribute` DISABLE KEYS */;

INSERT INTO `ns_goods_attribute` (`attr_id`, `goods_id`, `shop_id`, `attr_value_id`, `attr_value`, `attr_value_name`, `sort`, `create_time`)
VALUES
	(5,4,0,1,'尺码','l',0,1499333986),
	(6,4,0,1,'尺码','s',0,1499333986),
	(7,4,0,1,'尺码','均码',0,1499333986),
	(8,4,0,2,'颜色','蓝色',0,1499333986),
	(9,4,0,2,'颜色','粉色',0,1499333986),
	(10,4,0,2,'颜色','红色',0,1499333986),
	(14,6,0,1,'尺码','l',0,1499334466),
	(15,6,0,1,'尺码','s',0,1499334466),
	(16,7,0,1,'尺码','s',0,1499334666),
	(17,7,0,1,'尺码','m',0,1499334666),
	(18,7,0,2,'颜色','浅灰',0,1499334666),
	(19,8,0,1,'尺码','l',0,1499334789),
	(20,8,0,1,'尺码','s',0,1499334789),
	(21,8,0,1,'尺码','m',0,1499334789),
	(22,11,0,3,'尺码','s',0,1499335407),
	(23,11,0,3,'尺码','m',0,1499335407),
	(24,11,0,3,'尺码','l',0,1499335407),
	(25,13,0,3,'尺码','s',0,1499335733),
	(26,13,0,3,'尺码','m',0,1499335733),
	(27,13,0,3,'尺码','l',0,1499335733),
	(28,13,0,4,'颜色','花色',0,1499335733),
	(29,14,0,3,'尺码','s',0,1499335890),
	(30,14,0,3,'尺码','m',0,1499335890),
	(31,14,0,4,'颜色','白色',0,1499335890),
	(32,17,0,5,'颜色','白色',0,1499336543),
	(33,17,0,5,'颜色','黑色',0,1499336543),
	(34,20,0,5,'颜色','黑色',0,1499336895),
	(35,35,0,6,'尺寸','32寸',0,1499340221),
	(36,35,0,6,'尺寸','47寸',0,1499340221),
	(37,35,0,7,'颜色','黑色',0,1499340221),
	(38,35,0,7,'颜色','白色',0,1499340221),
	(39,36,0,6,'尺寸','32寸',0,1499340312),
	(40,36,0,7,'颜色','黑色',0,1499340312),
	(41,37,0,6,'尺寸','32寸',0,1499340425),
	(42,37,0,6,'尺寸','47寸',0,1499340425),
	(43,37,0,7,'颜色','白色',0,1499340425),
	(44,38,0,6,'尺寸','32寸',0,1499340523),
	(45,38,0,6,'尺寸','47寸',0,1499340523),
	(46,38,0,7,'颜色','黑色',0,1499340523),
	(47,38,0,7,'颜色','白色',0,1499340523),
	(48,39,0,8,'颜色','玫瑰金',0,1499340989),
	(49,39,0,8,'颜色','黑色',0,1499340989),
	(50,39,0,9,'尺寸','4.7寸',0,1499340989),
	(51,40,0,9,'尺寸','4.7寸',0,1499341088),
	(52,40,0,9,'尺寸','5.0寸',0,1499341088),
	(53,40,0,9,'尺寸','5.5寸',0,1499341088),
	(54,44,0,8,'颜色','玫瑰金',0,1499341557),
	(55,44,0,8,'颜色','黑色',0,1499341557),
	(56,44,0,9,'尺寸','4.7寸',0,1499341557),
	(57,44,0,9,'尺寸','5.0寸',0,1499341557),
	(58,47,0,10,'颜色','白色',0,1499342007),
	(59,47,0,10,'颜色','灰色',0,1499342007),
	(60,48,0,10,'颜色','白色',0,1499342080),
	(61,50,0,10,'颜色','白色',0,1499342229),
	(62,50,0,10,'颜色','灰色',0,1499342229),
	(65,53,0,11,'颜色','白色',0,1499342792),
	(66,53,0,11,'颜色','粉色',0,1499342792),
	(77,54,0,11,'颜色','白色',0,1499408728),
	(78,54,0,11,'颜色','粉色',0,1499408728),
	(79,52,0,11,'颜色','白色',0,1499408782),
	(80,52,0,11,'颜色','粉色',0,1499408782),
	(81,3,0,1,'尺码','l',0,1499409170),
	(82,3,0,1,'尺码','s',0,1499409170),
	(83,3,0,2,'颜色','蓝色',0,1499409170),
	(84,3,0,2,'颜色','粉色',0,1499409170),
	(85,5,0,1,'尺码','l',1,1513011324),
	(86,5,0,1,'尺码','s',1,1513011324),
	(87,5,0,1,'尺码','m',1,1513011324),
	(88,5,0,2,'颜色','蓝色',2,1513011324),
	(89,5,0,2,'颜色','粉色',2,1513011324),
	(90,5,0,2,'颜色','红色',2,1513011324),
	(93,55,0,11,'颜色','白色',1,1513014059),
	(94,55,0,11,'颜色','粉色',1,1513014059);

/*!40000 ALTER TABLE `ns_goods_attribute` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_goods_attribute_deleted
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_goods_attribute_deleted`;

CREATE TABLE `ns_goods_attribute_deleted` (
  `attr_id` int(10) NOT NULL,
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺ID',
  `attr_value_id` int(11) NOT NULL COMMENT '属性值id',
  `attr_value` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值名称',
  `attr_value_name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性值对应数据值',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=315 COMMENT='商品属性回收站表';

LOCK TABLES `ns_goods_attribute_deleted` WRITE;
/*!40000 ALTER TABLE `ns_goods_attribute_deleted` DISABLE KEYS */;

INSERT INTO `ns_goods_attribute_deleted` (`attr_id`, `goods_id`, `shop_id`, `attr_value_id`, `attr_value`, `attr_value_name`, `sort`, `create_time`)
VALUES
	(91,56,0,11,'颜色','白色',1,1513013828),
	(92,56,0,11,'颜色','粉色',1,1513013828);

/*!40000 ALTER TABLE `ns_goods_attribute_deleted` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_goods_attribute_value
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_goods_attribute_value`;

CREATE TABLE `ns_goods_attribute_value` (
  `attr_value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品属性值ID',
  `attr_id` int(11) NOT NULL COMMENT '商品属性ID',
  `attr_value` varchar(255) NOT NULL DEFAULT '' COMMENT '值名称',
  `is_visible` bit(1) NOT NULL DEFAULT b'1' COMMENT '是否可视',
  `sort` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT 0,
  PRIMARY KEY (`attr_value_id`),
  KEY `IDX_category_propvalues_c_pId` (`attr_id`),
  KEY `IDX_category_propvalues_orders` (`sort`),
  KEY `IDX_category_propvalues_value` (`attr_value`),
  KEY `UK_ns_goods_attribute_value_attr_value_id` (`attr_value_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1092 COMMENT='商品规格值模版表';



# Dump of table ns_goods_brand
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_goods_brand`;

CREATE TABLE `ns_goods_brand` (
  `brand_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '索引ID',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺ID',
  `brand_name` varchar(100) NOT NULL COMMENT '品牌名称',
  `brand_initial` varchar(1) NOT NULL COMMENT '品牌首字母',
  `brand_pic` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `brand_recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '推荐，0为否，1为是，默认为0',
  `sort` int(11) DEFAULT NULL,
  `brand_category_name` varchar(50) NOT NULL DEFAULT '' COMMENT '类别名称',
  `category_id_array` varchar(1000) NOT NULL DEFAULT '' COMMENT '所属分类id组',
  `brand_ads` varchar(255) NOT NULL DEFAULT '' COMMENT '品牌推荐广告',
  `category_name` varchar(50) NOT NULL DEFAULT '' COMMENT '品牌所属分类名称',
  `category_id_1` int(11) NOT NULL DEFAULT 0 COMMENT '一级分类ID',
  `category_id_2` int(11) NOT NULL DEFAULT 0 COMMENT '二级分类ID',
  `category_id_3` int(11) NOT NULL DEFAULT 0 COMMENT '三级分类ID',
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1024 COMMENT='品牌表';



# Dump of table ns_goods_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_goods_category`;

CREATE TABLE `ns_goods_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) NOT NULL DEFAULT '',
  `short_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品分类简称 ',
  `pid` int(11) NOT NULL DEFAULT 0,
  `level` tinyint(4) NOT NULL DEFAULT 0,
  `is_visible` int(11) NOT NULL DEFAULT 1 COMMENT '是否显示  1 显示 0 不显示',
  `attr_id` int(11) NOT NULL DEFAULT 0 COMMENT '关联商品类型ID',
  `attr_name` varchar(255) NOT NULL DEFAULT '' COMMENT '关联类型名称',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT '',
  `sort` int(11) DEFAULT NULL,
  `category_pic` varchar(255) NOT NULL DEFAULT '' COMMENT '商品分类图片',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=244 COMMENT='商品分类表';

LOCK TABLES `ns_goods_category` WRITE;
/*!40000 ALTER TABLE `ns_goods_category` DISABLE KEYS */;

INSERT INTO `ns_goods_category` (`category_id`, `category_name`, `short_name`, `pid`, `level`, `is_visible`, `attr_id`, `attr_name`, `keywords`, `description`, `sort`, `category_pic`)
VALUES
	(1,'家用电器','家电',0,1,1,0,'','家电','家电',1,''),
	(2,'手机/运营商/数码','通讯',0,1,1,0,'','通讯','通讯',2,''),
	(3,'电脑/办公','电脑',0,1,1,0,'','电脑','电脑',3,''),
	(4,'家居/家具/家装/厨具','家居',0,1,1,0,'','家居','家居',4,''),
	(5,'男装/女装/童装/内衣','衣服',0,1,1,0,'','衣服','衣服',5,''),
	(6,'美妆个护/宠物','美妆',0,1,1,0,'','美妆','美妆',6,''),
	(7,'女鞋/箱包/钟表/珠宝','配饰',0,1,1,0,'','配饰','配饰',7,''),
	(8,'男鞋/运动/户外','运动',0,1,1,0,'','运动','运动',8,''),
	(9,'汽车/汽车用品','汽车',0,1,1,0,'','汽车','汽车',9,''),
	(10,'母婴/玩具用品','母婴',0,1,1,0,'','母婴','母婴',10,''),
	(11,'食品/酒类/生鲜/特产','食品生鲜',0,1,1,0,'','食品生鲜','食品生鲜',11,''),
	(12,'礼品鲜花/农资绿植','礼品农资',0,1,1,0,'','礼品','礼品',12,''),
	(13,'机票/酒店/旅游/生活','旅游',0,1,1,0,'','旅游','旅游',13,''),
	(14,'电视','电视',1,2,1,0,'','电视','电视',1,''),
	(15,'空调','空调',1,2,1,0,'','空调','空调',2,''),
	(16,'洗衣机','洗衣机',1,2,1,0,'','洗衣机','洗衣机',3,''),
	(17,'手机通讯','手机',2,2,1,0,'','手机','手机',1,''),
	(18,'运营商','运营商',2,2,1,0,'','运营商','运营商',2,''),
	(20,'手机配件','手机配件',2,2,1,0,'','手机配件','手机配件',3,''),
	(21,'电脑整机','电脑整机',3,2,1,0,'','电脑整机','电脑整机',1,''),
	(22,'电脑配件','电脑配件',3,2,1,0,'','电脑配件','电脑配件',2,''),
	(23,'外设产品','外设产品',3,2,1,0,'','外设产品','外设产品',3,''),
	(24,'厨具','厨具',4,2,1,0,'','厨具','厨具',1,''),
	(25,'家纺','家纺',4,2,1,0,'','家纺','家纺',2,''),
	(26,'生活用品','生活用品',4,2,1,0,'','生活用品','生活用品',3,''),
	(27,'女装','女装',5,2,1,0,'','女装','女装',1,''),
	(28,'男装','男装',5,2,1,0,'','男装','男装',2,''),
	(29,'内衣','内衣',5,2,1,0,'','内衣','内衣',3,''),
	(30,'面部护肤','面部护肤',6,2,1,0,'','面部护肤','面部护肤',1,''),
	(31,'洗发护发','洗发护发',6,2,1,0,'','洗发护发','洗发护发',2,''),
	(32,'身体护理','身体护理',6,2,1,0,'','身体护理','身体护理',3,''),
	(33,'时尚女鞋','女鞋',7,2,1,0,'','女鞋','女鞋',1,''),
	(35,'潮流女包','女包',7,2,1,0,'','女包','女包',2,''),
	(36,'精品男包','男包',7,2,1,0,'','男包','男包',3,''),
	(37,'流行男鞋','男鞋',8,2,1,0,'','男鞋','男鞋',1,''),
	(38,'运动鞋包','鞋包',8,2,1,0,'','鞋包','鞋包',2,''),
	(39,'运动服饰','服饰',8,2,1,0,'','服饰','服饰',3,''),
	(40,'汽车车型','车型',9,2,1,0,'','车型','车型',1,''),
	(41,'汽车价格','车价',9,2,1,0,'','车价','车价',2,''),
	(42,'汽车品牌','品牌',9,2,1,0,'','品牌','品牌',3,''),
	(43,'奶粉','奶粉',10,2,1,0,'','奶粉','奶粉',1,''),
	(44,'营养辅食','营养辅食',10,2,1,0,'','营养辅食','营养辅食',2,''),
	(45,'尿裤湿巾','尿裤',10,2,1,0,'','尿裤','尿裤',3,''),
	(46,'新鲜水果','水果',11,2,1,0,'','水果','水果',1,''),
	(47,'蔬菜蛋品','蔬菜',11,2,1,0,'','蔬菜','蔬菜',2,''),
	(48,'精选蔬菜','蔬菜',11,2,1,0,'','蔬菜','蔬菜',3,''),
	(49,'礼品','礼品',12,2,1,0,'','礼品','礼品',1,''),
	(50,'绿植园艺','园艺',12,2,1,0,'','园艺','园艺',2,''),
	(51,'种子','种子',12,2,1,0,'','种子','种子',3,''),
	(52,'交通出行','交通',13,2,1,0,'','交通','交通',1,''),
	(53,'酒店预订','酒店预订',13,2,1,0,'','酒店预订','酒店预订',2,''),
	(54,'旅游度假','旅游',13,2,1,0,'','旅游','旅游',3,''),
	(55,'曲面电视','曲面电视',14,3,1,0,'','曲面电视','曲面电视',1,''),
	(56,'超薄电视','超薄电视',14,3,1,0,'','超薄电视','超薄电视',2,''),
	(57,'HDR电视','HDR电视',14,3,1,0,'','HDR电视','HDR电视',3,''),
	(58,'壁挂式空调','壁挂式',15,3,1,0,'','壁挂式','壁挂式',1,''),
	(59,'柜式空调','柜式',15,3,1,0,'','柜式','柜式',2,''),
	(60,'中央空调','中央',15,3,1,0,'','中央','中央',3,''),
	(61,'滚筒洗衣机','滚筒',16,3,1,0,'','滚筒','滚筒',1,''),
	(62,'洗烘一体机','洗烘一体机',16,3,1,0,'','洗烘一体机','洗烘一体机',3,''),
	(63,'波轮洗衣机','波轮',16,3,1,0,'','波轮','波轮',3,''),
	(64,'手机','手机',17,3,1,0,'','手机','手机',1,''),
	(65,'对讲机','对讲机',17,3,1,0,'','对讲机','对讲机',2,''),
	(66,'以旧换新','以旧换新',17,3,1,0,'','以旧换新','以旧换新',3,''),
	(67,'合约机','合约机',18,3,1,0,'','合约机','合约机',1,''),
	(68,'选号码','选号码',18,3,1,0,'','选号码','选号码',2,''),
	(69,'固定宽带','固定宽带',18,3,1,0,'','固定宽带','固定宽带',3,''),
	(70,'手机壳','手机壳',20,3,1,0,'','手机壳','手机壳',1,''),
	(71,'贴膜','贴膜',20,3,1,0,'','贴膜','贴膜',2,''),
	(72,'手机存储卡','存储卡',20,3,1,0,'','存储卡','存储卡',3,''),
	(73,'笔记本','笔记本',21,3,1,0,'','笔记本','笔记本',1,''),
	(74,'游戏本','游戏本',21,3,1,0,'','游戏本','游戏本',2,''),
	(75,'平板电脑','平板电脑',21,3,1,0,'','平板电脑','平板电脑',3,''),
	(76,'显示器','显示器',22,3,1,0,'','显示器','显示器',1,''),
	(77,'CPU','CPU',22,3,1,0,'','CPU','CPU',2,''),
	(78,'主板','主板',22,3,1,0,'','主板','主板',3,''),
	(79,'鼠标','鼠标',23,3,1,0,'','鼠标','鼠标',1,''),
	(80,'键盘','键盘',23,3,1,0,'','键盘','键盘',2,''),
	(81,'键鼠套装','键鼠套装',23,3,1,0,'','键鼠套装','键鼠套装',3,''),
	(82,'烹饪锅具','烹饪锅具',24,3,1,0,'','烹饪锅具','烹饪锅具',1,''),
	(83,'刀剪菜板','刀剪菜板',24,3,1,0,'','刀剪菜板','刀剪菜板',2,''),
	(84,'厨房配件','厨房配件',24,3,1,0,'','厨房配件','厨房配件',3,''),
	(85,'床品套件','床品套件',25,3,1,0,'','床品套件','床品套件',1,''),
	(86,'被子','被子',25,3,1,0,'','被子','被子',2,''),
	(87,'枕芯','枕芯',25,3,1,0,'','枕芯','枕芯',3,''),
	(88,'收纳用品','收纳用品',26,3,1,0,'','收纳用品','收纳用品',1,''),
	(89,'雨伞雨具','雨伞雨具',26,3,1,0,'','雨伞雨具','雨伞雨具',2,''),
	(90,'净化除味','净化除味',26,3,1,0,'','净化除味','净化除味',3,''),
	(91,'商场同款','商场同款',27,3,1,0,'','商场同款','商场同款',1,''),
	(92,'当季热卖','当季热卖',27,3,1,0,'','当季热卖','当季热卖',2,''),
	(93,'2017新品','2017新品',27,3,1,0,'','2017新品','2017新品',3,''),
	(94,'商场同款','商场同款',28,3,1,0,'','商场同款','商场同款',1,''),
	(95,'当季热卖','当季热卖',28,3,1,0,'','当季热卖','当季热卖',2,''),
	(96,'2017新品','2017新品',28,3,1,0,'','2017新品','2017新品',3,''),
	(97,'文胸','文胸',29,3,1,0,'','文胸','文胸',1,''),
	(98,'睡衣/家居服','睡衣/家居服',29,3,1,0,'','睡衣/家居服','睡衣/家居服',3,''),
	(99,'男士内裤','男士内裤',29,3,1,0,'','男士内裤','男士内裤',3,''),
	(100,'补水保湿','补水保湿',30,3,1,0,'','补水保湿','补水保湿',1,''),
	(101,'卸妆','卸妆',30,3,1,0,'','卸妆','卸妆',2,''),
	(102,'洁面','洁面',30,3,1,0,'','洁面','洁面',3,''),
	(103,'洗发','洗发',31,3,1,0,'','洗发','洗发',1,''),
	(104,'护发','护发',31,3,1,0,'','护发','护发',2,''),
	(105,'染发','染发',31,3,1,0,'','染发','染发',3,''),
	(106,'补水保湿','补水保湿',32,3,1,0,'','补水保湿','补水保湿',1,''),
	(107,'沐浴','沐浴',32,3,1,0,'','沐浴','沐浴',2,''),
	(108,'润肤','润肤',32,3,1,0,'','润肤','润肤',3,''),
	(109,'2017新品','2017新品',33,3,1,0,'','2017新品','2017新品',1,''),
	(110,'单鞋','单鞋',33,3,1,0,'','单鞋','单鞋',2,''),
	(111,'休闲鞋','休闲鞋',33,3,1,0,'','休闲鞋','休闲鞋',3,''),
	(112,'真皮包','真皮包',35,3,1,0,'','真皮包','真皮包',1,''),
	(113,'水桶包','水桶包',35,3,1,0,'','水桶包','水桶包',2,''),
	(114,'单肩包','单肩包',35,3,1,0,'','单肩包','单肩包',3,''),
	(115,'男士钱包','男士钱包',36,3,1,0,'','男士钱包','男士钱包',1,''),
	(116,'双肩包','双肩包',36,3,1,0,'','双肩包','双肩包',2,''),
	(117,'单肩/斜挎包','单肩/斜挎包',36,3,1,0,'','单肩/斜挎包','单肩/斜挎包',3,''),
	(118,'2017新品','2017新品',37,3,1,0,'','2017新品','2017新品',1,''),
	(119,'休闲鞋','休闲鞋',37,3,1,0,'','休闲鞋','休闲鞋',2,''),
	(120,'商务休闲鞋','商务休闲鞋',37,3,1,0,'','商务休闲鞋','商务休闲鞋',3,''),
	(121,'跑步鞋','跑步鞋',38,3,1,0,'','跑步鞋','跑步鞋',1,''),
	(122,'休闲鞋','休闲鞋',38,3,1,0,'','休闲鞋','休闲鞋',2,''),
	(123,'篮球鞋','篮球鞋',38,3,1,0,'','篮球鞋','篮球鞋',3,''),
	(124,'T桖','T桖',39,3,1,0,'','T桖','T桖',1,''),
	(125,'运动裤','运动裤',39,3,1,0,'','运动裤','运动裤',2,''),
	(126,'紧身衣','紧身衣',39,3,1,0,'','紧身衣','紧身衣',3,''),
	(127,'苹果','苹果',46,3,1,0,'','苹果','苹果',1,''),
	(128,'国产水果','国产水果',46,3,1,0,'','国产水果','国产水果',2,''),
	(129,'进口水果','进口水果',46,3,1,0,'','进口水果','进口水果',3,''),
	(130,'智能家居','智能家居',1,2,1,0,'','智能家居','智能家居',4,''),
	(131,'家居智能','家居智能',130,3,1,0,'','家居智能','家居智能',1,'');

/*!40000 ALTER TABLE `ns_goods_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_goods_category_block
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_goods_category_block`;

CREATE TABLE `ns_goods_category_block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '实例id',
  `category_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `category_id` int(11) NOT NULL DEFAULT 0 COMMENT '分类id',
  `category_alias` varchar(50) NOT NULL DEFAULT '' COMMENT '分类别名',
  `color` varchar(255) DEFAULT '#FFFFFF' COMMENT '颜色',
  `is_show` int(11) NOT NULL DEFAULT 1 COMMENT '是否显示 1显示 0 不显示',
  `is_show_lower_category` int(11) NOT NULL DEFAULT 0 COMMENT '是否显示下级分类',
  `is_show_brand` int(11) NOT NULL DEFAULT 0 COMMENT '是否显示品牌',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `ad_picture` varchar(255) NOT NULL DEFAULT '' COMMENT '广告图  {["title":"","subtitle":"","picture":"","url":"","background":""]}',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `modify_time` int(11) NOT NULL DEFAULT 0 COMMENT '修改时间',
  `short_name` varchar(255) DEFAULT '' COMMENT '分类简称',
  `goods_sort_type` int(11) NOT NULL DEFAULT 0 COMMENT '楼层商品排序方式 0默认按时间和排序号倒叙 1按发布时间排序 2按销量排序 3按排序号排序 4按人气排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='商品分类楼层表';

LOCK TABLES `ns_goods_category_block` WRITE;
/*!40000 ALTER TABLE `ns_goods_category_block` DISABLE KEYS */;

INSERT INTO `ns_goods_category_block` (`id`, `shop_id`, `category_name`, `category_id`, `category_alias`, `color`, `is_show`, `is_show_lower_category`, `is_show_brand`, `sort`, `ad_picture`, `create_time`, `modify_time`, `short_name`, `goods_sort_type`)
VALUES
	(3,0,'家用电器',1,'家用电器','#FFFFFF',1,0,0,0,'',0,0,'',0),
	(4,0,'手机/运营商/数码',2,'手机/运营商/数码','#FFFFFF',1,0,0,0,'',0,0,'',0),
	(5,0,'电脑/办公',3,'电脑/办公','#FFFFFF',1,0,0,0,'',0,0,'',0),
	(6,0,'家居/家具/家装/厨具',4,'家居/家具/家装/厨具','#FFFFFF',1,0,0,0,'',0,0,'',0),
	(7,0,'男装/女装/童装/内衣',5,'男装/女装/童装/内衣','#FFFFFF',1,0,0,0,'',0,0,'',0),
	(8,0,'美妆个护/宠物',6,'美妆个护/宠物','#FFFFFF',1,0,0,0,'',0,0,'',0),
	(9,0,'女鞋/箱包/钟表/珠宝',7,'女鞋/箱包/钟表/珠宝','#FFFFFF',1,0,0,0,'',0,0,'',0),
	(10,0,'男鞋/运动/户外',8,'男鞋/运动/户外','#FFFFFF',1,0,0,0,'',0,0,'',0),
	(11,0,'汽车/汽车用品',9,'汽车/汽车用品','#FFFFFF',1,0,0,0,'',0,0,'',0),
	(12,0,'母婴/玩具用品',10,'母婴/玩具用品','#FFFFFF',1,0,0,0,'',0,0,'',0),
	(13,0,'食品/酒类/生鲜/特产',11,'食品/酒类/生鲜/特产','#FFFFFF',1,0,0,0,'',0,0,'',0),
	(14,0,'礼品鲜花/农资绿植',12,'礼品鲜花/农资绿植','#FFFFFF',1,0,0,0,'',0,0,'',0),
	(15,0,'机票/酒店/旅游/生活',13,'机票/酒店/旅游/生活','#FFFFFF',1,0,0,0,'',0,0,'',0);

/*!40000 ALTER TABLE `ns_goods_category_block` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_goods_comment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_goods_comment`;

CREATE TABLE `ns_goods_comment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `create_time` int(11) DEFAULT 0 COMMENT '评论创建时间',
  `status` int(11) NOT NULL DEFAULT 0 COMMENT '评论状态 0未评论 1已评论',
  `number` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '数量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='商品评论送积分记录表';



# Dump of table ns_goods_deleted
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_goods_deleted`;

CREATE TABLE `ns_goods_deleted` (
  `goods_id` int(10) NOT NULL DEFAULT 0 COMMENT '商品id(SKU)',
  `goods_name` varchar(100) NOT NULL DEFAULT '' COMMENT '商品名称',
  `shop_id` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '店铺id',
  `category_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '商品分类id',
  `category_id_1` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '一级分类id',
  `category_id_2` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '二级分类id',
  `category_id_3` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '三级分类id',
  `brand_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '品牌id',
  `group_id_array` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分类id 首尾用,隔开',
  `promotion_type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '促销类型 0无促销，1团购，2限时折扣',
  `promote_id` int(11) NOT NULL DEFAULT 0 COMMENT '促销活动ID',
  `goods_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '实物或虚拟商品标志 1实物商品 0 虚拟商品 2 F码商品',
  `market_price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '市场价',
  `price` decimal(19,2) NOT NULL DEFAULT 0.00 COMMENT '商品原价格',
  `promotion_price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '商品促销价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT 0.00 COMMENT '成本价',
  `point_exchange_type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '积分兑换类型 0 非积分兑换 1 只能积分兑换 ',
  `point_exchange` int(11) NOT NULL DEFAULT 0 COMMENT '积分兑换',
  `give_point` int(11) NOT NULL DEFAULT 0 COMMENT '购买商品赠送积分',
  `is_member_discount` int(1) NOT NULL DEFAULT 0 COMMENT '参与会员折扣',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '运费 0为免运费',
  `shipping_fee_id` int(11) NOT NULL DEFAULT 0 COMMENT '售卖区域id 物流模板id  ns_order_shipping_fee 表id',
  `stock` int(10) NOT NULL DEFAULT 0 COMMENT '商品库存',
  `max_buy` int(11) NOT NULL DEFAULT 0 COMMENT '限购 0 不限购',
  `clicks` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '商品点击数量',
  `min_stock_alarm` int(11) NOT NULL DEFAULT 0 COMMENT '库存预警值',
  `sales` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '销售数量',
  `collects` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '收藏数量',
  `star` tinyint(3) unsigned NOT NULL DEFAULT 5 COMMENT '好评星级',
  `evaluates` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '评价数',
  `shares` int(11) NOT NULL DEFAULT 0 COMMENT '分享数',
  `province_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '一级地区id',
  `city_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '二级地区id',
  `picture` int(11) NOT NULL DEFAULT 0 COMMENT '商品主图',
  `keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '商品关键词',
  `introduction` varchar(255) NOT NULL DEFAULT '' COMMENT '商品简介，促销语',
  `description` text NOT NULL COMMENT '商品详情',
  `QRcode` varchar(255) NOT NULL DEFAULT '' COMMENT '商品二维码',
  `code` varchar(50) NOT NULL DEFAULT '' COMMENT '商家编号',
  `is_stock_visible` int(1) NOT NULL DEFAULT 0 COMMENT '页面不显示库存',
  `is_hot` int(1) NOT NULL DEFAULT 0 COMMENT '是否热销商品',
  `is_recommend` int(1) NOT NULL DEFAULT 0 COMMENT '是否推荐',
  `is_new` int(1) NOT NULL DEFAULT 0 COMMENT '是否新品',
  `is_pre_sale` int(1) NOT NULL DEFAULT 0 COMMENT '是否预售',
  `is_bill` int(1) NOT NULL DEFAULT 0 COMMENT '是否开具增值税发票 1是，0否',
  `state` tinyint(3) NOT NULL DEFAULT 1 COMMENT '商品状态 0下架，1正常，10违规（禁售）',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `img_id_array` varchar(1000) DEFAULT NULL COMMENT '商品图片序列',
  `sku_img_array` varchar(1000) DEFAULT NULL COMMENT '商品sku应用图片列表  属性,属性值，图片ID',
  `match_point` float(10,2) DEFAULT NULL COMMENT '实物与描述相符（根据评价计算）',
  `match_ratio` float(10,2) DEFAULT NULL COMMENT '实物与描述相符（根据评价计算）百分比',
  `real_sales` int(10) NOT NULL DEFAULT 0 COMMENT '实际销量',
  `goods_attribute_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品类型',
  `goods_spec_format` text NOT NULL COMMENT '商品规格',
  `goods_weight` decimal(8,2) NOT NULL DEFAULT 0.00 COMMENT '商品重量',
  `goods_volume` decimal(8,2) NOT NULL DEFAULT 0.00 COMMENT '商品体积',
  `shipping_fee_type` int(11) NOT NULL DEFAULT 1 COMMENT '计价方式1.重量2.体积3.计件',
  `extend_category_id` varchar(255) DEFAULT NULL,
  `extend_category_id_1` varchar(255) DEFAULT NULL,
  `extend_category_id_2` varchar(255) DEFAULT NULL,
  `extend_category_id_3` varchar(255) DEFAULT NULL,
  `supplier_id` int(11) NOT NULL DEFAULT 0 COMMENT '供货商id',
  `sale_date` int(11) DEFAULT 0 COMMENT '上下架时间',
  `create_time` int(11) DEFAULT 0 COMMENT '商品添加时间',
  `update_time` int(11) DEFAULT 0 COMMENT '商品编辑时间',
  `min_buy` int(11) NOT NULL DEFAULT 0 COMMENT '最少买几件',
  `virtual_goods_type_id` int(11) DEFAULT 0 COMMENT '虚拟商品类型id',
  `production_date` int(11) NOT NULL DEFAULT 0 COMMENT '生产日期',
  `shelf_life` varchar(50) NOT NULL DEFAULT '' COMMENT '保质期'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='商品回收站表';



# Dump of table ns_goods_evaluate
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_goods_evaluate`;

CREATE TABLE `ns_goods_evaluate` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评价ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `order_no` bigint(20) unsigned NOT NULL COMMENT '订单编号',
  `order_goods_id` int(11) NOT NULL COMMENT '订单项ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(100) NOT NULL COMMENT '商品名称',
  `goods_price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '商品价格',
  `goods_image` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `shop_name` varchar(100) NOT NULL COMMENT '店铺名称',
  `content` varchar(255) NOT NULL DEFAULT '' COMMENT '评价内容',
  `image` varchar(1000) NOT NULL DEFAULT '' COMMENT '评价图片',
  `explain_first` varchar(255) NOT NULL DEFAULT '' COMMENT '解释内容',
  `member_name` varchar(100) NOT NULL DEFAULT '' COMMENT '评价人名称',
  `uid` int(11) NOT NULL COMMENT '评价人编号',
  `is_anonymous` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0表示不是 1表示是匿名评价',
  `scores` tinyint(1) NOT NULL COMMENT '1-5分',
  `again_content` varchar(255) NOT NULL DEFAULT '' COMMENT '追加评价内容',
  `again_image` varchar(1000) NOT NULL DEFAULT '' COMMENT '追评评价图片',
  `again_explain` varchar(255) NOT NULL DEFAULT '' COMMENT '追加解释内容',
  `explain_type` int(11) DEFAULT 0 COMMENT '1好评2中评3差评',
  `is_show` int(1) DEFAULT 1 COMMENT '1显示 0隐藏',
  `addtime` int(11) DEFAULT 0 COMMENT '评价时间',
  `again_addtime` int(11) DEFAULT 0 COMMENT '追加评价时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 COMMENT='商品评价表';



# Dump of table ns_goods_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_goods_group`;

CREATE TABLE `ns_goods_group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '上级id 最多2级',
  `level` tinyint(4) NOT NULL DEFAULT 0 COMMENT '级别',
  `is_visible` int(1) NOT NULL DEFAULT 1 COMMENT '是否可视',
  `group_pic` varchar(100) NOT NULL DEFAULT '' COMMENT '图片',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=160 COMMENT='商品本店分类';



# Dump of table ns_goods_sku
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_goods_sku`;

CREATE TABLE `ns_goods_sku` (
  `sku_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表序号',
  `goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品编号',
  `sku_name` varchar(500) NOT NULL DEFAULT '' COMMENT 'SKU名称',
  `attr_value_items` varchar(255) NOT NULL DEFAULT '' COMMENT '属性和属性值 id串 attribute + attribute value 表ID分号分隔',
  `attr_value_items_format` varchar(500) NOT NULL DEFAULT '' COMMENT '属性和属性值id串组合json格式',
  `market_price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '市场价',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '价格',
  `promote_price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '促销价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT 0.00 COMMENT '成本价',
  `stock` int(11) NOT NULL DEFAULT 0 COMMENT '库存',
  `picture` int(11) NOT NULL DEFAULT 0 COMMENT '如果是第一个sku编码, 可以加图片',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '商家编码',
  `QRcode` varchar(255) NOT NULL DEFAULT '' COMMENT '商品二维码',
  `create_date` int(11) DEFAULT 0 COMMENT '创建时间',
  `update_date` int(11) DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=481 COMMENT='商品skui规格价格库存信息表';

LOCK TABLES `ns_goods_sku` WRITE;
/*!40000 ALTER TABLE `ns_goods_sku` DISABLE KEYS */;

INSERT INTO `ns_goods_sku` (`sku_id`, `goods_id`, `sku_name`, `attr_value_items`, `attr_value_items_format`, `market_price`, `price`, `promote_price`, `cost_price`, `stock`, `picture`, `code`, `QRcode`, `create_date`, `update_date`)
VALUES
	(4,4,'','','',0.00,399.00,399.00,0.00,1000,0,'','',1499333986,NULL),
	(6,6,'','','',0.00,188.00,188.00,0.00,1000,0,'','',1499334466,NULL),
	(7,7,'','','',0.00,178.00,178.00,0.00,1000,0,'','',1499334666,NULL),
	(8,8,'','','',0.00,188.00,188.00,0.00,1000,0,'','',1499334789,NULL),
	(9,9,'','','',0.00,986.00,986.00,0.00,1110,0,'','',1499335006,NULL),
	(10,10,'','','',0.00,198.00,198.00,0.00,1400,0,'','',1499335206,NULL),
	(11,11,'','','',0.00,188.00,188.00,0.00,1000,0,'','',1499335407,NULL),
	(12,12,'','','',0.00,158.00,158.00,0.00,500,0,'','',1499335532,NULL),
	(13,13,'','','',0.00,200.00,200.00,0.00,995,0,'','',1499335733,NULL),
	(14,14,'','','',0.00,141.00,141.00,0.00,500,0,'','',1499335890,NULL),
	(15,15,'','','',0.00,399.00,399.00,0.00,300,0,'','',1499336232,NULL),
	(16,16,'','','',0.00,888.00,888.00,0.00,500,0,'','',1499336321,NULL),
	(17,17,'','','',0.00,354.00,354.00,0.00,500,0,'','',1499336542,NULL),
	(18,18,'','','',0.00,588.00,588.00,0.00,900,0,'','',1499336676,NULL),
	(19,19,'','','',0.00,178.00,178.00,0.00,500,0,'','',1499336753,NULL),
	(20,20,'','','',0.00,500.00,500.00,0.00,991,0,'','',1499336895,NULL),
	(21,21,'','','',0.00,510.00,510.00,0.00,100,0,'','',1499337154,NULL),
	(22,22,'','','',0.00,999.00,999.00,0.00,1000,0,'','',1499337367,NULL),
	(23,23,'','','',0.00,179.00,179.00,0.00,500,0,'','',1499337512,NULL),
	(24,24,'','','',0.00,299.00,299.00,0.00,1000,0,'','',1499337621,NULL),
	(25,25,'','','',0.00,209.00,209.00,0.00,1000,0,'','',1499337720,NULL),
	(26,26,'','','',0.00,349.00,349.00,0.00,2000,0,'','',1499337832,NULL),
	(27,27,'','','',0.00,929.00,929.00,0.00,2000,0,'','',1499338186,1499338346),
	(28,28,'','','',0.00,1388.00,1388.00,0.00,1000,0,'','',1499338521,1499339165),
	(29,29,'','','',0.00,396.00,396.00,0.00,1000,0,'','',1499339297,NULL),
	(30,30,'','','',0.00,180.00,180.00,0.00,500,0,'','',1499339446,NULL),
	(31,31,'','','',0.00,388.00,388.00,0.00,500,0,'','',1499339585,NULL),
	(32,32,'','','',0.00,397.00,397.00,0.00,500,0,'','',1499339673,NULL),
	(33,33,'','','',0.00,1399.00,1399.00,0.00,2000,0,'','',1499339876,NULL),
	(34,34,'','','',0.00,3787.00,3787.00,0.00,2000,0,'','',1499340078,NULL),
	(35,35,'','','',0.00,4200.00,4200.00,0.00,2000,0,'','',1499340221,NULL),
	(36,36,'','','',0.00,2396.00,2396.00,0.00,1500,0,'','',1499340312,NULL),
	(37,37,'','','',0.00,3496.00,3496.00,0.00,200,0,'','',1499340425,NULL),
	(38,38,'','','',0.00,2600.00,2600.00,0.00,1200,0,'','',1499340523,NULL),
	(39,39,'','','',0.00,4498.00,4498.00,0.00,2000,0,'','',1499340989,NULL),
	(40,40,'','','',0.00,2688.00,2688.00,0.00,5000,0,'','',1499341088,NULL),
	(43,43,'','','',0.00,1288.00,1288.00,0.00,1000,0,'','',1499341351,NULL),
	(44,44,'','','',0.00,1258.00,1258.00,0.00,1000,0,'','',1499341557,NULL),
	(45,45,'','','',0.00,4588.00,4588.00,0.00,2000,0,'','',1499341792,NULL),
	(46,46,'','','',0.00,5888.00,5888.00,0.00,3000,0,'','',1499341866,NULL),
	(47,47,'','','',0.00,4500.00,4500.00,0.00,2000,0,'','',1499342007,NULL),
	(48,48,'','','',0.00,4266.00,4266.00,0.00,2200,0,'','',1499342080,NULL),
	(49,49,'','','',0.00,5600.00,5600.00,0.00,2000,0,'','',1499342154,NULL),
	(50,50,'','','',0.00,5300.00,5300.00,0.00,1500,0,'','',1499342229,NULL),
	(53,53,'','','',0.00,1000.00,1000.00,0.00,500,0,'','',1499342792,NULL),
	(59,42,'4.5寸 ','6:8','6:8',1300.00,1268.00,1268.00,655.00,3000,0,'','',1499408255,NULL),
	(60,42,'4.7寸 ','6:9','6:9',1300.00,1268.00,1268.00,655.00,3000,0,'','',1499408255,NULL),
	(61,42,'5.0寸 ','6:10','6:10',1300.00,1268.00,1268.00,655.00,3000,0,'','',1499408255,NULL),
	(62,41,'黑色 ','7:12','7:12',1800.00,1699.00,1699.00,1000.00,3000,0,'','',1499408574,NULL),
	(63,41,'玫瑰金 ','7:11','7:11',1800.00,1699.00,1699.00,1000.00,3000,0,'','',1499408574,NULL),
	(64,41,'土豪金 ','7:13','7:13',1800.00,1699.00,1699.00,1000.00,3000,0,'','',1499408574,NULL),
	(65,55,'粉色 ','8:14','8:14',42.00,38.88,38.88,15.00,3000,0,'','',1499408644,1513014059),
	(66,55,'白色 ','8:15','8:15',42.00,38.88,38.88,15.00,3000,0,'','',1499408644,1513014059),
	(69,54,'粉色 ','8:14','8:14',33.00,29.00,29.00,12.00,1000,0,'','',1499408728,NULL),
	(70,52,'白色 ','8:15','8:15',160.00,158.00,158.00,99.00,3000,0,'','',1499408782,NULL),
	(71,52,'土豪金 ','8:16','8:16',160.00,158.00,158.00,99.00,3000,0,'','',1499408782,NULL),
	(72,52,'粉色 ','8:14','8:14',160.00,158.00,158.00,99.00,3000,0,'','',1499408782,NULL),
	(73,51,'土豪金 ','8:16','8:16',16.00,15.00,15.00,5.00,3000,0,'','',1499408823,NULL),
	(74,3,'l 白色 ','10:18;11:25','10:18;11:25',198.00,169.00,169.00,100.00,5000,0,'','',1499409169,NULL),
	(75,3,'l 红色 ','10:18;11:24','10:18;11:24',198.00,169.00,169.00,100.00,5000,0,'','',1499409169,NULL),
	(76,3,'l 粉色 ','10:18;11:23','10:18;11:23',198.00,169.00,169.00,100.00,5000,0,'','',1499409169,NULL),
	(77,3,'m 白色 ','10:19;11:25','10:19;11:25',198.00,169.00,169.00,100.00,5000,0,'','',1499409169,NULL),
	(78,3,'m 红色 ','10:19;11:24','10:19;11:24',198.00,169.00,169.00,100.00,5000,0,'','',1499409169,NULL),
	(79,3,'m 粉色 ','10:19;11:23','10:19;11:23',198.00,169.00,169.00,100.00,5000,0,'','',1499409169,NULL),
	(80,3,'s 白色 ','10:20;11:25','10:20;11:25',198.00,169.00,169.00,100.00,5000,0,'','',1499409169,NULL),
	(81,3,'s 红色 ','10:20;11:24','10:20;11:24',198.00,169.00,169.00,100.00,5000,0,'','',1499409169,NULL),
	(82,3,'s 粉色 ','10:20;11:23','10:20;11:23',198.00,169.00,169.00,100.00,5000,0,'','',1499409169,NULL),
	(83,3,'xl 白色 ','10:21;11:25','10:21;11:25',198.00,169.00,169.00,100.00,5000,0,'','',1499409169,NULL),
	(84,3,'xl 红色 ','10:21;11:24','10:21;11:24',198.00,169.00,169.00,100.00,5000,0,'','',1499409170,NULL),
	(85,3,'xl 粉色 ','10:21;11:23','10:21;11:23',198.00,169.00,169.00,100.00,5000,0,'','',1499409170,NULL),
	(86,3,'2xl 白色 ','10:22;11:25','10:22;11:25',198.00,169.00,169.00,100.00,5000,0,'','',1499409170,NULL),
	(87,3,'2xl 红色 ','10:22;11:24','10:22;11:24',198.00,169.00,169.00,100.00,5000,0,'','',1499409170,NULL),
	(88,3,'2xl 粉色 ','10:22;11:23','10:22;11:23',198.00,169.00,169.00,100.00,5000,0,'','',1499409170,NULL),
	(89,5,'l 粉色 ','10:18;11:23','10:18;11:23',300.00,200.00,200.00,23.00,12,0,'','',1513011324,0),
	(90,5,'m 粉色 ','10:19;11:23','10:19;11:23',500.00,300.00,300.00,12.00,78,0,'','',1513011324,0),
	(91,5,'xl 粉色 ','10:21;11:23','10:21;11:23',800.00,500.00,500.00,13.00,78,0,'','',1513011324,0);

/*!40000 ALTER TABLE `ns_goods_sku` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_goods_sku_deleted
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_goods_sku_deleted`;

CREATE TABLE `ns_goods_sku_deleted` (
  `sku_id` int(11) NOT NULL DEFAULT 0 COMMENT '表序号',
  `goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品编号',
  `sku_name` varchar(500) NOT NULL DEFAULT '' COMMENT 'SKU名称',
  `attr_value_items` varchar(255) NOT NULL DEFAULT '' COMMENT '属性和属性值 id串 attribute + attribute value 表ID分号分隔',
  `attr_value_items_format` varchar(500) NOT NULL DEFAULT '' COMMENT '属性和属性值id串组合json格式',
  `market_price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '市场价',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '价格',
  `promote_price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '促销价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT 0.00 COMMENT '成本价',
  `stock` int(11) NOT NULL DEFAULT 0 COMMENT '库存',
  `picture` int(11) NOT NULL DEFAULT 0 COMMENT '如果是第一个sku编码, 可以加图片',
  `code` varchar(255) NOT NULL DEFAULT '' COMMENT '商家编码',
  `QRcode` varchar(255) NOT NULL DEFAULT '' COMMENT '商品二维码',
  `create_date` int(11) DEFAULT 0 COMMENT '创建时间',
  `update_date` int(11) DEFAULT 0 COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638 COMMENT='商品skui规格价格库存信息回收站表';



# Dump of table ns_goods_sku_picture
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_goods_sku_picture`;

CREATE TABLE `ns_goods_sku_picture` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品id',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `spec_id` int(11) NOT NULL DEFAULT 0 COMMENT '主规格id',
  `spec_value_id` int(11) NOT NULL DEFAULT 0 COMMENT '规格值id',
  `sku_img_array` varchar(1000) NOT NULL DEFAULT '' COMMENT '图片id 多个用逗号隔开',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  `modify_time` int(11) DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品sku多图';



# Dump of table ns_goods_sku_picture_delete
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_goods_sku_picture_delete`;

CREATE TABLE `ns_goods_sku_picture_delete` (
  `id` int(11) NOT NULL,
  `goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品id',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `spec_id` int(11) NOT NULL DEFAULT 0 COMMENT '主规格id',
  `spec_value_id` int(11) NOT NULL DEFAULT 0 COMMENT '规格值id',
  `sku_img_array` varchar(1000) NOT NULL DEFAULT '' COMMENT '图片id 多个用逗号隔开',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  `modify_time` int(11) DEFAULT 0 COMMENT '修改时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='商品sku多图';



# Dump of table ns_goods_spec
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_goods_spec`;

CREATE TABLE `ns_goods_spec` (
  `spec_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '属性ID',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺ID',
  `spec_name` varchar(255) NOT NULL DEFAULT '' COMMENT '属性名称',
  `is_visible` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否可视',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `show_type` int(11) NOT NULL DEFAULT 1 COMMENT '展示方式 1 文字 2 颜色 3 图片',
  `create_time` int(11) DEFAULT 0 COMMENT '创建日期',
  `is_screen` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否参与筛选 0 不参与 1 参与',
  PRIMARY KEY (`spec_id`),
  KEY `IDX_category_props_categoryId` (`shop_id`),
  KEY `IDX_category_props_orders` (`sort`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=3276 COMMENT='商品属性（规格）表';

LOCK TABLES `ns_goods_spec` WRITE;
/*!40000 ALTER TABLE `ns_goods_spec` DISABLE KEYS */;

INSERT INTO `ns_goods_spec` (`spec_id`, `shop_id`, `spec_name`, `is_visible`, `sort`, `show_type`, `create_time`, `is_screen`)
VALUES
	(6,0,'手机尺寸',1,1,1,1499408200,1),
	(7,0,'颜色',1,2,1,1499408509,1),
	(8,0,'颜色',1,3,1,1499408602,1),
	(10,0,'尺码',1,5,1,1499409048,1),
	(11,0,'衣服颜色',1,6,1,1499409094,1);

/*!40000 ALTER TABLE `ns_goods_spec` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_goods_spec_value
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_goods_spec_value`;

CREATE TABLE `ns_goods_spec_value` (
  `spec_value_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品属性值ID',
  `spec_id` int(11) NOT NULL COMMENT '商品属性ID',
  `spec_value_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品属性值名称',
  `spec_value_data` varchar(255) NOT NULL DEFAULT '' COMMENT '商品属性值数据',
  `is_visible` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否可视',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(11) DEFAULT 0,
  PRIMARY KEY (`spec_value_id`),
  KEY `IDX_category_propvalues_c_pId` (`spec_id`),
  KEY `IDX_category_propvalues_orders` (`sort`),
  KEY `IDX_category_propvalues_value` (`spec_value_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1092 COMMENT='商品规格值模版表';

LOCK TABLES `ns_goods_spec_value` WRITE;
/*!40000 ALTER TABLE `ns_goods_spec_value` DISABLE KEYS */;

INSERT INTO `ns_goods_spec_value` (`spec_value_id`, `spec_id`, `spec_value_name`, `spec_value_data`, `is_visible`, `sort`, `create_time`)
VALUES
	(8,6,'4.5寸','',1,0,1499408208),
	(9,6,'4.7寸','',1,0,1499408213),
	(10,6,'5.0寸','',1,0,1499408219),
	(11,7,'玫瑰金','',1,0,1499408522),
	(12,7,'黑色','',1,0,1499408526),
	(13,7,'土豪金','',1,0,1499408532),
	(14,8,'粉色','',1,0,1499408609),
	(15,8,'白色','',1,0,1499408614),
	(16,8,'土豪金','',1,0,1499408751),
	(18,10,'l','',1,0,1499409054),
	(19,10,'m','',1,0,1499409057),
	(20,10,'s','',1,0,1499409060),
	(21,10,'xl','',1,0,1499409063),
	(22,10,'2xl','',1,0,1499409068),
	(23,11,'粉色','',1,0,1499409118),
	(24,11,'红色','',1,0,1499409126),
	(25,11,'白色','',1,0,1499409135);

/*!40000 ALTER TABLE `ns_goods_spec_value` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_member
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_member`;

CREATE TABLE `ns_member` (
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `member_name` varchar(50) NOT NULL DEFAULT '' COMMENT '前台用户名',
  `member_level` int(11) NOT NULL DEFAULT 0 COMMENT '会员等级',
  `memo` varchar(1000) DEFAULT NULL COMMENT '备注',
  `reg_time` int(11) DEFAULT 0 COMMENT '注册时间',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=147 COMMENT='前台用户表';

LOCK TABLES `ns_member` WRITE;
/*!40000 ALTER TABLE `ns_member` DISABLE KEYS */;

INSERT INTO `ns_member` (`uid`, `member_name`, `member_level`, `memo`, `reg_time`)
VALUES
	(2,'admin',47,'',1500346817),
	(3,'admin',47,'',2017);

/*!40000 ALTER TABLE `ns_member` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_member_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_member_account`;

CREATE TABLE `ns_member_account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '会员uid',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `point` int(11) NOT NULL DEFAULT 0 COMMENT '会员积分',
  `balance` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '余额',
  `coin` int(11) NOT NULL DEFAULT 0 COMMENT '购物币',
  `member_cunsum` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '会员消费',
  `member_sum_point` int(11) NOT NULL DEFAULT 0 COMMENT '会员累计积分',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=3276 COMMENT='会员账户统计表';



# Dump of table ns_member_account_records
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_member_account_records`;

CREATE TABLE `ns_member_account_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '用户ID',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺ID',
  `account_type` int(11) NOT NULL DEFAULT 1 COMMENT '账户类型1.积分2.余额3.购物币',
  `sign` smallint(6) NOT NULL DEFAULT 1 COMMENT '正负号',
  `number` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '数量',
  `from_type` smallint(6) NOT NULL DEFAULT 0 COMMENT '产生方式1.商城订单2.订单退还3.兑换4.充值5.签到6.分享7.注册8.提现9提现退还',
  `data_id` int(11) NOT NULL DEFAULT 0 COMMENT '相关表的数据ID',
  `text` varchar(255) NOT NULL DEFAULT '' COMMENT '数据相关内容描述文本',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=108 COMMENT='会员流水账表';



# Dump of table ns_member_balance_withdraw
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_member_balance_withdraw`;

CREATE TABLE `ns_member_balance_withdraw` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '店铺编号',
  `withdraw_no` varchar(255) NOT NULL DEFAULT '' COMMENT '提现流水号',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `bank_name` varchar(50) NOT NULL COMMENT '提现银行名称',
  `account_number` varchar(50) NOT NULL COMMENT '提现银行账号',
  `realname` varchar(10) NOT NULL COMMENT '提现账户姓名',
  `mobile` varchar(20) NOT NULL COMMENT '手机',
  `cash` decimal(10,2) NOT NULL COMMENT '提现金额',
  `status` smallint(6) NOT NULL DEFAULT 0 COMMENT '当前状态 0已申请(等待处理) 1已同意 -1 已拒绝',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `ask_for_date` int(11) DEFAULT 0 COMMENT '提现日期',
  `payment_date` int(11) DEFAULT 0 COMMENT '到账日期',
  `modify_date` int(11) DEFAULT 0 COMMENT '修改日期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='会员余额提现记录表';



# Dump of table ns_member_bank_account
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_member_bank_account`;

CREATE TABLE `ns_member_bank_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '会员id',
  `bank_type` varchar(50) NOT NULL DEFAULT '1' COMMENT '账号类型 1银行卡2支付宝',
  `branch_bank_name` varchar(50) DEFAULT NULL COMMENT '支行信息',
  `realname` varchar(50) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `account_number` varchar(50) NOT NULL DEFAULT '' COMMENT '银行账号',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `is_default` int(11) NOT NULL DEFAULT 0 COMMENT '是否默认账号',
  `create_date` int(11) DEFAULT 0 COMMENT '创建日期',
  `modify_date` int(11) DEFAULT 0 COMMENT '修改日期',
  PRIMARY KEY (`id`),
  KEY `IDX_member_bank_account_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='会员提现账号';



# Dump of table ns_member_express_address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_member_express_address`;

CREATE TABLE `ns_member_express_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '会员基本资料表ID',
  `consigner` varchar(255) NOT NULL DEFAULT '' COMMENT '收件人',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机',
  `phone` varchar(20) NOT NULL DEFAULT '' COMMENT '固定电话',
  `province` int(11) NOT NULL DEFAULT 0 COMMENT '省',
  `city` int(11) NOT NULL DEFAULT 0 COMMENT '市',
  `district` int(11) NOT NULL DEFAULT 0 COMMENT '区县',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `zip_code` varchar(6) NOT NULL DEFAULT '' COMMENT '邮编',
  `alias` varchar(50) NOT NULL DEFAULT '' COMMENT '地址别名',
  `is_default` int(11) NOT NULL DEFAULT 0 COMMENT '默认收货地址',
  PRIMARY KEY (`id`),
  KEY `IDX_member_express_address_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='会员收货地址管理';



# Dump of table ns_member_favorites
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_member_favorites`;

CREATE TABLE `ns_member_favorites` (
  `log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `uid` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '会员ID',
  `fav_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '商品或店铺ID',
  `fav_type` varchar(20) NOT NULL DEFAULT 'goods' COMMENT '类型:goods为商品,shop为店铺,默认为商品',
  `shop_id` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '店铺ID',
  `shop_name` varchar(20) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `shop_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺logo',
  `goods_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_image` varchar(300) DEFAULT NULL,
  `log_price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '商品收藏时价格',
  `log_msg` varchar(1000) NOT NULL DEFAULT '' COMMENT '收藏备注',
  `fav_time` int(11) DEFAULT 0 COMMENT '收藏时间',
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='收藏表';



# Dump of table ns_member_gift
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_member_gift`;

CREATE TABLE `ns_member_gift` (
  `gift_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL COMMENT '会员ID',
  `promotion_gift_id` int(11) NOT NULL COMMENT '赠品活动ID',
  `goods_id` int(11) NOT NULL COMMENT '赠品ID',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '赠品名称',
  `goods_picture` int(11) NOT NULL DEFAULT 0 COMMENT '赠品图片',
  `num` int(11) NOT NULL DEFAULT 1 COMMENT '赠品数量',
  `get_type` int(11) NOT NULL DEFAULT 1 COMMENT '获取方式',
  `get_type_id` int(11) NOT NULL COMMENT '获取方式对应ID',
  `desc` text NOT NULL COMMENT '说明',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`gift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='会员赠品表';



# Dump of table ns_member_level
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_member_level`;

CREATE TABLE `ns_member_level` (
  `level_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '等级ID',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺ID',
  `level_name` varchar(50) NOT NULL DEFAULT '' COMMENT '等级名称',
  `min_integral` int(11) NOT NULL DEFAULT 0 COMMENT '累计积分',
  `goods_discount` decimal(3,2) NOT NULL DEFAULT 1.00 COMMENT '折扣率',
  `desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '等级描述',
  `is_default` int(11) NOT NULL DEFAULT 0 COMMENT '是否是默认',
  `quota` int(11) NOT NULL DEFAULT 0 COMMENT '消费额度',
  `upgrade` int(11) NOT NULL COMMENT '升级条件  1.累计积分 2.消费额度 3.同时满足',
  `relation` int(11) NOT NULL DEFAULT 1 COMMENT '1.或 2. 且',
  PRIMARY KEY (`level_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='会员等级';

LOCK TABLES `ns_member_level` WRITE;
/*!40000 ALTER TABLE `ns_member_level` DISABLE KEYS */;

INSERT INTO `ns_member_level` (`level_id`, `shop_id`, `level_name`, `min_integral`, `goods_discount`, `desc`, `is_default`, `quota`, `upgrade`, `relation`)
VALUES
	(47,0,'普通会员',0,1.00,'',1,0,0,2);

/*!40000 ALTER TABLE `ns_member_level` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_member_recharge
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_member_recharge`;

CREATE TABLE `ns_member_recharge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `recharge_money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '支付金额',
  `uid` varchar(255) NOT NULL COMMENT '用户uid',
  `out_trade_no` varchar(255) NOT NULL DEFAULT '' COMMENT '支付流水号',
  `create_time` varchar(255) NOT NULL DEFAULT '0' COMMENT '创建时间',
  `is_pay` varchar(255) NOT NULL DEFAULT '0' COMMENT '是否支付',
  `status` varchar(255) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='会员充值余额记录';



# Dump of table ns_notice
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_notice`;

CREATE TABLE `ns_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告id',
  `notice_title` varchar(255) NOT NULL DEFAULT '' COMMENT '标题',
  `notice_content` text NOT NULL COMMENT '公告内容',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `modify_time` int(11) NOT NULL DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺公告表';



# Dump of table ns_offpay_area
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_offpay_area`;

CREATE TABLE `ns_offpay_area` (
  `shop_id` int(11) DEFAULT NULL COMMENT '店铺Id',
  `province_id` text DEFAULT NULL COMMENT '省Id组合',
  `city_id` text DEFAULT NULL COMMENT '市Id组合',
  `district_id` text DEFAULT NULL COMMENT '县Id组合'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='货到付款支持地区表';



# Dump of table ns_order
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_order`;

CREATE TABLE `ns_order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_no` varchar(255) DEFAULT '' COMMENT '订单编号',
  `out_trade_no` varchar(100) NOT NULL DEFAULT '0' COMMENT '外部交易号',
  `order_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '订单类型',
  `payment_type` tinyint(4) NOT NULL DEFAULT 0 COMMENT '支付类型。取值范围：\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nWEIXIN (微信自有支付)\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nWEIXIN_DAIXIAO (微信代销支付)\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nALIPAY (支付宝支付)',
  `shipping_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '订单配送方式',
  `order_from` varchar(255) NOT NULL DEFAULT '' COMMENT '订单来源',
  `buyer_id` int(11) NOT NULL COMMENT '买家id',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '买家会员名称',
  `buyer_ip` varchar(20) NOT NULL DEFAULT '' COMMENT '买家ip',
  `buyer_message` varchar(255) NOT NULL DEFAULT '' COMMENT '买家附言',
  `buyer_invoice` varchar(255) NOT NULL DEFAULT '' COMMENT '买家发票信息',
  `receiver_mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '收货人的手机号码',
  `receiver_province` int(11) NOT NULL COMMENT '收货人所在省',
  `receiver_city` int(11) NOT NULL COMMENT '收货人所在城市',
  `receiver_district` int(11) NOT NULL COMMENT '收货人所在街道',
  `receiver_address` varchar(255) NOT NULL DEFAULT '' COMMENT '收货人详细地址',
  `receiver_zip` varchar(6) NOT NULL DEFAULT '' COMMENT '收货人邮编',
  `receiver_name` varchar(50) NOT NULL DEFAULT '' COMMENT '收货人姓名',
  `shop_id` int(11) NOT NULL COMMENT '卖家店铺id',
  `shop_name` varchar(100) NOT NULL DEFAULT '' COMMENT '卖家店铺名称',
  `seller_star` tinyint(4) NOT NULL DEFAULT 0 COMMENT '卖家对订单的标注星标',
  `seller_memo` varchar(255) NOT NULL DEFAULT '' COMMENT '卖家对订单的备注',
  `consign_time_adjust` int(11) NOT NULL DEFAULT 0 COMMENT '卖家延迟发货时间',
  `goods_money` decimal(19,2) NOT NULL COMMENT '商品总价',
  `order_money` decimal(10,2) NOT NULL COMMENT '订单总价',
  `point` int(11) NOT NULL COMMENT '订单消耗积分',
  `point_money` decimal(10,2) NOT NULL COMMENT '订单消耗积分抵多少钱',
  `coupon_money` decimal(10,2) NOT NULL COMMENT '订单代金券支付金额',
  `coupon_id` int(11) NOT NULL COMMENT '订单代金券id',
  `user_money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '订单余额支付金额',
  `user_platform_money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '用户平台余额支付',
  `promotion_money` decimal(10,2) NOT NULL COMMENT '订单优惠活动金额',
  `shipping_money` decimal(10,2) NOT NULL COMMENT '订单运费',
  `pay_money` decimal(10,2) NOT NULL COMMENT '订单实付金额',
  `refund_money` decimal(10,2) NOT NULL COMMENT '订单退款金额',
  `coin_money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '购物币金额',
  `give_point` int(11) NOT NULL COMMENT '订单赠送积分',
  `give_coin` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '订单成功之后返购物币',
  `order_status` tinyint(4) NOT NULL COMMENT '订单状态',
  `pay_status` tinyint(4) NOT NULL COMMENT '订单付款状态',
  `shipping_status` tinyint(4) NOT NULL COMMENT '订单配送状态',
  `review_status` tinyint(4) NOT NULL COMMENT '订单评价状态',
  `feedback_status` tinyint(4) NOT NULL COMMENT '订单维权状态',
  `is_evaluate` smallint(6) NOT NULL DEFAULT 0 COMMENT '是否评价 0为未评价 1为已评价 2为已追评',
  `tax_money` decimal(10,2) NOT NULL DEFAULT 0.00,
  `shipping_company_id` int(11) NOT NULL DEFAULT 0 COMMENT '配送物流公司ID',
  `give_point_type` int(11) NOT NULL DEFAULT 1 COMMENT '积分返还类型 1 订单完成  2 订单收货 3  支付订单',
  `pay_time` int(11) DEFAULT 0 COMMENT '订单付款时间',
  `shipping_time` int(11) DEFAULT 0 COMMENT '买家要求配送时间',
  `sign_time` int(11) DEFAULT 0 COMMENT '买家签收时间',
  `consign_time` int(11) DEFAULT 0 COMMENT '卖家发货时间',
  `create_time` int(11) DEFAULT 0 COMMENT '订单创建时间',
  `finish_time` int(11) DEFAULT 0 COMMENT '订单完成时间',
  `is_deleted` int(1) NOT NULL DEFAULT 0 COMMENT '订单是否已删除',
  `operator_type` int(1) NOT NULL DEFAULT 0 COMMENT '操作人类型  1店铺  2用户',
  `operator_id` int(11) NOT NULL DEFAULT 0 COMMENT '操作人id',
  `refund_balance_money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '订单退款余额',
  `fixed_telephone` varchar(50) NOT NULL DEFAULT '' COMMENT '固定电话',
  PRIMARY KEY (`order_id`),
  KEY `UK_ns_order_buyer_id` (`buyer_id`),
  KEY `UK_ns_order_order_no` (`order_no`),
  KEY `UK_ns_order_pay_status` (`pay_status`),
  KEY `UK_ns_order_status` (`order_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=440 COMMENT='订单表';



# Dump of table ns_order_action
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_order_action`;

CREATE TABLE `ns_order_action` (
  `action_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '动作id',
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `action` varchar(255) NOT NULL DEFAULT '' COMMENT '动作内容',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '操作人id',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '操作人',
  `order_status` int(11) NOT NULL COMMENT '订单大状态',
  `order_status_text` varchar(255) NOT NULL DEFAULT '' COMMENT '订单状态名称',
  `action_time` int(11) DEFAULT 0 COMMENT '操作时间',
  PRIMARY KEY (`action_id`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1706 COMMENT='订单操作表';



# Dump of table ns_order_goods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_order_goods`;

CREATE TABLE `ns_order_goods` (
  `order_goods_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '订单项ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `sku_id` int(11) NOT NULL COMMENT 'skuID',
  `sku_name` varchar(50) NOT NULL COMMENT 'sku名称',
  `price` decimal(19,2) NOT NULL DEFAULT 0.00 COMMENT '商品价格',
  `cost_price` decimal(19,2) NOT NULL DEFAULT 0.00 COMMENT '商品成本价',
  `num` varchar(255) NOT NULL DEFAULT '0' COMMENT '购买数量',
  `adjust_money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '调整金额',
  `goods_money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '商品总价',
  `goods_picture` int(11) NOT NULL DEFAULT 0 COMMENT '商品图片',
  `shop_id` int(11) NOT NULL DEFAULT 1 COMMENT '店铺ID',
  `buyer_id` int(11) NOT NULL DEFAULT 0 COMMENT '购买人ID',
  `point_exchange_type` int(11) NOT NULL DEFAULT 0 COMMENT '积分兑换类型0.非积分兑换1.积分兑换',
  `goods_type` varchar(255) NOT NULL DEFAULT '1' COMMENT '商品类型',
  `promotion_id` int(11) NOT NULL DEFAULT 0 COMMENT '促销ID',
  `promotion_type_id` int(11) NOT NULL DEFAULT 0 COMMENT '促销类型',
  `order_type` int(11) NOT NULL DEFAULT 1 COMMENT '订单类型',
  `order_status` int(11) NOT NULL DEFAULT 0 COMMENT '订单状态',
  `give_point` int(11) NOT NULL DEFAULT 0 COMMENT '积分数量',
  `shipping_status` int(11) NOT NULL DEFAULT 0 COMMENT '物流状态',
  `refund_type` int(11) NOT NULL DEFAULT 1 COMMENT '退款方式',
  `refund_require_money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '退款金额',
  `refund_reason` varchar(255) NOT NULL DEFAULT '' COMMENT '退款原因',
  `refund_shipping_code` varchar(255) NOT NULL DEFAULT '' COMMENT '退款物流单号',
  `refund_shipping_company` varchar(255) NOT NULL DEFAULT '0' COMMENT '退款物流公司名称',
  `refund_real_money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '实际退款金额',
  `refund_status` int(1) NOT NULL DEFAULT 0 COMMENT '退款状态',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `is_evaluate` smallint(6) NOT NULL DEFAULT 0 COMMENT '是否评价 0为未评价 1为已评价 2为已追评',
  `refund_time` int(11) DEFAULT 0 COMMENT '退款时间',
  `refund_balance_money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '订单退款余额',
  `tmp_express_company` varchar(255) NOT NULL DEFAULT '' COMMENT '批量打印时添加的临时物流公司',
  `tmp_express_company_id` int(11) NOT NULL DEFAULT 0 COMMENT '批量打印时添加的临时物流公司id',
  `tmp_express_no` varchar(50) NOT NULL DEFAULT '' COMMENT '批量打印时添加的临时订单编号',
  PRIMARY KEY (`order_goods_id`),
  KEY `UK_ns_order_goods_buyer_id` (`buyer_id`),
  KEY `UK_ns_order_goods_goods_id` (`goods_id`),
  KEY `UK_ns_order_goods_order_id` (`order_id`),
  KEY `UK_ns_order_goods_promotion_id` (`promotion_id`),
  KEY `UK_ns_order_goods_sku_id` (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=289 COMMENT='订单商品表';

LOCK TABLES `ns_order_goods` WRITE;
/*!40000 ALTER TABLE `ns_order_goods` DISABLE KEYS */;

INSERT INTO `ns_order_goods` (`order_goods_id`, `order_id`, `goods_id`, `goods_name`, `sku_id`, `sku_name`, `price`, `cost_price`, `num`, `adjust_money`, `goods_money`, `goods_picture`, `shop_id`, `buyer_id`, `point_exchange_type`, `goods_type`, `promotion_id`, `promotion_type_id`, `order_type`, `order_status`, `give_point`, `shipping_status`, `refund_type`, `refund_require_money`, `refund_reason`, `refund_shipping_code`, `refund_shipping_company`, `refund_real_money`, `refund_status`, `memo`, `is_evaluate`, `refund_time`, `refund_balance_money`, `tmp_express_company`, `tmp_express_company_id`, `tmp_express_no`)
VALUES
	(1,1,14,'夏装清爽字母印花纯棉青少年圆领短袖t恤男韩版修身男士体恤打底T',14,'',141.00,0.00,'3',0.00,423.00,44,0,5,0,'1',0,0,1,0,0,0,1,0.00,'','','0',0.00,0,'',0,0,0.00,'',0,''),
	(2,1,5,'定制韩版宽松蝙蝠袖中长款套头卫衣胸前系带连衣裙',91,'xl 粉色 ',500.00,13.00,'4',0.00,2000.00,17,0,5,0,'1',0,0,1,0,0,0,1,0.00,'','','0',0.00,0,'',0,0,0.00,'',0,''),
	(3,1,56,'钻石金属 闪钻镶卡通指环扣懒人防摔折叠粘贴式手机配件支架批发',68,'粉色 ',42.00,20.00,'2',0.00,84.00,126,0,5,0,'1',0,0,1,0,0,0,1,0.00,'','','0',0.00,0,'',0,0,0.00,'',0,''),
	(4,2,56,'钻石金属 闪钻镶卡通指环扣懒人防摔折叠粘贴式手机配件支架批发',68,'粉色 ',42.00,20.00,'1',0.00,42.00,126,0,5,0,'1',0,0,1,0,0,0,1,0.00,'','','0',0.00,0,'',0,0,0.00,'',0,'');

/*!40000 ALTER TABLE `ns_order_goods` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_order_goods_express
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_order_goods_express`;

CREATE TABLE `ns_order_goods_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单id',
  `order_goods_id_array` varchar(255) NOT NULL COMMENT '订单项商品组合列表',
  `express_name` varchar(50) NOT NULL DEFAULT '' COMMENT '包裹名称  （包裹- 1 包裹 - 2）',
  `shipping_type` tinyint(4) NOT NULL COMMENT '发货方式1 需要物流 0无需物流',
  `express_company_id` int(11) NOT NULL COMMENT '快递公司id',
  `express_company` varchar(255) NOT NULL DEFAULT '' COMMENT '物流公司名称',
  `express_no` varchar(50) NOT NULL COMMENT '运单编号',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `memo` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `shipping_time` int(11) DEFAULT 0 COMMENT '发货时间',
  PRIMARY KEY (`id`),
  KEY `UK_ns_order_goods_express_order_goods_id_array` (`order_goods_id_array`),
  KEY `UK_ns_order_goods_express_order_id` (`order_id`),
  KEY `UK_ns_order_goods_express_uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=606 COMMENT='商品订单物流信息表（多次发货）';



# Dump of table ns_order_goods_promotion_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_order_goods_promotion_details`;

CREATE TABLE `ns_order_goods_promotion_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `sku_id` int(11) NOT NULL COMMENT '商品skuid',
  `promotion_type` varbinary(255) NOT NULL COMMENT '优惠类型规则ID（满减对应规则）',
  `promotion_id` int(11) NOT NULL COMMENT '优惠ID',
  `discount_money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '优惠的金额，单位：元，精确到小数点后两位',
  `used_time` int(11) DEFAULT 0 COMMENT '使用时间',
  PRIMARY KEY (`id`),
  KEY `IDX_ns_order_goods_promotion_d_order_id` (`order_id`),
  KEY `IDX_ns_order_goods_promotion_d_promotion_id` (`promotion_id`),
  KEY `IDX_ns_order_goods_promotion_d_promotion_type` (`promotion_type`),
  KEY `IDX_ns_order_goods_promotion_d_sku_id` (`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='订单商品优惠详情';



# Dump of table ns_order_payment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_order_payment`;

CREATE TABLE `ns_order_payment` (
  `out_trade_no` varchar(30) NOT NULL COMMENT '支付单编号',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '执行支付的相关店铺ID（0平台）',
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '订单类型1.商城订单2.交易商支付',
  `type_alis_id` int(11) NOT NULL DEFAULT 0 COMMENT '订单类型关联ID',
  `pay_body` varchar(255) NOT NULL DEFAULT '' COMMENT '订单支付简介',
  `pay_detail` varchar(1000) NOT NULL DEFAULT '' COMMENT '订单支付详情',
  `pay_money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '支付金额',
  `pay_status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '支付状态',
  `pay_type` int(11) NOT NULL DEFAULT 1 COMMENT '支付方式',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  `pay_time` int(11) DEFAULT 0 COMMENT '支付时间',
  `trade_no` varchar(30) NOT NULL DEFAULT '' COMMENT '交易号，支付宝退款用，微信传入空',
  KEY `IDX_ns_order_payment_out_trade_no` (`out_trade_no`),
  KEY `IDX_ns_order_payment_pay_status` (`pay_status`),
  KEY `IDX_ns_order_payment_pay_type` (`pay_type`),
  KEY `IDX_ns_order_payment_shop_id` (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=963 COMMENT='订单支付表';



# Dump of table ns_order_pickup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_order_pickup`;

CREATE TABLE `ns_order_pickup` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `order_id` int(10) NOT NULL DEFAULT 0 COMMENT '订单ID',
  `name` varchar(255) NOT NULL COMMENT '自提点名称',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '自提点地址',
  `contact` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '联系电话',
  `city_id` int(11) NOT NULL COMMENT '市ID',
  `province_id` int(11) NOT NULL COMMENT '省ID',
  `district_id` int(11) NOT NULL COMMENT '区县ID',
  `supplier_id` int(11) NOT NULL DEFAULT 0 COMMENT '供应门店ID',
  `longitude` varchar(255) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(255) NOT NULL DEFAULT '' COMMENT '维度',
  `buyer_name` varchar(50) NOT NULL DEFAULT '' COMMENT '提货人姓名',
  `buyer_mobile` varchar(255) NOT NULL DEFAULT '' COMMENT '提货人电话',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '提货备注信息',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='订单自提点管理';



# Dump of table ns_order_promotion_details
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_order_promotion_details`;

CREATE TABLE `ns_order_promotion_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `promotion_type_id` int(11) NOT NULL COMMENT '优惠类型规则ID（满减对应规则）',
  `promotion_id` int(11) NOT NULL COMMENT '优惠ID',
  `promotion_type` varchar(255) NOT NULL COMMENT '优惠类型',
  `promotion_name` varchar(50) NOT NULL COMMENT '该优惠活动的名称',
  `promotion_condition` varchar(255) NOT NULL DEFAULT '' COMMENT '优惠使用条件说明',
  `discount_money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '优惠的金额，单位：元，精确到小数点后两位',
  `used_time` int(11) DEFAULT 0 COMMENT '使用时间',
  PRIMARY KEY (`id`),
  KEY `UK_ns_order_promotion_details_order_id` (`order_id`),
  KEY `UK_ns_order_promotion_details_promotion_id` (`promotion_id`),
  KEY `UK_ns_order_promotion_details_promotion_type` (`promotion_type`),
  KEY `UK_ns_order_promotion_details_promotion_type_id` (`promotion_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=364 COMMENT='订单优惠详情';



# Dump of table ns_order_refund
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_order_refund`;

CREATE TABLE `ns_order_refund` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_goods_id` int(11) NOT NULL COMMENT '订单商品表id',
  `refund_status` varchar(255) NOT NULL COMMENT '操作状态\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n流程状态(refund_status)	状态名称(refund_status_name)	操作时间\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n1	买家申请	发起了退款申请,等待卖家处理\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n2	等待买家退货	卖家已同意退款申请,等待买家退货\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n3	等待卖家确认收货	买家已退货,等待卖家确认收货\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n4	等待卖家确认退款	卖家同意退款\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n0	退款已成功	卖家退款给买家，本次维权结束\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n-1	退款已拒绝	卖家拒绝本次退款，本次维权结束\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n-2	退款已关闭	主动撤销退款，退款关闭\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n-3	退款申请不通过	拒绝了本次退款申请,等待买家修改\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n',
  `action` varchar(255) NOT NULL COMMENT '退款操作内容描述',
  `action_way` tinyint(4) NOT NULL DEFAULT 0 COMMENT '操作方 1 买家 2 卖家',
  `action_userid` varchar(255) NOT NULL DEFAULT '0' COMMENT '操作人id',
  `action_username` varchar(255) NOT NULL DEFAULT '' COMMENT '操作人姓名',
  `action_time` int(11) DEFAULT 0 COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=108 COMMENT='订单商品退货退款操作表';



# Dump of table ns_order_refund_account_records
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_order_refund_account_records`;

CREATE TABLE `ns_order_refund_account_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `order_goods_id` int(11) NOT NULL COMMENT '订单项id',
  `refund_trade_no` varchar(55) NOT NULL COMMENT '退款交易号',
  `refund_money` decimal(10,2) NOT NULL COMMENT '退款金额',
  `refund_way` int(11) NOT NULL COMMENT '退款方式（1：微信，2：支付宝，10：线下）',
  `buyer_id` int(11) NOT NULL COMMENT '买家id',
  `refund_time` int(11) NOT NULL COMMENT '退款时间',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单退款账户记录';



# Dump of table ns_order_shipping_fee
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_order_shipping_fee`;

CREATE TABLE `ns_order_shipping_fee` (
  `shipping_fee_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '运费模板ID',
  `shipping_fee_name` varchar(30) NOT NULL DEFAULT '' COMMENT '运费模板名称',
  `is_default` int(11) NOT NULL DEFAULT 0 COMMENT '是否是默认模板',
  `co_id` int(11) NOT NULL DEFAULT 0 COMMENT '物流公司ID',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `province_id_array` text NOT NULL COMMENT '省ID组',
  `city_id_array` text NOT NULL COMMENT '市ID组',
  `weight_is_use` int(11) NOT NULL DEFAULT 1 COMMENT '是否启用重量运费',
  `weight_snum` decimal(8,2) NOT NULL DEFAULT 1.00 COMMENT '首重',
  `weight_sprice` decimal(8,2) NOT NULL DEFAULT 0.00 COMMENT '首重运费',
  `weight_xnum` decimal(8,2) NOT NULL DEFAULT 1.00 COMMENT '续重',
  `weight_xprice` decimal(8,2) NOT NULL DEFAULT 0.00 COMMENT '续重运费',
  `volume_is_use` int(11) NOT NULL DEFAULT 1 COMMENT '是否启用体积计算运费',
  `volume_snum` decimal(8,2) NOT NULL DEFAULT 1.00 COMMENT '首体积量',
  `volume_sprice` decimal(8,2) NOT NULL DEFAULT 0.00 COMMENT '首体积运费',
  `volume_xnum` decimal(8,2) NOT NULL DEFAULT 0.00 COMMENT '续体积量',
  `volume_xprice` decimal(8,2) NOT NULL DEFAULT 0.00 COMMENT '续体积运费',
  `bynum_is_use` int(11) NOT NULL DEFAULT 1 COMMENT '是否启用计件方式运费',
  `bynum_snum` int(11) NOT NULL DEFAULT 0 COMMENT '首件',
  `bynum_sprice` decimal(8,2) NOT NULL DEFAULT 0.00 COMMENT '首件运费',
  `bynum_xnum` int(11) NOT NULL DEFAULT 1 COMMENT '续件',
  `bynum_xprice` decimal(8,2) NOT NULL DEFAULT 0.00 COMMENT '续件运费',
  `create_time` int(11) DEFAULT 0 COMMENT '创建日期',
  `update_time` int(11) DEFAULT 0 COMMENT '最后更新时间',
  `district_id_array` text DEFAULT NULL COMMENT '区县ID组',
  PRIMARY KEY (`shipping_fee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='运费模板';

LOCK TABLES `ns_order_shipping_fee` WRITE;
/*!40000 ALTER TABLE `ns_order_shipping_fee` DISABLE KEYS */;

INSERT INTO `ns_order_shipping_fee` (`shipping_fee_id`, `shipping_fee_name`, `is_default`, `co_id`, `shop_id`, `province_id_array`, `city_id_array`, `weight_is_use`, `weight_snum`, `weight_sprice`, `weight_xnum`, `weight_xprice`, `volume_is_use`, `volume_snum`, `volume_sprice`, `volume_xnum`, `volume_xprice`, `bynum_is_use`, `bynum_snum`, `bynum_sprice`, `bynum_xnum`, `bynum_xprice`, `create_time`, `update_time`, `district_id_array`)
VALUES
	(1,'001',1,1,0,'','',1,0.00,0.00,0.00,0.00,1,0.00,0.00,0.00,0.00,1,0,0.00,0,0.00,1513013930,0,'');

/*!40000 ALTER TABLE `ns_order_shipping_fee` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_order_shop_return
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_order_shop_return`;

CREATE TABLE `ns_order_shop_return` (
  `shop_id` int(11) NOT NULL,
  `shop_address` varchar(255) NOT NULL DEFAULT '' COMMENT '商家地址',
  `seller_name` varchar(50) NOT NULL DEFAULT '' COMMENT '收件人',
  `seller_mobile` varchar(30) NOT NULL DEFAULT '' COMMENT '收件人手机号',
  `seller_zipcode` varchar(20) NOT NULL DEFAULT '' COMMENT '邮编',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  `modify_time` int(11) DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='店铺退货设置';

LOCK TABLES `ns_order_shop_return` WRITE;
/*!40000 ALTER TABLE `ns_order_shop_return` DISABLE KEYS */;

INSERT INTO `ns_order_shop_return` (`shop_id`, `shop_address`, `seller_name`, `seller_mobile`, `seller_zipcode`, `create_time`, `modify_time`)
VALUES
	(0,'','','','',1511151413,0);

/*!40000 ALTER TABLE `ns_order_shop_return` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_pickup_point
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_pickup_point`;

CREATE TABLE `ns_pickup_point` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺ID',
  `name` varchar(255) NOT NULL COMMENT '自提点名称',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '自提点地址',
  `contact` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人',
  `phone` varchar(255) NOT NULL DEFAULT '' COMMENT '联系电话',
  `city_id` int(11) NOT NULL COMMENT '市ID',
  `province_id` int(11) NOT NULL COMMENT '省ID',
  `district_id` int(11) NOT NULL COMMENT '区县ID',
  `supplier_id` int(11) NOT NULL DEFAULT 0 COMMENT '供应门店ID',
  `longitude` varchar(255) NOT NULL DEFAULT '' COMMENT '经度',
  `latitude` varchar(255) NOT NULL DEFAULT '' COMMENT '维度',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='自提点管理';



# Dump of table ns_platform_adv
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_platform_adv`;

CREATE TABLE `ns_platform_adv` (
  `adv_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告自增标识编号',
  `ap_id` mediumint(8) unsigned NOT NULL COMMENT '广告位id',
  `adv_title` varchar(255) NOT NULL DEFAULT '' COMMENT '广告内容描述',
  `adv_url` text DEFAULT NULL,
  `adv_image` varchar(1000) NOT NULL DEFAULT '' COMMENT '广告内容图片',
  `slide_sort` int(11) DEFAULT NULL,
  `click_num` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '广告点击率',
  `background` varchar(255) NOT NULL DEFAULT '#FFFFFF' COMMENT '背景色',
  `adv_code` text NOT NULL COMMENT '广告代码',
  PRIMARY KEY (`adv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170 COMMENT='广告表';

LOCK TABLES `ns_platform_adv` WRITE;
/*!40000 ALTER TABLE `ns_platform_adv` DISABLE KEYS */;

INSERT INTO `ns_platform_adv` (`adv_id`, `ap_id`, `adv_title`, `adv_url`, `adv_image`, `slide_sort`, `click_num`, `background`, `adv_code`)
VALUES
	(948,1054,'广告栏一图片1','javascript:;','upload/advertising/1497067960.png',0,0,'#ffffff',''),
	(949,1054,'广告栏一图片2','javascript:;','upload/advertising/1497068146.png',1,0,'#ffffff',''),
	(950,1054,'广告栏一图片3','javascript:;','upload/advertising/1497068172.png',2,0,'#ffffff',''),
	(951,1054,'广告栏一图片4','javascript:;','upload/advertising/1497085006.png',3,0,'#ffffff',''),
	(958,1058,'推荐楼层1楼——轮播图1','#','upload/advertising/1497069144.png',0,0,'#ffffff',''),
	(959,1058,'推荐楼层1楼——轮播图2','#','upload/advertising/1497069159.png',1,0,'#ffffff',''),
	(960,1058,'推荐楼层1楼——轮播图3','#','upload/advertising/1497069175.png',2,0,'#ffffff',''),
	(961,1059,'推荐楼层1楼——多图1','#','upload/advertising/1497069290.png',0,0,'#ffffff',''),
	(962,1059,'推荐楼层1楼——多图2','#','upload/advertising/1497069302.png',1,0,'#ffffff',''),
	(963,1059,'推荐楼层1楼——多图3','#','upload/advertising/1497069321.png',2,0,'#ffffff',''),
	(964,1059,'推荐楼层1楼——多图4','#','upload/advertising/1497069393.png',3,0,'#ffffff',''),
	(965,1059,'推荐楼层1楼——多图5','#','upload/advertising/1497069408.png',4,0,'#ffffff',''),
	(967,1060,'推荐楼层2楼——单图广告图','#','upload/advertising/1497069441.png',0,0,'#ffffff',''),
	(968,1063,'推荐楼层3楼——单图广告图','#','upload/advertising/1497069606.png',0,0,'#ffffff',''),
	(970,1064,'推荐楼层4楼——单图广告图','#','upload/advertising/1497069629.png',0,0,'#ffffff',''),
	(976,1061,'推荐楼层2楼——轮播图1','#','upload/advertising/1497069460.png',1,0,'#ffffff',''),
	(977,1061,'推荐楼层2楼——轮播图2','#','upload/advertising/1497069501.png',2,0,'#ffffff',''),
	(978,1061,'推荐楼层2楼——轮播图3','#','upload/advertising/1497069514.png',3,0,'#ffffff',''),
	(982,1068,'推荐楼层4楼——轮播图1','#','upload/advertising/1497069758.png',0,0,'#ffffff',''),
	(983,1068,'推荐楼层4楼——轮播图2','#','upload/advertising/1497069771.png',1,0,'#ffffff',''),
	(984,1068,'推荐楼层4楼——轮播图3','#','upload/advertising/1497069786.png',2,0,'#ffffff',''),
	(991,1062,'推荐楼层2楼——多图1','#','upload/advertising/1497069535.png',0,0,'#ffffff',''),
	(992,1062,'推荐楼层2楼——多图2','#','upload/advertising/1497069549.png',1,0,'#ffffff',''),
	(993,1062,'推荐楼层2楼——多图3','#','upload/advertising/1497069561.png',2,0,'#ffffff',''),
	(994,1062,'推荐楼层2楼——多图4','#','upload/advertising/1497069575.png',3,0,'#ffffff',''),
	(995,1062,'推荐楼层2楼——多图5','#','upload/advertising/1497069587.png',4,0,'#ffffff',''),
	(996,1071,'推荐楼层3楼——多图1','#','upload/advertising/1497069893.png',0,0,'#ffffff',''),
	(997,1071,'推荐楼层3楼——多图2','#','upload/advertising/1497069906.png',1,0,'#ffffff',''),
	(998,1071,'推荐楼层3楼——多图3','#','upload/advertising/1497069923.png',2,0,'#ffffff',''),
	(999,1071,'推荐楼层3楼——多图4','#','upload/advertising/1497070037.png',3,0,'#ffffff',''),
	(1000,1071,'推荐楼层3楼——多图5','#','upload/advertising/1497070051.png',4,0,'#ffffff',''),
	(1001,1072,'推荐楼层4楼——多图1','#','upload/advertising/1497070074.png',0,0,'#ffffff',''),
	(1002,1072,'推荐楼层4楼——多图2','#','upload/advertising/1497070086.png',1,0,'#ffffff',''),
	(1003,1072,'推荐楼层4楼——多图3','#','upload/advertising/1497070098.png',2,0,'#ffffff',''),
	(1004,1072,'推荐楼层4楼——多图4','#','upload/advertising/1497070109.png',4,0,'#ffffff',''),
	(1005,1072,'推荐楼层4楼——多图5','#','upload/advertising/1497070120.png',5,0,'#ffffff',''),
	(1006,1067,'推荐楼层3楼——轮播图1','#','upload/advertising/1497069703.png',2,0,'#ffffff',''),
	(1007,1067,'推荐楼层3楼——轮播图2','#','upload/advertising/1497069729.png',2,0,'#ffffff',''),
	(1008,1067,'推荐楼层3楼——轮播图3','#','upload/advertising/1497069741.png',2,0,'#FFFFFF','');

/*!40000 ALTER TABLE `ns_platform_adv` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_platform_adv_position
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_platform_adv_position`;

CREATE TABLE `ns_platform_adv_position` (
  `ap_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '广告位置id',
  `ap_name` varchar(100) NOT NULL COMMENT '广告位置名',
  `ap_intro` varchar(255) NOT NULL COMMENT '广告位简介',
  `ap_class` smallint(1) unsigned NOT NULL COMMENT '广告类别：0图片1文字2幻灯3Flash',
  `ap_display` smallint(1) unsigned NOT NULL COMMENT '广告展示方式：0幻灯片1多广告展示2单广告展示',
  `is_use` smallint(1) unsigned NOT NULL COMMENT '广告位是否启用：0不启用1启用',
  `ap_height` int(10) NOT NULL COMMENT '广告位高度',
  `ap_width` int(10) NOT NULL COMMENT '广告位宽度',
  `ap_price` int(10) NOT NULL DEFAULT 0 COMMENT '广告位单价',
  `adv_num` int(10) NOT NULL DEFAULT 0 COMMENT '拥有的广告数',
  `click_num` int(10) NOT NULL DEFAULT 0 COMMENT '广告位点击率',
  `default_content` varchar(300) DEFAULT NULL,
  `ap_background_color` varchar(50) NOT NULL DEFAULT '#FFFFFF' COMMENT '广告位背景色 默认白色',
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '广告位所在位置类型   1 pc端  2 手机端',
  `instance_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `is_del` int(11) DEFAULT 0,
  `ap_keyword` varchar(100) NOT NULL DEFAULT '' COMMENT '广告位关键字',
  PRIMARY KEY (`ap_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 COMMENT='广告位表';

LOCK TABLES `ns_platform_adv_position` WRITE;
/*!40000 ALTER TABLE `ns_platform_adv_position` DISABLE KEYS */;

INSERT INTO `ns_platform_adv_position` (`ap_id`, `ap_name`, `ap_intro`, `ap_class`, `ap_display`, `is_use`, `ap_height`, `ap_width`, `ap_price`, `adv_num`, `click_num`, `default_content`, `ap_background_color`, `type`, `instance_id`, `is_del`, `ap_keyword`)
VALUES
	(1051,'商城首页最顶部广告位','商城首页最顶部广告位',0,2,1,1000,1000,0,0,0,'','#000000',1,0,1,''),
	(1052,'商城首页logo右侧小广告','商城首页logo右侧小广告',0,2,1,90,170,0,0,0,'public/static/images/default_img_url/shouyelogo.png','#FFFFFF',1,0,1,''),
	(1053,'商城首页滚动图广告位','商城首页滚动图广告位',0,2,1,443,800,0,0,0,'','#FFFFFF',1,0,1,''),
	(1054,'商城首页中部推荐广告位','商城首页中部推荐广告位（140*242）',0,2,1,150,291,0,0,0,'','',1,0,1,''),
	(1056,'商城限时折扣轮播广告位','商城限时折扣轮播广告位',0,2,1,443,1903,0,0,0,'public/static/images/default_img_url/xianshizhekou.png','#FFFFFF',1,0,1,''),
	(1057,'推荐楼层1楼——单图广告位','推荐楼层1楼——单图广告位',0,2,1,485,210,0,0,0,'upload/advertising/1497068896.png','#ffffff',1,0,0,''),
	(1058,'推荐楼层1楼——轮播图广告位','推荐楼层1楼——轮播图广告位',0,0,1,485,390,0,0,0,'upload/advertising/1497069144.png','#FFFFFF',1,0,0,''),
	(1059,'推荐楼层1楼——多图广告位','推荐楼层1楼——多图广告位',0,1,1,300,202,0,0,0,'upload/advertising/1497069290.png','#FFFFFF',1,0,0,''),
	(1060,'推荐楼层2楼——单图广告位','推荐楼层2楼——单图广告位',0,2,1,485,210,0,0,0,'upload/advertising/1497069441.png','#ffffff',1,0,0,''),
	(1061,'推荐楼层2楼——轮播图广告位','推荐楼层2楼——轮播图广告位',0,0,1,485,390,0,0,0,'upload/advertising/1497069460.png','#FFFFFF',1,0,0,''),
	(1062,'推荐楼层2楼——多图广告位','推荐楼层2楼——多图广告位',0,1,1,300,202,0,0,0,'upload/advertising/1497069549.png','#FFFFFF',1,0,0,''),
	(1063,'推荐楼层3楼——单图广告位','推荐楼层3楼——单图广告位',0,2,1,485,210,0,0,0,'upload/advertising/1497069606.png','#FFFFFF',1,0,0,''),
	(1064,'推荐楼层4楼——单图广告位','推荐楼层4楼——单图广告位',0,2,1,485,210,0,0,0,'upload/advertising/1497069629.png','#FFFFFF',1,0,0,''),
	(1067,'推荐楼层3楼——轮播图广告位','推荐楼层3楼——轮播图广告位',0,0,1,485,390,0,0,0,'','#ffffff',1,0,0,''),
	(1068,'推荐楼层4楼——轮播图广告位','推荐楼层4楼——轮播图广告位',0,0,1,485,390,0,0,0,'upload/advertising/1497069758.png','#FFFFFF',1,0,0,''),
	(1071,'推荐楼层3楼——多图广告位','推荐楼层3楼——多图广告位',0,1,1,300,202,0,0,0,'upload/advertising/1497069893.png','#FFFFFF',1,0,0,''),
	(1072,'推荐楼层4楼——多图广告位','推荐楼层4楼——多图广告位',0,1,1,300,202,0,0,0,'upload/advertising/1497070074.png','#FFFFFF',1,0,0,''),
	(1075,'商城品牌专区轮播广告位','商城品牌专区轮播广告位',0,0,1,443,1210,0,0,0,'public/static/images/default_img_url/pinpaizhuanqu.png','#000000',1,0,1,''),
	(1076,'商城积分中心轮播广告位','商城积分中心轮播广告位',0,2,1,320,910,0,0,0,'public/static/images/default_img_url/jifenzhongxin.jpg','#000000',1,0,1,''),
	(1102,'商城积分中心中部广告位','商城积分中心中部广告位',0,2,1,60,1210,0,0,0,'public/static/images/default_img_url/jifenzhongxinzhongbu.jpg','#000000',1,0,1,''),
	(1103,'商城登录页面轮播广告位','商城登录页面轮播广告位',0,0,1,0,0,0,0,0,'','',1,0,1,''),
	(1105,'手机端首页轮播广告位','手机端首页轮播广告位',0,1,1,175,320,0,0,0,'public/static/images/default_img_url/waplunbo.png','',2,0,1,''),
	(1152,'手机端会员中心广告位','手机端会员中心广告位',0,2,1,100,750,0,0,0,'public/static/images/default_img_url/waphuiyuanzhongxin.png','',2,0,1,''),
	(1162,'手机端品牌专区广告位','品牌专区广告',0,2,1,192,720,0,0,0,'public/static/images/default_img_url/wappinpaizhuanqu.png','',2,0,1,''),
	(1163,'手机端限时折扣专区广告位','限时折扣专区广告位',0,2,1,130,720,0,0,0,'public/static/images/default_img_url/wapxianshizhekou.png','',2,0,1,''),
	(1164,'手机端首页商城热卖广告位','手机端商城热卖',0,2,1,100,100,0,0,0,'public/static/images/default_img_url/wapshangchengremai.png','#000000',2,0,1,''),
	(1165,'手机端积分中心广告位','积分中心广告位',0,2,1,100,100,0,0,0,'public/static/images/default_img_url/wapjifenzhongxin.png','#000000',2,0,1,'');

/*!40000 ALTER TABLE `ns_platform_adv_position` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_platform_block
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_platform_block`;

CREATE TABLE `ns_platform_block` (
  `block_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_display` smallint(4) NOT NULL DEFAULT 1 COMMENT '是否显示',
  `block_color` varchar(255) NOT NULL COMMENT '颜色风格',
  `sort` int(11) DEFAULT NULL,
  `block_name` varchar(50) NOT NULL DEFAULT '' COMMENT '板块名称',
  `block_short_name` varchar(50) DEFAULT NULL COMMENT '板块简称',
  `recommend_ad_image_name` varchar(50) NOT NULL DEFAULT '' COMMENT '推荐单图广告位名称',
  `recommend_ad_image` int(11) NOT NULL DEFAULT 0 COMMENT '推荐单图广告位',
  `recommend_ad_slide_name` varchar(50) NOT NULL DEFAULT '' COMMENT '推荐幻灯广告位名称',
  `recommend_ad_slide` int(11) NOT NULL COMMENT '推荐幻灯广告位',
  `recommend_ad_images_name` varchar(255) NOT NULL DEFAULT '0' COMMENT '推荐多图广告位名称',
  `recommend_ad_images` int(11) NOT NULL DEFAULT 0 COMMENT '推荐多图广告位',
  `recommend_brands` varchar(255) NOT NULL DEFAULT '' COMMENT '推荐品牌',
  `recommend_categorys` varchar(255) NOT NULL DEFAULT '' COMMENT '推荐商品分类',
  `recommend_goods_category_name_1` varchar(50) NOT NULL DEFAULT '' COMMENT '推荐分类商品别名',
  `recommend_goods_category_1` int(11) NOT NULL DEFAULT 0 COMMENT '推荐显示商品分类',
  `recommend_goods_category_name_2` varchar(50) NOT NULL DEFAULT '' COMMENT '推荐分类商品别名',
  `recommend_goods_category_2` int(11) NOT NULL DEFAULT 0 COMMENT '推荐显示商品分类',
  `recommend_goods_category_name_3` varchar(50) NOT NULL DEFAULT '' COMMENT '推荐分类商品别名',
  `recommend_goods_category_3` int(11) NOT NULL DEFAULT 0 COMMENT '推荐显示商品分类',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `block_data` longtext DEFAULT NULL COMMENT '板块数据',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  `modify_time` int(11) DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='首页促销板块';

LOCK TABLES `ns_platform_block` WRITE;
/*!40000 ALTER TABLE `ns_platform_block` DISABLE KEYS */;

INSERT INTO `ns_platform_block` (`block_id`, `is_display`, `block_color`, `sort`, `block_name`, `block_short_name`, `recommend_ad_image_name`, `recommend_ad_image`, `recommend_ad_slide_name`, `recommend_ad_slide`, `recommend_ad_images_name`, `recommend_ad_images`, `recommend_brands`, `recommend_categorys`, `recommend_goods_category_name_1`, `recommend_goods_category_1`, `recommend_goods_category_name_2`, `recommend_goods_category_2`, `recommend_goods_category_name_3`, `recommend_goods_category_3`, `shop_id`, `block_data`, `create_time`, `modify_time`)
VALUES
	(1,1,'#00ff80',3,'手机数码','手机','单图广告位',1063,'幻灯片广告位',1067,'新品',1071,'','2','新品推荐',64,'特卖清仓',73,'手机配件',70,0,NULL,1499326971,1499429363),
	(2,1,'#ff0000',1,'服装美饰','服装','单图广告位',1060,'幻灯片广告位',1061,'新品',1062,'','35,36,38','清凉一夏',91,'男装臻选',94,'国际大牌',112,0,NULL,1499327448,1499429344),
	(3,1,'#0080ff',2,'家用电器','家电','单图广告位',1064,'幻灯片广告位',1068,'新品上市',1072,'','1,3,4','小型家电',84,'智能家居',131,'大家电',55,0,NULL,1499327871,1499429395);

/*!40000 ALTER TABLE `ns_platform_block` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_platform_goods_recommend
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_platform_goods_recommend`;

CREATE TABLE `ns_platform_goods_recommend` (
  `recommend_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `goods_id` int(11) NOT NULL COMMENT '推荐商品ID',
  `state` int(11) NOT NULL DEFAULT 1 COMMENT '推荐状态',
  `class_id` int(11) NOT NULL DEFAULT 1 COMMENT '推荐类型',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  `modify_time` int(11) DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`recommend_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=442 COMMENT='平台商品推荐';



# Dump of table ns_platform_goods_recommend_class
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_platform_goods_recommend_class`;

CREATE TABLE `ns_platform_goods_recommend_class` (
  `class_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `class_name` varchar(50) NOT NULL DEFAULT '' COMMENT '类型名称',
  `class_type` int(11) NOT NULL DEFAULT 1 COMMENT '推荐模块1.系统固有模块2.平台增加模块',
  `is_use` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否使用',
  `sort` int(11) NOT NULL DEFAULT 255 COMMENT '排序号',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `show_type` int(11) NOT NULL DEFAULT 0 COMMENT '展示类型  0电脑端  1手机端',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='店铺商品推荐类别';



# Dump of table ns_platform_help_class
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_platform_help_class`;

CREATE TABLE `ns_platform_help_class` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `type` int(11) NOT NULL DEFAULT 1 COMMENT '1.帮助类别2.会员协议类别3.开店协议类别',
  `class_name` varchar(50) NOT NULL DEFAULT '' COMMENT '类型名称',
  `parent_class_id` int(11) NOT NULL DEFAULT 0 COMMENT '上级ID',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序号',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='平台说明类型';

LOCK TABLES `ns_platform_help_class` WRITE;
/*!40000 ALTER TABLE `ns_platform_help_class` DISABLE KEYS */;

INSERT INTO `ns_platform_help_class` (`class_id`, `type`, `class_name`, `parent_class_id`, `sort`)
VALUES
	(1,1,'新手上路',0,1),
	(2,1,'配送与支付',0,2),
	(3,1,'会员中心',0,3),
	(4,1,'服务保证',0,4),
	(5,1,'联系我们',0,5);

/*!40000 ALTER TABLE `ns_platform_help_class` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_platform_help_document
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_platform_help_document`;

CREATE TABLE `ns_platform_help_document` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '表主键',
  `uid` int(11) NOT NULL COMMENT '最后修改人ID',
  `class_id` int(11) NOT NULL COMMENT '所属说明类型ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '主题',
  `link_url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序号',
  `content` text NOT NULL COMMENT '内容',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '图片',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  `modufy_time` int(11) DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 COMMENT='平台说明内容';

LOCK TABLES `ns_platform_help_document` WRITE;
/*!40000 ALTER TABLE `ns_platform_help_document` DISABLE KEYS */;

INSERT INTO `ns_platform_help_document` (`id`, `uid`, `class_id`, `title`, `link_url`, `sort`, `content`, `image`, `create_time`, `modufy_time`)
VALUES
	(1,87,1,'购物流程','',0,'','',0,1498471779),
	(2,2,2,'支付方式说明','',5,'<p>支付方式说明</p>','',0,1493810155),
	(3,87,3,'售后流程','',1,'','',0,1499240296),
	(5,2,3,'资金管理','',6,'<p>资金管理</p>','',0,1493964639),
	(6,2,3,'我的收藏','',7,'<p>我的收藏</p>','',0,1493809215),
	(7,2,2,'货到付款区域','',3,'<p>货到付款区域</p>','',1487559901,1493810113),
	(8,2,2,'配送支付智能查询','',4,'<p>配送支付智能查询</p>','',1487559942,1493810133),
	(9,2,4,'退换货原则','',9,'<p>退换货原则</p>','',1487560238,1493809406),
	(10,2,4,'售后服务保证','',9,'<p>售后服务保证</p>','',1487560263,1493809427),
	(11,2,4,'产品质量保证','',10,'<p>产品质量保证</p>','',1487560296,1493809443),
	(12,2,5,'网站故障报告','',11,'<p>网站故障报告</p>','',1487560338,1493809546),
	(13,87,13,'订购方式','',2,'','',1493206148,1498469763),
	(14,1,3,'我的订单','',8,'<p>我的订单</p>','',1493809066,1497102958),
	(15,2,5,'选机咨询','',12,'<p>选机咨询</p>','',1493809482,1493809565),
	(16,2,5,'投诉与建议','',13,'<p>投诉与建议</p>','',1493809511,1493964721),
	(17,87,6,'用户注册协议','',0,'<p><span style=\"color: rgb(102, 102, 102); font-family: &quot;Microsoft Yahei&quot;, &quot;Lucida Grande&quot;, Verdana, Lucida, Helvetica, Arial, sans-serif; font-size: 12px; background-color: rgb(255, 255, 255);\">商城用户注册协议本协议是您与商城网站（简称&quot;本站&quot;）所有者（以下简称为&quot;商城&quot;）之间就商城网站服务等相关事宜所订立的契约，请您仔细阅读本注册协议，您点击&quot;同意并继续&quot;按钮后，本协议即构成对双方有约束力的法律文件。第1条 本站服务条款的确认和接纳1.1本站的各项电子服务的所有权和运作权归商城所有。用户同意所有注册协议条款并完成注册程序，才能成为本站的正式用户。用户确认：本协议条款是处理双方权利义务的契约，始终有效，法律另有强制性规定或双方另有特别约定的，依其规定。1.2用户点击同意本协议的，即视为用户确认自己具有享受本站服务、下单购物等相应的权利能力和行为能力，能够独立承担法律责任。1.3如果您在18周岁以下，您只能在父母或监护人的监护参与下才能使用本站。第2条 本站服务2.1商城通过互联网依法为用户提供互联网信息等服务，用户在完全同意本协议及本站规定的情况下，方有权使用本站的相关服务。2.2用户必须自行准备如下设备和承担如下开支：（1）上网设备，包括并不限于电脑或者其他上网终端、调制解调器及其他必备的上网装置；（2）上网开支，包括并不限于网络接入费、上网设备租用费、手机流量费等。第3条 用户信息3.1用户应自行诚信向本站提供注册资料，用户同意其提供的注册资料真实、准确、完整、合法有效，用户注册资料如有变动的，应及时更新其注册资料。如果用户提供的注册资料不合法、不真实、不准确、不详尽的，用户需承担因此引起的相应责任及后果，并且商城保留终止用户使用商城各项服务的权利。3.2用户在本站进行浏览、下单购物等活动时，涉及用户真实姓名/名称、通信地址、联系电话、电子邮箱等隐私信息的，本站将予以严格保密，除非得到用户的授权或法律另有规定，本站不会向外界披露用户隐私信息。第4条 用户依法言行义务本协议依据国家相关法律法规规章制定，用户同意严格遵守以下义务：（1）不得传输或发表：煽动抗拒、破坏宪法和法律、行政法规实施的言论，煽动颠覆国家政权，推翻社会主义制度的言论，煽动分裂国家、破坏国家统一的的言论，煽动民族仇恨、民族歧视、破坏民族团结的言论；（2）从中国大陆向境外传输资料信息时必须符合中国有关法规；第5条 其他5.1商城网站所有者是指在政府部门依法许可或备案的商城网站经营主体。5.2您点击本协议下方的&quot;同意并继续&quot;按钮即视为您完全接受本协议，在点击之前请您再次确认已知悉并完全理解本协议的全部内容。</span></p>','',1499325553,1499325616);

/*!40000 ALTER TABLE `ns_platform_help_document` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_platform_link
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_platform_link`;

CREATE TABLE `ns_platform_link` (
  `link_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '索引id',
  `link_title` varchar(100) NOT NULL COMMENT '标题',
  `link_url` varchar(100) NOT NULL COMMENT '链接',
  `link_pic` varchar(100) NOT NULL COMMENT '图片',
  `link_sort` int(11) DEFAULT NULL,
  `is_blank` int(11) NOT NULL DEFAULT 1 COMMENT '是否新窗口打开 1.是 2.否',
  `is_show` int(11) NOT NULL DEFAULT 1 COMMENT '是否显示 1.是 2.否',
  PRIMARY KEY (`link_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=50 COMMENT='友情链接表';



# Dump of table ns_point_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_point_config`;

CREATE TABLE `ns_point_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `is_open` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否启动',
  `convert_rate` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '1积分对应金额',
  `desc` text NOT NULL COMMENT '积分说明',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  `modify_time` int(11) DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='积分设置表';

LOCK TABLES `ns_point_config` WRITE;
/*!40000 ALTER TABLE `ns_point_config` DISABLE KEYS */;

INSERT INTO `ns_point_config` (`id`, `shop_id`, `is_open`, `convert_rate`, `desc`, `create_time`, `modify_time`)
VALUES
	(1,0,0,0.00,'',1513013458,0);

/*!40000 ALTER TABLE `ns_point_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_promotion_bundling
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_promotion_bundling`;

CREATE TABLE `ns_promotion_bundling` (
  `bl_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合ID',
  `bl_name` varchar(50) NOT NULL COMMENT '组合名称',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `shop_name` varchar(100) NOT NULL COMMENT '店铺名称',
  `bl_price` decimal(10,2) NOT NULL COMMENT '商品组合价格',
  `shipping_fee_type` tinyint(1) NOT NULL COMMENT '运费承担方式 1卖家承担运费 2买家承担运费',
  `shipping_fee` decimal(10,2) NOT NULL COMMENT '运费',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '组合状态 0-关闭/1-开启',
  PRIMARY KEY (`bl_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组合销售活动表';



# Dump of table ns_promotion_bundling_goods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_promotion_bundling_goods`;

CREATE TABLE `ns_promotion_bundling_goods` (
  `bl_goods_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合商品id',
  `bl_id` int(11) NOT NULL COMMENT '组合id',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_picture` varchar(100) NOT NULL COMMENT '商品图片',
  `bl_goods_price` decimal(10,2) NOT NULL COMMENT '商品组合价格',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`bl_goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组合销售活动商品表';



# Dump of table ns_promotion_discount
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_promotion_discount`;

CREATE TABLE `ns_promotion_discount` (
  `discount_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` int(11) NOT NULL DEFAULT 1 COMMENT '店铺ID',
  `shop_name` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `discount_name` varchar(255) NOT NULL DEFAULT '' COMMENT '活动名称',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '活动状态(0-未发布/1-正常/3-关闭/4-结束)',
  `remark` text NOT NULL COMMENT '备注',
  `start_time` int(11) DEFAULT 0 COMMENT '开始时间',
  `end_time` int(11) DEFAULT 0 COMMENT '结束时间',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  `modify_time` int(11) DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`discount_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='限时折扣';



# Dump of table ns_promotion_discount_goods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_promotion_discount_goods`;

CREATE TABLE `ns_promotion_discount_goods` (
  `discount_goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `discount_id` int(11) NOT NULL COMMENT '对应活动',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态',
  `discount` decimal(10,2) NOT NULL COMMENT '活动折扣或者减现信息',
  `goods_name` varchar(255) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_picture` int(11) NOT NULL COMMENT '商品图片',
  `start_time` int(11) DEFAULT 0 COMMENT '开始时间',
  `end_time` int(11) DEFAULT 0 COMMENT '结束时间',
  PRIMARY KEY (`discount_goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=712 COMMENT='限时折扣商品列表';



# Dump of table ns_promotion_full_mail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_promotion_full_mail`;

CREATE TABLE `ns_promotion_full_mail` (
  `mail_id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `is_open` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否开启 0未开启 1已开启',
  `full_mail_money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '包邮所需订单金额',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  `modify_time` int(11) DEFAULT 0 COMMENT '更新时间',
  `no_mail_province_id_array` text NOT NULL COMMENT '不包邮省id组',
  `no_mail_city_id_array` text NOT NULL COMMENT '不包邮市id组',
  PRIMARY KEY (`mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='满额包邮';

LOCK TABLES `ns_promotion_full_mail` WRITE;
/*!40000 ALTER TABLE `ns_promotion_full_mail` DISABLE KEYS */;

INSERT INTO `ns_promotion_full_mail` (`mail_id`, `shop_id`, `is_open`, `full_mail_money`, `create_time`, `modify_time`, `no_mail_province_id_array`, `no_mail_city_id_array`)
VALUES
	(1,0,0,0.00,1499332185,0,'','');

/*!40000 ALTER TABLE `ns_promotion_full_mail` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_promotion_gift
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_promotion_gift`;

CREATE TABLE `ns_promotion_gift` (
  `gift_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '赠品活动id ',
  `days` int(10) unsigned NOT NULL COMMENT '领取有效期(多少天)',
  `max_num` varchar(50) NOT NULL COMMENT '领取限制(次/人 (0表示不限领取次数))',
  `shop_id` varchar(100) NOT NULL COMMENT '店铺id',
  `gift_name` varchar(255) NOT NULL COMMENT '赠品活动名称',
  `start_time` int(11) DEFAULT 0 COMMENT '赠品有效期开始时间',
  `end_time` int(11) DEFAULT 0 COMMENT '赠品有效期结束时间',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  `modify_time` int(11) DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`gift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='赠品活动表';



# Dump of table ns_promotion_gift_goods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_promotion_gift_goods`;

CREATE TABLE `ns_promotion_gift_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id ',
  `gift_id` int(10) unsigned NOT NULL COMMENT '赠品id ',
  `goods_id` int(10) unsigned NOT NULL COMMENT '商品id',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_picture` varchar(100) NOT NULL COMMENT '商品图片',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='商品赠品表';



# Dump of table ns_promotion_mansong
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_promotion_mansong`;

CREATE TABLE `ns_promotion_mansong` (
  `mansong_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '满送活动编号',
  `mansong_name` varchar(50) NOT NULL COMMENT '活动名称',
  `shop_id` int(10) unsigned NOT NULL COMMENT '店铺编号',
  `shop_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `status` tinyint(1) unsigned NOT NULL COMMENT '活动状态(0-未发布/1-正常/3-关闭/4-结束)',
  `remark` varchar(200) NOT NULL COMMENT '备注',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1.普通优惠  2.多级优惠',
  `range_type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1全部商品 0部分商品',
  `start_time` int(11) DEFAULT 0 COMMENT '活动开始时间',
  `end_time` int(11) DEFAULT 0 COMMENT '活动结束时间',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  `modify_time` int(11) DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`mansong_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638 COMMENT='满就送活动表';



# Dump of table ns_promotion_mansong_goods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_promotion_mansong_goods`;

CREATE TABLE `ns_promotion_mansong_goods` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `mansong_id` int(11) NOT NULL COMMENT '满减送ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `goods_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品名称',
  `goods_picture` varchar(255) NOT NULL DEFAULT '' COMMENT '商品图片',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '活动状态',
  `start_time` int(11) DEFAULT 0 COMMENT '开始时间',
  `end_time` int(11) DEFAULT 0 COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 COMMENT='满减送商品';



# Dump of table ns_promotion_mansong_rule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_promotion_mansong_rule`;

CREATE TABLE `ns_promotion_mansong_rule` (
  `rule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则编号',
  `mansong_id` int(10) unsigned NOT NULL COMMENT '活动编号',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '级别价格(满多少)',
  `discount` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '减现金优惠金额（减多少金额）',
  `free_shipping` tinyint(4) NOT NULL DEFAULT 0 COMMENT '免邮费',
  `give_point` int(11) NOT NULL DEFAULT 0 COMMENT '送积分数量（0表示不送）',
  `give_coupon` int(11) NOT NULL DEFAULT 0 COMMENT '送优惠券的id（0表示不送）',
  `gift_id` int(11) NOT NULL COMMENT '礼品(赠品)id',
  PRIMARY KEY (`rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170 COMMENT='满就送活动规则表';



# Dump of table ns_reward_rule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_reward_rule`;

CREATE TABLE `ns_reward_rule` (
  `shop_id` int(10) unsigned NOT NULL,
  `sign_point` int(11) NOT NULL DEFAULT 0 COMMENT '签到送积分',
  `share_point` int(11) NOT NULL DEFAULT 0 COMMENT '分享送积分',
  `reg_member_self_point` int(11) NOT NULL DEFAULT 0 COMMENT '注册会员 自己获得的积分',
  `reg_member_one_point` int(11) NOT NULL DEFAULT 0 COMMENT '注册会员 上级获得的积分',
  `reg_member_two_point` int(11) NOT NULL DEFAULT 0 COMMENT '注册会员 上上级获得的积分',
  `reg_member_three_point` int(11) NOT NULL DEFAULT 0 COMMENT '注册会员 上上上级获得的积分',
  `reg_promoter_self_point` int(11) NOT NULL DEFAULT 0 COMMENT '成为推广员 自己获得的积分',
  `reg_promoter_one_point` int(11) NOT NULL DEFAULT 0 COMMENT '成为推广员 上级获得的积分',
  `reg_promoter_two_point` int(11) NOT NULL DEFAULT 0 COMMENT '成为推广员 上上级获得的积分',
  `reg_promoter_three_point` int(11) NOT NULL DEFAULT 0 COMMENT '成为推广员 上上上级获得的积分',
  `reg_partner_self_point` int(11) NOT NULL DEFAULT 0 COMMENT '成为股东 自己获得的积分',
  `reg_partner_one_point` int(11) NOT NULL DEFAULT 0 COMMENT '成为股东 上级获得的积分',
  `reg_partner_two_point` int(11) NOT NULL DEFAULT 0 COMMENT '成为股东 上上级获得的积分',
  `reg_partner_three_point` int(11) NOT NULL DEFAULT 0 COMMENT '成为股东 上上上级获得的积分',
  `into_store_coupon` int(11) NOT NULL DEFAULT 0 COMMENT '进店领用优惠券  存入优惠券id(coupon_id)',
  `share_coupon` int(11) NOT NULL DEFAULT 0 COMMENT '分享领用优惠券  存入优惠券id(coupon_id)',
  `click_point` int(11) NOT NULL DEFAULT 0 COMMENT '点赞送积分',
  `comment_point` int(11) NOT NULL DEFAULT 0 COMMENT '评论送积分',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='奖励规则表';

LOCK TABLES `ns_reward_rule` WRITE;
/*!40000 ALTER TABLE `ns_reward_rule` DISABLE KEYS */;

INSERT INTO `ns_reward_rule` (`shop_id`, `sign_point`, `share_point`, `reg_member_self_point`, `reg_member_one_point`, `reg_member_two_point`, `reg_member_three_point`, `reg_promoter_self_point`, `reg_promoter_one_point`, `reg_promoter_two_point`, `reg_promoter_three_point`, `reg_partner_self_point`, `reg_partner_one_point`, `reg_partner_two_point`, `reg_partner_three_point`, `into_store_coupon`, `share_coupon`, `click_point`, `comment_point`)
VALUES
	(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0);

/*!40000 ALTER TABLE `ns_reward_rule` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_shop
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_shop`;

CREATE TABLE `ns_shop` (
  `shop_id` int(11) NOT NULL COMMENT '店铺索引id',
  `shop_name` varchar(50) NOT NULL COMMENT '店铺名称',
  `shop_type` int(11) NOT NULL COMMENT '店铺类型等级',
  `uid` int(11) NOT NULL COMMENT '会员id',
  `shop_group_id` int(11) NOT NULL COMMENT '店铺分类',
  `shop_company_name` varchar(50) DEFAULT NULL COMMENT '店铺公司名称',
  `province_id` mediumint(8) unsigned NOT NULL DEFAULT 0 COMMENT '店铺所在省份ID',
  `city_id` mediumint(8) unsigned NOT NULL DEFAULT 0 COMMENT '店铺所在市ID',
  `shop_address` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地区',
  `shop_zip` varchar(10) NOT NULL DEFAULT '' COMMENT '邮政编码',
  `shop_state` tinyint(1) NOT NULL DEFAULT 1 COMMENT '店铺状态，0关闭，1开启，2审核中',
  `shop_close_info` varchar(255) DEFAULT NULL COMMENT '店铺关闭原因',
  `shop_sort` int(11) NOT NULL DEFAULT 0 COMMENT '店铺排序',
  `shop_logo` varchar(255) DEFAULT NULL COMMENT '店铺logo',
  `shop_banner` varchar(255) DEFAULT NULL COMMENT '店铺横幅',
  `shop_avatar` varchar(150) DEFAULT NULL COMMENT '店铺头像',
  `shop_keywords` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺seo关键字',
  `shop_description` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺seo描述',
  `shop_qq` varchar(50) DEFAULT NULL COMMENT 'QQ',
  `shop_ww` varchar(50) DEFAULT NULL COMMENT '阿里旺旺',
  `shop_phone` varchar(20) DEFAULT NULL COMMENT '商家电话',
  `shop_domain` varchar(50) DEFAULT NULL COMMENT '店铺二级域名',
  `shop_domain_times` tinyint(1) unsigned DEFAULT 0 COMMENT '二级域名修改次数',
  `shop_recommend` tinyint(1) NOT NULL DEFAULT 0 COMMENT '推荐，0为否，1为是，默认为0',
  `shop_credit` int(10) NOT NULL DEFAULT 0 COMMENT '店铺信用',
  `shop_desccredit` float NOT NULL DEFAULT 0 COMMENT '描述相符度分数',
  `shop_servicecredit` float NOT NULL DEFAULT 0 COMMENT '服务态度分数',
  `shop_deliverycredit` float NOT NULL DEFAULT 0 COMMENT '发货速度分数',
  `shop_collect` int(10) unsigned NOT NULL DEFAULT 0 COMMENT '店铺收藏数量',
  `shop_stamp` varchar(200) DEFAULT NULL COMMENT '店铺印章',
  `shop_printdesc` varchar(500) DEFAULT NULL COMMENT '打印订单页面下方说明文字',
  `shop_sales` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '店铺销售额（不计算退款）',
  `shop_account` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '店铺账户余额',
  `shop_cash` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '店铺可提现金额',
  `shop_workingtime` varchar(100) DEFAULT NULL COMMENT '工作时间',
  `live_store_name` varchar(255) DEFAULT NULL COMMENT '商铺名称',
  `live_store_address` varchar(255) DEFAULT NULL COMMENT '商家地址',
  `live_store_tel` varchar(255) DEFAULT NULL COMMENT '商铺电话',
  `live_store_bus` varchar(255) DEFAULT NULL COMMENT '公交线路',
  `shop_vrcode_prefix` char(3) DEFAULT NULL COMMENT '商家兑换码前缀',
  `store_qtian` tinyint(1) DEFAULT 0 COMMENT '7天退换',
  `shop_zhping` tinyint(1) DEFAULT 0 COMMENT '正品保障',
  `shop_erxiaoshi` tinyint(1) DEFAULT 0 COMMENT '两小时发货',
  `shop_tuihuo` tinyint(1) DEFAULT 0 COMMENT '退货承诺',
  `shop_shiyong` tinyint(1) DEFAULT 0 COMMENT '试用中心',
  `shop_shiti` tinyint(1) DEFAULT 0 COMMENT '实体验证',
  `shop_xiaoxie` tinyint(1) DEFAULT 0 COMMENT '消协保证',
  `shop_huodaofk` tinyint(1) DEFAULT 0 COMMENT '货到付款',
  `shop_free_time` varchar(10) DEFAULT NULL COMMENT '商家配送时间',
  `shop_region` varchar(50) DEFAULT NULL COMMENT '店铺默认配送区域',
  `recommend_uid` int(11) NOT NULL DEFAULT 0 COMMENT '推荐招商员用户id',
  `shop_qrcode` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺公众号',
  `shop_create_time` int(11) DEFAULT 0 COMMENT '店铺时间',
  `shop_end_time` int(11) DEFAULT 0 COMMENT '店铺关闭时间',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='店铺数据表';



# Dump of table ns_shop_ad
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_shop_ad`;

CREATE TABLE `ns_shop_ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL,
  `ad_image` varchar(255) NOT NULL DEFAULT '' COMMENT '广告图片',
  `link_url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `type` int(1) NOT NULL DEFAULT 0 COMMENT '类型 0 -- pc端  1-- 手机端 ',
  `background` varchar(255) NOT NULL DEFAULT '#FFFFFF' COMMENT '背景色',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='店铺广告设置';



# Dump of table ns_shop_coin_records
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_shop_coin_records`;

CREATE TABLE `ns_shop_coin_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `num` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '购物币数量',
  `account_type` int(11) NOT NULL DEFAULT 1 COMMENT '增加或减少类型',
  `type_alis_id` int(11) NOT NULL DEFAULT 0 COMMENT '关联ID',
  `is_display` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否显示',
  `text` varchar(255) NOT NULL DEFAULT '' COMMENT '简介',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺购物币记录';



# Dump of table ns_shop_express_address
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_shop_express_address`;

CREATE TABLE `ns_shop_express_address` (
  `express_address_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '物流地址id',
  `shop_id` int(11) NOT NULL COMMENT '商铺id',
  `contact` varchar(100) NOT NULL DEFAULT '' COMMENT '联系人',
  `mobile` varchar(50) NOT NULL DEFAULT '' COMMENT '手机',
  `phone` varchar(50) NOT NULL DEFAULT '' COMMENT '电话',
  `company_name` varchar(100) NOT NULL DEFAULT '' COMMENT '公司名称',
  `province` smallint(6) NOT NULL DEFAULT 0 COMMENT '所在地省',
  `city` smallint(6) NOT NULL DEFAULT 0 COMMENT '所在地市',
  `district` smallint(6) NOT NULL DEFAULT 0 COMMENT '所在地区县',
  `zipcode` varchar(6) NOT NULL DEFAULT '' COMMENT '邮编',
  `address` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地址',
  `is_consigner` tinyint(2) NOT NULL DEFAULT 0 COMMENT '发货地址标记',
  `is_receiver` tinyint(2) NOT NULL DEFAULT 0 COMMENT '收货地址标记',
  `create_date` int(11) DEFAULT 0 COMMENT '创建日期',
  `modify_date` int(11) DEFAULT 0 COMMENT '修改日期',
  PRIMARY KEY (`express_address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1092 COMMENT='物流地址';



# Dump of table ns_shop_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_shop_group`;

CREATE TABLE `ns_shop_group` (
  `shop_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '分组ID',
  `group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '分组名称',
  `group_sort` int(11) NOT NULL DEFAULT 1 COMMENT '分组排序号',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  `modify_time` int(11) DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`shop_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2730 COMMENT='店铺分组表';



# Dump of table ns_shop_navigation
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_shop_navigation`;

CREATE TABLE `ns_shop_navigation` (
  `nav_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `nav_title` varchar(255) NOT NULL DEFAULT '' COMMENT '导航名称',
  `nav_url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `type` int(11) NOT NULL DEFAULT 3 COMMENT '纵向所在位置1.头部2.中部3底部',
  `sort` int(11) NOT NULL COMMENT '排序号',
  `align` int(11) NOT NULL DEFAULT 1 COMMENT '横向所在位置1 左  2  右',
  `nav_type` int(11) DEFAULT 1,
  `is_blank` int(11) DEFAULT 0,
  `template_name` varchar(255) DEFAULT '',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  `modify_time` int(11) DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`nav_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 COMMENT='店铺导航管理';

LOCK TABLES `ns_shop_navigation` WRITE;
/*!40000 ALTER TABLE `ns_shop_navigation` DISABLE KEYS */;

INSERT INTO `ns_shop_navigation` (`nav_id`, `shop_id`, `nav_title`, `nav_url`, `type`, `sort`, `align`, `nav_type`, `is_blank`, `template_name`, `create_time`, `modify_time`)
VALUES
	(1,0,'新闻动态','新闻动态',1,0,0,1,0,'',1513097283,1513097283),
	(2,0,'首页','/index',1,10,0,0,1,'首页',1513097298,1513097306),
	(3,0,'限时折扣','/index/discount',1,0,0,0,1,'限时折扣',1513097338,1513097338),
	(4,0,'品牌列表','/goods/brandlist',1,0,0,0,1,'品牌列表',1513097360,1513097360),
	(5,0,'积分兑换','/goods/integralcenter',1,0,0,0,1,'积分中心',1513097382,1513097382);

/*!40000 ALTER TABLE `ns_shop_navigation` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_shop_navigation_template
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_shop_navigation_template`;

CREATE TABLE `ns_shop_navigation_template` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模板名称',
  `template_url` varchar(255) NOT NULL DEFAULT '' COMMENT '访问路径',
  `is_use` int(11) NOT NULL DEFAULT 1 COMMENT '是否有效',
  `use_type` int(11) NOT NULL COMMENT '1 shop端 0wap端',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='导航 的 系统默认模板';

LOCK TABLES `ns_shop_navigation_template` WRITE;
/*!40000 ALTER TABLE `ns_shop_navigation_template` DISABLE KEYS */;

INSERT INTO `ns_shop_navigation_template` (`template_id`, `template_name`, `template_url`, `is_use`, `use_type`, `create_time`)
VALUES
	(1,'首页','/index',1,1,1497706628),
	(2,'限时折扣','/index/discount',1,1,1497706628),
	(3,'品牌列表','/goods/brandlist',1,1,1497706628),
	(4,'积分中心','/goods/integralcenter',1,1,1500721307);

/*!40000 ALTER TABLE `ns_shop_navigation_template` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_shop_order_account_records
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_shop_order_account_records`;

CREATE TABLE `ns_shop_order_account_records` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `shop_id` int(11) NOT NULL COMMENT '店铺ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `order_no` varchar(255) NOT NULL DEFAULT '' COMMENT '订单编号',
  `order_goods_id` int(11) NOT NULL COMMENT '订单项ID',
  `goods_pay_money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '订单项实际支付金额',
  `rate` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '商品平台佣金比率',
  `shop_money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '店铺获取金额',
  `platform_money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '平台获取金额',
  `is_refund` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否产生退款',
  `refund_money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '实际退款金额',
  `shop_refund_money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '店铺扣减余额',
  `platform_refund_money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '平台扣减余额',
  `is_issue` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否已经结算',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=655 COMMENT='店铺针对订单的金额分配';



# Dump of table ns_shop_weixin_share
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_shop_weixin_share`;

CREATE TABLE `ns_shop_weixin_share` (
  `shop_id` int(11) NOT NULL,
  `goods_param_1` varchar(255) NOT NULL DEFAULT '' COMMENT '商品分享价格标示',
  `goods_param_2` varchar(255) NOT NULL DEFAULT '' COMMENT '商品分享内容',
  `shop_param_1` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分享标题',
  `shop_param_2` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分享主题',
  `shop_param_3` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺分享内容',
  `qrcode_param_1` varchar(255) NOT NULL DEFAULT '' COMMENT '二维码分享主题',
  `qrcode_param_2` varchar(255) NOT NULL DEFAULT '' COMMENT '二维码分享内容',
  PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='店铺分享内容设置';

LOCK TABLES `ns_shop_weixin_share` WRITE;
/*!40000 ALTER TABLE `ns_shop_weixin_share` DISABLE KEYS */;

INSERT INTO `ns_shop_weixin_share` (`shop_id`, `goods_param_1`, `goods_param_2`, `shop_param_1`, `shop_param_2`, `shop_param_3`, `qrcode_param_1`, `qrcode_param_2`)
VALUES
	(0,'','','','','','','');

/*!40000 ALTER TABLE `ns_shop_weixin_share` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table ns_supplier
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_supplier`;

CREATE TABLE `ns_supplier` (
  `supplier_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT 0,
  `supplier_name` varchar(50) NOT NULL DEFAULT '' COMMENT '供货商名称',
  `desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '供货商描述',
  `linkman_tel` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人电话',
  `linkman_name` varchar(50) NOT NULL DEFAULT '' COMMENT '联系人姓名',
  `linkman_address` varchar(255) NOT NULL DEFAULT '' COMMENT '联系人地址',
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供货商表';



# Dump of table ns_virtual_goods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_virtual_goods`;

CREATE TABLE `ns_virtual_goods` (
  `virtual_goods_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `virtual_code` varbinary(255) NOT NULL COMMENT '虚拟码',
  `virtual_goods_name` varchar(255) NOT NULL COMMENT '虚拟商品名称',
  `money` decimal(10,2) NOT NULL COMMENT '虚拟商品金额',
  `buyer_id` int(11) NOT NULL COMMENT '买家id',
  `buyer_nickname` varchar(255) NOT NULL COMMENT '买家名称',
  `order_goods_id` int(11) NOT NULL COMMENT '关联订单项id',
  `order_no` varchar(255) NOT NULL COMMENT '订单编号',
  `validity_period` int(11) NOT NULL COMMENT '有效期/天(0表示不限制)',
  `start_time` int(11) NOT NULL COMMENT '有效期开始时间',
  `end_time` int(11) NOT NULL COMMENT '有效期结束时间',
  `use_number` int(11) NOT NULL COMMENT '使用次数',
  `confine_use_number` int(11) NOT NULL COMMENT '限制使用次数',
  `use_status` tinyint(1) NOT NULL COMMENT '使用状态(-1:已过期,0:未使用,1:已使用)',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`virtual_goods_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='虚拟商品列表(用户下单支成功后存放)';



# Dump of table ns_virtual_goods_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_virtual_goods_group`;

CREATE TABLE `ns_virtual_goods_group` (
  `virtual_goods_group_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '虚拟商品分组id',
  `virtual_goods_group_name` varchar(255) NOT NULL DEFAULT '' COMMENT '虚拟商品分组名称',
  `interfaces` varchar(1000) DEFAULT '' COMMENT '接口调用地址（JSON）',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`virtual_goods_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='虚拟商品分组表';



# Dump of table ns_virtual_goods_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ns_virtual_goods_type`;

CREATE TABLE `ns_virtual_goods_type` (
  `virtual_goods_type_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '虚拟商品类型id',
  `virtual_goods_group_id` int(11) NOT NULL COMMENT '关联虚拟商品分组id',
  `virtual_goods_type_name` varchar(255) NOT NULL COMMENT '虚拟商品类型名称',
  `validity_period` int(11) NOT NULL DEFAULT 0 COMMENT '有效期/天(0表示不限制)',
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用0：禁用，1启用（禁用后要查询关联的虚拟商品给予弹出确认提示框，确认后将商品下架）',
  `money` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '金额',
  `config_info` varchar(1000) NOT NULL COMMENT '配置信息（API接口、参数等）',
  `confine_use_number` int(11) NOT NULL DEFAULT 0 COMMENT '限制使用次数',
  `shop_id` int(11) NOT NULL COMMENT '店铺id',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`virtual_goods_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sys_addons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_addons`;

CREATE TABLE `sys_addons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL COMMENT '插件名或标识',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '中文名',
  `description` text DEFAULT NULL COMMENT '插件描述',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态',
  `config` text DEFAULT NULL COMMENT '配置',
  `author` varchar(40) DEFAULT '' COMMENT '作者',
  `version` varchar(20) DEFAULT '' COMMENT '版本号',
  `has_adminlist` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否有后台列表',
  `has_addonslist` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否有插件列表',
  `content` text NOT NULL COMMENT '详情',
  `config_hook` varchar(255) NOT NULL DEFAULT '' COMMENT '自定义配置文件钩子',
  `create_time` int(11) DEFAULT 0 COMMENT '安装时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

LOCK TABLES `sys_addons` WRITE;
/*!40000 ALTER TABLE `sys_addons` DISABLE KEYS */;

INSERT INTO `sys_addons` (`id`, `name`, `title`, `description`, `status`, `config`, `author`, `version`, `has_adminlist`, `has_addonslist`, `content`, `config_hook`, `create_time`)
VALUES
	(1,'wxtemplatemsg','微信模板消息','微信模板消息',1,'[]','ushop','1.0',0,0,'','wxtemplatemsg',1513009736);

/*!40000 ALTER TABLE `sys_addons` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_addons_weixin_template_msg
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_addons_weixin_template_msg`;

CREATE TABLE `sys_addons_weixin_template_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL COMMENT '店铺id（单店版为0）',
  `template_no` varchar(55) NOT NULL COMMENT '模版编号',
  `template_id` varbinary(55) DEFAULT NULL COMMENT '微信模板消息的ID',
  `title` varchar(100) NOT NULL COMMENT '模版标题',
  `is_enable` tinyint(4) NOT NULL DEFAULT 1 COMMENT '是否启用',
  `headtext` varchar(255) NOT NULL COMMENT '头部文字',
  `bottomtext` varchar(255) NOT NULL COMMENT '底部文字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='微信实例消息';

LOCK TABLES `sys_addons_weixin_template_msg` WRITE;
/*!40000 ALTER TABLE `sys_addons_weixin_template_msg` DISABLE KEYS */;

INSERT INTO `sys_addons_weixin_template_msg` (`id`, `instance_id`, `template_no`, `template_id`, `title`, `is_enable`, `headtext`, `bottomtext`)
VALUES
	(1,0,'OPENTM203347141','','会员注册成功通知',1,'恭喜，您已成功注册为会员！','恭喜，您已成为会员，您将享受会员所有权利！'),
	(2,0,'OPENTM200444240','','订单提交成功通知',1,'亲！您已成功创建订单，点击进入完成付款。','感谢您的支持，我们将为您提供更好的服务。'),
	(3,0,'OPENTM201541214','','订单发货通知',1,'亲，你的订单已发货','请关注订单,注意查收'),
	(4,0,'OPENTM200444326','','订单付款成功通知',1,'亲！您的订单已成功付款。',''),
	(5,0,'OPENTM207103254','','退款申请',1,'您已申请退款，我们将尽快处理您提交的退款申请。您可以在“退换货”中查看退款进度','如您的退款有疑问，请联系我们的客服人员，帮助您解决处理！'),
	(6,0,'OPENTM205986235','','退款结果通知',1,'亲，您的退款已处理。','如您还有疑问，请与客服人员联系。'),
	(7,0,'OPENTM207292959','','提现申请提醒',1,'亲，您的提现申请已提交','我们将在1到3个工作日内处理完毕，请耐心等待。'),
	(8,0,'OPENTM400094285','','提现审核结果通知',1,'亲，您提现申请已通过','我们将在1到3个工作日内处理完毕，请耐心等待。'),
	(9,0,'OPENTM409846856','','申请通过通知',1,'您的推广员申请已经通过','如您还有疑问，请与客服人员联系。'),
	(10,0,'OPENTM409846856','','下级申请通过通知',1,'您的下级推广员申请已经通过','如您还有疑问，请与客服人员联系。'),
	(11,0,'OPENTM409846856','','下下级申请通过通知',1,'您的下下级推广员申请已经通过','如您还有疑问，请与客服人员联系。'),
	(12,0,'OPENTM201010537','','本店分销订单提成通知',1,'亲，您已成功分销出一笔订单，继续努力哦',''),
	(13,0,'OPENTM201010537','','下级分店分销订单提成通知',1,'亲，您的下级推广员成功分销出一笔订单，继续努力哦',''),
	(14,0,'OPENTM201010537','','下下级分店分销订单提成通知',1,'亲，您的下下级推广员成功分销出一笔订单，继续努力哦','');

/*!40000 ALTER TABLE `sys_addons_weixin_template_msg` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_album_class
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_album_class`;

CREATE TABLE `sys_album_class` (
  `album_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册id',
  `shop_id` int(10) NOT NULL DEFAULT 1 COMMENT '店铺id',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '上级相册ID',
  `album_name` varchar(100) NOT NULL COMMENT '相册名称',
  `album_cover` varchar(255) NOT NULL DEFAULT '' COMMENT '相册封面',
  `is_default` tinyint(1) unsigned NOT NULL DEFAULT 0 COMMENT '是否为默认相册,1代表默认',
  `sort` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`album_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='相册表';

LOCK TABLES `sys_album_class` WRITE;
/*!40000 ALTER TABLE `sys_album_class` DISABLE KEYS */;

INSERT INTO `sys_album_class` (`album_id`, `shop_id`, `pid`, `album_name`, `album_cover`, `is_default`, `sort`, `create_time`)
VALUES
	(30,0,0,'默认相册','0',1,1,1497064831);

/*!40000 ALTER TABLE `sys_album_class` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_album_picture
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_album_picture`;

CREATE TABLE `sys_album_picture` (
  `pic_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '相册图片表id',
  `shop_id` int(10) unsigned DEFAULT 1 COMMENT '所属实例id',
  `album_id` int(10) unsigned NOT NULL COMMENT '相册id',
  `is_wide` int(11) NOT NULL DEFAULT 0 COMMENT '是否宽屏',
  `pic_name` varchar(100) NOT NULL COMMENT '图片名称',
  `pic_tag` varchar(255) NOT NULL DEFAULT '' COMMENT '图片标签',
  `pic_cover` varchar(255) NOT NULL COMMENT '原图图片路径',
  `pic_size` varchar(255) NOT NULL COMMENT '原图大小',
  `pic_spec` varchar(100) NOT NULL COMMENT '原图规格',
  `pic_cover_big` varchar(255) NOT NULL DEFAULT '' COMMENT '大图路径',
  `pic_size_big` varchar(255) NOT NULL DEFAULT '0' COMMENT '大图大小',
  `pic_spec_big` varchar(100) NOT NULL DEFAULT '' COMMENT '大图规格',
  `pic_cover_mid` varchar(255) NOT NULL DEFAULT '' COMMENT '中图路径',
  `pic_size_mid` varchar(255) NOT NULL DEFAULT '0' COMMENT '中图大小',
  `pic_spec_mid` varchar(100) NOT NULL DEFAULT '' COMMENT '中图规格',
  `pic_cover_small` varchar(255) NOT NULL DEFAULT '' COMMENT '小图路径',
  `pic_size_small` varchar(255) NOT NULL DEFAULT '0' COMMENT '小图大小',
  `pic_spec_small` varchar(255) NOT NULL DEFAULT '' COMMENT '小图规格',
  `pic_cover_micro` varchar(255) NOT NULL DEFAULT '' COMMENT '微图路径',
  `pic_size_micro` varchar(255) NOT NULL DEFAULT '0' COMMENT '微图大小',
  `pic_spec_micro` varchar(255) NOT NULL DEFAULT '' COMMENT '微图规格',
  `upload_time` int(11) DEFAULT 0 COMMENT '图片上传时间',
  `upload_type` int(11) DEFAULT 1 COMMENT '图片外链',
  `domain` varchar(255) DEFAULT '' COMMENT '图片外链',
  `bucket` varchar(255) DEFAULT '' COMMENT '存储空间名称',
  PRIMARY KEY (`pic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=204 COMMENT='相册图片表';

LOCK TABLES `sys_album_picture` WRITE;
/*!40000 ALTER TABLE `sys_album_picture` DISABLE KEYS */;

INSERT INTO `sys_album_picture` (`pic_id`, `shop_id`, `album_id`, `is_wide`, `pic_name`, `pic_tag`, `pic_cover`, `pic_size`, `pic_spec`, `pic_cover_big`, `pic_size_big`, `pic_spec_big`, `pic_cover_mid`, `pic_size_mid`, `pic_spec_mid`, `pic_cover_small`, `pic_size_small`, `pic_spec_small`, `pic_cover_micro`, `pic_size_micro`, `pic_spec_micro`, `upload_time`, `upload_type`, `domain`, `bucket`)
VALUES
	(1,0,30,0,'11499330924','1','upload/goods/11499330924.jpg','350,350','350,350','upload/goods/149933092411.jpg','700,700','700,700','upload/goods/149933092412.jpg','360,360','360,360','upload/goods/149933092413.jpg','240,240','240,240','upload/goods/149933092414.jpg','60,60','60,60',1499330924,1,'',''),
	(2,0,30,0,'21499330928','2','upload/goods/21499330928.jpg','350,350','350,350','upload/goods/149933092821.jpg','700,700','700,700','upload/goods/149933092822.jpg','360,360','360,360','upload/goods/149933092823.jpg','240,240','240,240','upload/goods/149933092824.jpg','60,60','60,60',1499330929,1,'',''),
	(3,0,30,0,'31499330933','3','upload/goods/31499330933.jpg','350,350','350,350','upload/goods/149933093331.jpg','700,700','700,700','upload/goods/149933093332.jpg','360,360','360,360','upload/goods/149933093333.jpg','240,240','240,240','upload/goods/149933093334.jpg','60,60','60,60',1499330933,1,'',''),
	(4,0,30,0,'21499330996','2','upload/goods/21499330996.jpg','350,350','350,350','upload/goods/149933099621.jpg','700,700','700,700','upload/goods/149933099622.jpg','360,360','360,360','upload/goods/149933099623.jpg','240,240','240,240','upload/goods/149933099624.jpg','60,60','60,60',1499330996,1,'',''),
	(5,0,30,0,'41499331769','4','upload/goods/41499331769.jpg','350,350','350,350','upload/goods/149933176941.jpg','700,700','700,700','upload/goods/149933176942.jpg','360,360','360,360','upload/goods/149933176943.jpg','240,240','240,240','upload/goods/149933176944.jpg','60,60','60,60',1499331769,1,'',''),
	(6,0,30,0,'61499331772','6','upload/goods/61499331772.jpg','350,350','350,350','upload/goods/149933177261.jpg','700,700','700,700','upload/goods/149933177262.jpg','360,360','360,360','upload/goods/149933177263.jpg','240,240','240,240','upload/goods/149933177264.jpg','60,60','60,60',1499331772,1,'',''),
	(7,0,30,0,'51499331775','5','upload/goods/51499331775.jpg','350,350','350,350','upload/goods/149933177551.jpg','700,700','700,700','upload/goods/149933177552.jpg','360,360','360,360','upload/goods/149933177553.jpg','240,240','240,240','upload/goods/149933177554.jpg','60,60','60,60',1499331775,1,'',''),
	(8,0,30,0,'11499333687','1','upload/goods/11499333687.jpg','800,800','800,800','upload/goods/149933368711.jpg','700,700','700,700','upload/goods/149933368712.jpg','360,360','360,360','upload/goods/149933368713.jpg','240,240','240,240','upload/goods/149933368714.jpg','60,60','60,60',1499333688,1,'',''),
	(9,0,30,0,'21499333690','2','upload/goods/21499333690.jpg','800,800','800,800','upload/goods/149933369021.jpg','700,700','700,700','upload/goods/149933369022.jpg','360,360','360,360','upload/goods/149933369023.jpg','240,240','240,240','upload/goods/149933369024.jpg','60,60','60,60',1499333691,1,'',''),
	(10,0,30,0,'31499333693','3','upload/goods/31499333693.jpg','800,1200','800,1200','upload/goods/149933369331.jpg','700,700','700,700','upload/goods/149933369332.jpg','360,360','360,360','upload/goods/149933369333.jpg','240,240','240,240','upload/goods/149933369334.jpg','60,60','60,60',1499333694,1,'',''),
	(11,0,30,0,'41499333696','4','upload/goods/41499333696.jpg','800,800','800,800','upload/goods/149933369641.jpg','700,700','700,700','upload/goods/149933369642.jpg','360,360','360,360','upload/goods/149933369643.jpg','240,240','240,240','upload/goods/149933369644.jpg','60,60','60,60',1499333697,1,'',''),
	(12,0,30,0,'51499333698','5','upload/goods/51499333698.jpg','800,800','800,800','upload/goods/149933369851.jpg','700,700','700,700','upload/goods/149933369852.jpg','360,360','360,360','upload/goods/149933369853.jpg','240,240','240,240','upload/goods/149933369854.jpg','60,60','60,60',1499333699,1,'',''),
	(13,0,30,0,'61499333939','6','upload/goods/61499333939.jpg','1061,1061','1061,1061','upload/goods/149933393961.jpg','700,700','700,700','upload/goods/149933393962.jpg','360,360','360,360','upload/goods/149933393963.jpg','240,240','240,240','upload/goods/149933393964.jpg','60,60','60,60',1499333940,1,'',''),
	(14,0,30,0,'71499333942','7','upload/goods/71499333942.jpg','1061,1061','1061,1061','upload/goods/149933394271.jpg','700,700','700,700','upload/goods/149933394272.jpg','360,360','360,360','upload/goods/149933394273.jpg','240,240','240,240','upload/goods/149933394274.jpg','60,60','60,60',1499333943,1,'',''),
	(15,0,30,0,'81499333945','8','upload/goods/81499333945.jpg','1061,1061','1061,1061','upload/goods/149933394581.jpg','700,700','700,700','upload/goods/149933394582.jpg','360,360','360,360','upload/goods/149933394583.jpg','240,240','240,240','upload/goods/149933394584.jpg','60,60','60,60',1499333946,1,'',''),
	(16,0,30,0,'91499333948','9','upload/goods/91499333948.jpg','569,854','569,854','upload/goods/149933394891.jpg','700,700','700,700','upload/goods/149933394892.jpg','360,360','360,360','upload/goods/149933394893.jpg','240,240','240,240','upload/goods/149933394894.jpg','60,60','60,60',1499333949,1,'',''),
	(17,0,30,0,'a1499334208','a','upload/goods/a1499334208.jpg','800,800','800,800','upload/goods/1499334209a1.jpg','700,700','700,700','upload/goods/1499334209a2.jpg','360,360','360,360','upload/goods/1499334209a3.jpg','240,240','240,240','upload/goods/1499334209a4.jpg','60,60','60,60',1499334209,1,'',''),
	(18,0,30,0,'b1499334212','b','upload/goods/b1499334212.jpg','800,800','800,800','upload/goods/1499334212b1.jpg','700,700','700,700','upload/goods/1499334212b2.jpg','360,360','360,360','upload/goods/1499334212b3.jpg','240,240','240,240','upload/goods/1499334212b4.jpg','60,60','60,60',1499334213,1,'',''),
	(19,0,30,0,'c1499334215','c','upload/goods/c1499334215.jpg','800,800','800,800','upload/goods/1499334215c1.jpg','700,700','700,700','upload/goods/1499334215c2.jpg','360,360','360,360','upload/goods/1499334215c3.jpg','240,240','240,240','upload/goods/1499334215c4.jpg','60,60','60,60',1499334216,1,'',''),
	(20,0,30,0,'101499334421','10','upload/goods/101499334421.jpg','800,800','800,800','upload/goods/1499334421101.jpg','700,700','700,700','upload/goods/1499334421102.jpg','360,360','360,360','upload/goods/1499334421103.jpg','240,240','240,240','upload/goods/1499334421104.jpg','60,60','60,60',1499334422,1,'',''),
	(21,0,30,0,'111499334425','11','upload/goods/111499334425.jpg','800,800','800,800','upload/goods/1499334425111.jpg','700,700','700,700','upload/goods/1499334425112.jpg','360,360','360,360','upload/goods/1499334425113.jpg','240,240','240,240','upload/goods/1499334425114.jpg','60,60','60,60',1499334425,1,'',''),
	(22,0,30,0,'121499334427','12','upload/goods/121499334427.jpg','800,800','800,800','upload/goods/1499334428121.jpg','700,700','700,700','upload/goods/1499334428122.jpg','360,360','360,360','upload/goods/1499334428123.jpg','240,240','240,240','upload/goods/1499334428124.jpg','60,60','60,60',1499334428,1,'',''),
	(23,0,30,0,'131499334430','13','upload/goods/131499334430.jpg','800,800','800,800','upload/goods/1499334430131.jpg','700,700','700,700','upload/goods/1499334430132.jpg','360,360','360,360','upload/goods/1499334430133.jpg','240,240','240,240','upload/goods/1499334430134.jpg','60,60','60,60',1499334431,1,'',''),
	(24,0,30,0,'141499334650','14','upload/goods/141499334650.jpg','2736,2736','2736,2736','upload/goods/1499334650141.jpg','700,700','700,700','upload/goods/1499334650142.jpg','360,360','360,360','upload/goods/1499334650143.jpg','240,240','240,240','upload/goods/1499334650144.jpg','60,60','60,60',1499334651,1,'',''),
	(25,0,30,0,'151499334654','15','upload/goods/151499334654.jpg','800,800','800,800','upload/goods/1499334654151.jpg','700,700','700,700','upload/goods/1499334654152.jpg','360,360','360,360','upload/goods/1499334654153.jpg','240,240','240,240','upload/goods/1499334654154.jpg','60,60','60,60',1499334655,1,'',''),
	(26,0,30,0,'161499334768','16','upload/goods/161499334768.jpg','800,800','800,800','upload/goods/1499334768161.jpg','700,700','700,700','upload/goods/1499334768162.jpg','360,360','360,360','upload/goods/1499334768163.jpg','240,240','240,240','upload/goods/1499334768164.jpg','60,60','60,60',1499334768,1,'',''),
	(27,0,30,0,'171499334771','17','upload/goods/171499334771.jpg','800,800','800,800','upload/goods/1499334771171.jpg','700,700','700,700','upload/goods/1499334771172.jpg','360,360','360,360','upload/goods/1499334771173.jpg','240,240','240,240','upload/goods/1499334771174.jpg','60,60','60,60',1499334772,1,'',''),
	(28,0,30,0,'181499334774','18','upload/goods/181499334774.jpg','800,800','800,800','upload/goods/1499334774181.jpg','700,700','700,700','upload/goods/1499334774182.jpg','360,360','360,360','upload/goods/1499334774183.jpg','240,240','240,240','upload/goods/1499334774184.jpg','60,60','60,60',1499334775,1,'',''),
	(29,0,30,0,'191499334986','19','upload/goods/191499334986.jpg','800,800','800,800','upload/goods/1499334986191.jpg','700,700','700,700','upload/goods/1499334986192.jpg','360,360','360,360','upload/goods/1499334986193.jpg','240,240','240,240','upload/goods/1499334986194.jpg','60,60','60,60',1499334987,1,'',''),
	(30,0,30,0,'201499334989','20','upload/goods/201499334989.jpg','800,800','800,800','upload/goods/1499334989201.jpg','700,700','700,700','upload/goods/1499334989202.jpg','360,360','360,360','upload/goods/1499334989203.jpg','240,240','240,240','upload/goods/1499334989204.jpg','60,60','60,60',1499334990,1,'',''),
	(31,0,30,0,'211499334991','21','upload/goods/211499334991.jpg','800,1200','800,1200','upload/goods/1499334991211.jpg','700,700','700,700','upload/goods/1499334991212.jpg','360,360','360,360','upload/goods/1499334991213.jpg','240,240','240,240','upload/goods/1499334991214.jpg','60,60','60,60',1499334992,1,'',''),
	(32,0,30,0,'221499335187','22','upload/goods/221499335187.jpg','800,800','800,800','upload/goods/1499335187221.jpg','700,700','700,700','upload/goods/1499335187222.jpg','360,360','360,360','upload/goods/1499335187223.jpg','240,240','240,240','upload/goods/1499335187224.jpg','60,60','60,60',1499335188,1,'',''),
	(33,0,30,0,'231499335191','23','upload/goods/231499335191.jpg','800,800','800,800','upload/goods/1499335191231.jpg','700,700','700,700','upload/goods/1499335191232.jpg','360,360','360,360','upload/goods/1499335191233.jpg','240,240','240,240','upload/goods/1499335191234.jpg','60,60','60,60',1499335192,1,'',''),
	(34,0,30,0,'241499335194','24','upload/goods/241499335194.jpg','800,800','800,800','upload/goods/1499335194241.jpg','700,700','700,700','upload/goods/1499335194242.jpg','360,360','360,360','upload/goods/1499335194243.jpg','240,240','240,240','upload/goods/1499335194244.jpg','60,60','60,60',1499335194,1,'',''),
	(35,0,30,0,'251499335196','25','upload/goods/251499335196.jpg','800,800','800,800','upload/goods/1499335196251.jpg','700,700','700,700','upload/goods/1499335196252.jpg','360,360','360,360','upload/goods/1499335196253.jpg','240,240','240,240','upload/goods/1499335196254.jpg','60,60','60,60',1499335196,1,'',''),
	(36,0,30,0,'261499335392','26','upload/goods/261499335392.jpg','800,800','800,800','upload/goods/1499335392261.jpg','700,700','700,700','upload/goods/1499335392262.jpg','360,360','360,360','upload/goods/1499335392263.jpg','240,240','240,240','upload/goods/1499335392264.jpg','60,60','60,60',1499335392,1,'',''),
	(37,0,30,0,'271499335523','27','upload/goods/271499335523.jpg','1200,1200','1200,1200','upload/goods/1499335523271.jpg','700,700','700,700','upload/goods/1499335523272.jpg','360,360','360,360','upload/goods/1499335523273.jpg','240,240','240,240','upload/goods/1499335523274.jpg','60,60','60,60',1499335523,1,'',''),
	(38,0,30,0,'281499335525','28','upload/goods/281499335525.jpg','1200,1200','1200,1200','upload/goods/1499335526281.jpg','700,700','700,700','upload/goods/1499335526282.jpg','360,360','360,360','upload/goods/1499335526283.jpg','240,240','240,240','upload/goods/1499335526284.jpg','60,60','60,60',1499335526,1,'',''),
	(39,0,30,0,'291499335528','29','upload/goods/291499335528.jpg','1200,1200','1200,1200','upload/goods/1499335528291.jpg','700,700','700,700','upload/goods/1499335528292.jpg','360,360','360,360','upload/goods/1499335528293.jpg','240,240','240,240','upload/goods/1499335528294.jpg','60,60','60,60',1499335528,1,'',''),
	(40,0,30,0,'301499335530','30','upload/goods/301499335530.jpg','1200,1200','1200,1200','upload/goods/1499335530301.jpg','700,700','700,700','upload/goods/1499335530302.jpg','360,360','360,360','upload/goods/1499335530303.jpg','240,240','240,240','upload/goods/1499335530304.jpg','60,60','60,60',1499335531,1,'',''),
	(41,0,30,0,'311499335717','31','upload/goods/311499335717.jpg','1200,1200','1200,1200','upload/goods/1499335717311.jpg','700,700','700,700','upload/goods/1499335717312.jpg','360,360','360,360','upload/goods/1499335717313.jpg','240,240','240,240','upload/goods/1499335717314.jpg','60,60','60,60',1499335717,1,'',''),
	(42,0,30,0,'321499335720','32','upload/goods/321499335720.jpg','1200,1200','1200,1200','upload/goods/1499335720321.jpg','700,700','700,700','upload/goods/1499335720322.jpg','360,360','360,360','upload/goods/1499335720323.jpg','240,240','240,240','upload/goods/1499335720324.jpg','60,60','60,60',1499335721,1,'',''),
	(43,0,30,0,'331499335722','33','upload/goods/331499335722.jpg','1200,1200','1200,1200','upload/goods/1499335722331.jpg','700,700','700,700','upload/goods/1499335722332.jpg','360,360','360,360','upload/goods/1499335722333.jpg','240,240','240,240','upload/goods/1499335722334.jpg','60,60','60,60',1499335723,1,'',''),
	(44,0,30,0,'aa1499335874','aa','upload/goods/aa1499335874.jpg','800,800','800,800','upload/goods/1499335874aa1.jpg','700,700','700,700','upload/goods/1499335874aa2.jpg','360,360','360,360','upload/goods/1499335874aa3.jpg','240,240','240,240','upload/goods/1499335874aa4.jpg','60,60','60,60',1499335875,1,'',''),
	(45,0,30,0,'bb1499335877','bb','upload/goods/bb1499335877.jpg','800,800','800,800','upload/goods/1499335877bb1.jpg','700,700','700,700','upload/goods/1499335877bb2.jpg','360,360','360,360','upload/goods/1499335877bb3.jpg','240,240','240,240','upload/goods/1499335877bb4.jpg','60,60','60,60',1499335878,1,'',''),
	(46,0,30,0,'341499336226','34','upload/goods/341499336226.jpg','900,900','900,900','upload/goods/1499336226341.jpg','700,700','700,700','upload/goods/1499336226342.jpg','360,360','360,360','upload/goods/1499336226343.jpg','240,240','240,240','upload/goods/1499336226344.jpg','60,60','60,60',1499336226,1,'',''),
	(47,0,30,0,'351499336230','35','upload/goods/351499336230.jpg','800,800','800,800','upload/goods/1499336230351.jpg','700,700','700,700','upload/goods/1499336230352.jpg','360,360','360,360','upload/goods/1499336230353.jpg','240,240','240,240','upload/goods/1499336230354.jpg','60,60','60,60',1499336231,1,'',''),
	(48,0,30,0,'361499336313','36','upload/goods/361499336313.jpg','750,1101','750,1101','upload/goods/1499336313361.jpg','700,700','700,700','upload/goods/1499336313362.jpg','360,360','360,360','upload/goods/1499336313363.jpg','240,240','240,240','upload/goods/1499336313364.jpg','60,60','60,60',1499336314,1,'',''),
	(49,0,30,0,'371499336316','37','upload/goods/371499336316.jpg','750,1109','750,1109','upload/goods/1499336316371.jpg','700,700','700,700','upload/goods/1499336316372.jpg','360,360','360,360','upload/goods/1499336316373.jpg','240,240','240,240','upload/goods/1499336316374.jpg','60,60','60,60',1499336317,1,'',''),
	(50,0,30,0,'381499336318','38','upload/goods/381499336318.jpg','750,499','750,499','upload/goods/1499336319381.jpg','700,700','700,700','upload/goods/1499336319382.jpg','360,360','360,360','upload/goods/1499336319383.jpg','240,240','240,240','upload/goods/1499336319384.jpg','60,60','60,60',1499336319,1,'',''),
	(51,0,30,0,'391499336531','39','upload/goods/391499336531.jpg','430,430','430,430','upload/goods/1499336531391.jpg','700,700','700,700','upload/goods/1499336531392.jpg','360,360','360,360','upload/goods/1499336531393.jpg','240,240','240,240','upload/goods/1499336531394.jpg','60,60','60,60',1499336531,1,'',''),
	(52,0,30,0,'dd1499336650','dd','upload/goods/dd1499336650.jpg','750,750','750,750','upload/goods/1499336650dd1.jpg','700,700','700,700','upload/goods/1499336650dd2.jpg','360,360','360,360','upload/goods/1499336650dd3.jpg','240,240','240,240','upload/goods/1499336650dd4.jpg','60,60','60,60',1499336651,1,'',''),
	(53,0,30,0,'ee1499336653','ee','upload/goods/ee1499336653.jpg','750,750','750,750','upload/goods/1499336653ee1.jpg','700,700','700,700','upload/goods/1499336653ee2.jpg','360,360','360,360','upload/goods/1499336653ee3.jpg','240,240','240,240','upload/goods/1499336653ee4.jpg','60,60','60,60',1499336653,1,'',''),
	(54,0,30,0,'ff1499336656','ff','upload/goods/ff1499336656.jpg','750,1125','750,1125','upload/goods/1499336656ff1.jpg','700,700','700,700','upload/goods/1499336656ff2.jpg','360,360','360,360','upload/goods/1499336656ff3.jpg','240,240','240,240','upload/goods/1499336656ff4.jpg','60,60','60,60',1499336656,1,'',''),
	(55,0,30,0,'cc1499336674','cc','upload/goods/cc1499336674.jpg','750,750','750,750','upload/goods/1499336674cc1.jpg','700,700','700,700','upload/goods/1499336674cc2.jpg','360,360','360,360','upload/goods/1499336674cc3.jpg','240,240','240,240','upload/goods/1499336674cc4.jpg','60,60','60,60',1499336674,1,'',''),
	(56,0,30,0,'401499336749','40','upload/goods/401499336749.jpg','750,766','750,766','upload/goods/1499336749401.jpg','700,700','700,700','upload/goods/1499336749402.jpg','360,360','360,360','upload/goods/1499336749403.jpg','240,240','240,240','upload/goods/1499336749404.jpg','60,60','60,60',1499336749,1,'',''),
	(57,0,30,0,'411499336751','41','upload/goods/411499336751.jpg','800,800','800,800','upload/goods/1499336751411.jpg','700,700','700,700','upload/goods/1499336751412.jpg','360,360','360,360','upload/goods/1499336751413.jpg','240,240','240,240','upload/goods/1499336751414.jpg','60,60','60,60',1499336752,1,'',''),
	(58,0,30,0,'461499336875','46','upload/goods/461499336875.jpg','750,1127','750,1127','upload/goods/1499336875461.jpg','700,700','700,700','upload/goods/1499336875462.jpg','360,360','360,360','upload/goods/1499336875463.jpg','240,240','240,240','upload/goods/1499336875464.jpg','60,60','60,60',1499336876,1,'',''),
	(59,0,30,0,'451499336878','45','upload/goods/451499336878.jpg','750,499','750,499','upload/goods/1499336878451.jpg','700,700','700,700','upload/goods/1499336878452.jpg','360,360','360,360','upload/goods/1499336878453.jpg','240,240','240,240','upload/goods/1499336878454.jpg','60,60','60,60',1499336879,1,'',''),
	(60,0,30,0,'431499336881','43','upload/goods/431499336881.jpg','750,1127','750,1127','upload/goods/1499336881431.jpg','700,700','700,700','upload/goods/1499336881432.jpg','360,360','360,360','upload/goods/1499336881433.jpg','240,240','240,240','upload/goods/1499336881434.jpg','60,60','60,60',1499336882,1,'',''),
	(61,0,30,0,'441499336884','44','upload/goods/441499336884.jpg','750,1127','750,1127','upload/goods/1499336884441.jpg','700,700','700,700','upload/goods/1499336884442.jpg','360,360','360,360','upload/goods/1499336884443.jpg','240,240','240,240','upload/goods/1499336884444.jpg','60,60','60,60',1499336884,1,'',''),
	(62,0,30,0,'491499337144','49','upload/goods/491499337144.jpg','800,800','800,800','upload/goods/1499337144491.jpg','700,700','700,700','upload/goods/1499337144492.jpg','360,360','360,360','upload/goods/1499337144493.jpg','240,240','240,240','upload/goods/1499337144494.jpg','60,60','60,60',1499337145,1,'',''),
	(63,0,30,0,'481499337148','48','upload/goods/481499337148.jpg','800,800','800,800','upload/goods/1499337148481.jpg','700,700','700,700','upload/goods/1499337148482.jpg','360,360','360,360','upload/goods/1499337148483.jpg','240,240','240,240','upload/goods/1499337148484.jpg','60,60','60,60',1499337148,1,'',''),
	(64,0,30,0,'471499337151','47','upload/goods/471499337151.jpg','800,800','800,800','upload/goods/1499337151471.jpg','700,700','700,700','upload/goods/1499337151472.jpg','360,360','360,360','upload/goods/1499337151473.jpg','240,240','240,240','upload/goods/1499337151474.jpg','60,60','60,60',1499337152,1,'',''),
	(65,0,30,0,'501499337357','50','upload/goods/501499337357.jpg','800,800','800,800','upload/goods/1499337357501.jpg','700,700','700,700','upload/goods/1499337357502.jpg','360,360','360,360','upload/goods/1499337357503.jpg','240,240','240,240','upload/goods/1499337357504.jpg','60,60','60,60',1499337358,1,'',''),
	(66,0,30,0,'511499337361','51','upload/goods/511499337361.jpg','800,800','800,800','upload/goods/1499337361511.jpg','700,700','700,700','upload/goods/1499337361512.jpg','360,360','360,360','upload/goods/1499337361513.jpg','240,240','240,240','upload/goods/1499337361514.jpg','60,60','60,60',1499337361,1,'',''),
	(67,0,30,0,'521499337364','52','upload/goods/521499337364.jpg','800,800','800,800','upload/goods/1499337364521.jpg','700,700','700,700','upload/goods/1499337364522.jpg','360,360','360,360','upload/goods/1499337364523.jpg','240,240','240,240','upload/goods/1499337364524.jpg','60,60','60,60',1499337365,1,'',''),
	(68,0,30,0,'531499337507','53','upload/goods/531499337507.jpg','800,800','800,800','upload/goods/1499337507531.jpg','700,700','700,700','upload/goods/1499337507532.jpg','360,360','360,360','upload/goods/1499337507533.jpg','240,240','240,240','upload/goods/1499337507534.jpg','60,60','60,60',1499337507,1,'',''),
	(69,0,30,0,'541499337509','54','upload/goods/541499337509.jpg','800,800','800,800','upload/goods/1499337509541.jpg','700,700','700,700','upload/goods/1499337509542.jpg','360,360','360,360','upload/goods/1499337509543.jpg','240,240','240,240','upload/goods/1499337509544.jpg','60,60','60,60',1499337510,1,'',''),
	(70,0,30,0,'561499337616','56','upload/goods/561499337616.jpg','800,800','800,800','upload/goods/1499337616561.jpg','700,700','700,700','upload/goods/1499337616562.jpg','360,360','360,360','upload/goods/1499337616563.jpg','240,240','240,240','upload/goods/1499337616564.jpg','60,60','60,60',1499337616,1,'',''),
	(71,0,30,0,'551499337619','55','upload/goods/551499337619.jpg','800,800','800,800','upload/goods/1499337619551.jpg','700,700','700,700','upload/goods/1499337619552.jpg','360,360','360,360','upload/goods/1499337619553.jpg','240,240','240,240','upload/goods/1499337619554.jpg','60,60','60,60',1499337619,1,'',''),
	(72,0,30,0,'581499337714','58','upload/goods/581499337714.jpg','800,800','800,800','upload/goods/1499337715581.jpg','700,700','700,700','upload/goods/1499337715582.jpg','360,360','360,360','upload/goods/1499337715583.jpg','240,240','240,240','upload/goods/1499337715584.jpg','60,60','60,60',1499337715,1,'',''),
	(73,0,30,0,'571499337717','57','upload/goods/571499337717.jpg','640,640','640,640','upload/goods/1499337717571.jpg','700,700','700,700','upload/goods/1499337717572.jpg','360,360','360,360','upload/goods/1499337717573.jpg','240,240','240,240','upload/goods/1499337717574.jpg','60,60','60,60',1499337718,1,'',''),
	(74,0,30,0,'611499337825','61','upload/goods/611499337825.jpg','1000,1000','1000,1000','upload/goods/1499337825611.jpg','700,700','700,700','upload/goods/1499337825612.jpg','360,360','360,360','upload/goods/1499337825613.jpg','240,240','240,240','upload/goods/1499337825614.jpg','60,60','60,60',1499337826,1,'',''),
	(75,0,30,0,'621499337828','62','upload/goods/621499337828.jpg','1000,1000','1000,1000','upload/goods/1499337828621.jpg','700,700','700,700','upload/goods/1499337828622.jpg','360,360','360,360','upload/goods/1499337828623.jpg','240,240','240,240','upload/goods/1499337828624.jpg','60,60','60,60',1499337828,1,'',''),
	(76,0,30,0,'641499338179','64','upload/goods/641499338179.jpg','796,800','796,800','upload/goods/1499338179641.jpg','700,700','700,700','upload/goods/1499338179642.jpg','360,360','360,360','upload/goods/1499338179643.jpg','240,240','240,240','upload/goods/1499338179644.jpg','60,60','60,60',1499338179,1,'',''),
	(77,0,30,0,'631499338183','63','upload/goods/631499338183.jpg','800,800','800,800','upload/goods/1499338183631.jpg','700,700','700,700','upload/goods/1499338183632.jpg','360,360','360,360','upload/goods/1499338183633.jpg','240,240','240,240','upload/goods/1499338183634.jpg','60,60','60,60',1499338184,1,'',''),
	(78,0,30,0,'651499338515','65','upload/goods/651499338515.jpg','800,800','800,800','upload/goods/1499338515651.jpg','700,700','700,700','upload/goods/1499338515652.jpg','360,360','360,360','upload/goods/1499338515653.jpg','240,240','240,240','upload/goods/1499338515654.jpg','60,60','60,60',1499338516,1,'',''),
	(79,0,30,0,'661499338519','66','upload/goods/661499338519.png','1200,1200','1200,1200','upload/goods/1499338519661.png','700,700','700,700','upload/goods/1499338519662.png','360,360','360,360','upload/goods/1499338519663.png','240,240','240,240','upload/goods/1499338519664.png','60,60','60,60',1499338521,1,'',''),
	(80,0,30,0,'661499339257','66','upload/goods/661499339257.png','1200,1200','1200,1200','upload/goods/1499339257661.png','700,700','700,700','upload/goods/1499339257662.png','360,360','360,360','upload/goods/1499339257663.png','240,240','240,240','upload/goods/1499339257664.png','60,60','60,60',1499339259,1,'',''),
	(81,0,30,0,'671499339261','67','upload/goods/671499339261.jpg','800,800','800,800','upload/goods/1499339261671.jpg','700,700','700,700','upload/goods/1499339261672.jpg','360,360','360,360','upload/goods/1499339261673.jpg','240,240','240,240','upload/goods/1499339261674.jpg','60,60','60,60',1499339261,1,'',''),
	(82,0,30,0,'661499339276','66','upload/goods/661499339276.png','1200,1200','1200,1200','upload/goods/1499339276661.png','700,700','700,700','upload/goods/1499339276662.png','360,360','360,360','upload/goods/1499339276663.png','240,240','240,240','upload/goods/1499339276664.png','60,60','60,60',1499339278,1,'',''),
	(83,0,30,0,'661499339283','66','upload/goods/661499339283.jpg','800,800','800,800','upload/goods/1499339283661.jpg','700,700','700,700','upload/goods/1499339283662.jpg','360,360','360,360','upload/goods/1499339283663.jpg','240,240','240,240','upload/goods/1499339283664.jpg','60,60','60,60',1499339284,1,'',''),
	(84,0,30,0,'691499339438','69','upload/goods/691499339438.jpg','800,800','800,800','upload/goods/1499339438691.jpg','700,700','700,700','upload/goods/1499339438692.jpg','360,360','360,360','upload/goods/1499339438693.jpg','240,240','240,240','upload/goods/1499339438694.jpg','60,60','60,60',1499339439,1,'',''),
	(85,0,30,0,'701499339443','70','upload/goods/701499339443.jpg','800,800','800,800','upload/goods/1499339443701.jpg','700,700','700,700','upload/goods/1499339443702.jpg','360,360','360,360','upload/goods/1499339443703.jpg','240,240','240,240','upload/goods/1499339443704.jpg','60,60','60,60',1499339444,1,'',''),
	(86,0,30,0,'751499339583','75','upload/goods/751499339583.jpg','430,430','430,430','upload/goods/1499339583751.jpg','700,700','700,700','upload/goods/1499339583752.jpg','360,360','360,360','upload/goods/1499339583753.jpg','240,240','240,240','upload/goods/1499339583754.jpg','60,60','60,60',1499339583,1,'',''),
	(87,0,30,0,'761499339658','76','upload/goods/761499339658.jpg','800,800','800,800','upload/goods/1499339658761.jpg','700,700','700,700','upload/goods/1499339658762.jpg','360,360','360,360','upload/goods/1499339658763.jpg','240,240','240,240','upload/goods/1499339658764.jpg','60,60','60,60',1499339658,1,'',''),
	(88,0,30,0,'771499339662','77','upload/goods/771499339662.jpg','800,800','800,800','upload/goods/1499339662771.jpg','700,700','700,700','upload/goods/1499339662772.jpg','360,360','360,360','upload/goods/1499339662773.jpg','240,240','240,240','upload/goods/1499339662774.jpg','60,60','60,60',1499339662,1,'',''),
	(89,0,30,0,'801499339873','80','upload/goods/801499339873.jpg','430,430','430,430','upload/goods/1499339873801.jpg','700,700','700,700','upload/goods/1499339873802.jpg','360,360','360,360','upload/goods/1499339873803.jpg','240,240','240,240','upload/goods/1499339873804.jpg','60,60','60,60',1499339874,1,'',''),
	(90,0,30,0,'821499340046','82','upload/goods/821499340046.jpg','430,430','430,430','upload/goods/1499340046821.jpg','700,700','700,700','upload/goods/1499340046822.jpg','360,360','360,360','upload/goods/1499340046823.jpg','240,240','240,240','upload/goods/1499340046824.jpg','60,60','60,60',1499340047,1,'',''),
	(91,0,30,0,'811499340050','81','upload/goods/811499340050.jpg','430,430','430,430','upload/goods/1499340050811.jpg','700,700','700,700','upload/goods/1499340050812.jpg','360,360','360,360','upload/goods/1499340050813.jpg','240,240','240,240','upload/goods/1499340050814.jpg','60,60','60,60',1499340051,1,'',''),
	(92,0,30,0,'831499340182','83','upload/goods/831499340182.jpg','430,430','430,430','upload/goods/1499340182831.jpg','700,700','700,700','upload/goods/1499340182832.jpg','360,360','360,360','upload/goods/1499340182833.jpg','240,240','240,240','upload/goods/1499340182834.jpg','60,60','60,60',1499340182,1,'',''),
	(93,0,30,0,'841499340186','84','upload/goods/841499340186.jpg','430,430','430,430','upload/goods/1499340186841.jpg','700,700','700,700','upload/goods/1499340186842.jpg','360,360','360,360','upload/goods/1499340186843.jpg','240,240','240,240','upload/goods/1499340186844.jpg','60,60','60,60',1499340186,1,'',''),
	(94,0,30,0,'851499340287','85','upload/goods/851499340287.jpg','430,430','430,430','upload/goods/1499340287851.jpg','700,700','700,700','upload/goods/1499340287852.jpg','360,360','360,360','upload/goods/1499340287853.jpg','240,240','240,240','upload/goods/1499340287854.jpg','60,60','60,60',1499340287,1,'',''),
	(95,0,30,0,'861499340398','86','upload/goods/861499340398.jpg','430,430','430,430','upload/goods/1499340398861.jpg','700,700','700,700','upload/goods/1499340398862.jpg','360,360','360,360','upload/goods/1499340398863.jpg','240,240','240,240','upload/goods/1499340398864.jpg','60,60','60,60',1499340399,1,'',''),
	(96,0,30,0,'871499340501','87','upload/goods/871499340501.jpg','430,430','430,430','upload/goods/1499340501871.jpg','700,700','700,700','upload/goods/1499340501872.jpg','360,360','360,360','upload/goods/1499340501873.jpg','240,240','240,240','upload/goods/1499340501874.jpg','60,60','60,60',1499340501,1,'',''),
	(97,0,30,0,'901499340950','90','upload/goods/901499340950.jpg','800,800','800,800','upload/goods/1499340950901.jpg','700,700','700,700','upload/goods/1499340950902.jpg','360,360','360,360','upload/goods/1499340950903.jpg','240,240','240,240','upload/goods/1499340950904.jpg','60,60','60,60',1499340950,1,'',''),
	(98,0,30,0,'911499340954','91','upload/goods/911499340954.jpg','800,800','800,800','upload/goods/1499340954911.jpg','700,700','700,700','upload/goods/1499340954912.jpg','360,360','360,360','upload/goods/1499340954913.jpg','240,240','240,240','upload/goods/1499340954914.jpg','60,60','60,60',1499340954,1,'',''),
	(99,0,30,0,'921499340958','92','upload/goods/921499340958.jpg','800,800','800,800','upload/goods/1499340958921.jpg','700,700','700,700','upload/goods/1499340958922.jpg','360,360','360,360','upload/goods/1499340958923.jpg','240,240','240,240','upload/goods/1499340958924.jpg','60,60','60,60',1499340959,1,'',''),
	(100,0,30,0,'951499341070','95','upload/goods/951499341070.jpg','800,800','800,800','upload/goods/1499341070951.jpg','700,700','700,700','upload/goods/1499341070952.jpg','360,360','360,360','upload/goods/1499341070953.jpg','240,240','240,240','upload/goods/1499341070954.jpg','60,60','60,60',1499341071,1,'',''),
	(101,0,30,0,'961499341074','96','upload/goods/961499341074.jpg','800,800','800,800','upload/goods/1499341074961.jpg','700,700','700,700','upload/goods/1499341074962.jpg','360,360','360,360','upload/goods/1499341074963.jpg','240,240','240,240','upload/goods/1499341074964.jpg','60,60','60,60',1499341075,1,'',''),
	(102,0,30,0,'981499341160','98','upload/goods/981499341160.jpg','800,800','800,800','upload/goods/1499341160981.jpg','700,700','700,700','upload/goods/1499341160982.jpg','360,360','360,360','upload/goods/1499341160983.jpg','240,240','240,240','upload/goods/1499341160984.jpg','60,60','60,60',1499341161,1,'',''),
	(103,0,30,0,'991499341165','99','upload/goods/991499341165.jpg','800,800','800,800','upload/goods/1499341165991.jpg','700,700','700,700','upload/goods/1499341165992.jpg','360,360','360,360','upload/goods/1499341165993.jpg','240,240','240,240','upload/goods/1499341165994.jpg','60,60','60,60',1499341165,1,'',''),
	(104,0,30,0,'1011499341241','101','upload/goods/1011499341241.png','700,700','700,700','upload/goods/14993412411011.png','700,700','700,700','upload/goods/14993412411012.png','360,360','360,360','upload/goods/14993412411013.png','240,240','240,240','upload/goods/14993412411014.png','60,60','60,60',1499341242,1,'',''),
	(105,0,30,0,'1001499341246','100','upload/goods/1001499341246.jpg','800,800','800,800','upload/goods/14993412461001.jpg','700,700','700,700','upload/goods/14993412461002.jpg','360,360','360,360','upload/goods/14993412461003.jpg','240,240','240,240','upload/goods/14993412461004.jpg','60,60','60,60',1499341246,1,'',''),
	(106,0,30,0,'991499341252','99','upload/goods/991499341252.jpg','800,800','800,800','upload/goods/1499341252991.jpg','700,700','700,700','upload/goods/1499341252992.jpg','360,360','360,360','upload/goods/1499341252993.jpg','240,240','240,240','upload/goods/1499341252994.jpg','60,60','60,60',1499341253,1,'',''),
	(107,0,30,0,'1031499341349','103','upload/goods/1031499341349.jpg','800,800','800,800','upload/goods/14993413491031.jpg','700,700','700,700','upload/goods/14993413491032.jpg','360,360','360,360','upload/goods/14993413491033.jpg','240,240','240,240','upload/goods/14993413491034.jpg','60,60','60,60',1499341350,1,'',''),
	(108,0,30,0,'1041499341430','104','upload/goods/1041499341430.jpg','800,800','800,800','upload/goods/14993414301041.jpg','700,700','700,700','upload/goods/14993414301042.jpg','360,360','360,360','upload/goods/14993414301043.jpg','240,240','240,240','upload/goods/14993414301044.jpg','60,60','60,60',1499341431,1,'',''),
	(109,0,30,0,'1051499341434','105','upload/goods/1051499341434.jpg','800,800','800,800','upload/goods/14993414341051.jpg','700,700','700,700','upload/goods/14993414341052.jpg','360,360','360,360','upload/goods/14993414341053.jpg','240,240','240,240','upload/goods/14993414341054.jpg','60,60','60,60',1499341435,1,'',''),
	(110,0,30,0,'1101499341778','110','upload/goods/1101499341778.jpg','700,700','700,700','upload/goods/14993417781101.jpg','700,700','700,700','upload/goods/14993417781102.jpg','360,360','360,360','upload/goods/14993417781103.jpg','240,240','240,240','upload/goods/14993417781104.jpg','60,60','60,60',1499341778,1,'',''),
	(111,0,30,0,'1111499341860','111','upload/goods/1111499341860.jpg','800,800','800,800','upload/goods/14993418601111.jpg','700,700','700,700','upload/goods/14993418601112.jpg','360,360','360,360','upload/goods/14993418601113.jpg','240,240','240,240','upload/goods/14993418601114.jpg','60,60','60,60',1499341861,1,'',''),
	(112,0,30,0,'1121499341864','112','upload/goods/1121499341864.jpg','800,800','800,800','upload/goods/14993418641121.jpg','700,700','700,700','upload/goods/14993418641122.jpg','360,360','360,360','upload/goods/14993418641123.jpg','240,240','240,240','upload/goods/14993418641124.jpg','60,60','60,60',1499341864,1,'',''),
	(113,0,30,0,'1141499341978','114','upload/goods/1141499341978.jpg','799,799','799,799','upload/goods/14993419781141.jpg','700,700','700,700','upload/goods/14993419781142.jpg','360,360','360,360','upload/goods/14993419781143.jpg','240,240','240,240','upload/goods/14993419781144.jpg','60,60','60,60',1499341979,1,'',''),
	(114,0,30,0,'1151499341981','115','upload/goods/1151499341981.jpg','809,809','809,809','upload/goods/14993419811151.jpg','700,700','700,700','upload/goods/14993419811152.jpg','360,360','360,360','upload/goods/14993419811153.jpg','240,240','240,240','upload/goods/14993419811154.jpg','60,60','60,60',1499341982,1,'',''),
	(115,0,30,0,'1161499342069','116','upload/goods/1161499342069.jpg','800,800','800,800','upload/goods/14993420691161.jpg','700,700','700,700','upload/goods/14993420691162.jpg','360,360','360,360','upload/goods/14993420691163.jpg','240,240','240,240','upload/goods/14993420691164.jpg','60,60','60,60',1499342070,1,'',''),
	(116,0,30,0,'1171499342147','117','upload/goods/1171499342147.jpg','800,800','800,800','upload/goods/14993421471171.jpg','700,700','700,700','upload/goods/14993421471172.jpg','360,360','360,360','upload/goods/14993421471173.jpg','240,240','240,240','upload/goods/14993421471174.jpg','60,60','60,60',1499342148,1,'',''),
	(117,0,30,0,'1181499342151','118','upload/goods/1181499342151.jpg','800,800','800,800','upload/goods/14993421511181.jpg','700,700','700,700','upload/goods/14993421511182.jpg','360,360','360,360','upload/goods/14993421511183.jpg','240,240','240,240','upload/goods/14993421511184.jpg','60,60','60,60',1499342152,1,'',''),
	(118,0,30,0,'1201499342214','120','upload/goods/1201499342214.jpg','749,687','749,687','upload/goods/14993422141201.jpg','700,700','700,700','upload/goods/14993422141202.jpg','360,360','360,360','upload/goods/14993422141203.jpg','240,240','240,240','upload/goods/14993422141204.jpg','60,60','60,60',1499342214,1,'',''),
	(119,0,30,0,'1191499342218','119','upload/goods/1191499342218.jpg','749,687','749,687','upload/goods/14993422181191.jpg','700,700','700,700','upload/goods/14993422181192.jpg','360,360','360,360','upload/goods/14993422181193.jpg','240,240','240,240','upload/goods/14993422181194.jpg','60,60','60,60',1499342219,1,'',''),
	(120,0,30,0,'1301499342509','130','upload/goods/1301499342509.jpg','430,430','430,430','upload/goods/14993425091301.jpg','700,700','700,700','upload/goods/14993425091302.jpg','360,360','360,360','upload/goods/14993425091303.jpg','240,240','240,240','upload/goods/14993425091304.jpg','60,60','60,60',1499342509,1,'',''),
	(121,0,30,0,'1311499342643','131','upload/goods/1311499342643.jpg','800,800','800,800','upload/goods/14993426431311.jpg','700,700','700,700','upload/goods/14993426431312.jpg','360,360','360,360','upload/goods/14993426431313.jpg','240,240','240,240','upload/goods/14993426431314.jpg','60,60','60,60',1499342644,1,'',''),
	(122,0,30,0,'1321499342647','132','upload/goods/1321499342647.jpg','800,800','800,800','upload/goods/14993426471321.jpg','700,700','700,700','upload/goods/14993426471322.jpg','360,360','360,360','upload/goods/14993426471323.jpg','240,240','240,240','upload/goods/14993426471324.jpg','60,60','60,60',1499342648,1,'',''),
	(123,0,30,0,'1361499342774','136','upload/goods/1361499342774.jpg','430,430','430,430','upload/goods/14993427741361.jpg','700,700','700,700','upload/goods/14993427741362.jpg','360,360','360,360','upload/goods/14993427741363.jpg','240,240','240,240','upload/goods/14993427741364.jpg','60,60','60,60',1499342774,1,'',''),
	(124,0,30,0,'1401499342874','140','upload/goods/1401499342874.jpg','800,800','800,800','upload/goods/14993428741401.jpg','700,700','700,700','upload/goods/14993428741402.jpg','360,360','360,360','upload/goods/14993428741403.jpg','240,240','240,240','upload/goods/14993428741404.jpg','60,60','60,60',1499342875,1,'',''),
	(125,0,30,0,'1431499342975','143','upload/goods/1431499342975.jpg','430,430','430,430','upload/goods/14993429751431.jpg','700,700','700,700','upload/goods/14993429751432.jpg','360,360','360,360','upload/goods/14993429751433.jpg','240,240','240,240','upload/goods/14993429751434.jpg','60,60','60,60',1499342976,1,'',''),
	(126,0,30,0,'1451499343096','145','upload/goods/1451499343096.jpg','800,800','800,800','upload/goods/14993430961451.jpg','700,700','700,700','upload/goods/14993430961452.jpg','360,360','360,360','upload/goods/14993430961453.jpg','240,240','240,240','upload/goods/14993430961454.jpg','60,60','60,60',1499343097,1,'','');

/*!40000 ALTER TABLE `sys_album_picture` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_area
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_area`;

CREATE TABLE `sys_area` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_name` varchar(50) NOT NULL DEFAULT '',
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2048 COMMENT='全部区域表';

LOCK TABLES `sys_area` WRITE;
/*!40000 ALTER TABLE `sys_area` DISABLE KEYS */;

INSERT INTO `sys_area` (`area_id`, `area_name`, `sort`)
VALUES
	(1,'华东',0),
	(2,'华北',0),
	(3,'华南',0),
	(4,'华中',0),
	(5,'东北',0),
	(6,'西北',0),
	(7,'西南',0),
	(8,'港澳台',0);

/*!40000 ALTER TABLE `sys_area` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_city
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_city`;

CREATE TABLE `sys_city` (
  `city_id` int(11) NOT NULL AUTO_INCREMENT,
  `province_id` int(11) NOT NULL DEFAULT 0,
  `city_name` varchar(255) NOT NULL DEFAULT '',
  `zipcode` varchar(6) NOT NULL DEFAULT '',
  `sort` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`city_id`),
  KEY `IDX_g_city_CityName` (`city_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=135;

LOCK TABLES `sys_city` WRITE;
/*!40000 ALTER TABLE `sys_city` DISABLE KEYS */;

INSERT INTO `sys_city` (`city_id`, `province_id`, `city_name`, `zipcode`, `sort`)
VALUES
	(1,1,'北京市','100000',1),
	(2,2,'天津市','100000',0),
	(3,3,'石家庄市','050000',0),
	(4,3,'唐山市','063000',0),
	(5,3,'秦皇岛市','066000',0),
	(6,3,'邯郸市','056000',0),
	(7,3,'邢台市','054000',0),
	(8,3,'保定市','071000',0),
	(9,3,'张家口市','075000',0),
	(10,3,'承德市','067000',0),
	(11,3,'沧州市','061000',0),
	(12,3,'廊坊市','065000',0),
	(13,3,'衡水市','053000',0),
	(14,4,'太原市','030000',0),
	(15,4,'大同市','037000',0),
	(16,4,'阳泉市','045000',0),
	(17,4,'长治市','046000',0),
	(18,4,'晋城市','048000',0),
	(19,4,'朔州市','036000',0),
	(20,4,'晋中市','030600',0),
	(21,4,'运城市','044000',0),
	(22,4,'忻州市','034000',0),
	(23,4,'临汾市','041000',0),
	(24,4,'吕梁市','030500',0),
	(25,5,'呼和浩特市','010000',0),
	(26,5,'包头市','014000',0),
	(27,5,'乌海市','016000',0),
	(28,5,'赤峰市','024000',0),
	(29,5,'通辽市','028000',0),
	(30,5,'鄂尔多斯市','010300',0),
	(31,5,'呼伦贝尔市','021000',0),
	(32,5,'巴彦淖尔市','014400',0),
	(33,5,'乌兰察布市','011800',0),
	(34,5,'兴安盟','137500',0),
	(35,5,'锡林郭勒盟','011100',0),
	(36,5,'阿拉善盟','016000',0),
	(37,6,'沈阳市','110000',0),
	(38,6,'大连市','116000',0),
	(39,6,'鞍山市','114000',0),
	(40,6,'抚顺市','113000',0),
	(41,6,'本溪市','117000',0),
	(42,6,'丹东市','118000',0),
	(43,6,'锦州市','121000',0),
	(44,6,'营口市','115000',0),
	(45,6,'阜新市','123000',0),
	(46,6,'辽阳市','111000',0),
	(47,6,'盘锦市','124000',0),
	(48,6,'铁岭市','112000',0),
	(49,6,'朝阳市','122000',0),
	(50,6,'葫芦岛市','125000',0),
	(51,7,'长春市','130000',0),
	(52,7,'吉林市','132000',0),
	(53,7,'四平市','136000',0),
	(54,7,'辽源市','136200',0),
	(55,7,'通化市','134000',0),
	(56,7,'白山市','134300',0),
	(57,7,'松原市','131100',0),
	(58,7,'白城市','137000',0),
	(59,7,'延边朝鲜族自治州','133000',0),
	(60,8,'哈尔滨市','150000',0),
	(61,8,'齐齐哈尔市','161000',0),
	(62,8,'鸡西市','158100',0),
	(63,8,'鹤岗市','154100',0),
	(64,8,'双鸭山市','155100',0),
	(65,8,'大庆市','163000',0),
	(66,8,'伊春市','152300',0),
	(67,8,'佳木斯市','154000',0),
	(68,8,'七台河市','154600',0),
	(69,8,'牡丹江市','157000',0),
	(70,8,'黑河市','164300',0),
	(71,8,'绥化市','152000',0),
	(72,8,'大兴安岭地区','165000',0),
	(73,9,'上海市','200000',0),
	(74,10,'南京市','210000',0),
	(75,10,'无锡市','214000',0),
	(76,10,'徐州市','221000',0),
	(77,10,'常州市','213000',0),
	(78,10,'苏州市','215000',0),
	(79,10,'南通市','226000',0),
	(80,10,'连云港市','222000',0),
	(81,10,'淮安市','223200',0),
	(82,10,'盐城市','224000',0),
	(83,10,'扬州市','225000',0),
	(84,10,'镇江市','212000',0),
	(85,10,'泰州市','225300',0),
	(86,10,'宿迁市','223800',0),
	(87,11,'杭州市','310000',0),
	(88,11,'宁波市','315000',0),
	(89,11,'温州市','325000',0),
	(90,11,'嘉兴市','314000',0),
	(91,11,'湖州市','313000',0),
	(92,11,'绍兴市','312000',0),
	(93,11,'金华市','321000',0),
	(94,11,'衢州市','324000',0),
	(95,11,'舟山市','316000',0),
	(96,11,'台州市','318000',0),
	(97,11,'丽水市','323000',0),
	(98,12,'合肥市','230000',0),
	(99,12,'芜湖市','241000',0),
	(100,12,'蚌埠市','233000',0),
	(101,12,'淮南市','232000',0),
	(102,12,'马鞍山市','243000',0),
	(103,12,'淮北市','235000',0),
	(104,12,'铜陵市','244000',0),
	(105,12,'安庆市','246000',0),
	(106,12,'黄山市','242700',0),
	(107,12,'滁州市','239000',0),
	(108,12,'阜阳市','236100',0),
	(109,12,'宿州市','234100',0),
	(110,12,'巢湖市','238000',0),
	(111,12,'六安市','237000',0),
	(112,12,'亳州市','236800',0),
	(113,12,'池州市','247100',0),
	(114,12,'宣城市','366000',0),
	(115,13,'福州市','350000',0),
	(116,13,'厦门市','361000',0),
	(117,13,'莆田市','351100',0),
	(118,13,'三明市','365000',0),
	(119,13,'泉州市','362000',0),
	(120,13,'漳州市','363000',0),
	(121,13,'南平市','353000',0),
	(122,13,'龙岩市','364000',0),
	(123,13,'宁德市','352100',0),
	(124,14,'南昌市','330000',0),
	(125,14,'景德镇市','333000',0),
	(126,14,'萍乡市','337000',0),
	(127,14,'九江市','332000',0),
	(128,14,'新余市','338000',0),
	(129,14,'鹰潭市','335000',0),
	(130,14,'赣州市','341000',0),
	(131,14,'吉安市','343000',0),
	(132,14,'宜春市','336000',0),
	(133,14,'抚州市','332900',0),
	(134,14,'上饶市','334000',0),
	(135,15,'济南市','250000',0),
	(136,15,'青岛市','266000',0),
	(137,15,'淄博市','255000',0),
	(138,15,'枣庄市','277100',0),
	(139,15,'东营市','257000',0),
	(140,15,'烟台市','264000',0),
	(141,15,'潍坊市','261000',0),
	(142,15,'济宁市','272100',0),
	(143,15,'泰安市','271000',0),
	(144,15,'威海市','265700',0),
	(145,15,'日照市','276800',0),
	(146,15,'莱芜市','271100',0),
	(147,15,'临沂市','276000',0),
	(148,15,'德州市','253000',0),
	(149,15,'聊城市','252000',0),
	(150,15,'滨州市','256600',0),
	(151,15,'荷泽市','255000',0),
	(152,16,'郑州市','450000',0),
	(153,16,'开封市','475000',0),
	(154,16,'洛阳市','471000',0),
	(155,16,'平顶山市','467000',0),
	(156,16,'安阳市','454900',0),
	(157,16,'鹤壁市','456600',0),
	(158,16,'新乡市','453000',0),
	(159,16,'焦作市','454100',0),
	(160,16,'濮阳市','457000',0),
	(161,16,'许昌市','461000',0),
	(162,16,'漯河市','462000',0),
	(163,16,'三门峡市','472000',0),
	(164,16,'南阳市','473000',0),
	(165,16,'商丘市','476000',0),
	(166,16,'信阳市','464000',0),
	(167,16,'周口市','466000',0),
	(168,16,'驻马店市','463000',0),
	(169,17,'武汉市','430000',0),
	(170,17,'黄石市','435000',0),
	(171,17,'十堰市','442000',0),
	(172,17,'宜昌市','443000',0),
	(173,17,'襄樊市','441000',0),
	(174,17,'鄂州市','436000',0),
	(175,17,'荆门市','448000',0),
	(176,17,'孝感市','432100',0),
	(177,17,'荆州市','434000',0),
	(178,17,'黄冈市','438000',0),
	(179,17,'咸宁市','437000',0),
	(180,17,'随州市','441300',0),
	(181,17,'恩施土家族苗族自治州','445000',0),
	(182,17,'神农架','442400',0),
	(183,18,'长沙市','410000',0),
	(184,18,'株洲市','412000',0),
	(185,18,'湘潭市','411100',0),
	(186,18,'衡阳市','421000',0),
	(187,18,'邵阳市','422000',0),
	(188,18,'岳阳市','414000',0),
	(189,18,'常德市','415000',0),
	(190,18,'张家界市','427000',0),
	(191,18,'益阳市','413000',0),
	(192,18,'郴州市','423000',0),
	(193,18,'永州市','425000',0),
	(194,18,'怀化市','418000',0),
	(195,18,'娄底市','417000',0),
	(196,18,'湘西土家族苗族自治州','416000',0),
	(197,19,'广州市','510000',0),
	(198,19,'韶关市','521000',0),
	(199,19,'深圳市','518000',0),
	(200,19,'珠海市','519000',0),
	(201,19,'汕头市','515000',0),
	(202,19,'佛山市','528000',0),
	(203,19,'江门市','529000',0),
	(204,19,'湛江市','524000',0),
	(205,19,'茂名市','525000',0),
	(206,19,'肇庆市','526000',0),
	(207,19,'惠州市','516000',0),
	(208,19,'梅州市','514000',0),
	(209,19,'汕尾市','516600',1),
	(210,19,'河源市','517000',0),
	(211,19,'阳江市','529500',0),
	(212,19,'清远市','511500',0),
	(213,19,'东莞市','511700',0),
	(214,19,'中山市','528400',0),
	(215,19,'潮州市','515600',0),
	(216,19,'揭阳市','522000',0),
	(217,19,'云浮市','527300',0),
	(218,20,'南宁市','530000',0),
	(219,20,'柳州市','545000',0),
	(220,20,'桂林市','541000',0),
	(221,20,'梧州市','543000',0),
	(222,20,'北海市','536000',0),
	(223,20,'防城港市','538000',0),
	(224,20,'钦州市','535000',0),
	(225,20,'贵港市','537100',0),
	(226,20,'玉林市','537000',0),
	(227,20,'百色市','533000',0),
	(228,20,'贺州市','542800',0),
	(229,20,'河池市','547000',0),
	(230,20,'来宾市','546100',0),
	(231,20,'崇左市','532200',0),
	(232,21,'海口市','570000',0),
	(233,21,'三亚市','572000',0),
	(234,22,'重庆市','400000',0),
	(235,23,'成都市','610000',0),
	(236,23,'自贡市','643000',0),
	(237,23,'攀枝花市','617000',0),
	(238,23,'泸州市','646100',0),
	(239,23,'德阳市','618000',0),
	(240,23,'绵阳市','621000',0),
	(241,23,'广元市','628000',0),
	(242,23,'遂宁市','629000',0),
	(243,23,'内江市','641000',0),
	(244,23,'乐山市','614000',0),
	(245,23,'南充市','637000',0),
	(246,23,'眉山市','612100',0),
	(247,23,'宜宾市','644000',0),
	(248,23,'广安市','638000',0),
	(249,23,'达州市','635000',0),
	(250,23,'雅安市','625000',0),
	(251,23,'巴中市','635500',0),
	(252,23,'资阳市','641300',0),
	(253,23,'阿坝藏族羌族自治州','624600',0),
	(254,23,'甘孜藏族自治州','626000',0),
	(255,23,'凉山彝族自治州','615000',0),
	(256,24,'贵阳市','55000',0),
	(257,24,'六盘水市','553000',0),
	(258,24,'遵义市','563000',0),
	(259,24,'安顺市','561000',0),
	(260,24,'铜仁地区','554300',0),
	(261,24,'黔西南布依族苗族自治州','551500',0),
	(262,24,'毕节地区','551700',0),
	(263,24,'黔东南苗族侗族自治州','551500',0),
	(264,24,'黔南布依族苗族自治州','550100',0),
	(265,25,'昆明市','650000',0),
	(266,25,'曲靖市','655000',0),
	(267,25,'玉溪市','653100',0),
	(268,25,'保山市','678000',0),
	(269,25,'昭通市','657000',0),
	(270,25,'丽江市','674100',0),
	(271,25,'思茅市','665000',0),
	(272,25,'临沧市','677000',0),
	(273,25,'楚雄彝族自治州','675000',0),
	(274,25,'红河哈尼族彝族自治州','654400',0),
	(275,25,'文山壮族苗族自治州','663000',0),
	(276,25,'西双版纳傣族自治州','666200',0),
	(277,25,'大理白族自治州','671000',0),
	(278,25,'德宏傣族景颇族自治州','678400',0),
	(279,25,'怒江傈僳族自治州','671400',0),
	(280,25,'迪庆藏族自治州','674400',0),
	(281,26,'拉萨市','850000',0),
	(282,26,'昌都地区','854000',0),
	(283,26,'山南地区','856000',0),
	(284,26,'日喀则地区','857000',0),
	(285,26,'那曲地区','852000',0),
	(286,26,'阿里地区','859100',0),
	(287,26,'林芝地区','860100',0),
	(288,27,'西安市','710000',0),
	(289,27,'铜川市','727000',0),
	(290,27,'宝鸡市','721000',0),
	(291,27,'咸阳市','712000',0),
	(292,27,'渭南市','714000',0),
	(293,27,'延安市','716000',0),
	(294,27,'汉中市','723000',0),
	(295,27,'榆林市','719000',0),
	(296,27,'安康市','725000',0),
	(297,27,'商洛市','711500',0),
	(298,28,'兰州市','730000',0),
	(299,28,'嘉峪关市','735100',0),
	(300,28,'金昌市','737100',0),
	(301,28,'白银市','730900',0),
	(302,28,'天水市','741000',0),
	(303,28,'武威市','733000',0),
	(304,28,'张掖市','734000',0),
	(305,28,'平凉市','744000',0),
	(306,28,'酒泉市','735000',0),
	(307,28,'庆阳市','744500',0),
	(308,28,'定西市','743000',0),
	(309,28,'陇南市','742100',0),
	(310,28,'临夏回族自治州','731100',0),
	(311,28,'甘南藏族自治州','747000',0),
	(312,29,'西宁市','810000',0),
	(313,29,'海东地区','810600',0),
	(314,29,'海北藏族自治州','810300',0),
	(315,29,'黄南藏族自治州','811300',0),
	(316,29,'海南藏族自治州','813000',0),
	(317,29,'果洛藏族自治州','814000',0),
	(318,29,'玉树藏族自治州','815000',0),
	(319,29,'海西蒙古族藏族自治州','817000',0),
	(320,30,'银川市','750000',0),
	(321,30,'石嘴山市','753000',0),
	(322,30,'吴忠市','751100',0),
	(323,30,'固原市','756000',0),
	(324,30,'中卫市','751700',0),
	(325,31,'乌鲁木齐市','830000',0),
	(326,31,'克拉玛依市','834000',0),
	(327,31,'吐鲁番地区','838000',0),
	(328,31,'哈密地区','839000',0),
	(329,31,'昌吉回族自治州','831100',0),
	(330,31,'博尔塔拉蒙古自治州','833400',0),
	(331,31,'巴音郭楞蒙古自治州','841000',0),
	(332,31,'阿克苏地区','843000',0),
	(333,31,'克孜勒苏柯尔克孜自治州','835600',0),
	(334,31,'喀什地区','844000',0),
	(335,31,'和田地区','848000',0),
	(336,31,'伊犁哈萨克自治州','833200',0),
	(337,31,'塔城地区','834700',0),
	(338,31,'阿勒泰地区','836500',0),
	(339,31,'石河子市','832000',0),
	(340,31,'阿拉尔市','843300',0),
	(341,31,'图木舒克市','843900',0),
	(342,31,'五家渠市','831300',0),
	(343,32,'香港特别行政区','000000',0),
	(344,33,'澳门特别行政区','000000',0),
	(345,34,'台湾省','000000',0);

/*!40000 ALTER TABLE `sys_city` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_config`;

CREATE TABLE `sys_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL DEFAULT 1 COMMENT '实例ID',
  `key` varchar(255) NOT NULL DEFAULT '' COMMENT '配置项WCHAT,QQ,WPAY,ALIPAY...',
  `value` varchar(1000) NOT NULL DEFAULT '' COMMENT '配置值json',
  `desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '描述',
  `is_use` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否启用 1启用 0不启用',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  `modify_time` int(11) DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=963 COMMENT='第三方配置表';

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;

INSERT INTO `sys_config` (`id`, `instance_id`, `key`, `value`, `desc`, `is_use`, `create_time`, `modify_time`)
VALUES
	(12,0,'USERNOTICE','','',1,1487830081,1497102938),
	(13,0,'HOTKEY','','',1,1487831749,1497105229),
	(14,0,'DEFAULTKEY','','',1,1487831788,1497105235),
	(17,0,'QQLOGIN','{\"APP_KEY\":\"\",\"APP_SECRET\":\"\",\"AUTHORIZE\":\"http:\\/\\/yourdomain\",\"CALLBACK\":\"http:\\/\\/yourdomain\\/wap\\/login\\/callback\"}','qq',0,1488350925,1497105447),
	(18,0,'WCHAT','{\"APP_KEY\":\"\",\"APP_SECRET\":\"\",\"AUTHORIZE\":\"http:\\/\\/yourdomain\",\"CALLBACK\":\"http:\\/\\/yourdomain\\/wap\\/Login\\/callback\"}','微信',0,1488350947,1497105440),
	(21,0,'ALIPAY','{\"ali_partnerid\":\"\",\"ali_seller\":\"\",\"ali_key\":\"\"}','',0,1488442697,1497105409),
	(22,0,'EMAILMESSAGE','{\"email_host\":\"smtp.163.com\",\"email_port\":\"465\",\"email_addr\":\"\",\"email_id\":\"\",\"email_pass\":\"\"}','',0,1488524450,1498907460),
	(27,0,'WXOPENPLATFORM','','',1,1490845979,1496903672),
	(28,0,'LOGINVERIFYCODE','{\"platform\":0,\"admin\":\"1\",\"pc\":\"0\"}','',1,1491014899,1513013575),
	(31,0,'COIN_CONFIG','','购物币现金转化关系',1,1492396593,1496903672),
	(38,0,'ORDER_BUY_CLOSE_TIME','60','订单自动关闭时间',1,0,1498904013),
	(39,0,'ORDER_DELIVERY_COMPLETE_TIME','7','收货后多长时间自动完成',1,0,1498904013),
	(40,0,'ORDER_AUTO_DELIVERY','14','订单多长时间自动完成',1,0,1498904013),
	(41,0,'ORDER_BALANCE_PAY','0','是否开启余额支付',1,0,1498904013),
	(42,0,'ORDER_INVOICE_TAX','0','发票税率',1,0,1498904013),
	(43,0,'ORDER_INVOICE_CONTENT','','发票内容',1,0,1498904013),
	(44,0,'ORDER_SHOW_BUY_RECORD','0','是否显示购买记录',1,0,1498904013),
	(45,0,'SEO_TITLE','','标题附加字',1,1496751194,1497090304),
	(46,0,'SEO_META','','商城关键词',1,1496751194,1497090304),
	(47,0,'SEO_DESC','','关键词描述',1,1496751194,1497090304),
	(48,0,'SEO_OTHER','','其他页头信息',1,1496751194,1497090304),
	(107,0,'ORDER_DELIVERY_PAY','','是否开启货到付款',1,1496825466,1498904013),
	(108,0,'WITHDRAW_BALANCE','','会员余额提现设置',1,1496830716,1498893253),
	(109,0,'REGISTER_INTEGRAL','0','注册送积分',1,1496981877,1498739145),
	(111,0,'SHARE_INTEGRAL','0','分享送积分',1,1496981877,1498739145),
	(112,0,'SIGN_INTEGRAL','0','签到送积分',1,1496983370,1498739145),
	(116,0,'LOGINVERIFYCODE','{\"platform\":0,\"admin\":\"1\",\"pc\":\"0\"}','',1,1497085371,1513013575),
	(122,0,'HOTKEY','','',1,1497087566,1497105229),
	(123,0,'DEFAULTKEY','','',1,1497087582,1497105235),
	(125,0,'WPAY','{\"appid\":\"\",\"appkey\":\"\",\"mch_id\":\"\",\"mch_key\":\"\"}','',0,1497087123,1498882635),
	(127,0,'SHOPWCHAT','{\"appid\":\"\",\"appsecret\":\"\"}','',1,1497088090,1498736290),
	(128,0,'BUYER_SELF_LIFTING','0','是否开启买家自提',1,1498730475,1498904013),
	(129,0,'ORDER_SELLER_DISPATCHING','1','是否开启商家配送',1,1498730475,1498904013),
	(130,0,'SHOPPING_BACK_POINTS','3','购物返积分设置',1,1498730475,1498904013),
	(136,0,'MOBILEMESSAGE','','',1,1498894954,1500347126),
	(137,0,'REGISTERANDVISIT','{\"is_register\":\"1\",\"register_info\":\"plain\",\"name_keyword\":\"\",\"pwd_len\":\"5\",\"pwd_complexity\":\"\",\"terms_of_service\":\"\"}','',1,1499310581,0),
	(138,0,'SERVICE_ADDR','{\"service_addr\":\"\"}','美洽客服链接地址设置',0,1510713085,0),
	(139,0,'IMG_THUMB','{\"thumb_type\":\"2\",\"upload_size\":\"0\",\"upload_ext\":\"gif,jpg,jpeg,bmp,png\"}','thumb_type(缩略)  3 居中裁剪 2 缩放后填充 4 左上角裁剪 5 右下角裁剪 6 固定尺寸缩放',1,1511151286,0),
	(140,0,'USE_PC_TEMPLATE','blue','当前使用的PC端模板文件夹',1,1513154704,1513154704),
	(141,0,'USE_WAP_TEMPLATE','default','当前使用的手机端模板文件夹',1,1511151520,1511151520),
	(142,0,'IS_RECOMMEND','{\"is_recommend\":\"\"}','首页商城促销版块显示设置',0,1511151520,0),
	(143,0,'IS_CATEGORY','{\"is_category\":\"\"}','首页商品分类是否显示设置',0,1511151520,0),
	(144,0,'COPYRIGHT_LOGO','','版权logo',1,1513013376,0),
	(145,0,'COPYRIGHT_META','','备案号',1,1513013376,0),
	(146,0,'COPYRIGHT_LINK','','版权链接',1,1513013376,0),
	(147,0,'COPYRIGHT_DESC','','版权信息',1,1513013376,0),
	(148,0,'COPYRIGHT_COMPANYNAME','','公司名称',1,1513013376,0),
	(149,0,'UPLOAD_TYPE','1','上传方式 1 本地  2 七牛',1,1513102641,0),
	(150,0,'QINIU_CONFIG','{\"Accesskey\":\"\",\"Secretkey\":\"\",\"Bucket\":\"\",\"QiniuUrl\":\"\"}','七牛云存储参数配置',1,1513103084,0);

/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_custom_template
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_custom_template`;

CREATE TABLE `sys_custom_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shop_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `template_name` varchar(250) DEFAULT NULL COMMENT '自定义模板名称（暂时预留）',
  `template_data` text NOT NULL COMMENT '模板数据（JSON格式）',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间戳',
  `modify_time` int(11) DEFAULT NULL COMMENT '修改时间戳',
  `is_enable` int(11) NOT NULL DEFAULT 0 COMMENT '是否启用 0 不启用 1 启用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='手机端自定义模板';



# Dump of table sys_district
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_district`;

CREATE TABLE `sys_district` (
  `district_id` int(11) NOT NULL AUTO_INCREMENT,
  `city_id` int(11) DEFAULT 0,
  `district_name` varchar(255) NOT NULL DEFAULT '',
  `sort` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`district_id`),
  KEY `IDX_g_district_DistrictName` (`district_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=50;

LOCK TABLES `sys_district` WRITE;
/*!40000 ALTER TABLE `sys_district` DISABLE KEYS */;

INSERT INTO `sys_district` (`district_id`, `city_id`, `district_name`, `sort`)
VALUES
	(1,1,'东城区',0),
	(2,1,'西城区',0),
	(3,1,'崇文区',0),
	(4,1,'宣武区',0),
	(5,1,'朝阳区',0),
	(6,1,'丰台区',0),
	(7,1,'石景山区',0),
	(8,1,'海淀区',0),
	(9,1,'门头沟区',0),
	(10,1,'房山区',0),
	(11,1,'通州区',0),
	(12,1,'顺义区',0),
	(13,1,'昌平区',0),
	(14,1,'大兴区',0),
	(15,1,'怀柔区',0),
	(16,1,'平谷区',0),
	(17,1,'密云县',0),
	(18,1,'延庆县',0),
	(19,2,'和平区',0),
	(20,2,'河东区',0),
	(21,2,'河西区',0),
	(22,2,'南开区',0),
	(23,2,'河北区',0),
	(24,2,'红桥区',0),
	(25,2,'塘沽区',0),
	(26,2,'汉沽区',0),
	(27,2,'大港区',0),
	(28,2,'东丽区',0),
	(29,2,'西青区',0),
	(30,2,'津南区',0),
	(31,2,'北辰区',0),
	(32,2,'武清区',0),
	(33,2,'宝坻区',0),
	(34,2,'宁河县',0),
	(35,2,'静海县',0),
	(36,2,'蓟县',0),
	(37,3,'长安区',0),
	(38,3,'桥东区',0),
	(39,3,'桥西区',0),
	(40,3,'新华区',0),
	(41,3,'井陉矿区',0),
	(42,3,'裕华区',0),
	(43,3,'井陉县',0),
	(44,3,'正定县',0),
	(45,3,'栾城县',0),
	(46,3,'行唐县',0),
	(47,3,'灵寿县',0),
	(48,3,'高邑县',0),
	(49,3,'深泽县',0),
	(50,3,'赞皇县',0),
	(51,3,'无极县',0),
	(52,3,'平山县',0),
	(53,3,'元氏县',0),
	(54,3,'赵县',0),
	(55,3,'辛集市',0),
	(56,3,'藁城市',0),
	(57,3,'晋州市',0),
	(58,3,'新乐市',0),
	(59,3,'鹿泉市',0),
	(60,4,'路南区',0),
	(61,4,'路北区',0),
	(62,4,'古冶区',0),
	(63,4,'开平区',0),
	(64,4,'丰南区',0),
	(65,4,'丰润区',0),
	(66,4,'滦县',0),
	(67,4,'滦南县',0),
	(68,4,'乐亭县',0),
	(69,4,'迁西县',0),
	(70,4,'玉田县',0),
	(71,4,'唐海县',0),
	(72,4,'遵化市',0),
	(73,4,'迁安市',0),
	(74,5,'海港区',0),
	(75,5,'山海关区',0),
	(76,5,'北戴河区',0),
	(77,5,'青龙满族自治县',0),
	(78,5,'昌黎县',0),
	(79,5,'抚宁县',0),
	(80,5,'卢龙县',0),
	(81,6,'邯山区',0),
	(82,6,'丛台区',0),
	(83,6,'复兴区',0),
	(84,6,'峰峰矿区',0),
	(85,6,'邯郸县',0),
	(86,6,'临漳县',0),
	(87,6,'成安县',0),
	(88,6,'大名县',0),
	(89,6,'涉县',0),
	(90,6,'磁县',0),
	(91,6,'肥乡县',0),
	(92,6,'永年县',0),
	(93,6,'邱县',0),
	(94,6,'鸡泽县',0),
	(95,6,'广平县',0),
	(96,6,'馆陶县',0),
	(97,6,'魏县',0),
	(98,6,'曲周县',0),
	(99,6,'武安市',0),
	(100,7,'桥东区',0),
	(101,7,'桥西区',0),
	(102,7,'邢台县',0),
	(103,7,'临城县',0),
	(104,7,'内丘县',0),
	(105,7,'柏乡县',0),
	(106,7,'隆尧县',0),
	(107,7,'任县',0),
	(108,7,'南和县',0),
	(109,7,'宁晋县',0),
	(110,7,'巨鹿县',0),
	(111,7,'新河县',0),
	(112,7,'广宗县',0),
	(113,7,'平乡县',0),
	(114,7,'威县',0),
	(115,7,'清河县',0),
	(116,7,'临西县',0),
	(117,7,'南宫市',0),
	(118,7,'沙河市',0),
	(119,8,'新市区',0),
	(120,8,'北市区',0),
	(121,8,'南市区',0),
	(122,8,'满城县',0),
	(123,8,'清苑县',0),
	(124,8,'涞水县',0),
	(125,8,'阜平县',0),
	(126,8,'徐水县',0),
	(127,8,'定兴县',0),
	(128,8,'唐县',0),
	(129,8,'高阳县',0),
	(130,8,'容城县',0),
	(131,8,'涞源县',0),
	(132,8,'望都县',0),
	(133,8,'安新县',0),
	(134,8,'易县',0),
	(135,8,'曲阳县',0),
	(136,8,'蠡县',0),
	(137,8,'顺平县',0),
	(138,8,'博野县',0),
	(139,8,'雄县',0),
	(140,8,'涿州市',0),
	(141,8,'定州市',0),
	(142,8,'安国市',0),
	(143,8,'高碑店市',0),
	(144,9,'桥东区',0),
	(145,9,'桥西区',0),
	(146,9,'宣化区',0),
	(147,9,'下花园区',0),
	(148,9,'宣化县',0),
	(149,9,'张北县',0),
	(150,9,'康保县',0),
	(151,9,'沽源县',0),
	(152,9,'尚义县',0),
	(153,9,'蔚县',0),
	(154,9,'阳原县',0),
	(155,9,'怀安县',0),
	(156,9,'万全县',0),
	(157,9,'怀来县',0),
	(158,9,'涿鹿县',0),
	(159,9,'赤城县',0),
	(160,9,'崇礼县',0),
	(161,10,'双桥区',0),
	(162,10,'双滦区',0),
	(163,10,'鹰手营子矿区',0),
	(164,10,'承德县',0),
	(165,10,'兴隆县',0),
	(166,10,'平泉县',0),
	(167,10,'滦平县',0),
	(168,10,'隆化县',0),
	(169,10,'丰宁满族自治县',0),
	(170,10,'宽城满族自治县',0),
	(171,10,'围场满族蒙古族自治县',0),
	(172,11,'新华区',0),
	(173,11,'运河区',0),
	(174,11,'沧县',0),
	(175,11,'青县',0),
	(176,11,'东光县',0),
	(177,11,'海兴县',0),
	(178,11,'盐山县',0),
	(179,11,'肃宁县',0),
	(180,11,'南皮县',0),
	(181,11,'吴桥县',0),
	(182,11,'献县',0),
	(183,11,'孟村回族自治县',0),
	(184,11,'泊头市',0),
	(185,11,'任丘市',0),
	(186,11,'黄骅市',0),
	(187,11,'河间市',0),
	(188,12,'安次区',0),
	(189,12,'广阳区',0),
	(190,12,'固安县',0),
	(191,12,'永清县',0),
	(192,12,'香河县',0),
	(193,12,'大城县',0),
	(194,12,'文安县',0),
	(195,12,'大厂回族自治县',0),
	(196,12,'霸州市',0),
	(197,12,'三河市',0),
	(198,13,'桃城区',0),
	(199,13,'枣强县',0),
	(200,13,'武邑县',0),
	(201,13,'武强县',0),
	(202,13,'饶阳县',0),
	(203,13,'安平县',0),
	(204,13,'故城县',0),
	(205,13,'景县',0),
	(206,13,'阜城县',0),
	(207,13,'冀州市',0),
	(208,13,'深州市',0),
	(209,14,'小店区',0),
	(210,14,'迎泽区',0),
	(211,14,'杏花岭区',0),
	(212,14,'尖草坪区',0),
	(213,14,'万柏林区',0),
	(214,14,'晋源区',0),
	(215,14,'清徐县',0),
	(216,14,'阳曲县',0),
	(217,14,'娄烦县',0),
	(218,14,'古交市',0),
	(219,15,'城区',0),
	(220,15,'矿区',0),
	(221,15,'南郊区',0),
	(222,15,'新荣区',0),
	(223,15,'阳高县',0),
	(224,15,'天镇县',0),
	(225,15,'广灵县',0),
	(226,15,'灵丘县',0),
	(227,15,'浑源县',0),
	(228,15,'左云县',0),
	(229,15,'大同县',0),
	(230,16,'城区',0),
	(231,16,'矿区',0),
	(232,16,'郊区',0),
	(233,16,'平定县',0),
	(234,16,'盂县',0),
	(235,17,'城区',0),
	(236,17,'郊区',0),
	(237,17,'长治县',0),
	(238,17,'襄垣县',0),
	(239,17,'屯留县',0),
	(240,17,'平顺县',0),
	(241,17,'黎城县',0),
	(242,17,'壶关县',0),
	(243,17,'长子县',0),
	(244,17,'武乡县',0),
	(245,17,'沁县',0),
	(246,17,'沁源县',0),
	(247,17,'潞城市',0),
	(248,18,'城区',0),
	(249,18,'沁水县',0),
	(250,18,'阳城县',0),
	(251,18,'陵川县',0),
	(252,18,'泽州县',0),
	(253,18,'高平市',0),
	(254,19,'朔城区',0),
	(255,19,'平鲁区',0),
	(256,19,'山阴县',0),
	(257,19,'应县',0),
	(258,19,'右玉县',0),
	(259,19,'怀仁县',0),
	(260,20,'榆次区',0),
	(261,20,'榆社县',0),
	(262,20,'左权县',0),
	(263,20,'和顺县',0),
	(264,20,'昔阳县',0),
	(265,20,'寿阳县',0),
	(266,20,'太谷县',0),
	(267,20,'祁县',0),
	(268,20,'平遥县',0),
	(269,20,'灵石县',0),
	(270,20,'介休市',0),
	(271,21,'盐湖区',0),
	(272,21,'临猗县',0),
	(273,21,'万荣县',0),
	(274,21,'闻喜县',0),
	(275,21,'稷山县',0),
	(276,21,'新绛县',0),
	(277,21,'绛县',0),
	(278,21,'垣曲县',0),
	(279,21,'夏县',0),
	(280,21,'平陆县',0),
	(281,21,'芮城县',0),
	(282,21,'永济市',0),
	(283,21,'河津市',0),
	(284,22,'忻府区',0),
	(285,22,'定襄县',0),
	(286,22,'五台县',0),
	(287,22,'代县',0),
	(288,22,'繁峙县',0),
	(289,22,'宁武县',0),
	(290,22,'静乐县',0),
	(291,22,'神池县',0),
	(292,22,'五寨县',0),
	(293,22,'岢岚县',0),
	(294,22,'河曲县',0),
	(295,22,'保德县',0),
	(296,22,'偏关县',0),
	(297,22,'原平市',0),
	(298,23,'尧都区',0),
	(299,23,'曲沃县',0),
	(300,23,'翼城县',0),
	(301,23,'襄汾县',0),
	(302,23,'洪洞县',0),
	(303,23,'古县',0),
	(304,23,'安泽县',0),
	(305,23,'浮山县',0),
	(306,23,'吉县',0),
	(307,23,'乡宁县',0),
	(308,23,'大宁县',0),
	(309,23,'隰县',0),
	(310,23,'永和县',0),
	(311,23,'蒲县',0),
	(312,23,'汾西县',0),
	(313,23,'侯马市',0),
	(314,23,'霍州市',0),
	(315,24,'离石区',0),
	(316,24,'文水县',0),
	(317,24,'交城县',0),
	(318,24,'兴县',0),
	(319,24,'临县',0),
	(320,24,'柳林县',0),
	(321,24,'石楼县',0),
	(322,24,'岚县',0),
	(323,24,'方山县',0),
	(324,24,'中阳县',0),
	(325,24,'交口县',0),
	(326,24,'孝义市',0),
	(327,24,'汾阳市',0),
	(328,25,'新城区',0),
	(329,25,'回民区',0),
	(330,25,'玉泉区',0),
	(331,25,'赛罕区',0),
	(332,25,'土默特左旗',0),
	(333,25,'托克托县',0),
	(334,25,'和林格尔县',0),
	(335,25,'清水河县',0),
	(336,25,'武川县',0),
	(337,26,'东河区',0),
	(338,26,'昆都仑区',0),
	(339,26,'青山区',0),
	(340,26,'石拐区',0),
	(341,26,'白云矿区',0),
	(342,26,'九原区',0),
	(343,26,'土默特右旗',0),
	(344,26,'固阳县',0),
	(345,26,'达尔罕茂明安联合旗',0),
	(346,27,'海勃湾区',0),
	(347,27,'海南区',0),
	(348,27,'乌达区',0),
	(349,28,'红山区',0),
	(350,28,'元宝山区',0),
	(351,28,'松山区',0),
	(352,28,'阿鲁科尔沁旗',0),
	(353,28,'巴林左旗',0),
	(354,28,'巴林右旗',0),
	(355,28,'林西县',0),
	(356,28,'克什克腾旗',0),
	(357,28,'翁牛特旗',0),
	(358,28,'喀喇沁旗',0),
	(359,28,'宁城县',0),
	(360,28,'敖汉旗',0),
	(361,29,'科尔沁区',0),
	(362,29,'科尔沁左翼中旗',0),
	(363,29,'科尔沁左翼后旗',0),
	(364,29,'开鲁县',0),
	(365,29,'库伦旗',0),
	(366,29,'奈曼旗',0),
	(367,29,'扎鲁特旗',0),
	(368,29,'霍林郭勒市',0),
	(369,30,'东胜区',0),
	(370,30,'达拉特旗',0),
	(371,30,'准格尔旗',0),
	(372,30,'鄂托克前旗',0),
	(373,30,'鄂托克旗',0),
	(374,30,'杭锦旗',0),
	(375,30,'乌审旗',0),
	(376,30,'伊金霍洛旗',0),
	(377,31,'海拉尔区',0),
	(378,31,'阿荣旗',0),
	(379,31,'莫力达瓦达斡尔族自治旗',0),
	(380,31,'鄂伦春自治旗',0),
	(381,31,'鄂温克族自治旗',0),
	(382,31,'陈巴尔虎旗',0),
	(383,31,'新巴尔虎左旗',0),
	(384,31,'新巴尔虎右旗',0),
	(385,31,'满洲里市',0),
	(386,31,'牙克石市',0),
	(387,31,'扎兰屯市',0),
	(388,31,'额尔古纳市',0),
	(389,31,'根河市',0),
	(390,32,'临河区',0),
	(391,32,'五原县',0),
	(392,32,'磴口县',0),
	(393,32,'乌拉特前旗',0),
	(394,32,'乌拉特中旗',0),
	(395,32,'乌拉特后旗',0),
	(396,32,'杭锦后旗',0),
	(397,33,'集宁区',0),
	(398,33,'卓资县',0),
	(399,33,'化德县',0),
	(400,33,'商都县',0),
	(401,33,'兴和县',0),
	(402,33,'凉城县',0),
	(403,33,'察哈尔右翼前旗',0),
	(404,33,'察哈尔右翼中旗',0),
	(405,33,'察哈尔右翼后旗',0),
	(406,33,'四子王旗',0),
	(407,33,'丰镇市',0),
	(408,34,'乌兰浩特市',0),
	(409,34,'阿尔山市',0),
	(410,34,'科尔沁右翼前旗',0),
	(411,34,'科尔沁右翼中旗',0),
	(412,34,'扎赉特旗',0),
	(413,34,'突泉县',0),
	(414,35,'二连浩特市',0),
	(415,35,'锡林浩特市',0),
	(416,35,'阿巴嘎旗',0),
	(417,35,'苏尼特左旗',0),
	(418,35,'苏尼特右旗',0),
	(419,35,'东乌珠穆沁旗',0),
	(420,35,'西乌珠穆沁旗',0),
	(421,35,'太仆寺旗',0),
	(422,35,'镶黄旗',0),
	(423,35,'正镶白旗',0),
	(424,35,'正蓝旗',0),
	(425,35,'多伦县',0),
	(426,36,'阿拉善左旗',0),
	(427,36,'阿拉善右旗',0),
	(428,36,'额济纳旗',0),
	(429,37,'和平区',0),
	(430,37,'沈河区',0),
	(431,37,'大东区',0),
	(432,37,'皇姑区',0),
	(433,37,'铁西区',0),
	(434,37,'苏家屯区',0),
	(435,37,'东陵区',0),
	(436,37,'新城子区',0),
	(437,37,'于洪区',0),
	(438,37,'辽中县',0),
	(439,37,'康平县',0),
	(440,37,'法库县',0),
	(441,37,'新民市',0),
	(442,38,'中山区',0),
	(443,38,'西岗区',0),
	(444,38,'沙河口区',0),
	(445,38,'甘井子区',0),
	(446,38,'旅顺口区',0),
	(447,38,'金州区',0),
	(448,38,'长海县',0),
	(449,38,'瓦房店市',0),
	(450,38,'普兰店市',0),
	(451,38,'庄河市',0),
	(452,39,'铁东区',0),
	(453,39,'铁西区',0),
	(454,39,'立山区',0),
	(455,39,'千山区',0),
	(456,39,'台安县',0),
	(457,39,'岫岩满族自治县',0),
	(458,39,'海城市',0),
	(459,40,'新抚区',0),
	(460,40,'东洲区',0),
	(461,40,'望花区',0),
	(462,40,'顺城区',0),
	(463,40,'抚顺县',0),
	(464,40,'新宾满族自治县',0),
	(465,40,'清原满族自治县',0),
	(466,41,'平山区',0),
	(467,41,'溪湖区',0),
	(468,41,'明山区',0),
	(469,41,'南芬区',0),
	(470,41,'本溪满族自治县',0),
	(471,41,'桓仁满族自治县',0),
	(472,42,'元宝区',0),
	(473,42,'振兴区',0),
	(474,42,'振安区',0),
	(475,42,'宽甸满族自治县',0),
	(476,42,'东港市',0),
	(477,42,'凤城市',0),
	(478,43,'古塔区',0),
	(479,43,'凌河区',0),
	(480,43,'太和区',0),
	(481,43,'黑山县',0),
	(482,43,'义县',0),
	(483,43,'凌海市',0),
	(484,43,'北宁市',0),
	(485,44,'站前区',0),
	(486,44,'西市区',0),
	(487,44,'鲅鱼圈区',0),
	(488,44,'老边区',0),
	(489,44,'盖州市',0),
	(490,44,'大石桥市',0),
	(491,45,'海州区',0),
	(492,45,'新邱区',0),
	(493,45,'太平区',0),
	(494,45,'清河门区',0),
	(495,45,'细河区',0),
	(496,45,'阜新蒙古族自治县',0),
	(497,45,'彰武县',0),
	(498,46,'白塔区',0),
	(499,46,'文圣区',0),
	(500,46,'宏伟区',0),
	(501,46,'弓长岭区',0),
	(502,46,'太子河区',0),
	(503,46,'辽阳县',0),
	(504,46,'灯塔市',0),
	(505,47,'双台子区',0),
	(506,47,'兴隆台区',0),
	(507,47,'大洼县',0),
	(508,47,'盘山县',0),
	(509,48,'银州区',0),
	(510,48,'清河区',0),
	(511,48,'铁岭县',0),
	(512,48,'西丰县',0),
	(513,48,'昌图县',0),
	(514,48,'调兵山市',0),
	(515,48,'开原市',0),
	(516,49,'双塔区',0),
	(517,49,'龙城区',0),
	(518,49,'朝阳县',0),
	(519,49,'建平县',0),
	(520,49,'喀喇沁左翼蒙古族自治县',0),
	(521,49,'北票市',0),
	(522,49,'凌源市',0),
	(523,50,'连山区',0),
	(524,50,'龙港区',0),
	(525,50,'南票区',0),
	(526,50,'绥中县',0),
	(527,50,'建昌县',0),
	(528,50,'兴城市',0),
	(529,51,'南关区',0),
	(530,51,'宽城区',0),
	(531,51,'朝阳区',0),
	(532,51,'二道区',0),
	(533,51,'绿园区',0),
	(534,51,'双阳区',0),
	(535,51,'农安县',0),
	(536,51,'九台市',0),
	(537,51,'榆树市',0),
	(538,51,'德惠市',0),
	(539,52,'昌邑区',0),
	(540,52,'龙潭区',0),
	(541,52,'船营区',0),
	(542,52,'丰满区',0),
	(543,52,'永吉县',0),
	(544,52,'蛟河市',0),
	(545,52,'桦甸市',0),
	(546,52,'舒兰市',0),
	(547,52,'磐石市',0),
	(548,53,'铁西区',0),
	(549,53,'铁东区',0),
	(550,53,'梨树县',0),
	(551,53,'伊通满族自治县',0),
	(552,53,'公主岭市',0),
	(553,53,'双辽市',0),
	(554,54,'龙山区',0),
	(555,54,'西安区',0),
	(556,54,'东丰县',0),
	(557,54,'东辽县',0),
	(558,55,'东昌区',0),
	(559,55,'二道江区',0),
	(560,55,'通化县',0),
	(561,55,'辉南县',0),
	(562,55,'柳河县',0),
	(563,55,'梅河口市',0),
	(564,55,'集安市',0),
	(565,56,'八道江区',0),
	(566,56,'抚松县',0),
	(567,56,'靖宇县',0),
	(568,56,'长白朝鲜族自治县',0),
	(569,56,'江源县',0),
	(570,56,'临江市',0),
	(571,57,'宁江区',0),
	(572,57,'前郭尔罗斯蒙古族自治县',0),
	(573,57,'长岭县',0),
	(574,57,'乾安县',0),
	(575,57,'扶余县',0),
	(576,58,'洮北区',0),
	(577,58,'镇赉县',0),
	(578,58,'通榆县',0),
	(579,58,'洮南市',0),
	(580,58,'大安市',0),
	(581,59,'延吉市',0),
	(582,59,'图们市',0),
	(583,59,'敦化市',0),
	(584,59,'珲春市',0),
	(585,59,'龙井市',0),
	(586,59,'和龙市',0),
	(587,59,'汪清县',0),
	(588,59,'安图县',0),
	(589,60,'道里区',0),
	(590,60,'南岗区',0),
	(591,60,'道外区',0),
	(592,60,'香坊区',0),
	(593,60,'动力区',0),
	(594,60,'平房区',0),
	(595,60,'松北区',0),
	(596,60,'呼兰区',0),
	(597,60,'依兰县',0),
	(598,60,'方正县',0),
	(599,60,'宾县',0),
	(600,60,'巴彦县',0),
	(601,60,'木兰县',0),
	(602,60,'通河县',0),
	(603,60,'延寿县',0),
	(604,60,'阿城市',0),
	(605,60,'双城市',0),
	(606,60,'尚志市',0),
	(607,60,'五常市',0),
	(608,61,'龙沙区',0),
	(609,61,'建华区',0),
	(610,61,'铁锋区',0),
	(611,61,'昂昂溪区',0),
	(612,61,'富拉尔基区',0),
	(613,61,'碾子山区',0),
	(614,61,'梅里斯达斡尔族区',0),
	(615,61,'龙江县',0),
	(616,61,'依安县',0),
	(617,61,'泰来县',0),
	(618,61,'甘南县',0),
	(619,61,'富裕县',0),
	(620,61,'克山县',0),
	(621,61,'克东县',0),
	(622,61,'拜泉县',0),
	(623,61,'讷河市',0),
	(624,62,'鸡冠区',0),
	(625,62,'恒山区',0),
	(626,62,'滴道区',0),
	(627,62,'梨树区',0),
	(628,62,'城子河区',0),
	(629,62,'麻山区',0),
	(630,62,'鸡东县',0),
	(631,62,'虎林市',0),
	(632,62,'密山市',0),
	(633,63,'向阳区',0),
	(634,63,'工农区',0),
	(635,63,'南山区',0),
	(636,63,'兴安区',0),
	(637,63,'东山区',0),
	(638,63,'兴山区',0),
	(639,63,'萝北县',0),
	(640,63,'绥滨县',0),
	(641,64,'尖山区',0),
	(642,64,'岭东区',0),
	(643,64,'四方台区',0),
	(644,64,'宝山区',0),
	(645,64,'集贤县',0),
	(646,64,'友谊县',0),
	(647,64,'宝清县',0),
	(648,64,'饶河县',0),
	(649,65,'萨尔图区',0),
	(650,65,'龙凤区',0),
	(651,65,'让胡路区',0),
	(652,65,'红岗区',0),
	(653,65,'大同区',0),
	(654,65,'肇州县',0),
	(655,65,'肇源县',0),
	(656,65,'林甸县',0),
	(657,65,'杜尔伯特蒙古族自治县',0),
	(658,66,'伊春区',0),
	(659,66,'南岔区',0),
	(660,66,'友好区',0),
	(661,66,'西林区',0),
	(662,66,'翠峦区',0),
	(663,66,'新青区',0),
	(664,66,'美溪区',0),
	(665,66,'金山屯区',0),
	(666,66,'五营区',0),
	(667,66,'乌马河区',0),
	(668,66,'汤旺河区',0),
	(669,66,'带岭区',0),
	(670,66,'乌伊岭区',0),
	(671,66,'红星区',0),
	(672,66,'上甘岭区',0),
	(673,66,'嘉荫县',0),
	(674,66,'铁力市',0),
	(675,67,'永红区',0),
	(676,67,'向阳区',0),
	(677,67,'前进区',0),
	(678,67,'东风区',0),
	(679,67,'郊区',0),
	(680,67,'桦南县',0),
	(681,67,'桦川县',0),
	(682,67,'汤原县',0),
	(683,67,'抚远县',0),
	(684,67,'同江市',0),
	(685,67,'富锦市',0),
	(686,68,'新兴区',0),
	(687,68,'桃山区',0),
	(688,68,'茄子河区',0),
	(689,68,'勃利县',0),
	(690,69,'东安区',0),
	(691,69,'阳明区',0),
	(692,69,'爱民区',0),
	(693,69,'西安区',0),
	(694,69,'东宁县',0),
	(695,69,'林口县',0),
	(696,69,'绥芬河市',0),
	(697,69,'海林市',0),
	(698,69,'宁安市',0),
	(699,69,'穆棱市',0),
	(700,70,'爱辉区',0),
	(701,70,'嫩江县',0),
	(702,70,'逊克县',0),
	(703,70,'孙吴县',0),
	(704,70,'北安市',0),
	(705,70,'五大连池市',0),
	(706,71,'北林区',0),
	(707,71,'望奎县',0),
	(708,71,'兰西县',0),
	(709,71,'青冈县',0),
	(710,71,'庆安县',0),
	(711,71,'明水县',0),
	(712,71,'绥棱县',0),
	(713,71,'安达市',0),
	(714,71,'肇东市',0),
	(715,71,'海伦市',0),
	(716,72,'呼玛县',0),
	(717,72,'塔河县',0),
	(718,72,'漠河县',0),
	(719,73,'黄浦区',0),
	(720,73,'卢湾区',0),
	(721,73,'徐汇区',0),
	(722,73,'长宁区',0),
	(723,73,'静安区',0),
	(724,73,'普陀区',0),
	(725,73,'闸北区',0),
	(726,73,'虹口区',0),
	(727,73,'杨浦区',0),
	(728,73,'闵行区',0),
	(729,73,'宝山区',0),
	(730,73,'嘉定区',0),
	(731,73,'浦东新区',0),
	(732,73,'金山区',0),
	(733,73,'松江区',0),
	(734,73,'青浦区',0),
	(735,73,'南汇区',0),
	(736,73,'奉贤区',0),
	(737,73,'崇明县',0),
	(738,74,'玄武区',0),
	(739,74,'白下区',0),
	(740,74,'秦淮区',0),
	(741,74,'建邺区',0),
	(742,74,'鼓楼区',0),
	(743,74,'下关区',0),
	(744,74,'浦口区',0),
	(745,74,'栖霞区',0),
	(746,74,'雨花台区',0),
	(747,74,'江宁区',0),
	(748,74,'六合区',0),
	(749,74,'溧水县',0),
	(750,74,'高淳县',0),
	(751,75,'崇安区',0),
	(752,75,'南长区',0),
	(753,75,'北塘区',0),
	(754,75,'锡山区',0),
	(755,75,'惠山区',0),
	(756,75,'滨湖区',0),
	(757,75,'江阴市',0),
	(758,75,'宜兴市',0),
	(759,76,'鼓楼区',0),
	(760,76,'云龙区',0),
	(761,76,'九里区',0),
	(762,76,'贾汪区',0),
	(763,76,'泉山区',0),
	(764,76,'丰县',0),
	(765,76,'沛县',0),
	(766,76,'铜山县',0),
	(767,76,'睢宁县',0),
	(768,76,'新沂市',0),
	(769,76,'邳州市',0),
	(770,77,'天宁区',0),
	(771,77,'钟楼区',0),
	(772,77,'戚墅堰区',0),
	(773,77,'新北区',0),
	(774,77,'武进区',0),
	(775,77,'溧阳市',0),
	(776,77,'金坛市',0),
	(777,78,'沧浪区',0),
	(778,78,'平江区',0),
	(779,78,'金阊区',0),
	(780,78,'虎丘区',0),
	(781,78,'吴中区',0),
	(782,78,'相城区',0),
	(783,78,'常熟市',0),
	(784,78,'张家港市',0),
	(785,78,'昆山市',0),
	(786,78,'吴江市',0),
	(787,78,'太仓市',0),
	(788,79,'崇川区',0),
	(789,79,'港闸区',0),
	(790,79,'海安县',0),
	(791,79,'如东县',0),
	(792,79,'启东市',0),
	(793,79,'如皋市',0),
	(794,79,'通州市',0),
	(795,79,'海门市',0),
	(796,80,'连云区',0),
	(797,80,'新浦区',0),
	(798,80,'海州区',0),
	(799,80,'赣榆县',0),
	(800,80,'东海县',0),
	(801,80,'灌云县',0),
	(802,80,'灌南县',0),
	(803,81,'清河区',0),
	(804,81,'楚州区',0),
	(805,81,'淮阴区',0),
	(806,81,'清浦区',0),
	(807,81,'涟水县',0),
	(808,81,'洪泽县',0),
	(809,81,'盱眙县',0),
	(810,81,'金湖县',0),
	(811,82,'亭湖区',0),
	(812,82,'盐都区',0),
	(813,82,'响水县',0),
	(814,82,'滨海县',0),
	(815,82,'阜宁县',0),
	(816,82,'射阳县',0),
	(817,82,'建湖县',0),
	(818,82,'东台市',0),
	(819,82,'大丰市',0),
	(820,83,'广陵区',0),
	(821,83,'邗江区',0),
	(822,83,'维扬区',0),
	(823,83,'宝应县',0),
	(824,83,'仪征市',0),
	(825,83,'高邮市',0),
	(826,83,'江都市',0),
	(827,84,'京口区',0),
	(828,84,'润州区',0),
	(829,84,'丹徒区',0),
	(830,84,'丹阳市',0),
	(831,84,'扬中市',0),
	(832,84,'句容市',0),
	(833,85,'海陵区',0),
	(834,85,'高港区',0),
	(835,85,'兴化市',0),
	(836,85,'靖江市',0),
	(837,85,'泰兴市',0),
	(838,85,'姜堰市',0),
	(839,86,'宿城区',0),
	(840,86,'宿豫区',0),
	(841,86,'沭阳县',0),
	(842,86,'泗阳县',0),
	(843,86,'泗洪县',0),
	(844,87,'上城区',0),
	(845,87,'下城区',0),
	(846,87,'江干区',0),
	(847,87,'拱墅区',0),
	(848,87,'西湖区',0),
	(849,87,'滨江区',0),
	(850,87,'萧山区',0),
	(851,87,'余杭区',0),
	(852,87,'桐庐县',0),
	(853,87,'淳安县',0),
	(854,87,'建德市',0),
	(855,87,'富阳市',0),
	(856,87,'临安市',0),
	(857,88,'海曙区',0),
	(858,88,'江东区',0),
	(859,88,'江北区',0),
	(860,88,'北仑区',0),
	(861,88,'镇海区',0),
	(862,88,'鄞州区',0),
	(863,88,'象山县',0),
	(864,88,'宁海县',0),
	(865,88,'余姚市',0),
	(866,88,'慈溪市',0),
	(867,88,'奉化市',0),
	(868,89,'鹿城区',0),
	(869,89,'龙湾区',0),
	(870,89,'瓯海区',0),
	(871,89,'洞头县',0),
	(872,89,'永嘉县',0),
	(873,89,'平阳县',0),
	(874,89,'苍南县',0),
	(875,89,'文成县',0),
	(876,89,'泰顺县',0),
	(877,89,'瑞安市',0),
	(878,89,'乐清市',0),
	(879,90,'秀城区',0),
	(880,90,'秀洲区',0),
	(881,90,'嘉善县',0),
	(882,90,'海盐县',0),
	(883,90,'海宁市',0),
	(884,90,'平湖市',0),
	(885,90,'桐乡市',0),
	(886,91,'吴兴区',0),
	(887,91,'南浔区',0),
	(888,91,'德清县',0),
	(889,91,'长兴县',0),
	(890,91,'安吉县',0),
	(891,92,'越城区',0),
	(892,92,'绍兴县',0),
	(893,92,'新昌县',0),
	(894,92,'诸暨市',0),
	(895,92,'上虞市',0),
	(896,92,'嵊州市',0),
	(897,93,'婺城区',0),
	(898,93,'金东区',0),
	(899,93,'武义县',0),
	(900,93,'浦江县',0),
	(901,93,'磐安县',0),
	(902,93,'兰溪市',0),
	(903,93,'义乌市',0),
	(904,93,'东阳市',0),
	(905,93,'永康市',0),
	(906,94,'柯城区',0),
	(907,94,'衢江区',0),
	(908,94,'常山县',0),
	(909,94,'开化县',0),
	(910,94,'龙游县',0),
	(911,94,'江山市',0),
	(912,95,'定海区',0),
	(913,95,'普陀区',0),
	(914,95,'岱山县',0),
	(915,95,'嵊泗县',0),
	(916,96,'椒江区',0),
	(917,96,'黄岩区',0),
	(918,96,'路桥区',0),
	(919,96,'玉环县',0),
	(920,96,'三门县',0),
	(921,96,'天台县',0),
	(922,96,'仙居县',0),
	(923,96,'温岭市',0),
	(924,96,'临海市',0),
	(925,97,'莲都区',0),
	(926,97,'青田县',0),
	(927,97,'缙云县',0),
	(928,97,'遂昌县',0),
	(929,97,'松阳县',0),
	(930,97,'云和县',0),
	(931,97,'庆元县',0),
	(932,97,'景宁畲族自治县',0),
	(933,97,'龙泉市',0),
	(934,98,'瑶海区',0),
	(935,98,'庐阳区',0),
	(936,98,'蜀山区',0),
	(937,98,'包河区',0),
	(938,98,'长丰县',0),
	(939,98,'肥东县',0),
	(940,98,'肥西县',0),
	(941,99,'镜湖区',0),
	(942,99,'马塘区',0),
	(943,99,'新芜区',0),
	(944,99,'鸠江区',0),
	(945,99,'芜湖县',0),
	(946,99,'繁昌县',0),
	(947,99,'南陵县',0),
	(948,100,'龙子湖区',0),
	(949,100,'蚌山区',0),
	(950,100,'禹会区',0),
	(951,100,'淮上区',0),
	(952,100,'怀远县',0),
	(953,100,'五河县',0),
	(954,100,'固镇县',0),
	(955,101,'大通区',0),
	(956,101,'田家庵区',0),
	(957,101,'谢家集区',0),
	(958,101,'八公山区',0),
	(959,101,'潘集区',0),
	(960,101,'凤台县',0),
	(961,102,'金家庄区',0),
	(962,102,'花山区',0),
	(963,102,'雨山区',0),
	(964,102,'当涂县',0),
	(965,103,'杜集区',0),
	(966,103,'相山区',0),
	(967,103,'烈山区',0),
	(968,103,'濉溪县',0),
	(969,104,'铜官山区',0),
	(970,104,'狮子山区',0),
	(971,104,'郊区',0),
	(972,104,'铜陵县',0),
	(973,105,'迎江区',0),
	(974,105,'大观区',0),
	(975,105,'郊区',0),
	(976,105,'怀宁县',0),
	(977,105,'枞阳县',0),
	(978,105,'潜山县',0),
	(979,105,'太湖县',0),
	(980,105,'宿松县',0),
	(981,105,'望江县',0),
	(982,105,'岳西县',0),
	(983,105,'桐城市',0),
	(984,106,'屯溪区',0),
	(985,106,'黄山区',0),
	(986,106,'徽州区',0),
	(987,106,'歙县',0),
	(988,106,'休宁县',0),
	(989,106,'黟县',0),
	(990,106,'祁门县',0),
	(991,107,'琅琊区',0),
	(992,107,'南谯区',0),
	(993,107,'来安县',0),
	(994,107,'全椒县',0),
	(995,107,'定远县',0),
	(996,107,'凤阳县',0),
	(997,107,'天长市',0),
	(998,107,'明光市',0),
	(999,108,'颍州区',0),
	(1000,108,'颍东区',0),
	(1001,108,'颍泉区',0),
	(1002,108,'临泉县',0),
	(1003,108,'太和县',0),
	(1004,108,'阜南县',0),
	(1005,108,'颍上县',0),
	(1006,108,'界首市',0),
	(1007,109,'埇桥区',0),
	(1008,109,'砀山县',0),
	(1009,109,'萧县',0),
	(1010,109,'灵璧县',0),
	(1011,109,'泗县',0),
	(1012,110,'居巢区',0),
	(1013,110,'庐江县',0),
	(1014,110,'无为县',0),
	(1015,110,'含山县',0),
	(1016,110,'和县',0),
	(1017,111,'金安区',0),
	(1018,111,'裕安区',0),
	(1019,111,'寿县',0),
	(1020,111,'霍邱县',0),
	(1021,111,'舒城县',0),
	(1022,111,'金寨县',0),
	(1023,111,'霍山县',0),
	(1024,112,'谯城区',0),
	(1025,112,'涡阳县',0),
	(1026,112,'蒙城县',0),
	(1027,112,'利辛县',0),
	(1028,113,'贵池区',0),
	(1029,113,'东至县',0),
	(1030,113,'石台县',0),
	(1031,113,'青阳县',0),
	(1032,114,'宣州区',0),
	(1033,114,'郎溪县',0),
	(1034,114,'广德县',0),
	(1035,114,'泾县',0),
	(1036,114,'绩溪县',0),
	(1037,114,'旌德县',0),
	(1038,114,'宁国市',0),
	(1039,115,'鼓楼区',0),
	(1040,115,'台江区',0),
	(1041,115,'仓山区',0),
	(1042,115,'马尾区',0),
	(1043,115,'晋安区',0),
	(1044,115,'闽侯县',0),
	(1045,115,'连江县',0),
	(1046,115,'罗源县',0),
	(1047,115,'闽清县',0),
	(1048,115,'永泰县',0),
	(1049,115,'平潭县',0),
	(1050,115,'福清市',0),
	(1051,115,'长乐市',0),
	(1052,116,'思明区',0),
	(1053,116,'海沧区',0),
	(1054,116,'湖里区',0),
	(1055,116,'集美区',0),
	(1056,116,'同安区',0),
	(1057,116,'翔安区',0),
	(1058,117,'城厢区',0),
	(1059,117,'涵江区',0),
	(1060,117,'荔城区',0),
	(1061,117,'秀屿区',0),
	(1062,117,'仙游县',0),
	(1063,118,'梅列区',0),
	(1064,118,'三元区',0),
	(1065,118,'明溪县',0),
	(1066,118,'清流县',0),
	(1067,118,'宁化县',0),
	(1068,118,'大田县',0),
	(1069,118,'尤溪县',0),
	(1070,118,'沙县',0),
	(1071,118,'将乐县',0),
	(1072,118,'泰宁县',0),
	(1073,118,'建宁县',0),
	(1074,118,'永安市',0),
	(1075,119,'鲤城区',0),
	(1076,119,'丰泽区',0),
	(1077,119,'洛江区',0),
	(1078,119,'泉港区',0),
	(1079,119,'惠安县',0),
	(1080,119,'安溪县',0),
	(1081,119,'永春县',0),
	(1082,119,'德化县',0),
	(1083,119,'金门县',0),
	(1084,119,'石狮市',0),
	(1085,119,'晋江市',0),
	(1086,119,'南安市',0),
	(1087,120,'芗城区',0),
	(1088,120,'龙文区',0),
	(1089,120,'云霄县',0),
	(1090,120,'漳浦县',0),
	(1091,120,'诏安县',0),
	(1092,120,'长泰县',0),
	(1093,120,'东山县',0),
	(1094,120,'南靖县',0),
	(1095,120,'平和县',0),
	(1096,120,'华安县',0),
	(1097,120,'龙海市',0),
	(1098,121,'延平区',0),
	(1099,121,'顺昌县',0),
	(1100,121,'浦城县',0),
	(1101,121,'光泽县',0),
	(1102,121,'松溪县',0),
	(1103,121,'政和县',0),
	(1104,121,'邵武市',0),
	(1105,121,'武夷山市',0),
	(1106,121,'建瓯市',0),
	(1107,121,'建阳市',0),
	(1108,122,'新罗区',0),
	(1109,122,'长汀县',0),
	(1110,122,'永定县',0),
	(1111,122,'上杭县',0),
	(1112,122,'武平县',0),
	(1113,122,'连城县',0),
	(1114,122,'漳平市',0),
	(1115,123,'蕉城区',0),
	(1116,123,'霞浦县',0),
	(1117,123,'古田县',0),
	(1118,123,'屏南县',0),
	(1119,123,'寿宁县',0),
	(1120,123,'周宁县',0),
	(1121,123,'柘荣县',0),
	(1122,123,'福安市',0),
	(1123,123,'福鼎市',0),
	(1124,124,'东湖区',0),
	(1125,124,'西湖区',0),
	(1126,124,'青云谱区',0),
	(1127,124,'湾里区',0),
	(1128,124,'青山湖区',0),
	(1129,124,'南昌县',0),
	(1130,124,'新建县',0),
	(1131,124,'安义县',0),
	(1132,124,'进贤县',0),
	(1133,125,'昌江区',0),
	(1134,125,'珠山区',0),
	(1135,125,'浮梁县',0),
	(1136,125,'乐平市',0),
	(1137,126,'安源区',0),
	(1138,126,'湘东区',0),
	(1139,126,'莲花县',0),
	(1140,126,'上栗县',0),
	(1141,126,'芦溪县',0),
	(1142,127,'庐山区',0),
	(1143,127,'浔阳区',0),
	(1144,127,'九江县',0),
	(1145,127,'武宁县',0),
	(1146,127,'修水县',0),
	(1147,127,'永修县',0),
	(1148,127,'德安县',0),
	(1149,127,'星子县',0),
	(1150,127,'都昌县',0),
	(1151,127,'湖口县',0),
	(1152,127,'彭泽县',0),
	(1153,127,'瑞昌市',0),
	(1154,128,'渝水区',0),
	(1155,128,'分宜县',0),
	(1156,129,'月湖区',0),
	(1157,129,'余江县',0),
	(1158,129,'贵溪市',0),
	(1159,130,'章贡区',0),
	(1160,130,'赣县',0),
	(1161,130,'信丰县',0),
	(1162,130,'大余县',0),
	(1163,130,'上犹县',0),
	(1164,130,'崇义县',0),
	(1165,130,'安远县',0),
	(1166,130,'龙南县',0),
	(1167,130,'定南县',0),
	(1168,130,'全南县',0),
	(1169,130,'宁都县',0),
	(1170,130,'于都县',0),
	(1171,130,'兴国县',0),
	(1172,130,'会昌县',0),
	(1173,130,'寻乌县',0),
	(1174,130,'石城县',0),
	(1175,130,'瑞金市',0),
	(1176,130,'南康市',0),
	(1177,131,'吉州区',0),
	(1178,131,'青原区',0),
	(1179,131,'吉安县',0),
	(1180,131,'吉水县',0),
	(1181,131,'峡江县',0),
	(1182,131,'新干县',0),
	(1183,131,'永丰县',0),
	(1184,131,'泰和县',0),
	(1185,131,'遂川县',0),
	(1186,131,'万安县',0),
	(1187,131,'安福县',0),
	(1188,131,'永新县',0),
	(1189,131,'井冈山市',0),
	(1190,132,'袁州区',0),
	(1191,132,'奉新县',0),
	(1192,132,'万载县',0),
	(1193,132,'上高县',0),
	(1194,132,'宜丰县',0),
	(1195,132,'靖安县',0),
	(1196,132,'铜鼓县',0),
	(1197,132,'丰城市',0),
	(1198,132,'樟树市',0),
	(1199,132,'高安市',0),
	(1200,133,'临川区',0),
	(1201,133,'南城县',0),
	(1202,133,'黎川县',0),
	(1203,133,'南丰县',0),
	(1204,133,'崇仁县',0),
	(1205,133,'乐安县',0),
	(1206,133,'宜黄县',0),
	(1207,133,'金溪县',0),
	(1208,133,'资溪县',0),
	(1209,133,'东乡县',0),
	(1210,133,'广昌县',0),
	(1211,134,'信州区',0),
	(1212,134,'上饶县',0),
	(1213,134,'广丰县',0),
	(1214,134,'玉山县',0),
	(1215,134,'铅山县',0),
	(1216,134,'横峰县',0),
	(1217,134,'弋阳县',0),
	(1218,134,'余干县',0),
	(1219,134,'鄱阳县',0),
	(1220,134,'万年县',0),
	(1221,134,'婺源县',0),
	(1222,134,'德兴市',0),
	(1223,135,'历下区',0),
	(1224,135,'市中区',0),
	(1225,135,'槐荫区',0),
	(1226,135,'天桥区',0),
	(1227,135,'历城区',0),
	(1228,135,'长清区',0),
	(1229,135,'平阴县',0),
	(1230,135,'济阳县',0),
	(1231,135,'商河县',0),
	(1232,135,'章丘市',0),
	(1233,136,'市南区',0),
	(1234,136,'市北区',0),
	(1235,136,'四方区',0),
	(1236,136,'黄岛区',0),
	(1237,136,'崂山区',0),
	(1238,136,'李沧区',0),
	(1239,136,'城阳区',0),
	(1240,136,'胶州市',0),
	(1241,136,'即墨市',0),
	(1242,136,'平度市',0),
	(1243,136,'胶南市',0),
	(1244,136,'莱西市',0),
	(1245,137,'淄川区',0),
	(1246,137,'张店区',0),
	(1247,137,'博山区',0),
	(1248,137,'临淄区',0),
	(1249,137,'周村区',0),
	(1250,137,'桓台县',0),
	(1251,137,'高青县',0),
	(1252,137,'沂源县',0),
	(1253,138,'市中区',0),
	(1254,138,'薛城区',0),
	(1255,138,'峄城区',0),
	(1256,138,'台儿庄区',0),
	(1257,138,'山亭区',0),
	(1258,138,'滕州市',0),
	(1259,139,'东营区',0),
	(1260,139,'河口区',0),
	(1261,139,'垦利县',0),
	(1262,139,'利津县',0),
	(1263,139,'广饶县',0),
	(1264,140,'芝罘区',0),
	(1265,140,'福山区',0),
	(1266,140,'牟平区',0),
	(1267,140,'莱山区',0),
	(1268,140,'长岛县',0),
	(1269,140,'龙口市',0),
	(1270,140,'莱阳市',0),
	(1271,140,'莱州市',0),
	(1272,140,'蓬莱市',0),
	(1273,140,'招远市',0),
	(1274,140,'栖霞市',0),
	(1275,140,'海阳市',0),
	(1276,141,'潍城区',0),
	(1277,141,'寒亭区',0),
	(1278,141,'坊子区',0),
	(1279,141,'奎文区',0),
	(1280,141,'临朐县',0),
	(1281,141,'昌乐县',0),
	(1282,141,'青州市',0),
	(1283,141,'诸城市',0),
	(1284,141,'寿光市',0),
	(1285,141,'安丘市',0),
	(1286,141,'高密市',0),
	(1287,141,'昌邑市',0),
	(1288,142,'市中区',0),
	(1289,142,'任城区',0),
	(1290,142,'微山县',0),
	(1291,142,'鱼台县',0),
	(1292,142,'金乡县',0),
	(1293,142,'嘉祥县',0),
	(1294,142,'汶上县',0),
	(1295,142,'泗水县',0),
	(1296,142,'梁山县',0),
	(1297,142,'曲阜市',0),
	(1298,142,'兖州市',0),
	(1299,142,'邹城市',0),
	(1300,143,'泰山区',0),
	(1301,143,'岱岳区',0),
	(1302,143,'宁阳县',0),
	(1303,143,'东平县',0),
	(1304,143,'新泰市',0),
	(1305,143,'肥城市',0),
	(1306,144,'环翠区',0),
	(1307,144,'文登市',0),
	(1308,144,'荣成市',0),
	(1309,144,'乳山市',0),
	(1310,145,'东港区',0),
	(1311,145,'岚山区',0),
	(1312,145,'五莲县',0),
	(1313,145,'莒县',0),
	(1314,146,'莱城区',0),
	(1315,146,'钢城区',0),
	(1316,147,'兰山区',0),
	(1317,147,'罗庄区',0),
	(1318,147,'河东区',0),
	(1319,147,'沂南县',0),
	(1320,147,'郯城县',0),
	(1321,147,'沂水县',0),
	(1322,147,'苍山县',0),
	(1323,147,'费县',0),
	(1324,147,'平邑县',0),
	(1325,147,'莒南县',0),
	(1326,147,'蒙阴县',0),
	(1327,147,'临沭县',0),
	(1328,148,'德城区',0),
	(1329,148,'陵县',0),
	(1330,148,'宁津县',0),
	(1331,148,'庆云县',0),
	(1332,148,'临邑县',0),
	(1333,148,'齐河县',0),
	(1334,148,'平原县',0),
	(1335,148,'夏津县',0),
	(1336,148,'武城县',0),
	(1337,148,'乐陵市',0),
	(1338,148,'禹城市',0),
	(1339,149,'东昌府区',0),
	(1340,149,'阳谷县',0),
	(1341,149,'莘县',0),
	(1342,149,'茌平县',0),
	(1343,149,'东阿县',0),
	(1344,149,'冠县',0),
	(1345,149,'高唐县',0),
	(1346,149,'临清市',0),
	(1347,150,'滨城区',0),
	(1348,150,'惠民县',0),
	(1349,150,'阳信县',0),
	(1350,150,'无棣县',0),
	(1351,150,'沾化县',0),
	(1352,150,'博兴县',0),
	(1353,150,'邹平县',0),
	(1354,151,'牡丹区',0),
	(1355,151,'曹县',0),
	(1356,151,'单县',0),
	(1357,151,'成武县',0),
	(1358,151,'巨野县',0),
	(1359,151,'郓城县',0),
	(1360,151,'鄄城县',0),
	(1361,151,'定陶县',0),
	(1362,151,'东明县',0),
	(1363,152,'中原区',0),
	(1364,152,'二七区',0),
	(1365,152,'管城回族区',0),
	(1366,152,'金水区',0),
	(1367,152,'上街区',0),
	(1368,152,'惠济区',0),
	(1369,152,'中牟县',0),
	(1370,152,'巩义市',0),
	(1371,152,'荥阳市',0),
	(1372,152,'新密市',0),
	(1373,152,'新郑市',0),
	(1374,152,'登封市',0),
	(1375,153,'龙亭区',0),
	(1376,153,'顺河回族区',0),
	(1377,153,'鼓楼区',0),
	(1378,153,'南关区',0),
	(1379,153,'郊区',0),
	(1380,153,'杞县',0),
	(1381,153,'通许县',0),
	(1382,153,'尉氏县',0),
	(1383,153,'开封县',0),
	(1384,153,'兰考县',0),
	(1385,154,'老城区',0),
	(1386,154,'西工区',0),
	(1387,154,'廛河回族区',0),
	(1388,154,'涧西区',0),
	(1389,154,'吉利区',0),
	(1390,154,'洛龙区',0),
	(1391,154,'孟津县',0),
	(1392,154,'新安县',0),
	(1393,154,'栾川县',0),
	(1394,154,'嵩县',0),
	(1395,154,'汝阳县',0),
	(1396,154,'宜阳县',0),
	(1397,154,'洛宁县',0),
	(1398,154,'伊川县',0),
	(1399,154,'偃师市',0),
	(1400,155,'新华区',0),
	(1401,155,'卫东区',0),
	(1402,155,'石龙区',0),
	(1403,155,'湛河区',0),
	(1404,155,'宝丰县',0),
	(1405,155,'叶县',0),
	(1406,155,'鲁山县',0),
	(1407,155,'郏县',0),
	(1408,155,'舞钢市',0),
	(1409,155,'汝州市',0),
	(1410,156,'文峰区',0),
	(1411,156,'北关区',0),
	(1412,156,'殷都区',0),
	(1413,156,'龙安区',0),
	(1414,156,'安阳县',0),
	(1415,156,'汤阴县',0),
	(1416,156,'滑县',0),
	(1417,156,'内黄县',0),
	(1418,156,'林州市',0),
	(1419,157,'鹤山区',0),
	(1420,157,'山城区',0),
	(1421,157,'淇滨区',0),
	(1422,157,'浚县',0),
	(1423,157,'淇县',0),
	(1424,158,'红旗区',0),
	(1425,158,'卫滨区',0),
	(1426,158,'凤泉区',0),
	(1427,158,'牧野区',0),
	(1428,158,'新乡县',0),
	(1429,158,'获嘉县',0),
	(1430,158,'原阳县',0),
	(1431,158,'延津县',0),
	(1432,158,'封丘县',0),
	(1433,158,'长垣县',0),
	(1434,158,'卫辉市',0),
	(1435,158,'辉县市',0),
	(1436,159,'解放区',0),
	(1437,159,'中站区',0),
	(1438,159,'马村区',0),
	(1439,159,'山阳区',0),
	(1440,159,'修武县',0),
	(1441,159,'博爱县',0),
	(1442,159,'武陟县',0),
	(1443,159,'温县',0),
	(1444,159,'济源市',0),
	(1445,159,'沁阳市',0),
	(1446,159,'孟州市',0),
	(1447,160,'华龙区',0),
	(1448,160,'清丰县',0),
	(1449,160,'南乐县',0),
	(1450,160,'范县',0),
	(1451,160,'台前县',0),
	(1452,160,'濮阳县',0),
	(1453,161,'魏都区',0),
	(1454,161,'许昌县',0),
	(1455,161,'鄢陵县',0),
	(1456,161,'襄城县',0),
	(1457,161,'禹州市',0),
	(1458,161,'长葛市',0),
	(1459,162,'源汇区',0),
	(1460,162,'郾城区',0),
	(1461,162,'召陵区',0),
	(1462,162,'舞阳县',0),
	(1463,162,'临颍县',0),
	(1464,163,'市辖区',0),
	(1465,163,'湖滨区',0),
	(1466,163,'渑池县',0),
	(1467,163,'陕县',0),
	(1468,163,'卢氏县',0),
	(1469,163,'义马市',0),
	(1470,163,'灵宝市',0),
	(1471,164,'宛城区',0),
	(1472,164,'卧龙区',0),
	(1473,164,'南召县',0),
	(1474,164,'方城县',0),
	(1475,164,'西峡县',0),
	(1476,164,'镇平县',0),
	(1477,164,'内乡县',0),
	(1478,164,'淅川县',0),
	(1479,164,'社旗县',0),
	(1480,164,'唐河县',0),
	(1481,164,'新野县',0),
	(1482,164,'桐柏县',0),
	(1483,164,'邓州市',0),
	(1484,165,'梁园区',0),
	(1485,165,'睢阳区',0),
	(1486,165,'民权县',0),
	(1487,165,'睢县',0),
	(1488,165,'宁陵县',0),
	(1489,165,'柘城县',0),
	(1490,165,'虞城县',0),
	(1491,165,'夏邑县',0),
	(1492,165,'永城市',0),
	(1493,166,'浉河区',0),
	(1494,166,'平桥区',0),
	(1495,166,'罗山县',0),
	(1496,166,'光山县',0),
	(1497,166,'新县',0),
	(1498,166,'商城县',0),
	(1499,166,'固始县',0),
	(1500,166,'潢川县',0),
	(1501,166,'淮滨县',0),
	(1502,166,'息县',0),
	(1503,167,'川汇区',0),
	(1504,167,'扶沟县',0),
	(1505,167,'西华县',0),
	(1506,167,'商水县',0),
	(1507,167,'沈丘县',0),
	(1508,167,'郸城县',0),
	(1509,167,'淮阳县',0),
	(1510,167,'太康县',0),
	(1511,167,'鹿邑县',0),
	(1512,167,'项城市',0),
	(1513,168,'驿城区',0),
	(1514,168,'西平县',0),
	(1515,168,'上蔡县',0),
	(1516,168,'平舆县',0),
	(1517,168,'正阳县',0),
	(1518,168,'确山县',0),
	(1519,168,'泌阳县',0),
	(1520,168,'汝南县',0),
	(1521,168,'遂平县',0),
	(1522,168,'新蔡县',0),
	(1523,169,'江岸区',0),
	(1524,169,'江汉区',0),
	(1525,169,'硚口区',0),
	(1526,169,'汉阳区',0),
	(1527,169,'武昌区',0),
	(1528,169,'青山区',0),
	(1529,169,'洪山区',0),
	(1530,169,'东西湖区',0),
	(1531,169,'汉南区',0),
	(1532,169,'蔡甸区',0),
	(1533,169,'江夏区',0),
	(1534,169,'黄陂区',0),
	(1535,169,'新洲区',0),
	(1536,170,'黄石港区',0),
	(1537,170,'西塞山区',0),
	(1538,170,'下陆区',0),
	(1539,170,'铁山区',0),
	(1540,170,'阳新县',0),
	(1541,170,'大冶市',0),
	(1542,171,'茅箭区',0),
	(1543,171,'张湾区',0),
	(1544,171,'郧县',0),
	(1545,171,'郧西县',0),
	(1546,171,'竹山县',0),
	(1547,171,'竹溪县',0),
	(1548,171,'房县',0),
	(1549,171,'丹江口市',0),
	(1550,172,'西陵区',0),
	(1551,172,'伍家岗区',0),
	(1552,172,'点军区',0),
	(1553,172,'猇亭区',0),
	(1554,172,'夷陵区',0),
	(1555,172,'远安县',0),
	(1556,172,'兴山县',0),
	(1557,172,'秭归县',0),
	(1558,172,'长阳土家族自治县',0),
	(1559,172,'五峰土家族自治县',0),
	(1560,172,'宜都市',0),
	(1561,172,'当阳市',0),
	(1562,172,'枝江市',0),
	(1563,173,'襄城区',0),
	(1564,173,'樊城区',0),
	(1565,173,'襄阳区',0),
	(1566,173,'南漳县',0),
	(1567,173,'谷城县',0),
	(1568,173,'保康县',0),
	(1569,173,'老河口市',0),
	(1570,173,'枣阳市',0),
	(1571,173,'宜城市',0),
	(1572,174,'梁子湖区',0),
	(1573,174,'华容区',0),
	(1574,174,'鄂城区',0),
	(1575,175,'东宝区',0),
	(1576,175,'掇刀区',0),
	(1577,175,'京山县',0),
	(1578,175,'沙洋县',0),
	(1579,175,'钟祥市',0),
	(1580,176,'孝南区',0),
	(1581,176,'孝昌县',0),
	(1582,176,'大悟县',0),
	(1583,176,'云梦县',0),
	(1584,176,'应城市',0),
	(1585,176,'安陆市',0),
	(1586,176,'汉川市',0),
	(1587,177,'沙市区',0),
	(1588,177,'荆州区',0),
	(1589,177,'公安县',0),
	(1590,177,'监利县',0),
	(1591,177,'江陵县',0),
	(1592,177,'石首市',0),
	(1593,177,'洪湖市',0),
	(1594,177,'松滋市',0),
	(1595,178,'黄州区',0),
	(1596,178,'团风县',0),
	(1597,178,'红安县',0),
	(1598,178,'罗田县',0),
	(1599,178,'英山县',0),
	(1600,178,'浠水县',0),
	(1601,178,'蕲春县',0),
	(1602,178,'黄梅县',0),
	(1603,178,'麻城市',0),
	(1604,178,'武穴市',0),
	(1605,179,'咸安区',0),
	(1606,179,'嘉鱼县',0),
	(1607,179,'通城县',0),
	(1608,179,'崇阳县',0),
	(1609,179,'通山县',0),
	(1610,179,'赤壁市',0),
	(1611,180,'曾都区',0),
	(1612,180,'广水市',0),
	(1613,181,'恩施市',0),
	(1614,181,'利川市',0),
	(1615,181,'建始县',0),
	(1616,181,'巴东县',0),
	(1617,181,'宣恩县',0),
	(1618,181,'咸丰县',0),
	(1619,181,'来凤县',0),
	(1620,181,'鹤峰县',0),
	(1621,182,'仙桃市',0),
	(1622,182,'潜江市',0),
	(1623,182,'天门市',0),
	(1624,182,'神农架林区',0),
	(1625,183,'芙蓉区',0),
	(1626,183,'天心区',0),
	(1627,183,'岳麓区',0),
	(1628,183,'开福区',0),
	(1629,183,'雨花区',0),
	(1630,183,'长沙县',0),
	(1631,183,'望城县',0),
	(1632,183,'宁乡县',0),
	(1633,183,'浏阳市',0),
	(1634,184,'荷塘区',0),
	(1635,184,'芦淞区',0),
	(1636,184,'石峰区',0),
	(1637,184,'天元区',0),
	(1638,184,'株洲县',0),
	(1639,184,'攸县',0),
	(1640,184,'茶陵县',0),
	(1641,184,'炎陵县',0),
	(1642,184,'醴陵市',0),
	(1643,185,'雨湖区',0),
	(1644,185,'岳塘区',0),
	(1645,185,'湘潭县',0),
	(1646,185,'湘乡市',0),
	(1647,185,'韶山市',0),
	(1648,186,'珠晖区',0),
	(1649,186,'雁峰区',0),
	(1650,186,'石鼓区',0),
	(1651,186,'蒸湘区',0),
	(1652,186,'南岳区',0),
	(1653,186,'衡阳县',0),
	(1654,186,'衡南县',0),
	(1655,186,'衡山县',0),
	(1656,186,'衡东县',0),
	(1657,186,'祁东县',0),
	(1658,186,'耒阳市',0),
	(1659,186,'常宁市',0),
	(1660,187,'双清区',0),
	(1661,187,'大祥区',0),
	(1662,187,'北塔区',0),
	(1663,187,'邵东县',0),
	(1664,187,'新邵县',0),
	(1665,187,'邵阳县',0),
	(1666,187,'隆回县',0),
	(1667,187,'洞口县',0),
	(1668,187,'绥宁县',0),
	(1669,187,'新宁县',0),
	(1670,187,'城步苗族自治县',0),
	(1671,187,'武冈市',0),
	(1672,188,'岳阳楼区',0),
	(1673,188,'云溪区',0),
	(1674,188,'君山区',0),
	(1675,188,'岳阳县',0),
	(1676,188,'华容县',0),
	(1677,188,'湘阴县',0),
	(1678,188,'平江县',0),
	(1679,188,'汨罗市',0),
	(1680,188,'临湘市',0),
	(1681,189,'武陵区',0),
	(1682,189,'鼎城区',0),
	(1683,189,'安乡县',0),
	(1684,189,'汉寿县',0),
	(1685,189,'澧县',0),
	(1686,189,'临澧县',0),
	(1687,189,'桃源县',0),
	(1688,189,'石门县',0),
	(1689,189,'津市市',0),
	(1690,190,'永定区',0),
	(1691,190,'武陵源区',0),
	(1692,190,'慈利县',0),
	(1693,190,'桑植县',0),
	(1694,191,'资阳区',0),
	(1695,191,'赫山区',0),
	(1696,191,'南县',0),
	(1697,191,'桃江县',0),
	(1698,191,'安化县',0),
	(1699,191,'沅江市',0),
	(1700,192,'北湖区',0),
	(1701,192,'苏仙区',0),
	(1702,192,'桂阳县',0),
	(1703,192,'宜章县',0),
	(1704,192,'永兴县',0),
	(1705,192,'嘉禾县',0),
	(1706,192,'临武县',0),
	(1707,192,'汝城县',0),
	(1708,192,'桂东县',0),
	(1709,192,'安仁县',0),
	(1710,192,'资兴市',0),
	(1711,193,'芝山区',0),
	(1712,193,'冷水滩区',0),
	(1713,193,'祁阳县',0),
	(1714,193,'东安县',0),
	(1715,193,'双牌县',0),
	(1716,193,'道县',0),
	(1717,193,'江永县',0),
	(1718,193,'宁远县',0),
	(1719,193,'蓝山县',0),
	(1720,193,'新田县',0),
	(1721,193,'江华瑶族自治县',0),
	(1722,194,'鹤城区',0),
	(1723,194,'中方县',0),
	(1724,194,'沅陵县',0),
	(1725,194,'辰溪县',0),
	(1726,194,'溆浦县',0),
	(1727,194,'会同县',0),
	(1728,194,'麻阳苗族自治县',0),
	(1729,194,'新晃侗族自治县',0),
	(1730,194,'芷江侗族自治县',0),
	(1731,194,'靖州苗族侗族自治县',0),
	(1732,194,'通道侗族自治县',0),
	(1733,194,'洪江市',0),
	(1734,195,'娄星区',0),
	(1735,195,'双峰县',0),
	(1736,195,'新化县',0),
	(1737,195,'冷水江市',0),
	(1738,195,'涟源市',0),
	(1739,196,'吉首市',0),
	(1740,196,'泸溪县',0),
	(1741,196,'凤凰县',0),
	(1742,196,'花垣县',0),
	(1743,196,'保靖县',0),
	(1744,196,'古丈县',0),
	(1745,196,'永顺县',0),
	(1746,196,'龙山县',0),
	(1748,197,'荔湾区',0),
	(1749,197,'越秀区',0),
	(1750,197,'海珠区',0),
	(1751,197,'天河区',0),
	(1752,197,'芳村区',0),
	(1753,197,'白云区',0),
	(1754,197,'黄埔区',0),
	(1755,197,'番禺区',0),
	(1756,197,'花都区',0),
	(1757,197,'增城市',0),
	(1759,198,'武江区',0),
	(1760,198,'浈江区',0),
	(1761,198,'曲江区',0),
	(1762,198,'始兴县',0),
	(1763,198,'仁化县',0),
	(1764,198,'翁源县',0),
	(1765,198,'乳源瑶族自治县',0),
	(1766,198,'新丰县',0),
	(1767,198,'乐昌市',0),
	(1768,198,'南雄市',0),
	(1769,199,'罗湖区',0),
	(1770,199,'福田区',0),
	(1771,199,'南山区',0),
	(1772,199,'宝安区',0),
	(1773,199,'龙岗区',0),
	(1774,199,'盐田区',0),
	(1775,200,'香洲区',0),
	(1776,200,'斗门区',0),
	(1777,200,'金湾区',0),
	(1778,201,'龙湖区',0),
	(1779,201,'金平区',0),
	(1780,201,'濠江区',0),
	(1781,201,'潮阳区',0),
	(1782,201,'潮南区',0),
	(1783,201,'澄海区',0),
	(1784,201,'南澳县',0),
	(1785,202,'禅城区',0),
	(1786,202,'南海区',0),
	(1787,202,'顺德区',0),
	(1788,202,'三水区',0),
	(1789,202,'高明区',0),
	(1790,203,'蓬江区',0),
	(1791,203,'江海区',0),
	(1792,203,'新会区',0),
	(1793,203,'台山市',0),
	(1794,203,'开平市',0),
	(1795,203,'鹤山市',0),
	(1796,203,'恩平市',0),
	(1797,204,'赤坎区',0),
	(1798,204,'霞山区',0),
	(1799,204,'坡头区',0),
	(1800,204,'麻章区',0),
	(1801,204,'遂溪县',0),
	(1802,204,'徐闻县',0),
	(1803,204,'廉江市',0),
	(1804,204,'雷州市',0),
	(1805,204,'吴川市',0),
	(1806,205,'茂南区',0),
	(1807,205,'茂港区',0),
	(1808,205,'电白县',0),
	(1809,205,'高州市',0),
	(1810,205,'化州市',0),
	(1811,205,'信宜市',0),
	(1812,206,'端州区',0),
	(1813,206,'鼎湖区',0),
	(1814,206,'广宁县',0),
	(1815,206,'怀集县',0),
	(1816,206,'封开县',0),
	(1817,206,'德庆县',0),
	(1818,206,'高要市',0),
	(1819,206,'四会市',0),
	(1820,207,'惠城区',0),
	(1821,207,'惠阳区',0),
	(1822,207,'博罗县',0),
	(1823,207,'惠东县',0),
	(1824,207,'龙门县',0),
	(1825,208,'梅江区',0),
	(1826,208,'梅县',0),
	(1827,208,'大埔县',0),
	(1828,208,'丰顺县',0),
	(1829,208,'五华县',0),
	(1830,208,'平远县',0),
	(1831,208,'蕉岭县',0),
	(1832,208,'兴宁市',0),
	(1833,209,'城区',0),
	(1834,209,'海丰县',0),
	(1835,209,'陆河县',0),
	(1836,209,'陆丰市',0),
	(1837,210,'源城区',0),
	(1838,210,'紫金县',0),
	(1839,210,'龙川县',0),
	(1840,210,'连平县',0),
	(1841,210,'和平县',0),
	(1842,210,'东源县',0),
	(1843,211,'江城区',0),
	(1844,211,'阳西县',0),
	(1845,211,'阳东县',0),
	(1846,211,'阳春市',0),
	(1847,212,'清城区',0),
	(1848,212,'佛冈县',0),
	(1849,212,'阳山县',0),
	(1850,212,'连山壮族瑶族自治县',0),
	(1851,212,'连南瑶族自治县',0),
	(1852,212,'清新县',0),
	(1853,212,'英德市',0),
	(1854,212,'连州市',0),
	(1855,215,'湘桥区',0),
	(1856,215,'潮安县',0),
	(1857,215,'饶平县',0),
	(1858,216,'榕城区',0),
	(1859,216,'揭东县',0),
	(1860,216,'揭西县',0),
	(1861,216,'惠来县',0),
	(1862,216,'普宁市',0),
	(1863,217,'云城区',0),
	(1864,217,'新兴县',0),
	(1865,217,'郁南县',0),
	(1866,217,'云安县',0),
	(1867,217,'罗定市',0),
	(1868,218,'兴宁区',0),
	(1869,218,'青秀区',0),
	(1870,218,'江南区',0),
	(1871,218,'西乡塘区',0),
	(1872,218,'良庆区',0),
	(1873,218,'邕宁区',0),
	(1874,218,'武鸣县',0),
	(1875,218,'隆安县',0),
	(1876,218,'马山县',0),
	(1877,218,'上林县',0),
	(1878,218,'宾阳县',0),
	(1879,218,'横县',0),
	(1880,219,'城中区',0),
	(1881,219,'鱼峰区',0),
	(1882,219,'柳南区',0),
	(1883,219,'柳北区',0),
	(1884,219,'柳江县',0),
	(1885,219,'柳城县',0),
	(1886,219,'鹿寨县',0),
	(1887,219,'融安县',0),
	(1888,219,'融水苗族自治县',0),
	(1889,219,'三江侗族自治县',0),
	(1890,220,'秀峰区',0),
	(1891,220,'叠彩区',0),
	(1892,220,'象山区',0),
	(1893,220,'七星区',0),
	(1894,220,'雁山区',0),
	(1895,220,'阳朔县',0),
	(1896,220,'临桂县',0),
	(1897,220,'灵川县',0),
	(1898,220,'全州县',0),
	(1899,220,'兴安县',0),
	(1900,220,'永福县',0),
	(1901,220,'灌阳县',0),
	(1902,220,'龙胜各族自治县',0),
	(1903,220,'资源县',0),
	(1904,220,'平乐县',0),
	(1905,220,'荔蒲县',0),
	(1906,220,'恭城瑶族自治县',0),
	(1907,221,'万秀区',0),
	(1908,221,'蝶山区',0),
	(1909,221,'长洲区',0),
	(1910,221,'苍梧县',0),
	(1911,221,'藤县',0),
	(1912,221,'蒙山县',0),
	(1913,221,'岑溪市',0),
	(1914,222,'海城区',0),
	(1915,222,'银海区',0),
	(1916,222,'铁山港区',0),
	(1917,222,'合浦县',0),
	(1918,223,'港口区',0),
	(1919,223,'防城区',0),
	(1920,223,'上思县',0),
	(1921,223,'东兴市',0),
	(1922,224,'钦南区',0),
	(1923,224,'钦北区',0),
	(1924,224,'灵山县',0),
	(1925,224,'浦北县',0),
	(1926,225,'港北区',0),
	(1927,225,'港南区',0),
	(1928,225,'覃塘区',0),
	(1929,225,'平南县',0),
	(1930,225,'桂平市',0),
	(1931,226,'玉州区',0),
	(1932,226,'容县',0),
	(1933,226,'陆川县',0),
	(1934,226,'博白县',0),
	(1935,226,'兴业县',0),
	(1936,226,'北流市',0),
	(1937,227,'右江区',0),
	(1938,227,'田阳县',0),
	(1939,227,'田东县',0),
	(1940,227,'平果县',0),
	(1941,227,'德保县',0),
	(1942,227,'靖西县',0),
	(1943,227,'那坡县',0),
	(1944,227,'凌云县',0),
	(1945,227,'乐业县',0),
	(1946,227,'田林县',0),
	(1947,227,'西林县',0),
	(1948,227,'隆林各族自治县',0),
	(1949,228,'八步区',0),
	(1950,228,'昭平县',0),
	(1951,228,'钟山县',0),
	(1952,228,'富川瑶族自治县',0),
	(1953,229,'金城江区',0),
	(1954,229,'南丹县',0),
	(1955,229,'天峨县',0),
	(1956,229,'凤山县',0),
	(1957,229,'东兰县',0),
	(1958,229,'罗城仫佬族自治县',0),
	(1959,229,'环江毛南族自治县',0),
	(1960,229,'巴马瑶族自治县',0),
	(1961,229,'都安瑶族自治县',0),
	(1962,229,'大化瑶族自治县',0),
	(1963,229,'宜州市',0),
	(1964,230,'兴宾区',0),
	(1965,230,'忻城县',0),
	(1966,230,'象州县',0),
	(1967,230,'武宣县',0),
	(1968,230,'金秀瑶族自治县',0),
	(1969,230,'合山市',0),
	(1970,231,'江洲区',0),
	(1971,231,'扶绥县',0),
	(1972,231,'宁明县',0),
	(1973,231,'龙州县',0),
	(1974,231,'大新县',0),
	(1975,231,'天等县',0),
	(1976,231,'凭祥市',0),
	(1977,232,'秀英区',0),
	(1978,232,'龙华区',0),
	(1979,232,'琼山区',0),
	(1980,232,'美兰区',0),
	(1981,233,'五指山市',0),
	(1982,233,'琼海市',0),
	(1983,233,'儋州市',0),
	(1984,233,'文昌市',0),
	(1985,233,'万宁市',0),
	(1986,233,'东方市',0),
	(1987,233,'定安县',0),
	(1988,233,'屯昌县',0),
	(1989,233,'澄迈县',0),
	(1990,233,'临高县',0),
	(1991,233,'白沙黎族自治县',0),
	(1992,233,'昌江黎族自治县',0),
	(1993,233,'乐东黎族自治县',0),
	(1994,233,'陵水黎族自治县',0),
	(1995,233,'保亭黎族苗族自治县',0),
	(1996,233,'琼中黎族苗族自治县',0),
	(1997,233,'西沙群岛',0),
	(1998,233,'南沙群岛',0),
	(1999,233,'中沙群岛的岛礁及其海域',0),
	(2000,234,'万州区',0),
	(2001,234,'涪陵区',0),
	(2002,234,'渝中区',0),
	(2003,234,'大渡口区',0),
	(2004,234,'江北区',0),
	(2005,234,'沙坪坝区',0),
	(2006,234,'九龙坡区',0),
	(2007,234,'南岸区',0),
	(2008,234,'北碚区',0),
	(2009,234,'万盛区',0),
	(2010,234,'双桥区',0),
	(2011,234,'渝北区',0),
	(2012,234,'巴南区',0),
	(2013,234,'黔江区',0),
	(2014,234,'长寿区',0),
	(2015,234,'綦江县',0),
	(2016,234,'潼南县',0),
	(2017,234,'铜梁县',0),
	(2018,234,'大足县',0),
	(2019,234,'荣昌县',0),
	(2020,234,'璧山县',0),
	(2021,234,'梁平县',0),
	(2022,234,'城口县',0),
	(2023,234,'丰都县',0),
	(2024,234,'垫江县',0),
	(2025,234,'武隆县',0),
	(2026,234,'忠县',0),
	(2027,234,'开县',0),
	(2028,234,'云阳县',0),
	(2029,234,'奉节县',0),
	(2030,234,'巫山县',0),
	(2031,234,'巫溪县',0),
	(2032,234,'石柱土家族自治县',0),
	(2033,234,'秀山土家族苗族自治县',0),
	(2034,234,'酉阳土家族苗族自治县',0),
	(2035,234,'彭水苗族土家族自治县',0),
	(2036,234,'江津市',0),
	(2037,234,'合川市',0),
	(2038,234,'永川市',0),
	(2039,234,'南川市',0),
	(2040,235,'锦江区',0),
	(2041,235,'青羊区',0),
	(2042,235,'金牛区',0),
	(2043,235,'武侯区',0),
	(2044,235,'成华区',0),
	(2045,235,'龙泉驿区',0),
	(2046,235,'青白江区',0),
	(2047,235,'新都区',0),
	(2048,235,'温江区',0),
	(2049,235,'金堂县',0),
	(2050,235,'双流县',0),
	(2051,235,'郫县',0),
	(2052,235,'大邑县',0),
	(2053,235,'蒲江县',0),
	(2054,235,'新津县',0),
	(2055,235,'都江堰市',0),
	(2056,235,'彭州市',0),
	(2057,235,'邛崃市',0),
	(2058,235,'崇州市',0),
	(2059,236,'自流井区',0),
	(2060,236,'贡井区',0),
	(2061,236,'大安区',0),
	(2062,236,'沿滩区',0),
	(2063,236,'荣县',0),
	(2064,236,'富顺县',0),
	(2065,237,'东区',0),
	(2066,237,'西区',0),
	(2067,237,'仁和区',0),
	(2068,237,'米易县',0),
	(2069,237,'盐边县',0),
	(2070,238,'江阳区',0),
	(2071,238,'纳溪区',0),
	(2072,238,'龙马潭区',0),
	(2073,238,'泸县',0),
	(2074,238,'合江县',0),
	(2075,238,'叙永县',0),
	(2076,238,'古蔺县',0),
	(2077,239,'旌阳区',0),
	(2078,239,'中江县',0),
	(2079,239,'罗江县',0),
	(2080,239,'广汉市',0),
	(2081,239,'什邡市',0),
	(2082,239,'绵竹市',0),
	(2083,240,'涪城区',0),
	(2084,240,'游仙区',0),
	(2085,240,'三台县',0),
	(2086,240,'盐亭县',0),
	(2087,240,'安县',0),
	(2088,240,'梓潼县',0),
	(2089,240,'北川羌族自治县',0),
	(2090,240,'平武县',0),
	(2091,240,'江油市',0),
	(2092,241,'市中区',0),
	(2093,241,'元坝区',0),
	(2094,241,'朝天区',0),
	(2095,241,'旺苍县',0),
	(2096,241,'青川县',0),
	(2097,241,'剑阁县',0),
	(2098,241,'苍溪县',0),
	(2099,242,'船山区',0),
	(2100,242,'安居区',0),
	(2101,242,'蓬溪县',0),
	(2102,242,'射洪县',0),
	(2103,242,'大英县',0),
	(2104,243,'市中区',0),
	(2105,243,'东兴区',0),
	(2106,243,'威远县',0),
	(2107,243,'资中县',0),
	(2108,243,'隆昌县',0),
	(2109,244,'市中区',0),
	(2110,244,'沙湾区',0),
	(2111,244,'五通桥区',0),
	(2112,244,'金口河区',0),
	(2113,244,'犍为县',0),
	(2114,244,'井研县',0),
	(2115,244,'夹江县',0),
	(2116,244,'沐川县',0),
	(2117,244,'峨边彝族自治县',0),
	(2118,244,'马边彝族自治县',0),
	(2119,244,'峨眉山市',0),
	(2120,245,'顺庆区',0),
	(2121,245,'高坪区',0),
	(2122,245,'嘉陵区',0),
	(2123,245,'南部县',0),
	(2124,245,'营山县',0),
	(2125,245,'蓬安县',0),
	(2126,245,'仪陇县',0),
	(2127,245,'西充县',0),
	(2128,245,'阆中市',0),
	(2129,246,'东坡区',0),
	(2130,246,'仁寿县',0),
	(2131,246,'彭山县',0),
	(2132,246,'洪雅县',0),
	(2133,246,'丹棱县',0),
	(2134,246,'青神县',0),
	(2135,247,'翠屏区',0),
	(2136,247,'宜宾县',0),
	(2137,247,'南溪县',0),
	(2138,247,'江安县',0),
	(2139,247,'长宁县',0),
	(2140,247,'高县',0),
	(2141,247,'珙县',0),
	(2142,247,'筠连县',0),
	(2143,247,'兴文县',0),
	(2144,247,'屏山县',0),
	(2145,248,'广安区',0),
	(2146,248,'岳池县',0),
	(2147,248,'武胜县',0),
	(2148,248,'邻水县',0),
	(2149,248,'华蓥市',0),
	(2150,249,'通川区',0),
	(2151,249,'达县',0),
	(2152,249,'宣汉县',0),
	(2153,249,'开江县',0),
	(2154,249,'大竹县',0),
	(2155,249,'渠县',0),
	(2156,249,'万源市',0),
	(2157,250,'雨城区',0),
	(2158,250,'名山县',0),
	(2159,250,'荥经县',0),
	(2160,250,'汉源县',0),
	(2161,250,'石棉县',0),
	(2162,250,'天全县',0),
	(2163,250,'芦山县',0),
	(2164,250,'宝兴县',0),
	(2165,251,'巴州区',0),
	(2166,251,'通江县',0),
	(2167,251,'南江县',0),
	(2168,251,'平昌县',0),
	(2169,252,'雁江区',0),
	(2170,252,'安岳县',0),
	(2171,252,'乐至县',0),
	(2172,252,'简阳市',0),
	(2173,253,'汶川县',0),
	(2174,253,'理县',0),
	(2175,253,'茂县',0),
	(2176,253,'松潘县',0),
	(2177,253,'九寨沟县',0),
	(2178,253,'金川县',0),
	(2179,253,'小金县',0),
	(2180,253,'黑水县',0),
	(2181,253,'马尔康县',0),
	(2182,253,'壤塘县',0),
	(2183,253,'阿坝县',0),
	(2184,253,'若尔盖县',0),
	(2185,253,'红原县',0),
	(2186,254,'康定县',0),
	(2187,254,'泸定县',0),
	(2188,254,'丹巴县',0),
	(2189,254,'九龙县',0),
	(2190,254,'雅江县',0),
	(2191,254,'道孚县',0),
	(2192,254,'炉霍县',0),
	(2193,254,'甘孜县',0),
	(2194,254,'新龙县',0),
	(2195,254,'德格县',0),
	(2196,254,'白玉县',0),
	(2197,254,'石渠县',0),
	(2198,254,'色达县',0),
	(2199,254,'理塘县',0),
	(2200,254,'巴塘县',0),
	(2201,254,'乡城县',0),
	(2202,254,'稻城县',0),
	(2203,254,'得荣县',0),
	(2204,255,'西昌市',0),
	(2205,255,'木里藏族自治县',0),
	(2206,255,'盐源县',0),
	(2207,255,'德昌县',0),
	(2208,255,'会理县',0),
	(2209,255,'会东县',0),
	(2210,255,'宁南县',0),
	(2211,255,'普格县',0),
	(2212,255,'布拖县',0),
	(2213,255,'金阳县',0),
	(2214,255,'昭觉县',0),
	(2215,255,'喜德县',0),
	(2216,255,'冕宁县',0),
	(2217,255,'越西县',0),
	(2218,255,'甘洛县',0),
	(2219,255,'美姑县',0),
	(2220,255,'雷波县',0),
	(2221,256,'南明区',0),
	(2222,256,'云岩区',0),
	(2223,256,'花溪区',0),
	(2224,256,'乌当区',0),
	(2225,256,'白云区',0),
	(2226,256,'小河区',0),
	(2227,256,'开阳县',0),
	(2228,256,'息烽县',0),
	(2229,256,'修文县',0),
	(2230,256,'清镇市',0),
	(2231,257,'钟山区',0),
	(2232,257,'六枝特区',0),
	(2233,257,'水城县',0),
	(2234,257,'盘县',0),
	(2235,258,'红花岗区',0),
	(2236,258,'汇川区',0),
	(2237,258,'遵义县',0),
	(2238,258,'桐梓县',0),
	(2239,258,'绥阳县',0),
	(2240,258,'正安县',0),
	(2241,258,'道真仡佬族苗族自治县',0),
	(2242,258,'务川仡佬族苗族自治县',0),
	(2243,258,'凤冈县',0),
	(2244,258,'湄潭县',0),
	(2245,258,'余庆县',0),
	(2246,258,'习水县',0),
	(2247,258,'赤水市',0),
	(2248,258,'仁怀市',0),
	(2249,259,'西秀区',0),
	(2250,259,'平坝县',0),
	(2251,259,'普定县',0),
	(2252,259,'镇宁布依族苗族自治县',0),
	(2253,259,'关岭布依族苗族自治县',0),
	(2254,259,'紫云苗族布依族自治县',0),
	(2255,260,'铜仁市',0),
	(2256,260,'江口县',0),
	(2257,260,'玉屏侗族自治县',0),
	(2258,260,'石阡县',0),
	(2259,260,'思南县',0),
	(2260,260,'印江土家族苗族自治县',0),
	(2261,260,'德江县',0),
	(2262,260,'沿河土家族自治县',0),
	(2263,260,'松桃苗族自治县',0),
	(2264,260,'万山特区',0),
	(2265,261,'兴义市',0),
	(2266,261,'兴仁县',0),
	(2267,261,'普安县',0),
	(2268,261,'晴隆县',0),
	(2269,261,'贞丰县',0),
	(2270,261,'望谟县',0),
	(2271,261,'册亨县',0),
	(2272,261,'安龙县',0),
	(2273,262,'毕节市',0),
	(2274,262,'大方县',0),
	(2275,262,'黔西县',0),
	(2276,262,'金沙县',0),
	(2277,262,'织金县',0),
	(2278,262,'纳雍县',0),
	(2279,262,'威宁彝族回族苗族自治县',0),
	(2280,262,'赫章县',0),
	(2281,263,'凯里市',0),
	(2282,263,'黄平县',0),
	(2283,263,'施秉县',0),
	(2284,263,'三穗县',0),
	(2285,263,'镇远县',0),
	(2286,263,'岑巩县',0),
	(2287,263,'天柱县',0),
	(2288,263,'锦屏县',0),
	(2289,263,'剑河县',0),
	(2290,263,'台江县',0),
	(2291,263,'黎平县',0),
	(2292,263,'榕江县',0),
	(2293,263,'从江县',0),
	(2294,263,'雷山县',0),
	(2295,263,'麻江县',0),
	(2296,263,'丹寨县',0),
	(2297,264,'都匀市',0),
	(2298,264,'福泉市',0),
	(2299,264,'荔波县',0),
	(2300,264,'贵定县',0),
	(2301,264,'瓮安县',0),
	(2302,264,'独山县',0),
	(2303,264,'平塘县',0),
	(2304,264,'罗甸县',0),
	(2305,264,'长顺县',0),
	(2306,264,'龙里县',0),
	(2307,264,'惠水县',0),
	(2308,264,'三都水族自治县',0),
	(2309,265,'五华区',0),
	(2310,265,'盘龙区',0),
	(2311,265,'官渡区',0),
	(2312,265,'西山区',0),
	(2313,265,'东川区',0),
	(2314,265,'呈贡县',0),
	(2315,265,'晋宁县',0),
	(2316,265,'富民县',0),
	(2317,265,'宜良县',0),
	(2318,265,'石林彝族自治县',0),
	(2319,265,'嵩明县',0),
	(2320,265,'禄劝彝族苗族自治县',0),
	(2321,265,'寻甸回族彝族自治县',0),
	(2322,265,'安宁市',0),
	(2323,266,'麒麟区',0),
	(2324,266,'马龙县',0),
	(2325,266,'陆良县',0),
	(2326,266,'师宗县',0),
	(2327,266,'罗平县',0),
	(2328,266,'富源县',0),
	(2329,266,'会泽县',0),
	(2330,266,'沾益县',0),
	(2331,266,'宣威市',0),
	(2332,267,'红塔区',0),
	(2333,267,'江川县',0),
	(2334,267,'澄江县',0),
	(2335,267,'通海县',0),
	(2336,267,'华宁县',0),
	(2337,267,'易门县',0),
	(2338,267,'峨山彝族自治县',0),
	(2339,267,'新平彝族傣族自治县',0),
	(2340,267,'元江哈尼族彝族傣族自治县',0),
	(2341,268,'隆阳区',0),
	(2342,268,'施甸县',0),
	(2343,268,'腾冲县',0),
	(2344,268,'龙陵县',0),
	(2345,268,'昌宁县',0),
	(2346,269,'昭阳区',0),
	(2347,269,'鲁甸县',0),
	(2348,269,'巧家县',0),
	(2349,269,'盐津县',0),
	(2350,269,'大关县',0),
	(2351,269,'永善县',0),
	(2352,269,'绥江县',0),
	(2353,269,'镇雄县',0),
	(2354,269,'彝良县',0),
	(2355,269,'威信县',0),
	(2356,269,'水富县',0),
	(2357,270,'古城区',0),
	(2358,270,'玉龙纳西族自治县',0),
	(2359,270,'永胜县',0),
	(2360,270,'华坪县',0),
	(2361,270,'宁蒗彝族自治县',0),
	(2362,271,'翠云区',0),
	(2363,271,'普洱哈尼族彝族自治县',0),
	(2364,271,'墨江哈尼族自治县',0),
	(2365,271,'景东彝族自治县',0),
	(2366,271,'景谷傣族彝族自治县',0),
	(2367,271,'镇沅彝族哈尼族拉祜族自治县',0),
	(2368,271,'江城哈尼族彝族自治县',0),
	(2369,271,'孟连傣族拉祜族佤族自治县',0),
	(2370,271,'澜沧拉祜族自治县',0),
	(2371,271,'西盟佤族自治县',0),
	(2372,272,'临翔区',0),
	(2373,272,'凤庆县',0),
	(2374,272,'云县',0),
	(2375,272,'永德县',0),
	(2376,272,'镇康县',0),
	(2377,272,'双江拉祜族佤族布朗族傣族自治县',0),
	(2378,272,'耿马傣族佤族自治县',0),
	(2379,272,'沧源佤族自治县',0),
	(2380,273,'楚雄市',0),
	(2381,273,'双柏县',0),
	(2382,273,'牟定县',0),
	(2383,273,'南华县',0),
	(2384,273,'姚安县',0),
	(2385,273,'大姚县',0),
	(2386,273,'永仁县',0),
	(2387,273,'元谋县',0),
	(2388,273,'武定县',0),
	(2389,273,'禄丰县',0),
	(2390,274,'个旧市',0),
	(2391,274,'开远市',0),
	(2392,274,'蒙自县',0),
	(2393,274,'屏边苗族自治县',0),
	(2394,274,'建水县',0),
	(2395,274,'石屏县',0),
	(2396,274,'弥勒县',0),
	(2397,274,'泸西县',0),
	(2398,274,'元阳县',0),
	(2399,274,'红河县',0),
	(2400,274,'金平苗族瑶族傣族自治县',0),
	(2401,274,'绿春县',0),
	(2402,274,'河口瑶族自治县',0),
	(2403,275,'文山县',0),
	(2404,275,'砚山县',0),
	(2405,275,'西畴县',0),
	(2406,275,'麻栗坡县',0),
	(2407,275,'马关县',0),
	(2408,275,'丘北县',0),
	(2409,275,'广南县',0),
	(2410,275,'富宁县',0),
	(2411,276,'景洪市',0),
	(2412,276,'勐海县',0),
	(2413,276,'勐腊县',0),
	(2414,277,'大理市',0),
	(2415,277,'漾濞彝族自治县',0),
	(2416,277,'祥云县',0),
	(2417,277,'宾川县',0),
	(2418,277,'弥渡县',0),
	(2419,277,'南涧彝族自治县',0),
	(2420,277,'巍山彝族回族自治县',0),
	(2421,277,'永平县',0),
	(2422,277,'云龙县',0),
	(2423,277,'洱源县',0),
	(2424,277,'剑川县',0),
	(2425,277,'鹤庆县',0),
	(2426,278,'瑞丽市',0),
	(2427,278,'潞西市',0),
	(2428,278,'梁河县',0),
	(2429,278,'盈江县',0),
	(2430,278,'陇川县',0),
	(2431,279,'泸水县',0),
	(2432,279,'福贡县',0),
	(2433,279,'贡山独龙族怒族自治县',0),
	(2434,279,'兰坪白族普米族自治县',0),
	(2435,280,'香格里拉县',0),
	(2436,280,'德钦县',0),
	(2437,280,'维西傈僳族自治县',0),
	(2438,281,'城关区',0),
	(2439,281,'林周县',0),
	(2440,281,'当雄县',0),
	(2441,281,'尼木县',0),
	(2442,281,'曲水县',0),
	(2443,281,'堆龙德庆县',0),
	(2444,281,'达孜县',0),
	(2445,281,'墨竹工卡县',0),
	(2446,282,'昌都县',0),
	(2447,282,'江达县',0),
	(2448,282,'贡觉县',0),
	(2449,282,'类乌齐县',0),
	(2450,282,'丁青县',0),
	(2451,282,'察雅县',0),
	(2452,282,'八宿县',0),
	(2453,282,'左贡县',0),
	(2454,282,'芒康县',0),
	(2455,282,'洛隆县',0),
	(2456,282,'边坝县',0),
	(2457,283,'乃东县',0),
	(2458,283,'扎囊县',0),
	(2459,283,'贡嘎县',0),
	(2460,283,'桑日县',0),
	(2461,283,'琼结县',0),
	(2462,283,'曲松县',0),
	(2463,283,'措美县',0),
	(2464,283,'洛扎县',0),
	(2465,283,'加查县',0),
	(2466,283,'隆子县',0),
	(2467,283,'错那县',0),
	(2468,283,'浪卡子县',0),
	(2469,284,'日喀则市',0),
	(2470,284,'南木林县',0),
	(2471,284,'江孜县',0),
	(2472,284,'定日县',0),
	(2473,284,'萨迦县',0),
	(2474,284,'拉孜县',0),
	(2475,284,'昂仁县',0),
	(2476,284,'谢通门县',0),
	(2477,284,'白朗县',0),
	(2478,284,'仁布县',0),
	(2479,284,'康马县',0),
	(2480,284,'定结县',0),
	(2481,284,'仲巴县',0),
	(2482,284,'亚东县',0),
	(2483,284,'吉隆县',0),
	(2484,284,'聂拉木县',0),
	(2485,284,'萨嘎县',0),
	(2486,284,'岗巴县',0),
	(2487,285,'那曲县',0),
	(2488,285,'嘉黎县',0),
	(2489,285,'比如县',0),
	(2490,285,'聂荣县',0),
	(2491,285,'安多县',0),
	(2492,285,'申扎县',0),
	(2493,285,'索县',0),
	(2494,285,'班戈县',0),
	(2495,285,'巴青县',0),
	(2496,285,'尼玛县',0),
	(2497,286,'普兰县',0),
	(2498,286,'札达县',0),
	(2499,286,'噶尔县',0),
	(2500,286,'日土县',0),
	(2501,286,'革吉县',0),
	(2502,286,'改则县',0),
	(2503,286,'措勤县',0),
	(2504,287,'林芝县',0),
	(2505,287,'工布江达县',0),
	(2506,287,'米林县',0),
	(2507,287,'墨脱县',0),
	(2508,287,'波密县',0),
	(2509,287,'察隅县',0),
	(2510,287,'朗县',0),
	(2511,288,'新城区',0),
	(2512,288,'碑林区',0),
	(2513,288,'莲湖区',0),
	(2514,288,'灞桥区',0),
	(2515,288,'未央区',0),
	(2516,288,'雁塔区',0),
	(2517,288,'阎良区',0),
	(2518,288,'临潼区',0),
	(2519,288,'长安区',0),
	(2520,288,'蓝田县',0),
	(2521,288,'周至县',0),
	(2522,288,'户县',0),
	(2523,288,'高陵县',0),
	(2524,289,'王益区',0),
	(2525,289,'印台区',0),
	(2526,289,'耀州区',0),
	(2527,289,'宜君县',0),
	(2528,290,'渭滨区',0),
	(2529,290,'金台区',0),
	(2530,290,'陈仓区',0),
	(2531,290,'凤翔县',0),
	(2532,290,'岐山县',0),
	(2533,290,'扶风县',0),
	(2534,290,'眉县',0),
	(2535,290,'陇县',0),
	(2536,290,'千阳县',0),
	(2537,290,'麟游县',0),
	(2538,290,'凤县',0),
	(2539,290,'太白县',0),
	(2540,291,'秦都区',0),
	(2541,291,'杨凌区',0),
	(2542,291,'渭城区',0),
	(2543,291,'三原县',0),
	(2544,291,'泾阳县',0),
	(2545,291,'乾县',0),
	(2546,291,'礼泉县',0),
	(2547,291,'永寿县',0),
	(2548,291,'彬县',0),
	(2549,291,'长武县',0),
	(2550,291,'旬邑县',0),
	(2551,291,'淳化县',0),
	(2552,291,'武功县',0),
	(2553,291,'兴平市',0),
	(2554,292,'临渭区',0),
	(2555,292,'华县',0),
	(2556,292,'潼关县',0),
	(2557,292,'大荔县',0),
	(2558,292,'合阳县',0),
	(2559,292,'澄城县',0),
	(2560,292,'蒲城县',0),
	(2561,292,'白水县',0),
	(2562,292,'富平县',0),
	(2563,292,'韩城市',0),
	(2564,292,'华阴市',0),
	(2565,293,'宝塔区',0),
	(2566,293,'延长县',0),
	(2567,293,'延川县',0),
	(2568,293,'子长县',0),
	(2569,293,'安塞县',0),
	(2570,293,'志丹县',0),
	(2571,293,'吴旗县',0),
	(2572,293,'甘泉县',0),
	(2573,293,'富县',0),
	(2574,293,'洛川县',0),
	(2575,293,'宜川县',0),
	(2576,293,'黄龙县',0),
	(2577,293,'黄陵县',0),
	(2578,294,'汉台区',0),
	(2579,294,'南郑县',0),
	(2580,294,'城固县',0),
	(2581,294,'洋县',0),
	(2582,294,'西乡县',0),
	(2583,294,'勉县',0),
	(2584,294,'宁强县',0),
	(2585,294,'略阳县',0),
	(2586,294,'镇巴县',0),
	(2587,294,'留坝县',0),
	(2588,294,'佛坪县',0),
	(2589,295,'榆阳区',0),
	(2590,295,'神木县',0),
	(2591,295,'府谷县',0),
	(2592,295,'横山县',0),
	(2593,295,'靖边县',0),
	(2594,295,'定边县',0),
	(2595,295,'绥德县',0),
	(2596,295,'米脂县',0),
	(2597,295,'佳县',0),
	(2598,295,'吴堡县',0),
	(2599,295,'清涧县',0),
	(2600,295,'子洲县',0),
	(2601,296,'汉滨区',0),
	(2602,296,'汉阴县',0),
	(2603,296,'石泉县',0),
	(2604,296,'宁陕县',0),
	(2605,296,'紫阳县',0),
	(2606,296,'岚皋县',0),
	(2607,296,'平利县',0),
	(2608,296,'镇坪县',0),
	(2609,296,'旬阳县',0),
	(2610,296,'白河县',0),
	(2611,297,'商州区',0),
	(2612,297,'洛南县',0),
	(2613,297,'丹凤县',0),
	(2614,297,'商南县',0),
	(2615,297,'山阳县',0),
	(2616,297,'镇安县',0),
	(2617,297,'柞水县',0),
	(2618,298,'城关区',0),
	(2619,298,'七里河区',0),
	(2620,298,'西固区',0),
	(2621,298,'安宁区',0),
	(2622,298,'红古区',0),
	(2623,298,'永登县',0),
	(2624,298,'皋兰县',0),
	(2625,298,'榆中县',0),
	(2626,300,'金川区',0),
	(2627,300,'永昌县',0),
	(2628,301,'白银区',0),
	(2629,301,'平川区',0),
	(2630,301,'靖远县',0),
	(2631,301,'会宁县',0),
	(2632,301,'景泰县',0),
	(2633,302,'秦城区',0),
	(2634,302,'北道区',0),
	(2635,302,'清水县',0),
	(2636,302,'秦安县',0),
	(2637,302,'甘谷县',0),
	(2638,302,'武山县',0),
	(2639,302,'张家川回族自治县',0),
	(2640,303,'凉州区',0),
	(2641,303,'民勤县',0),
	(2642,303,'古浪县',0),
	(2643,303,'天祝藏族自治县',0),
	(2644,304,'甘州区',0),
	(2645,304,'肃南裕固族自治县',0),
	(2646,304,'民乐县',0),
	(2647,304,'临泽县',0),
	(2648,304,'高台县',0),
	(2649,304,'山丹县',0),
	(2650,305,'崆峒区',0),
	(2651,305,'泾川县',0),
	(2652,305,'灵台县',0),
	(2653,305,'崇信县',0),
	(2654,305,'华亭县',0),
	(2655,305,'庄浪县',0),
	(2656,305,'静宁县',0),
	(2657,306,'肃州区',0),
	(2658,306,'金塔县',0),
	(2659,306,'安西县',0),
	(2660,306,'肃北蒙古族自治县',0),
	(2661,306,'阿克塞哈萨克族自治县',0),
	(2662,306,'玉门市',0),
	(2663,306,'敦煌市',0),
	(2664,307,'西峰区',0),
	(2665,307,'庆城县',0),
	(2666,307,'环县',0),
	(2667,307,'华池县',0),
	(2668,307,'合水县',0),
	(2669,307,'正宁县',0),
	(2670,307,'宁县',0),
	(2671,307,'镇原县',0),
	(2672,308,'安定区',0),
	(2673,308,'通渭县',0),
	(2674,308,'陇西县',0),
	(2675,308,'渭源县',0),
	(2676,308,'临洮县',0),
	(2677,308,'漳县',0),
	(2678,308,'岷县',0),
	(2679,309,'武都区',0),
	(2680,309,'成县',0),
	(2681,309,'文县',0),
	(2682,309,'宕昌县',0),
	(2683,309,'康县',0),
	(2684,309,'西和县',0),
	(2685,309,'礼县',0),
	(2686,309,'徽县',0),
	(2687,309,'两当县',0),
	(2688,310,'临夏市',0),
	(2689,310,'临夏县',0),
	(2690,310,'康乐县',0),
	(2691,310,'永靖县',0),
	(2692,310,'广河县',0),
	(2693,310,'和政县',0),
	(2694,310,'东乡族自治县',0),
	(2695,310,'积石山保安族东乡族撒拉族自治县',0),
	(2696,311,'合作市',0),
	(2697,311,'临潭县',0),
	(2698,311,'卓尼县',0),
	(2699,311,'舟曲县',0),
	(2700,311,'迭部县',0),
	(2701,311,'玛曲县',0),
	(2702,311,'碌曲县',0),
	(2703,311,'夏河县',0),
	(2704,312,'城东区',0),
	(2705,312,'城中区',0),
	(2706,312,'城西区',0),
	(2707,312,'城北区',0),
	(2708,312,'大通回族土族自治县',0),
	(2709,312,'湟中县',0),
	(2710,312,'湟源县',0),
	(2711,313,'平安县',0),
	(2712,313,'民和回族土族自治县',0),
	(2713,313,'乐都县',0),
	(2714,313,'互助土族自治县',0),
	(2715,313,'化隆回族自治县',0),
	(2716,313,'循化撒拉族自治县',0),
	(2717,314,'门源回族自治县',0),
	(2718,314,'祁连县',0),
	(2719,314,'海晏县',0),
	(2720,314,'刚察县',0),
	(2721,315,'同仁县',0),
	(2722,315,'尖扎县',0),
	(2723,315,'泽库县',0),
	(2724,315,'河南蒙古族自治县',0),
	(2725,316,'共和县',0),
	(2726,316,'同德县',0),
	(2727,316,'贵德县',0),
	(2728,316,'兴海县',0),
	(2729,316,'贵南县',0),
	(2730,317,'玛沁县',0),
	(2731,317,'班玛县',0),
	(2732,317,'甘德县',0),
	(2733,317,'达日县',0),
	(2734,317,'久治县',0),
	(2735,317,'玛多县',0),
	(2736,318,'玉树县',0),
	(2737,318,'杂多县',0),
	(2738,318,'称多县',0),
	(2739,318,'治多县',0),
	(2740,318,'囊谦县',0),
	(2741,318,'曲麻莱县',0),
	(2742,319,'格尔木市',0),
	(2743,319,'德令哈市',0),
	(2744,319,'乌兰县',0),
	(2745,319,'都兰县',0),
	(2746,319,'天峻县',0),
	(2747,320,'兴庆区',0),
	(2748,320,'西夏区',0),
	(2749,320,'金凤区',0),
	(2750,320,'永宁县',0),
	(2751,320,'贺兰县',0),
	(2752,320,'灵武市',0),
	(2753,321,'大武口区',0),
	(2754,321,'惠农区',0),
	(2755,321,'平罗县',0),
	(2756,322,'利通区',0),
	(2757,322,'盐池县',0),
	(2758,322,'同心县',0),
	(2759,322,'青铜峡市',0),
	(2760,323,'原州区',0),
	(2761,323,'西吉县',0),
	(2762,323,'隆德县',0),
	(2763,323,'泾源县',0),
	(2764,323,'彭阳县',0),
	(2765,324,'沙坡头区',0),
	(2766,324,'中宁县',0),
	(2767,324,'海原县',0),
	(2768,325,'天山区',0),
	(2769,325,'沙依巴克区',0),
	(2770,325,'新市区',0),
	(2771,325,'水磨沟区',0),
	(2772,325,'头屯河区',0),
	(2773,325,'达坂城区',0),
	(2774,325,'东山区',0),
	(2775,325,'乌鲁木齐县',0),
	(2776,326,'独山子区',0),
	(2777,326,'克拉玛依区',0),
	(2778,326,'白碱滩区',0),
	(2779,326,'乌尔禾区',0),
	(2780,327,'吐鲁番市',0),
	(2781,327,'鄯善县',0),
	(2782,327,'托克逊县',0),
	(2783,328,'哈密市',0),
	(2784,328,'巴里坤哈萨克自治县',0),
	(2785,328,'伊吾县',0),
	(2786,329,'昌吉市',0),
	(2787,329,'阜康市',0),
	(2788,329,'米泉市',0),
	(2789,329,'呼图壁县',0),
	(2790,329,'玛纳斯县',0),
	(2791,329,'奇台县',0),
	(2792,329,'吉木萨尔县',0),
	(2793,329,'木垒哈萨克自治县',0),
	(2794,330,'博乐市',0),
	(2795,330,'精河县',0),
	(2796,330,'温泉县',0),
	(2797,331,'库尔勒市',0),
	(2798,331,'轮台县',0),
	(2799,331,'尉犁县',0),
	(2800,331,'若羌县',0),
	(2801,331,'且末县',0),
	(2802,331,'焉耆回族自治县',0),
	(2803,331,'和静县',0),
	(2804,331,'和硕县',0),
	(2805,331,'博湖县',0),
	(2806,332,'阿克苏市',0),
	(2807,332,'温宿县',0),
	(2808,332,'库车县',0),
	(2809,332,'沙雅县',0),
	(2810,332,'新和县',0),
	(2811,332,'拜城县',0),
	(2812,332,'乌什县',0),
	(2813,332,'阿瓦提县',0),
	(2814,332,'柯坪县',0),
	(2815,333,'阿图什市',0),
	(2816,333,'阿克陶县',0),
	(2817,333,'阿合奇县',0),
	(2818,333,'乌恰县',0),
	(2819,334,'喀什市',0),
	(2820,334,'疏附县',0),
	(2821,334,'疏勒县',0),
	(2822,334,'英吉沙县',0),
	(2823,334,'泽普县',0),
	(2824,334,'莎车县',0),
	(2825,334,'叶城县',0),
	(2826,334,'麦盖提县',0),
	(2827,334,'岳普湖县',0),
	(2828,334,'伽师县',0),
	(2829,334,'巴楚县',0),
	(2830,334,'塔什库尔干塔吉克自治县',0),
	(2831,335,'和田市',0),
	(2832,335,'和田县',0),
	(2833,335,'墨玉县',0),
	(2834,335,'皮山县',0),
	(2835,335,'洛浦县',0),
	(2836,335,'策勒县',0),
	(2837,335,'于田县',0),
	(2838,335,'民丰县',0),
	(2839,336,'伊宁市',0),
	(2840,336,'奎屯市',0),
	(2841,336,'伊宁县',0),
	(2842,336,'察布查尔锡伯自治县',0),
	(2843,336,'霍城县',0),
	(2844,336,'巩留县',0),
	(2845,336,'新源县',0),
	(2846,336,'昭苏县',0),
	(2847,336,'特克斯县',0),
	(2848,336,'尼勒克县',0),
	(2849,337,'塔城市',0),
	(2850,337,'乌苏市',0),
	(2851,337,'额敏县',0),
	(2852,337,'沙湾县',0),
	(2853,337,'托里县',0),
	(2854,337,'裕民县',0),
	(2855,337,'和布克赛尔蒙古自治县',0),
	(2856,338,'阿勒泰市',0),
	(2857,338,'布尔津县',0),
	(2858,338,'富蕴县',0),
	(2859,338,'福海县',0),
	(2860,338,'哈巴河县',0),
	(2861,338,'青河县',0),
	(2862,338,'吉木乃县',0),
	(2867,352,'宛平县',1),
	(2868,352,'111111',5),
	(2869,345,'台北',2);

/*!40000 ALTER TABLE `sys_district` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_hooks
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_hooks`;

CREATE TABLE `sys_hooks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(40) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `description` text NOT NULL COMMENT '描述',
  `type` tinyint(1) unsigned NOT NULL DEFAULT 1 COMMENT '类型  1 视图 2 控制器',
  `addons` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子挂载的插件 ''，''分割',
  `status` tinyint(2) DEFAULT 1,
  `update_time` int(11) DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=65;

LOCK TABLES `sys_hooks` WRITE;
/*!40000 ALTER TABLE `sys_hooks` DISABLE KEYS */;

INSERT INTO `sys_hooks` (`id`, `name`, `description`, `type`, `addons`, `status`, `update_time`)
VALUES
	(23,'login','第三方登录',1,'Oauthlogin',1,1499327900),
	(24,'sms','短信',1,'sms',1,1499487808),
	(26,'wxtemplatemsg','微信模板消息设置',1,'wxtemplatemsg',1,1500013768),
	(27,'orderCreateSuccess','订单创建成功',2,'wxtemplatemsg',1,1500025515),
	(29,'orderDeliverySuccess','订单发货成功',2,'wxtemplatemsg',1,1500448695),
	(30,'orderPaySuccess','订单付款成功',2,'wxtemplatemsg',1,1500448963),
	(31,'orderRefundApplyCreateSuccess','订单申请退款创建成功',2,'wxtemplatemsg',1,1500449386),
	(32,'orderRefundSuccess','订单退款成功',2,'wxtemplatemsg',1,1500450437),
	(33,'userWithdrawApplyCreateSuccess','会员提现申请创建成功',2,'wxtemplatemsg',1,1500450601),
	(34,'userLoginSuccess','用户登陆成功',2,'',1,1500619318),
	(35,'userAddSuccess','基础用户添加成功后',2,'',1,1500619587),
	(36,'memberRegisterSuccess','会员注册成功',2,'wxtemplatemsg',1,1500619688),
	(37,'memberLevelSaveSuccess','会员等级保存成功',2,'',1,1500620008),
	(38,'memberWithdrawApplyCreateSuccess','会员提现申请创建成功',2,'wxtemplatemsg',1,1500620146),
	(39,'memberWithdrawAuditAgree','会员提现审核通过',2,'wxtemplatemsg',1,1500620297),
	(40,'goodsSaveSuccess','商品保存成功',2,'',1,1500620784),
	(41,'goodsSaveBefore','商品保存之前',2,'',1,1500620803),
	(42,'goodsDeleteBefore','商品删除之前',2,'',1,1500621085),
	(43,'goodsDeleteSuccess','商品删除成功',2,'',1,1500621109),
	(44,'goodsOnlineSuccess','商品上架成功',2,'',1,1500621131),
	(45,'goodsOfflineSuccess','商品下架成功',2,'',1,1500621142),
	(55,'goodsCategorySaveSuccess','商品分类保存成功',2,'',1,1500621379),
	(56,'goodsCategoryDeleteSuccess','商品分类删除成功',2,'',1,1500621397),
	(57,'goodsBrandSaveSuccess','商品品牌保存成功',2,'',1,1500621414),
	(58,'goodsBrandDeleteSuccess','商品品牌删除成功',2,'',1,1500621428),
	(59,'goodsGroupSaveSuccess','商品分组保存成功',2,'',1,1500621441),
	(60,'goodsGroupDeleteSuccess','商品分组删除成功',2,'',1,1500621455),
	(61,'goodsSpecSaveSuccess','商品规格保存成功',2,'',1,1500621470),
	(62,'goodsSpecDeleteSuccess','商品规格删除成功',2,'',1,1500621483),
	(63,'goodsAttributeSaveSuccess','商品类型保存成功',2,'',1,1500621495),
	(64,'goodsAttributeDeleteSuccess','商品类型删除成功',2,'',1,1500621506);

/*!40000 ALTER TABLE `sys_hooks` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_instance
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_instance`;

CREATE TABLE `sys_instance` (
  `instance_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_name` varchar(50) NOT NULL DEFAULT '' COMMENT '实例名',
  `instance_typeid` int(11) NOT NULL DEFAULT 2 COMMENT '实例类型ID',
  `qrcode` varchar(255) NOT NULL DEFAULT '' COMMENT '实例二维码',
  `remark` text DEFAULT NULL COMMENT '实例简介',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1365 COMMENT='系统实例表';

LOCK TABLES `sys_instance` WRITE;
/*!40000 ALTER TABLE `sys_instance` DISABLE KEYS */;

INSERT INTO `sys_instance` (`instance_id`, `instance_name`, `instance_typeid`, `qrcode`, `remark`, `create_time`)
VALUES
	(19,'您的开源商城',1,'','\'\'',1477541018);

/*!40000 ALTER TABLE `sys_instance` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_instance_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_instance_type`;

CREATE TABLE `sys_instance_type` (
  `instance_typeid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '实例类型ID',
  `type_name` varchar(50) NOT NULL DEFAULT '' COMMENT '实例类型名称',
  `type_module_array` text NOT NULL COMMENT '实例类型权限',
  `type_desc` text NOT NULL COMMENT '实例类型说明',
  `type_sort` int(11) NOT NULL DEFAULT 1 COMMENT '排序号',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  `modify_time` int(11) DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`instance_typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='实例类型';



# Dump of table sys_module
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_module`;

CREATE TABLE `sys_module` (
  `module_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模块ID',
  `module_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模块标题',
  `module` varchar(255) NOT NULL DEFAULT 'admin' COMMENT '项目名',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '控制器名',
  `method` varchar(255) NOT NULL DEFAULT '' COMMENT '方法名',
  `pid` int(10) NOT NULL DEFAULT 0 COMMENT '上级模块ID',
  `level` int(11) NOT NULL DEFAULT 1 COMMENT '深度等级',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `is_menu` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是菜单',
  `is_dev` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否仅开发者模式可见',
  `sort` int(10) NOT NULL DEFAULT 0 COMMENT '排序（同级有效）',
  `desc` text DEFAULT NULL COMMENT '模块描述',
  `module_picture` varchar(255) NOT NULL DEFAULT '' COMMENT '模块图片',
  `icon_class` varchar(255) NOT NULL DEFAULT '' COMMENT '矢量图class',
  `is_control_auth` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否控制权限',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  `modify_time` int(11) DEFAULT 0,
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=606 COMMENT='系统模块表';

LOCK TABLES `sys_module` WRITE;
/*!40000 ALTER TABLE `sys_module` DISABLE KEYS */;

INSERT INTO `sys_module` (`module_id`, `module_name`, `module`, `controller`, `method`, `pid`, `level`, `url`, `is_menu`, `is_dev`, `sort`, `desc`, `module_picture`, `icon_class`, `is_control_auth`, `create_time`, `modify_time`)
VALUES
	(120,'系统','admin','system','modulelist',0,1,'system/modulelist',1,0,999,'\'\'','','',1,1477454152,1477794717),
	(121,'模块列表','admin','system','modulelist',120,2,'system/modulelist',1,0,2,'\'\'','','',1,0,NULL),
	(122,'添加模块','admin','system','addmodule',121,3,'system/addmodule',0,0,1,'添加模块','','',1,0,1479976597),
	(123,'修改模块','admin','system','editmodule',121,3,'system/editmodule',0,0,2,'修改模块','','',1,0,1479976646),
	(126,'用户','admin','auth','userlist',0,1,'auth/userlist',1,0,10,'','','',1,0,1484650663),
	(127,'用户列表','admin','auth','userlist',126,2,'auth/userlist',1,0,0,NULL,'','',1,0,NULL),
	(128,'用户组列表','admin','auth','authgrouplist',126,2,'auth/authgrouplist',1,0,0,'用户组','','',1,0,1479976919),
	(129,'删除模块','admin','system','delmodule',121,3,'system/delmodule',0,0,0,'模块列表','','',1,1477618350,1479976723),
	(133,'添加用户组','admin','auth','addusergroup',128,3,'auth/addusergroup',0,0,2,'用户组','','',1,1477628544,1479977008),
	(137,'会员','admin','member','memberlist',0,1,'member/memberlist',1,0,4,'','','',1,1477994717,1493206725),
	(139,'相册管理','admin','system','albumlist',149,2,'system/albumlist',1,0,10,'相册管理','','',1,1478158094,1496819610),
	(144,'编辑用户','admin','auth','edituser',127,3,'auth/edituser',0,0,5,'用户','','',1,1478837447,1479976963),
	(145,'会员列表','admin','member','memberlist',137,2,'member/memberlist',1,0,1,'','','',1,1478846113,1478846203),
	(149,'商品','admin','goods','goodslist',0,1,'goods/goodslist',1,0,1,'商品模块','','',1,1479268148,1493973167),
	(150,'商品列表','admin','goods','goodslist',149,2,'goods/goodslist',1,0,1,'商品列表','','',0,1479268236,1491898725),
	(151,'商品发布','admin','goods','addgoods',149,2,'goods/addgoods',1,0,2,'商品发布','','',1,1479268307,NULL),
	(169,'图片管理','admin','system','albumpicturelist',139,3,'system/albumpicturelist',0,0,5,'sfgsdf','','',1,1479464708,1479976790),
	(170,'添加运费模板','admin','express','transportationadd',164,3,'express/transportationadd',0,0,1,'添加运费模板','','',1,1479700610,1484894376),
	(171,'商品标签','admin','goods','goodsgrouplist',149,2,'goods/goodsgrouplist',1,0,3,'商品分组','','',1,1479873298,1479960182),
	(172,'添加商品标签','admin','goods','addgoodsgroup',171,3,'goods/addgoodsgroup',0,0,6,'添加商品分组','','',1,1479873424,1479960243),
	(176,'运费模板修改','admin','express','transportationedit',164,3,'express/transportationedit',0,0,6,'sd','','',1,1480040625,NULL),
	(179,'营销','admin','promotion','coupontypelist',0,1,'promotion/coupontypelist',1,0,3,'优惠券类型列表','','',1,1480491652,1480491725),
	(180,'优惠券','admin','promotion','coupontypelist',179,2,'promotion/coupontypelist',1,0,1,'优惠券类型列表','','',1,1480491846,NULL),
	(184,'订单','admin','order','orderlist',0,1,'order/orderlist',1,0,2,'订单列表','','',1,1480563137,NULL),
	(185,'订单列表','admin','order','orderlist',184,2,'order/orderlist',1,0,1,'订单列表','','',1,1480563210,NULL),
	(186,'添加优惠券','admin','promotion','addcoupontype',180,3,'promotion/addcoupontype',1,0,2,'添加优惠券类型','','',1,1480573171,NULL),
	(187,'修改优惠券','admin','promotion','updatecoupontype',180,3,'promotion/updatecoupontype',1,0,3,'修改优惠券类型','','',1,1480904943,NULL),
	(189,'物流公司','admin','express','expresscompany',529,3,'express/expresscompany',0,0,60,'物流公司','','',1,1481254866,1484894344),
	(190,'订单详情','admin','order','orderdetail',185,3,'order/orderdetail',0,0,1,'订单详情','','',1,1481258173,NULL),
	(191,'添加物流公司','admin','express','addexpresscompany',529,3,'express/addexpresscompany',1,0,1,'添加物流公司','','',1,1481267828,NULL),
	(192,'物流公司修改','admin','express','updateexpresscompany',529,3,'express/updateexpresscompany',1,0,2,'物流公司修改排序','','',1,1481271808,NULL),
	(194,'退款详情','admin','order','orderrefunddetail',185,3,'order/orderrefunddetail',0,0,2,'退款详情','','',1,1481872074,NULL),
	(195,'赠品','admin','promotion','giftlist',179,2,'promotion/giftlist',0,0,3,'','','',1,1482113074,1494215988),
	(196,'添加赠品','admin','promotion','addgift',195,3,'promotion/addgift',1,0,0,'添加赠品','','',1,1482113664,1482117539),
	(197,'修改赠品','admin','promotion','updategift',195,3,'promotion/updategift',1,0,0,'修改赠品','','',1,1482113715,1482117558),
	(198,'满减送','admin','promotion','mansonglist',179,2,'promotion/mansonglist',1,0,4,'满减送','','',1,1482138580,1482138597),
	(199,'添加满减满送','admin','promotion','addmansong',198,3,'promotion/addmansong',1,0,0,'满减送','','',1,1482140311,NULL),
	(200,'编辑满减送','admin','promotion','updatemansong',198,3,'promotion/updatemansong',1,0,1,'编辑满减送','','',1,1482907059,NULL),
	(201,'限时折扣','admin','promotion','getdiscountlist',179,2,'promotion/getdiscountlist',1,0,5,'限时折扣','','',1,1483949283,NULL),
	(202,'添加限时折扣','admin','promotion','adddiscount',201,3,'promotion/adddiscount',1,0,0,'添加限时折扣','','',1,1483951104,NULL),
	(203,'修改限时折扣','admin','promotion','updatediscount',201,3,'promotion/updatediscount',1,0,1,'修改限时折扣','','',1,1483951151,1483958451),
	(210,'修改商品标签','admin','goods','updategoodsgroup',171,3,'goods/updategoodsgroup',0,0,2,'修改商品分组','','',1,1484120298,1484125917),
	(218,'设置','admin','config','webconfig',0,1,'config/webconfig',1,0,11,'店铺设置','','',1,1484617355,1493348177),
	(221,'支付配置','admin','config','paymentconfig',218,2,'config/paymentconfig',1,0,40,'支付配置','\'\'','',1,1484623427,1496820428),
	(334,'咨询管理','admin','saleservice','consultlist',149,2,'saleservice/consultlist',1,0,8,'咨询管理，未回复咨询，已回复咨询','','',1,1488875702,1496392553),
	(335,'微信','admin','wchat','config',0,1,'wchat/config',1,0,8,'微信','','',1,1488945338,1493015492),
	(336,'公众号管理','admin','wchat','config',335,2,'wchat/config',1,0,1,'公众号管理','','',1,1488945416,NULL),
	(339,'微信菜单管理','admin','wchat','menu',335,2,'wchat/menu',1,0,2,'微信菜单管理','','',1,1489046481,NULL),
	(340,'推广二维码管理','admin','wchat','weixinqrcodetemplate',335,2,'wchat/weixinqrcodetemplate',1,0,3,'推广二维码管理','','',1,1489046596,1490153341),
	(341,'回复设置','admin','wchat','replayconfig',335,2,'wchat/replayconfig',1,0,4,'','','',1,1489046662,NULL),
	(342,'消息素材管理','admin','wchat','materialmessage',335,2,'wchat/materialmessage',1,0,6,'','','',1,1489046731,NULL),
	(343,'分享内容设置','admin','wchat','shareconfig',335,2,'wchat/shareconfig',1,0,7,'','','',1,1489046804,NULL),
	(358,'自定义推广二维码','admin','wchat','qrcode',340,3,'wchat/qrcode',0,0,1,'自定义二维码','','',1,1490153257,1490153278),
	(359,'添加回复','admin','wchat','addorupdatekeyreplay',341,3,'wchat/addorupdatekeyreplay',1,0,1,'','','',1,1490236498,NULL),
	(360,'添加用户','admin','auth','adduser',127,3,'auth/adduser',0,0,1,'添加用户','','',1,1490236731,NULL),
	(361,'一键关注设置','admin','wchat','onekeysubscribe',335,2,'wchat/onekeysubscribe',0,0,6,'一键关注设置','','',1,1490318979,1496386363),
	(381,'广告位','admin','system','shopadvlist',477,2,'system/shopadvlist',1,0,9,'广告位设置','','',1,1490774263,1496320676),
	(382,'广告管理','admin','system','shopadvlist',381,3,'system/shopadvlist',0,0,0,'广告管理','','',1,1490785255,NULL),
	(383,'添加广告位','admin','system','addshopadvposition',381,3,'system/addshopadvposition',0,0,0,'添加广告位','','',1,1490835009,NULL),
	(387,'广告位编辑','admin','system','updateshopadvposition',381,3,'system/updateshopadvposition',1,0,0,'广告位编辑','','',1,1490851266,NULL),
	(388,'添加广告','admin','system','addshopadv',381,3,'system/addshopadv',0,0,0,'添加广告','','',1,1490854140,NULL),
	(389,'广告编辑','admin','system','updateshopadv',381,3,'system/updateshopadv',0,0,0,'','','',1,1490857038,NULL),
	(390,'促销版块','admin','system','goodsrecommendclass',10007,3,'system/goodsrecommendclass',0,0,10,'促销版块管理','','',1,1490861814,1496320694),
	(392,'首页楼层','admin','system','blocklist',10007,3,'system/blocklist',0,0,11,'','','',1,1490947012,1496320711),
	(394,'添加楼层','admin','system','addblock',10007,3,'system/addblock',0,0,0,'','','',1,1490948318,NULL),
	(395,'楼层编辑','admin','system','updateblock',10007,3,'system/updateblock',0,0,0,'','','',1,1490948388,1490952538),
	(398,'个人资料','admin','auth','userdetail',126,2,'auth/userdetail',1,0,0,'个人资料','','',0,1491029995,1494298490),
	(403,'销售排行','admin','account','shopgoodssalesrank',409,2,'account/shopgoodssalesrank',1,0,9,'商品销售排行','','',1,1491040090,1496819701),
	(405,'商品销售统计','admin','account','shopgoodsaccountlist',403,3,'account/shopgoodsaccountlist',0,0,6,'商品销售统计','','',1,1491042742,NULL),
	(409,'资产','admin','account','shopsalesaccount',0,1,'account/shopsalesaccount',1,0,7,'资产','','',1,1493281488,1493974412),
	(418,'网站设置','admin','config','webconfig',528,3,'config/webconfig',0,0,2,'','','',1,1492755047,NULL),
	(419,'商品分类','admin','goods','goodscategorylist',149,2,'goods/goodscategorylist',1,0,2,'商品分类','','',1,1492755701,NULL),
	(420,'添加商品分类','admin','goods','addgoodscategory',419,3,'goods/addgoodscategory',1,0,2,'添加商品分类','','',1,1492755811,1492755828),
	(421,'修改商品分类','admin','goods','updategoodscategory',419,3,'goods/updategoodscategory',1,0,1,'修改商品分类','','',1,1492755920,NULL),
	(422,'删除商品分类','admin','goods','deletegoodscategory',419,3,'goods/deletegoodscategory',1,0,2,'删除商品分类','','',1,1492755973,NULL),
	(423,'商品品牌','admin','goods','goodsbrandlist',149,2,'goods/goodsbrandlist',1,0,3,'商品品牌列表','','',1,1492756038,NULL),
	(424,'添加商品品牌','admin','goods','addgoodsbrand',423,3,'goods/addgoodsbrand',1,0,1,'添加商品品牌','','',1,1492756096,NULL),
	(425,'修改商品品牌','admin','goods','updategoodsbrand',423,3,'goods/updategoodsbrand',1,0,4,'修改商品品牌','','',1,1492756169,NULL),
	(427,'导航管理','admin','config','shopnavigationlist',10007,3,'config/shopnavigationlist',0,0,1,'导航','','',1,1492761752,1496320733),
	(428,'添加导航','admin','config','addshopnavigation',10007,3,'config/addshopnavigation',1,0,2,'添加导航','','',0,1492761909,NULL),
	(429,'修改导航','admin','config','updateshopnavigation',10007,3,'config/updateshopnavigation',1,0,3,'修改导航','','',0,1492762515,NULL),
	(430,'友情链接','admin','config','linklist',10007,3,'config/linklist',0,0,13,'友情链接','','',1,1492765269,1496320750),
	(431,'文章管理','admin','cms','articlelist',477,2,'cms/articlelist',1,0,18,'Cms系统','','',1,1492782512,1492782619),
	(432,'文章列表','admin','cms','articlelist',431,3,'cms/articlelist',0,0,1,'文章列表','','',1,1492782808,1492782837),
	(433,'文章分类','admin','cms','articleclasslist',431,3,'cms/articleclasslist',0,0,2,'文章列表','','',1,1492782934,1492782952),
	(434,'评论列表','admin','cms','commentarticle',431,2,'cms/commentarticle',0,0,3,'评论列表','','',1,1492782991,1497084797),
	(435,'搜索设置','admin','config','searchconfig',10007,3,'config/searchconfig',0,0,14,'搜索设置','','',1,1493187802,1496321601),
	(436,'添加友情链接','admin','config','addlink',10007,3,'config/addlink',0,0,1,'添加友情链接','','',1,1493190273,1493190306),
	(437,'编辑友情链接','admin','config','updatelink',10007,3,'config/updatelink',0,0,2,'编辑友情链接','','',1,1493192018,NULL),
	(438,'验证码设置','admin','config','codeconfig',528,3,'config/codeconfig',0,0,15,'验证码设置','','',1,1493192505,1493192978),
	(439,'通知系统','admin','config','notifyindex',218,2,'config/notifyindex',1,0,30,'messageConfig','','',1,1493194795,1496722814),
	(440,'帮助类型','admin','config','helpclass',530,3,'config/helpclass',0,0,10,'帮助类型','','',1,1493199934,1496320786),
	(441,'帮助内容','admin','config','helpdocument',530,3,'config/helpdocument',0,0,18,'帮助内容','','',1,1493201598,1496320803),
	(442,'添加帮助类型','admin','config','addhelpclass',530,3,'config/addhelpclass',0,0,1,'添加帮助类型','','',1,1493201673,NULL),
	(443,'修改帮助内容','admin','config','updatedocument',530,3,'config/updatedocument',0,0,2,'updateDocument.html','','',1,1493203409,NULL),
	(444,'添加帮助内容','admin','config','adddocument',530,3,'config/adddocument',0,0,2,'aaddDocument','','',1,1493205866,NULL),
	(445,'首页公告','admin','config','usernotice',10007,3,'config/usernotice',0,0,20,'userNotice','','',1,1493206256,1496321121),
	(446,'积分管理','admin','promotion','pointconfig',179,2,'promotion/pointconfig',1,0,1,'1','','',1,1493206530,1496894015),
	(447,'粉丝列表','admin','member','weixinfanslist',137,2,'member/weixinfanslist',1,0,2,'粉丝列表','','',1,1493278702,NULL),
	(450,'修改消息素材','admin','wchat','updatemedia',342,3,'wchat/updatemedia',1,0,1,'','','',1,1493282078,1493282297),
	(451,'添加消息素材','admin','wchat','addmedia',342,3,'wchat/addmedia',1,0,1,'','','',1,1493282371,NULL),
	(452,'添加文章','admin','cms','addarticle',431,3,'cms/addarticle',0,0,4,'','','',1,1493287571,1493289825),
	(454,'销售统计','admin','account','orderaccountcount',409,2,'account/orderaccountcount',0,0,6,'','','',1,1493289961,1493981704),
	(455,'修改文章','admin','cms','updatearticle',431,3,'cms/updatearticle',0,0,2,'','','',1,1493343780,NULL),
	(456,'第三方登录','admin','config','partylogin',218,2,'config/partylogin',1,0,20,'','','',1,1493347646,1496903436),
	(457,'销售明细','admin','account','orderrecordslist',454,3,'account/orderrecordslist',0,0,2,'','','',1,1493705080,1493705419),
	(459,'销售概况','admin','account','shopsalesaccount',409,2,'account/shopsalesaccount',1,0,1,'','','',1,1493776001,1493974321),
	(460,'热卖商品','admin','account','bestsellergoods',463,3,'account/bestsellergoods',0,0,1,'','','',1,1493867120,1493972190),
	(461,'同行热卖','admin','account','shopgoodsgroupsalecount',409,2,'account/shopgoodsgroupsalecount',1,0,4,'','','',1,1493946658,1493950999),
	(462,'运营报告','admin','account','shopreport',409,2,'account/shopreport',1,0,5,'','','',1,1493947412,NULL),
	(463,'商品分析','admin','account','shopgoodssaleslist',409,2,'account/shopgoodssaleslist',1,0,2,'','','',1,1493949799,NULL),
	(467,'首页','admin','index','index',0,1,'index/index',1,0,0,'','','',0,1494485612,1497071676),
	(469,'满额包邮','admin','promotion','fullshipping',179,2,'promotion/fullshipping',1,0,6,'满额包邮设置','','',1,1494928162,NULL),
	(471,'商家地址','admin','order','returnsetting',529,3,'order/returnsetting',0,0,70,'退货设置','','',1,1496215760,1496216046),
	(472,'添加或修改','admin','order','addreturn',529,3,'order/addreturn',1,0,1,'添加退货','','',1,1496215892,1496216067),
	(474,'首页公告','admin','config','updatenotice',10008,3,'config/updatenotice',0,0,15,'公告','','',1,1496291567,1496320766),
	(477,'网站','admin','config','shopnavigationlist',0,1,'config/shopnavigationlist',1,0,9,'导航管理','','',1,1496303515,1496821512),
	(478,'商品评价','admin','goods','goodscomment',149,2,'goods/goodscomment',1,0,8,'','','',1,1496310914,NULL),
	(479,'商品规格','admin','goods','goodsspeclist',149,2,'goods/goodsspeclist',1,0,6,'商品规格','','',1,1496314078,1496368479),
	(480,'添加商品规格','admin','goods','addgoodsspec',479,3,'goods/addgoodsspec',0,0,1,'','','',1,1496368895,NULL),
	(481,'修改商品规格','admin','goods','updategoodsspec',479,3,'goods/updategoodsspec',0,0,0,'','','',1,1496386955,NULL),
	(482,'商品类型','admin','goods','attributelist',149,2,'goods/attributelist',1,0,7,'','','',1,1496392434,1496392497),
	(484,'添加商品类型','admin','goods','addattributeservice',482,3,'goods/addattributeservice',0,0,0,'','','',1,1496395497,1496457873),
	(485,'修改商品类型','admin','goods','updategoodsattribute',482,3,'goods/updategoodsattribute',0,0,0,'','','',1,1496396084,NULL),
	(486,'地区管理','admin','config','areamanagement',529,3,'config/areamanagement',0,0,50,'','','',1,1496452390,NULL),
	(487,'模板编辑','admin','express','expresstemplate',529,3,'express/expresstemplate',0,0,0,'','','',1,1496459993,NULL),
	(488,'会员等级','admin','member','memberlevellist',137,2,'member/memberlevellist',1,0,3,'会员等级','','',1,1496462360,NULL),
	(489,'添加等级','admin','member','addmemberlevel',488,3,'member/addmemberlevel',1,0,1,'添加等级','','',1,1496483895,NULL),
	(490,'修改等级','admin','member','updatememberlevel',488,3,'member/updatememberlevel',1,0,0,'修改等级','','',1,1496483933,1496485692),
	(491,'专题列表','admin','cms','topiclist',477,2,'cms/topiclist',1,0,19,'专题列表','','',1,1496630179,1496632713),
	(492,'添加专题','admin','cms','addtopic',491,3,'cms/addtopic',1,0,1,'添加专题','','',1,1496630640,1496632753),
	(493,'修改专题','admin','cms','updatetopic',491,3,'cms/updatetopic',1,0,2,'修改专题','','',1,1496630696,1496632781),
	(494,'购物设置','admin','config','shopset',528,3,'config/shopset',0,0,44,'购物设置','','',1,1496716845,1496717062),
	(495,'邮件设置','admin','config','messageconfig',439,3,'config/messageconfig',0,0,0,'','','',1,1496731597,NULL),
	(496,'短信设置','admin','config','messageconfig',439,3,'config/messageconfig',0,0,0,'','','',1,1496731636,NULL),
	(497,'会员积分明细','admin','member','pointdetail',145,3,'member/pointdetail',0,0,0,'','','',1,1496739472,NULL),
	(498,'会员余额明细','admin','member','accountdetail',145,3,'member/accountdetail',0,0,0,'','','',1,1496744512,NULL),
	(499,'seo设置','admin','config','seoconfig',528,3,'config/seoconfig',0,0,2,'seo设置','','',1,1496750885,1496751054),
	(501,'微信支付','admin','config','payconfig',221,3,'config/payconfig',1,0,1,'微信支付','','',1,1496821450,NULL),
	(502,'支付宝支付','admin','config','payaliconfig',221,3,'config/payaliconfig',1,0,2,'支付宝支付','','',1,1496821780,NULL),
	(503,'会员提现设置','admin','config','memberwithdrawsetting',218,2,'config/memberwithdrawsetting',1,0,45,'会员提现设置','','',1,1496821934,1496822222),
	(504,'会员提现','admin','member','usercommissionwithdrawlist',137,2,'member/usercommissionwithdrawlist',1,0,4,'会员提现','','',1,1496822171,1496822242),
	(506,'模板管理','admin','config','notifytemplate',439,3,'config/notifytemplate',0,0,0,'','','',1,1496886539,1496974268),
	(507,'积分设置','admin','promotion','integral',446,3,'promotion/integral',1,0,0,'积分奖励','','',1,1496896166,NULL),
	(508,'积分奖励','admin','promotion','integral',446,3,'promotion/integral',1,0,0,'积分奖励','','',1,1496896201,NULL),
	(509,'积分管理','admin','member','pointlist',137,2,'member/pointlist',1,0,5,'','','',1,1496906007,1496906222),
	(510,'余额管理','admin','member','accountlist',137,2,'member/accountlist',1,0,6,'','','',1,1496906142,1496906242),
	(512,'微信登录','admin','config','loginconfig',456,3,'config/loginconfig',1,0,2,'微信登录','','',1,1496907149,1496907569),
	(513,'qq登录','admin','config','loginconfig',456,3,'config/loginconfig',1,0,1,'qq登录','','',1,1496907238,1496907552),
	(515,'欢迎页','admin','index','index',467,2,'index/index',1,0,0,'欢迎页','','',0,1496979062,NULL),
	(517,'商品回收站','admin','goods','recycle',149,2,'goods/recyclelist',1,0,11,'','','',1,1497445996,1497445996),
	(518,'回收站列表','admin','goods','recyclelist',517,3,'goods/recyclelist',0,0,0,'','','',1,1497445996,1497445996),
	(519,'货到付款地区管理','admin','config','distributionareamanagement',529,3,'config/distributionareamanagement',0,0,24,'','','',1,1497706614,1497706614),
	(520,'自提点管理','admin','shop','pickuppointlist',529,3,'shop/pickuppointlist',0,0,80,'','','',1,1498135759,1498135759),
	(521,'添加自提点','admin','shop','addpickuppoint',529,3,'shop/addpickuppoint',0,0,0,'','','',1,1498135759,1498135759),
	(522,'修改自提点','admin','shop','updatepickuppoint',529,3,'shop/updatepickuppoint',0,0,0,'','','',1,1498135759,1498135759),
	(523,'物流跟踪设置','admin','config','expressmessage',528,3,'config/expressmessage',0,0,47,'','','',1,1498198990,1498198990),
	(525,'运费模板列表','admin','express','freighttemplatelist',529,3,'express/freighttemplatelist',0,0,0,'','','',1,1498733102,1498733102),
	(526,'编辑运费模板','admin','express','freighttemplateedit',529,3,'express/freighttemplateedit',0,0,2,'','','',1,1498733102,1498733102),
	(527,'注册与访问','admin','config','registerAndVisit',218,2,'config/registerandvisit',1,0,10,'','','',1,1498874511,1498874511),
	(528,'基础设置','admin','config','webconfig',218,2,'config/webconfig',1,0,0,'','','',1,1499398784,1499398784),
	(529,'物流配送','admin','express','expresscompany',218,2,'express/expresscompany',1,0,60,'','','',1,1499398784,1499398784),
	(530,'站点帮助','admin','config','helpclass',477,2,'config/helpdocument',1,0,17,'','','',1,1499398784,1499398784),
	(10001,'供货商','admin','member','supplierlist',149,2,'member/supplierlist',1,0,7,'','','',1,1500018219,1500018219),
	(10002,'添加供货商','admin','member','addsupplier',10001,3,'member/addsupplier',1,0,0,'','','',1,1500018219,1500018219),
	(10003,'修改供货商','admin','member','updatesupplier',10001,3,'member/updatesupplier',1,0,1,'','','',1,1500018219,1500018219),
	(10007,'电脑端','admin','config','shopnavigationlist',477,2,'config/shopnavigationlist',1,0,0,'','','',1,1500721059,1500721059),
	(10008,'手机端','admin','config','fixedtemplate',477,2,'config/fixedtemplate',1,0,1,'','','',1,1500721060,1500721060),
	(10009,'促销版块','admin','system','goodsrecommendclassmobile',10008,3,'system/goodsrecommendclassmobile',0,0,20,'','','',1,1500721060,1500721060),
	(10075,'商家通知','admin','config','businessnotifytemplate',439,3,'config/businessnotifytemplate',0,0,0,'','','',1,1505870490,0),
	(11008,'扩展','admin','extend','addonslist',0,1,'extend/addonslist',1,0,50,NULL,'','',1,1500632812,1500632818),
	(11009,'插件管理','admin','extend','addonslist',11008,2,'extend/addonslist',1,0,0,'','','',1,1500633040,NULL),
	(11010,'钩子管理','admin','extend','hookslist',11008,2,'extend/hookslist',1,0,1,'','','',1,1500633096,NULL),
	(11011,'插件列表','admin','extend','pluginlist',11008,2,'extend/pluginlist',0,0,3,'','','',1,1500633141,NULL),
	(11012,'添加钩子','admin','extend','addhooks',11010,3,'extend/addhooks',1,0,0,'','','',1,1500633268,NULL),
	(11013,'修改钩子','admin','extend','updatehooks',11010,3,'extend/updatehooks',1,0,0,'','','',1,1500633326,NULL),
	(11014,'插件配置','admin','extend','pluginconfig',11008,2,'extend/pluginconfig',0,0,4,'','','',1,1500633368,NULL),
	(11015,'插件配置','admin','extend','addonsconfig',11008,2,'extend/addonsconfig',0,0,5,'','','',1,1500633398,NULL),
	(11016,'自提点运费','admin','shop','pickuppointfreight',529,3,'shop/pickuppointfreight',1,0,4,'','','',1,1501925650,1501925650),
	(11017,'版权设置','admin','config','copyrightinfo',528,3,'config/copyrightinfo',0,0,8,'','','',1,1501925992,1501925992),
	(11018,'手机模板','admin','config','waptemplate',10008,3,'config/waptemplate',0,0,3,'','','',1,1501925995,1501925995),
	(11019,'客服设置','admin','config','customservice',218,2,'config/customservice',1,0,70,'','','',1,1502540383,1502540383),
	(11021,'固定模板','admin','config','fixedtemplate',10008,3,'config/fixedtemplate',1,0,1,'','','',1,1502540383,1502540383),
	(11022,'附件上传','admin','config','uptype',218,2,'config/uptype',1,0,10,'','','',1,0,1513103421),
	(11023,'商品楼层','admin','system','goodscategoryblock',477,2,'system/goodscategoryblock',1,0,10,NULL,'','',1,0,0),
	(11024,'模板','admin','config','pctemplate',10007,3,'config/pctemplate',1,0,1,'','','',1,1504697794,1504697794),
	(11025,'原路退款配置','admin','config','originalroadrefundsetting',218,2,'config/originalroadrefundsetting',1,0,41,'','','',1,1507881605,0),
	(11026,'数据库管理','admin','dbdatabase','databaselist',218,2,'dbdatabase/databaselist',1,0,0,'','','',1,1506132536,0),
	(11027,'数据库恢复','admin','dbdatabase','importdatalist',11026,3,'dbdatabase/importdatalist',0,0,0,'','','',1,1506132758,0),
	(11028,'SQL执行与导入','admin','dbdatabase','sqlfilequery',11026,3,'dbdatabase/sqlfilequery',0,0,0,'','','',1,1506132811,0),
	(11029,'添加首页公告','admin','config','addhomenotice',10007,3,'config/addhomenotice',0,0,0,'','','',1,1508152805,0),
	(11030,'公告编辑','admin','config','updatehomenotice',10007,3,'config/updatehomenotice',0,0,0,'','','',1,1508208576,0),
	(11031,'图片设置','admin','config','pictureuploadsetting',218,2,'config/pictureuploadsetting',1,0,4,'','','',1,1508152805,0),
	(11033,'伪静态路由设置','admin','config','customPseudoStaticRule',218,2,'config/customPseudoStaticRule',1,0,12,'','','',1,1509941657,0),
	(11034,'编辑路由规则','admin','config','updateRoutingRule',11033,3,'config/updateRoutingRule',0,0,0,'','','',1,1509958647,0),
	(11035,'添加路由规则','admin','config','addRoutingRules',11033,3,'config/addRoutingRules',0,0,0,'','','',1,1509951666,1509959648),
	(11037,'编辑路由规则','admin','config','updateRoutingRule',11033,3,'config/updateRoutingRule',0,0,0,'','','',1,1509958647,0),
	(11038,'添加路由规则','admin','config','addRoutingRules',11033,3,'config/addRoutingRules',0,0,0,'','','',1,1509951666,1509959648),
	(11039,'模板消息设置','admin','wchat','addonmenu',335,2,'wchat/menu_wchat?addons=wxtemplatemsg',1,0,7,'模板消息插件菜单','','',1,1513009735,0),
	(11045,'广告位管理','admin','system','shopadvpositionlist',381,3,'system/shopadvpositionlist',0,0,0,'','','',1,1513076042,0),
	(11047,'广告位管理','admin','system','shopadvpositionlist',381,3,'system/shopadvpositionlist',0,0,0,'','','',1,1513076415,0);

/*!40000 ALTER TABLE `sys_module` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_notice
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_notice`;

CREATE TABLE `sys_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shopid` int(11) NOT NULL COMMENT '店铺ID（单店版为0）',
  `notice_message` varchar(255) DEFAULT '' COMMENT '公告内容',
  `is_enable` tinyint(1) DEFAULT 0 COMMENT '是否启用（0：隐藏，1：显示）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='网站公告';

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;

INSERT INTO `sys_notice` (`id`, `shopid`, `notice_message`, `is_enable`)
VALUES
	(7,0,'',1);

/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_notice_template
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_notice_template`;

CREATE TABLE `sys_notice_template` (
  `template_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `template_type` varchar(50) NOT NULL DEFAULT '' COMMENT '模板类型',
  `instance_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `template_code` varchar(50) NOT NULL DEFAULT '' COMMENT '模板编号',
  `template_title` varchar(50) NOT NULL DEFAULT '' COMMENT '模板编号',
  `template_content` text NOT NULL COMMENT '模板名称',
  `sign_name` varchar(50) NOT NULL DEFAULT '' COMMENT '签名',
  `is_enable` int(11) NOT NULL DEFAULT 0 COMMENT '是否开启',
  `modify_time` int(11) DEFAULT 0 COMMENT '更新时间',
  `notify_type` varchar(255) NOT NULL DEFAULT '' COMMENT '通知人类型',
  `notification_mode` text NOT NULL COMMENT '通知方式',
  PRIMARY KEY (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170 COMMENT='通知模版设置';



# Dump of table sys_notice_template_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_notice_template_item`;

CREATE TABLE `sys_notice_template_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_name` varchar(50) NOT NULL DEFAULT '' COMMENT '项名称',
  `show_name` varchar(50) NOT NULL DEFAULT '' COMMENT '显示名称',
  `replace_name` varchar(50) NOT NULL DEFAULT '' COMMENT '替换字段名字',
  `type_ids` varchar(255) NOT NULL COMMENT '关联type类型',
  `order` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1820 COMMENT='通知模板项';

LOCK TABLES `sys_notice_template_item` WRITE;
/*!40000 ALTER TABLE `sys_notice_template_item` DISABLE KEYS */;

INSERT INTO `sys_notice_template_item` (`id`, `item_name`, `show_name`, `replace_name`, `type_ids`, `order`)
VALUES
	(1,'商场名称','{商场名称}','shopname','after_register,recharge_success,create_order,pay_success,confirm_order,order_deliver,order_remind,refund_order',0),
	(2,'用户名称','{用户名称}','username','after_register,recharge_success,create_order,pay_success,confirm_order,order_deliver,bind_mobile,bind_email,order_remind,refund_order',1),
	(5,'商品名称','{商品名称}','goodsname','order_deliver',4),
	(6,'商品规格','{商品规格}','goodssku','order_deliver',5),
	(7,'主订单号','{主订单号}','orderno','create_order,pay_success,confirm_order,order_deliver,order_remind,refund_order',6),
	(8,'订单金额','{订单金额}','ordermoney','create_order,pay_success,confirm_order,order_deliver,order_remind,refund_order',7),
	(9,'商品金额','{商品金额}','goodsmoney','create_order,pay_success,order_deliver',8),
	(10,'验证码','{验证码}','number','register_validate,forgot_password,bind_mobile,bind_email',9),
	(11,'充值金额','{充值金额}','rechargemoney','recharge_success',0),
	(12,'物流公司','{物流公司}','expresscompany','order_deliver',0),
	(13,'快递编号','{快递编号}','expressno','order_deliver',0);

/*!40000 ALTER TABLE `sys_notice_template_item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_notice_template_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_notice_template_type`;

CREATE TABLE `sys_notice_template_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模板名称',
  `template_code` varchar(50) NOT NULL DEFAULT '' COMMENT '模板编号',
  `template_type` varchar(50) NOT NULL DEFAULT '' COMMENT '模板类型',
  `notify_type` varchar(255) NOT NULL DEFAULT '' COMMENT '通知人类型',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='通知模板类型';

LOCK TABLES `sys_notice_template_type` WRITE;
/*!40000 ALTER TABLE `sys_notice_template_type` DISABLE KEYS */;

INSERT INTO `sys_notice_template_type` (`type_id`, `template_name`, `template_code`, `template_type`, `notify_type`)
VALUES
	(1,'注册成功','after_register','all','user'),
	(2,'注册验证','register_validate','all','user'),
	(3,'充值成功','recharge_success','all','user'),
	(4,'确认订单','confirm_order','all','user'),
	(5,'付款成功','pay_success','all','user'),
	(6,'下单成功','create_order','all','user'),
	(7,'订单发货','order_deliver','all','user'),
	(8,'找回密码','forgot_password','all','user'),
	(9,'手机绑定','bind_mobile','sms','user'),
	(10,'邮箱绑定','bind_email','email','user'),
	(11,'退款订单','refund_order','all','business'),
	(12,'订单提醒','order_remind','all','business'),
	(13,'充值成功','recharge_success','all','business');

/*!40000 ALTER TABLE `sys_notice_template_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_province
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_province`;

CREATE TABLE `sys_province` (
  `province_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` tinyint(4) NOT NULL DEFAULT 0,
  `province_name` varchar(255) NOT NULL DEFAULT '',
  `sort` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`province_id`),
  KEY `IDX_g_province_ProvinceName` (`province_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=481;

LOCK TABLES `sys_province` WRITE;
/*!40000 ALTER TABLE `sys_province` DISABLE KEYS */;

INSERT INTO `sys_province` (`province_id`, `area_id`, `province_name`, `sort`)
VALUES
	(1,2,'北京市',1),
	(2,2,'天津市',0),
	(3,2,'河北省',0),
	(4,2,'山西省',0),
	(5,2,'内蒙古自治区',0),
	(6,5,'辽宁省',0),
	(7,5,'吉林省',0),
	(8,5,'黑龙江省',0),
	(9,1,'上海市',0),
	(10,1,'江苏省',0),
	(11,1,'浙江省',0),
	(12,1,'安徽省',0),
	(13,3,'福建省',0),
	(14,1,'江西省',0),
	(15,2,'山东省',0),
	(16,4,'河南省',0),
	(17,4,'湖北省',0),
	(18,4,'湖南省',0),
	(19,3,'广东省',0),
	(20,3,'广西壮族自治区',0),
	(21,3,'海南省',0),
	(22,7,'重庆市',0),
	(23,7,'四川省',0),
	(24,7,'贵州省',0),
	(25,7,'云南省',0),
	(26,7,'西藏自治区',0),
	(27,6,'陕西省',0),
	(28,6,'甘肃省',0),
	(29,6,'青海省',0),
	(30,6,'宁夏回族自治区',0),
	(31,6,'新疆维吾尔自治区',0),
	(32,8,'香港特别行政区',0),
	(33,8,'澳门特别行政区',0),
	(34,8,'台湾省',0);

/*!40000 ALTER TABLE `sys_province` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_url_route
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_url_route`;

CREATE TABLE `sys_url_route` (
  `routeid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `rule` varchar(255) NOT NULL DEFAULT '' COMMENT '伪静态路由规则',
  `route` varchar(255) NOT NULL DEFAULT '' COMMENT '路由地址',
  `is_open` int(1) NOT NULL DEFAULT 1 COMMENT '是否启用',
  `is_system` int(1) NOT NULL DEFAULT 0 COMMENT '是否是系统默认',
  `route_model` tinyint(4) NOT NULL DEFAULT 1 COMMENT '配置伪静态使用的模块1.shop2.wap3.admin',
  `remark` text NOT NULL COMMENT '简介',
  PRIMARY KEY (`routeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2340 COMMENT='系统伪静态路由';

LOCK TABLES `sys_url_route` WRITE;
/*!40000 ALTER TABLE `sys_url_route` DISABLE KEYS */;

INSERT INTO `sys_url_route` (`routeid`, `rule`, `route`, `is_open`, `is_system`, `route_model`, `remark`)
VALUES
	(1,'goods','shop/goods/goodsinfo',1,1,1,''),
	(2,'list','shop/goods/goodslist',1,1,1,''),
	(3,'brands','shop/goods/brandlist',1,1,1,''),
	(4,'integralcenter','shop/goods/integralcenter',1,1,1,''),
	(5,'discount','shop/index/discount',1,1,1,''),
	(7,'membercenter','shop/member/index',1,0,1,''),
	(8,'article','shop/cms/articleclassinfo',1,1,1,'文章详情');

/*!40000 ALTER TABLE `sys_url_route` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL DEFAULT 0 COMMENT '实例信息',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_password` varchar(255) NOT NULL DEFAULT '' COMMENT '用户密码（MD5）',
  `user_status` int(11) NOT NULL DEFAULT 1 COMMENT '用户状态  用户状态默认为1',
  `user_headimg` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像',
  `is_system` int(1) NOT NULL DEFAULT 0 COMMENT '是否是系统后台用户 0 不是 1 是',
  `is_member` int(11) NOT NULL DEFAULT 0 COMMENT '是否是前台会员',
  `user_tel` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  `user_tel_bind` int(1) NOT NULL DEFAULT 0 COMMENT '手机号是否绑定 0 未绑定 1 绑定 ',
  `user_qq` varchar(255) DEFAULT '' COMMENT 'qq号',
  `qq_openid` varchar(255) NOT NULL DEFAULT '' COMMENT 'qq互联id',
  `qq_info` varchar(2000) NOT NULL DEFAULT '' COMMENT 'qq账号相关信息',
  `user_email` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `user_email_bind` int(1) NOT NULL DEFAULT 0 COMMENT '是否邮箱绑定',
  `wx_openid` varchar(255) DEFAULT NULL COMMENT '微信用户openid',
  `wx_is_sub` int(1) NOT NULL DEFAULT 0 COMMENT '微信用户是否关注',
  `wx_info` varchar(2000) DEFAULT NULL COMMENT '微信用户信息',
  `other_info` varchar(255) DEFAULT NULL COMMENT '附加信息',
  `current_login_ip` varchar(255) DEFAULT NULL COMMENT '当前登录ip',
  `current_login_type` int(11) DEFAULT NULL COMMENT '当前登录的操作终端类型',
  `last_login_ip` varchar(255) DEFAULT NULL COMMENT '上次登录ip',
  `last_login_type` int(11) DEFAULT NULL COMMENT '上次登录的操作终端类型',
  `login_num` int(11) NOT NULL DEFAULT 0 COMMENT '登录次数',
  `real_name` varchar(50) DEFAULT '' COMMENT '真实姓名',
  `sex` smallint(6) DEFAULT 0 COMMENT '性别 0保密 1男 2女',
  `location` varchar(255) DEFAULT '' COMMENT '所在地',
  `nick_name` varchar(50) DEFAULT '牛酷用户' COMMENT '用户昵称',
  `wx_unionid` varchar(255) NOT NULL DEFAULT '' COMMENT '微信unionid',
  `qrcode_template_id` int(11) NOT NULL DEFAULT 0 COMMENT '模板id',
  `wx_sub_time` int(11) DEFAULT 0 COMMENT '微信用户关注时间',
  `wx_notsub_time` int(11) DEFAULT 0 COMMENT '微信用户取消关注时间',
  `reg_time` int(11) DEFAULT 0 COMMENT '注册时间',
  `current_login_time` int(11) DEFAULT 0 COMMENT '当前登录时间',
  `last_login_time` int(11) DEFAULT 0 COMMENT '上次登录时间',
  `birthday` int(11) DEFAULT 0,
  PRIMARY KEY (`uid`),
  KEY `IDX_sys_user_user_email` (`user_email`),
  KEY `IDX_sys_user_user_name` (`user_name`),
  KEY `IDX_sys_user_user_password` (`user_password`),
  KEY `IDX_sys_user_user_tel` (`user_tel`),
  KEY `IDX_sys_user_wx_openid` (`wx_openid`),
  KEY `IDX_sys_user_wx_unionid` (`wx_unionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=372 COMMENT='系统用户表';

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;

INSERT INTO `sys_user` (`uid`, `instance_id`, `user_name`, `user_password`, `user_status`, `user_headimg`, `is_system`, `is_member`, `user_tel`, `user_tel_bind`, `user_qq`, `qq_openid`, `qq_info`, `user_email`, `user_email_bind`, `wx_openid`, `wx_is_sub`, `wx_info`, `other_info`, `current_login_ip`, `current_login_type`, `last_login_ip`, `last_login_type`, `login_num`, `real_name`, `sex`, `location`, `nick_name`, `wx_unionid`, `qrcode_template_id`, `wx_sub_time`, `wx_notsub_time`, `reg_time`, `current_login_time`, `last_login_time`, `birthday`)
VALUES
	(3,0,'admin','670b14728ad9902aecba32e22fa4f6bd',1,'',1,1,'',0,'','','','',0,NULL,0,NULL,NULL,'127.0.0.1',1,'127.0.0.1',1,33,'',0,'','系统用户','',0,0,0,2017,1513156342,1513154736,0);

/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user_admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user_admin`;

CREATE TABLE `sys_user_admin` (
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT 'user用户ID',
  `admin_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户姓名',
  `group_id_array` int(11) NOT NULL DEFAULT 0 COMMENT '系统用户组',
  `is_admin` int(1) NOT NULL DEFAULT 0 COMMENT '是否是系统管理员组',
  `admin_status` int(11) DEFAULT 1 COMMENT '状态 默认为1',
  `desc` text DEFAULT NULL COMMENT '附加信息',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=910 COMMENT='后台管理员表';

LOCK TABLES `sys_user_admin` WRITE;
/*!40000 ALTER TABLE `sys_user_admin` DISABLE KEYS */;

INSERT INTO `sys_user_admin` (`uid`, `admin_name`, `group_id_array`, `is_admin`, `admin_status`, `desc`)
VALUES
	(2,'管理员',2,1,1,NULL),
	(3,'管理员',3,1,1,NULL);

/*!40000 ALTER TABLE `sys_user_admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user_group`;

CREATE TABLE `sys_user_group` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL DEFAULT 1 COMMENT '实例ID',
  `group_name` varchar(50) NOT NULL DEFAULT '' COMMENT '用户组名称',
  `group_status` int(11) NOT NULL DEFAULT 1 COMMENT '用户组状态',
  `is_system` int(1) NOT NULL DEFAULT 0 COMMENT '是否是系统用户组',
  `module_id_array` text NOT NULL COMMENT '系统模块ID组，用，隔开',
  `desc` text DEFAULT NULL COMMENT '描述',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  `modify_time` int(11) DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=963 COMMENT='系统用户组表';

LOCK TABLES `sys_user_group` WRITE;
/*!40000 ALTER TABLE `sys_user_group` DISABLE KEYS */;

INSERT INTO `sys_user_group` (`group_id`, `instance_id`, `group_name`, `group_status`, `is_system`, `module_id_array`, `desc`, `create_time`, `modify_time`)
VALUES
	(2,1,'管理员组',1,1,'120,121,122,123,126,127,128,129,133,137,139,144,145,149,151,169,170,171,172,176,179,180,184,185,186,187,189,190,191,192,194,195,196,197,198,199,200,201,202,203,210,218,221,334,335,336,339,340,341,342,343,344,358,359,360,361,381,382,383,387,388,389,390,392,394,395,403,405,409,418,419,420,421,422,423,424,425,427,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,450,451,452,454,455,456,457,459,460,461,462,463,467,469,471,472,474,477,478,479,480,481,482,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,501,502,503,504,506,507,508,509,510,512,513,515,517,518,519,520,521,522,523,524,525,526,527,528,529,530,10000,10001,10002,10003',NULL,1500346817,0),
	(3,0,'管理员组',1,1,'120,121,122,123,126,127,128,129,133,137,139,144,145,149,151,169,170,171,172,176,179,180,184,185,186,187,189,190,191,192,194,195,196,197,198,199,200,201,202,203,210,218,221,334,335,336,339,340,341,342,343,358,359,360,361,381,382,383,387,388,389,390,392,394,395,403,405,409,418,419,420,421,422,423,424,425,427,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,450,451,452,454,455,456,457,459,460,461,462,463,469,471,472,474,477,478,479,480,481,482,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,501,502,503,504,506,507,508,509,510,512,513,517,518,519,520,521,522,523,524,525,526,527,528,529,530,10000,10001,10002,10003,10007,10008,10009,10010,10075,11008,11009,11010,11011,11012,11013,11014,11015,11016,11017,11018,11019,11021,11022,11023,11024,11025,11026,11027,11028,11029,11030,11031,11032',NULL,2017,0);

/*!40000 ALTER TABLE `sys_user_group` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_user_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_user_log`;

CREATE TABLE `sys_user_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '操作用户ID',
  `is_system` int(11) NOT NULL DEFAULT 1 COMMENT '是否是后台操作',
  `controller` varchar(255) NOT NULL DEFAULT '' COMMENT '操作控制器',
  `method` varchar(255) NOT NULL DEFAULT '' COMMENT '操作方案',
  `data` text DEFAULT NULL COMMENT '传输数据',
  `ip` varchar(255) DEFAULT NULL COMMENT 'ip地址',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=82 COMMENT='用户操作日志';



# Dump of table sys_version_devolution
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_version_devolution`;

CREATE TABLE `sys_version_devolution` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `devolution_username` varchar(255) NOT NULL DEFAULT '' COMMENT '授权账户',
  `devolution_password` varchar(255) NOT NULL DEFAULT '' COMMENT '授权密码',
  `create_date` int(11) DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='用户授权信息';



# Dump of table sys_version_patch
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_version_patch`;

CREATE TABLE `sys_version_patch` (
  `patch_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `patch_type` int(11) NOT NULL DEFAULT 1 COMMENT '补丁类型  1. B2C单用户商城 2.B2C 单用户分销商城 3 B2B2C多用户商城',
  `patch_type_name` varchar(50) NOT NULL DEFAULT '' COMMENT '补丁类型名称',
  `patch_release` varchar(50) NOT NULL DEFAULT '' COMMENT '补丁编号',
  `patch_name` varchar(255) NOT NULL DEFAULT '' COMMENT '补丁标题',
  `patch_no` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '版本号',
  `patch_file_name` varchar(50) NOT NULL DEFAULT '' COMMENT '补丁文件名称',
  `patch_log` text NOT NULL COMMENT '版本补丁更新日志',
  `patch_file_size` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '补丁文件大小',
  `is_up` int(11) NOT NULL DEFAULT 2 COMMENT '是否升级  1代表已升级  0未升级 2全部',
  `modify_date` int(11) DEFAULT 0 COMMENT '更新时间',
  PRIMARY KEY (`patch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='版本补丁管理';



# Dump of table sys_web_style
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_web_style`;

CREATE TABLE `sys_web_style` (
  `style_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `style_name` varchar(50) NOT NULL DEFAULT '' COMMENT '样式名称',
  `style_path` varchar(255) NOT NULL DEFAULT '' COMMENT '样式路径',
  `stye_img` varchar(255) NOT NULL DEFAULT '' COMMENT '样式图片路径',
  `desc` text DEFAULT NULL COMMENT '备注',
  `type` int(11) DEFAULT 1 COMMENT '1：前台样式，2：后台样式',
  `create_time` int(11) DEFAULT 0 COMMENT '创建时间',
  `modify_time` int(11) DEFAULT 0 COMMENT '修改时间',
  PRIMARY KEY (`style_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='网站前台样式表';

LOCK TABLES `sys_web_style` WRITE;
/*!40000 ALTER TABLE `sys_web_style` DISABLE KEYS */;

INSERT INTO `sys_web_style` (`style_id`, `style_name`, `style_path`, `stye_img`, `desc`, `type`, `create_time`, `modify_time`)
VALUES
	(1,'热情洋溢','default','',NULL,1,0,0),
	(2,'蓝色清爽','blue','',NULL,1,1499428480,0),
	(3,'经典版','admin','','',2,1500721061,1500721061),
	(4,'简约版','adminblue','','',2,1500721061,1500721061);

/*!40000 ALTER TABLE `sys_web_style` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_website
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_website`;

CREATE TABLE `sys_website` (
  `website_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '网站标题',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT '网站logo',
  `web_desc` varchar(1000) NOT NULL DEFAULT '' COMMENT '网站描述',
  `key_words` varchar(255) NOT NULL DEFAULT '' COMMENT '网站关键字',
  `web_icp` varchar(255) NOT NULL DEFAULT '' COMMENT '网站备案号',
  `style_id_pc` int(10) NOT NULL DEFAULT 2 COMMENT '前台网站风格（1：热情洋溢模板，2：蓝色清爽版）',
  `web_address` varchar(255) NOT NULL DEFAULT '' COMMENT '网站联系地址',
  `web_qrcode` varchar(255) NOT NULL DEFAULT '' COMMENT '网站公众号二维码',
  `web_url` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺网址',
  `web_email` varchar(255) NOT NULL DEFAULT '' COMMENT '网站邮箱',
  `web_phone` varchar(255) NOT NULL DEFAULT '' COMMENT '网站联系方式',
  `web_qq` varchar(255) NOT NULL DEFAULT '' COMMENT '网站qq号',
  `web_weixin` varchar(255) NOT NULL DEFAULT '' COMMENT '网站微信号',
  `web_status` int(10) NOT NULL DEFAULT 1 COMMENT '网站运营状态1.开启 2.关闭 ',
  `third_count` text NOT NULL COMMENT '第三方统计',
  `close_reason` varchar(255) NOT NULL DEFAULT '' COMMENT '站点关闭原因',
  `wap_status` int(10) NOT NULL DEFAULT 1 COMMENT '手机端运营状态 1.开启2.关闭',
  `style_id_admin` int(10) DEFAULT 4 COMMENT '后台网站风格（3：旧模板，4：新模板）',
  `create_time` int(11) DEFAULT 0 COMMENT '网站创建时间',
  `modify_time` int(11) DEFAULT 0 COMMENT '网站修改时间',
  `url_type` int(11) NOT NULL DEFAULT 0 COMMENT '网站访问模式',
  `web_popup_title` varchar(50) NOT NULL DEFAULT '' COMMENT '网站弹出框标题',
  `web_wechat_share_logo` varchar(255) NOT NULL DEFAULT '' COMMENT '微信分享logo',
  `web_gov_record` varchar(60) NOT NULL DEFAULT '' COMMENT '网站公安备案信息',
  `web_gov_record_url` varchar(255) NOT NULL DEFAULT '' COMMENT '网站公安备案跳转链接地址',
  PRIMARY KEY (`website_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='网站信息表';

LOCK TABLES `sys_website` WRITE;
/*!40000 ALTER TABLE `sys_website` DISABLE KEYS */;

INSERT INTO `sys_website` (`website_id`, `title`, `logo`, `web_desc`, `key_words`, `web_icp`, `style_id_pc`, `web_address`, `web_qrcode`, `web_url`, `web_email`, `web_phone`, `web_qq`, `web_weixin`, `web_status`, `third_count`, `close_reason`, `wap_status`, `style_id_admin`, `create_time`, `modify_time`, `url_type`, `web_popup_title`, `web_wechat_share_logo`, `web_gov_record`, `web_gov_record_url`)
VALUES
	(1,'您的开源商城','public/static/images/default_img_url/logo.png','开源商城','','abc',1,'#','public/static/images/default_img_url/qrcode.png','#','18000000000@bb.com','18000000000','000000','000000',1,'','对不起，商城维护中，大家敬请期待...',1,4,1477452112,1513152898,0,'','','','');

/*!40000 ALTER TABLE `sys_website` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_weixin_auth
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_weixin_auth`;

CREATE TABLE `sys_weixin_auth` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `authorizer_appid` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺的appid  授权之后不用刷新',
  `authorizer_refresh_token` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺授权之后的刷新token，每月刷新',
  `authorizer_access_token` varchar(255) NOT NULL DEFAULT '' COMMENT '店铺的公众号token，只有2小时',
  `func_info` varchar(1000) NOT NULL DEFAULT '' COMMENT '授权项目',
  `nick_name` varchar(50) NOT NULL DEFAULT '' COMMENT '公众号昵称',
  `head_img` varchar(255) NOT NULL DEFAULT '' COMMENT '公众号头像url',
  `user_name` varchar(50) NOT NULL DEFAULT '' COMMENT '公众号原始账号',
  `alias` varchar(255) NOT NULL DEFAULT '' COMMENT '公众号原始名称',
  `qrcode_url` varchar(255) NOT NULL DEFAULT '' COMMENT '公众号二维码url',
  `auth_time` int(11) DEFAULT 0 COMMENT '授权时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=8192 COMMENT='店铺(实例)微信公众账号授权';



# Dump of table sys_weixin_default_replay
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_weixin_default_replay`;

CREATE TABLE `sys_weixin_default_replay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL COMMENT '店铺id',
  `reply_media_id` int(11) NOT NULL COMMENT '回复媒体内容id',
  `sort` int(11) NOT NULL,
  `create_time` int(11) DEFAULT 0,
  `modify_time` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='关注时回复';



# Dump of table sys_weixin_fans
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_weixin_fans`;

CREATE TABLE `sys_weixin_fans` (
  `fans_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '粉丝ID',
  `uid` int(11) NOT NULL DEFAULT 0 COMMENT '会员编号ID',
  `source_uid` int(11) NOT NULL DEFAULT 0 COMMENT '推广人uid',
  `instance_id` int(11) NOT NULL COMMENT '店铺ID',
  `nickname` varchar(255) NOT NULL COMMENT '昵称',
  `nickname_decode` varchar(255) DEFAULT '',
  `headimgurl` varchar(500) NOT NULL DEFAULT '' COMMENT '头像',
  `sex` smallint(6) NOT NULL DEFAULT 1 COMMENT '性别',
  `language` varchar(20) NOT NULL DEFAULT '' COMMENT '用户语言',
  `country` varchar(60) NOT NULL DEFAULT '' COMMENT '国家',
  `province` varchar(255) NOT NULL DEFAULT '' COMMENT '省',
  `city` varchar(255) NOT NULL DEFAULT '' COMMENT '城市',
  `district` varchar(255) NOT NULL DEFAULT '' COMMENT '行政区/县',
  `openid` varchar(255) NOT NULL DEFAULT '' COMMENT '用户的标识，对当前公众号唯一     用户的唯一身份ID',
  `unionid` varchar(255) NOT NULL DEFAULT '' COMMENT '粉丝unionid',
  `groupid` int(11) NOT NULL DEFAULT 0 COMMENT '粉丝所在组id',
  `is_subscribe` bigint(1) NOT NULL DEFAULT 1 COMMENT '是否订阅',
  `memo` varchar(255) NOT NULL COMMENT '备注',
  `subscribe_date` int(11) DEFAULT 0 COMMENT '订阅时间',
  `unsubscribe_date` int(11) DEFAULT 0 COMMENT '解订阅时间',
  `update_date` int(11) DEFAULT 0 COMMENT '粉丝信息最后更新时间',
  PRIMARY KEY (`fans_id`),
  KEY `IDX_sys_weixin_fans_openid` (`openid`),
  KEY `IDX_sys_weixin_fans_unionid` (`unionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638 COMMENT='微信公众号获取粉丝列表';



# Dump of table sys_weixin_follow_replay
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_weixin_follow_replay`;

CREATE TABLE `sys_weixin_follow_replay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL COMMENT '店铺id',
  `reply_media_id` int(11) NOT NULL COMMENT '回复媒体内容id',
  `sort` int(11) NOT NULL,
  `create_time` int(11) DEFAULT 0,
  `modify_time` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='关注时回复';



# Dump of table sys_weixin_functions_button
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_weixin_functions_button`;

CREATE TABLE `sys_weixin_functions_button` (
  `button_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `instance_id` int(11) NOT NULL COMMENT '实例',
  `button_name` varchar(50) NOT NULL DEFAULT '' COMMENT '模块名',
  `keyname` varchar(20) NOT NULL DEFAULT '' COMMENT '触发关键词',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '触发网址',
  `hits` int(11) NOT NULL DEFAULT 0 COMMENT '触发次数',
  `is_enabled` int(1) NOT NULL DEFAULT 1 COMMENT '是否启用',
  `is_system` int(1) DEFAULT 0,
  `orders` int(11) NOT NULL DEFAULT 0 COMMENT '排序号',
  `create_time` int(11) DEFAULT 0 COMMENT '创建日期',
  `modify_time` int(11) DEFAULT 0 COMMENT '修改日期',
  PRIMARY KEY (`button_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1489 COMMENT='微信功能按钮';



# Dump of table sys_weixin_instance_msg
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_weixin_instance_msg`;

CREATE TABLE `sys_weixin_instance_msg` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL COMMENT '店铺id（单店版为0）',
  `template_no` varchar(55) NOT NULL COMMENT '模版编号',
  `template_id` varbinary(55) DEFAULT NULL COMMENT '微信模板消息的ID',
  `title` varchar(100) NOT NULL COMMENT '模版标题',
  `is_enable` bit(1) DEFAULT b'0' COMMENT '是否启用',
  `headtext` varchar(255) NOT NULL COMMENT '头部文字',
  `bottomtext` varchar(255) NOT NULL COMMENT '底部文字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=4096 COMMENT='微信实例消息';



# Dump of table sys_weixin_key_replay
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_weixin_key_replay`;

CREATE TABLE `sys_weixin_key_replay` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `instance_id` int(11) NOT NULL COMMENT '店铺id',
  `key` varchar(255) NOT NULL COMMENT '关键词',
  `match_type` tinyint(4) NOT NULL COMMENT '匹配类型1模糊匹配2全部匹配',
  `reply_media_id` int(11) NOT NULL COMMENT '回复媒体内容id',
  `sort` int(11) NOT NULL,
  `create_time` int(11) DEFAULT 0,
  `modify_time` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=16384 COMMENT='关键词回复';



# Dump of table sys_weixin_media
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_weixin_media`;

CREATE TABLE `sys_weixin_media` (
  `media_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '图文消息id',
  `title` varchar(100) DEFAULT NULL,
  `instance_id` int(11) NOT NULL DEFAULT 0 COMMENT '实例id店铺id',
  `type` varchar(255) NOT NULL DEFAULT '1' COMMENT '类型1文本(项表无内容) 2单图文 3多图文',
  `sort` int(11) NOT NULL DEFAULT 0,
  `create_time` int(11) DEFAULT 0 COMMENT '创建日期',
  `modify_time` int(11) DEFAULT 0 COMMENT '修改日期',
  PRIMARY KEY (`media_id`),
  UNIQUE KEY `id` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1170;



# Dump of table sys_weixin_media_item
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_weixin_media_item`;

CREATE TABLE `sys_weixin_media_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'id',
  `media_id` int(11) NOT NULL COMMENT '图文消息id',
  `title` varchar(100) DEFAULT NULL,
  `author` varchar(50) NOT NULL COMMENT '作者',
  `cover` varchar(200) NOT NULL COMMENT '图文消息封面',
  `show_cover_pic` tinyint(4) NOT NULL DEFAULT 1 COMMENT '封面图片显示在正文中',
  `summary` text DEFAULT NULL,
  `content` text NOT NULL COMMENT '正文',
  `content_source_url` varchar(200) NOT NULL DEFAULT '' COMMENT '图文消息的原文地址，即点击“阅读原文”后的URL',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序号',
  `hits` int(11) NOT NULL DEFAULT 0 COMMENT '阅读次数',
  PRIMARY KEY (`id`),
  KEY `id` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=712;



# Dump of table sys_weixin_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_weixin_menu`;

CREATE TABLE `sys_weixin_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `instance_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `menu_name` varchar(50) NOT NULL DEFAULT '' COMMENT '菜单名称',
  `ico` varchar(32) NOT NULL DEFAULT '' COMMENT '菜图标单',
  `pid` int(11) NOT NULL DEFAULT 0 COMMENT '父菜单',
  `menu_event_type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1普通url 2 图文素材 3 功能',
  `media_id` int(11) NOT NULL DEFAULT 0 COMMENT '图文消息ID',
  `menu_event_url` varchar(255) NOT NULL DEFAULT '' COMMENT '菜单url',
  `hits` int(11) NOT NULL DEFAULT 0 COMMENT '触发数',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '排序',
  `create_date` int(11) DEFAULT 0 COMMENT '创建日期',
  `modify_date` int(11) DEFAULT 0 COMMENT '修改日期',
  PRIMARY KEY (`menu_id`),
  KEY `IDX_biz_shop_menu_orders` (`sort`),
  KEY `IDX_biz_shop_menu_shopId` (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1638 COMMENT='微设置->微店菜单';



# Dump of table sys_weixin_msg_template
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_weixin_msg_template`;

CREATE TABLE `sys_weixin_msg_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `template_no` varchar(55) NOT NULL COMMENT '编号',
  `title` varchar(100) NOT NULL COMMENT '标题',
  `contents` varchar(255) NOT NULL DEFAULT '' COMMENT '内容示例',
  `template_id` varchar(55) DEFAULT '' COMMENT '模版id',
  `headtext` varchar(255) DEFAULT NULL COMMENT '头部文字',
  `bottomtext` varchar(255) DEFAULT NULL COMMENT '底部文字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信消息模版';



# Dump of table sys_weixin_qrcode_template
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_weixin_qrcode_template`;

CREATE TABLE `sys_weixin_qrcode_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '实例ID',
  `instance_id` int(11) NOT NULL DEFAULT 0 COMMENT '店铺id',
  `background` varchar(255) NOT NULL DEFAULT '' COMMENT '背景图片',
  `nick_font_color` varchar(255) NOT NULL DEFAULT '#000' COMMENT '昵称字体颜色',
  `nick_font_size` smallint(6) NOT NULL DEFAULT 12 COMMENT '昵称字体大小',
  `is_logo_show` smallint(6) NOT NULL DEFAULT 1 COMMENT 'logo是否显示',
  `header_left` varchar(6) NOT NULL DEFAULT '0px' COMMENT '头部左边距',
  `header_top` varchar(6) NOT NULL DEFAULT '0px' COMMENT '头部上边距',
  `name_left` varchar(6) NOT NULL DEFAULT '0px' COMMENT '昵称左边距',
  `name_top` varchar(6) NOT NULL DEFAULT '0px' COMMENT '昵称上边距',
  `logo_left` varchar(6) NOT NULL DEFAULT '0px' COMMENT 'logo左边距',
  `logo_top` varchar(6) NOT NULL DEFAULT '0px' COMMENT 'logo上边距',
  `code_left` varchar(6) NOT NULL DEFAULT '0px' COMMENT '二维码左边距',
  `code_top` varchar(6) NOT NULL DEFAULT '0px' COMMENT '二维码上边距',
  `is_check` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否默认',
  `is_remove` tinyint(4) NOT NULL DEFAULT 0 COMMENT '是否删除  0未删除 1删除',
  `template_url` varchar(255) NOT NULL DEFAULT '' COMMENT '模板样式路径',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=5461 COMMENT='微信推广二维码模板管理';

LOCK TABLES `sys_weixin_qrcode_template` WRITE;
/*!40000 ALTER TABLE `sys_weixin_qrcode_template` DISABLE KEYS */;

INSERT INTO `sys_weixin_qrcode_template` (`id`, `instance_id`, `background`, `nick_font_color`, `nick_font_size`, `is_logo_show`, `header_left`, `header_top`, `name_left`, `name_top`, `logo_left`, `logo_top`, `code_left`, `code_top`, `is_check`, `is_remove`, `template_url`)
VALUES
	(1,0,'public/static/images/qrcode_bg/qrcode_bg.png','#2b2b2b',23,1,'93px','467px','159px','479px','98px','319px','89px','88px',0,0,'public/static/images/qrcode_bg/template_bg_img.png');

/*!40000 ALTER TABLE `sys_weixin_qrcode_template` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sys_weixin_user_msg
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_weixin_user_msg`;

CREATE TABLE `sys_weixin_user_msg` (
  `msg_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `msg_type` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `is_replay` int(11) NOT NULL DEFAULT 0 COMMENT '是否回复',
  `create_time` int(11) DEFAULT 0,
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信用户消息表';



# Dump of table sys_weixin_user_msg_replay
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_weixin_user_msg_replay`;

CREATE TABLE `sys_weixin_user_msg_replay` (
  `replay_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `msg_id` int(11) NOT NULL,
  `replay_uid` int(11) NOT NULL COMMENT '当前客服uid',
  `replay_type` varchar(255) NOT NULL,
  `content` text DEFAULT NULL,
  `replay_time` int(11) DEFAULT 0,
  PRIMARY KEY (`replay_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信用户消息回复表';



# Dump of table sys_wexin_onekeysubscribe
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sys_wexin_onekeysubscribe`;

CREATE TABLE `sys_wexin_onekeysubscribe` (
  `instance_id` int(11) NOT NULL COMMENT '实例ID',
  `url` varchar(300) NOT NULL DEFAULT '' COMMENT '一键关注url',
  PRIMARY KEY (`instance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=2048 COMMENT='微信一键关注设置';




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
