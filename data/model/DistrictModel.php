<?php
/**
 * DistrictModel.php
 *
 */

namespace data\model;
use data\model\BaseModel as BaseModel;
/**
 * 地区区县表
 */
class DistrictModel extends BaseModel {

    protected $table = 'sys_district';
    protected $rule = [
        'district_id'  =>  '',
    ];
    protected $msg = [
        'district_id'  =>  '',
    ];
}