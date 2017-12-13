<?php

namespace data\model;

use data\model\BaseModel as BaseModel;

/**
 * 虚拟商品分组表
 * virtual_goods_group_id int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '虚拟商品分组id',
 * virtual_goods_group_name varchar(255) NOT NULL DEFAULT '' COMMENT '虚拟商品分组名称',
 * interfaces varchar(1000) NOT NULL COMMENT '接口调用地址（JSON）',
 * create_time int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
 *
 * @author Administrator
 *        
 */
class NsVirtualGoodsGroupModel extends BaseModel
{

    protected $table = 'ns_virtual_goods_group';

    protected $rule = [];

    protected $msg = [];
}