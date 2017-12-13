<?php

namespace data\model;

use data\model\BaseModel as BaseModel;

/**
 * 虚拟商品列表(用户下单支成功后存放)
 *
 * virtual_code varbinary(255) NOT NULL COMMENT '虚拟码',
 * virtual_goods_name varchar(255) NOT NULL COMMENT '虚拟商品名称',
 * money decimal(10, 2) NOT NULL COMMENT '金额',
 * buyer_id int(11) NOT NULL COMMENT '买家id',
 * buyer_name varchar(255) NOT NULL COMMENT '买家名称',
 * order_id int(11) NOT NULL COMMENT '关联订单id',
 * order_no varchar(255) NOT NULL COMMENT '订单编号',
 * validity_period int(11) NOT NULL COMMENT '有效期/天(0表示不限制)',
 * start_time int(11) NOT NULL COMMENT '有效期开始时间',
 * end_time int(11) NOT NULL COMMENT '有效期结束时间',
 * use_number int(11) NOT NULL COMMENT '使用次数',
 * confine_use_number int(11) NOT NULL COMMENT '限制使用次数',
 *
 * @author Administrator
 *        
 */
class NsVirtualGoodsModel extends BaseModel
{

    protected $table = 'ns_virtual_goods';

    protected $rule = [];

    protected $msg = [];
}