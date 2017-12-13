<?php

namespace data\model;

use data\model\BaseModel as BaseModel;

/**
 * 虚拟商品类型表
 * virtual_goods_type_id int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '虚拟商品类型id',
 * virtual_goods_group_id int(11) NOT NULL COMMENT '关联虚拟商品分组id',
 * virtual_goods_type_name varchar(255) NOT NULL COMMENT '虚拟商品类型名称',
 * validity_period int(11) NOT NULL DEFAULT 0 COMMENT '有效期/天(0表示不限制)',
 * is_enabled tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用（禁用后要查询关联的虚拟商品给予弹出确认提示框）',
 * config_info varchar(1000) NOT NULL COMMENT '配置信息(JSON)示例：金额',
 * interfaces varchar(1000) NOT NULL COMMENT '接口调用地址(JSON)',
 * confine_use_number int(11) NOT NULL DEFAULT 0 COMMENT '限制使用次数',
 * create_time int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
 *
 * @author Administrator
 *        
 */
class NsVirtualGoodsTypeModel extends BaseModel
{

    protected $table = 'ns_virtual_goods_type';

    protected $rule = [];

    protected $msg = [];
}