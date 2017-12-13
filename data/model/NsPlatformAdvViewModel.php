<?php

namespace data\model;

use data\model\BaseModel as BaseModel;
/**
 * 平台广告
 * @author Administrator
 *
 */
class NsPlatformAdvViewModel extends BaseModel {

    protected $table = 'ns_platform_adv';
    protected $rule = [
        'adv_id'  =>  '',
    ];
    protected $msg = [
        'adv_id'  =>  '',
    ];
    
    /**
     * 获取列表返回数据格式
     * @param unknown $page_index
     * @param unknown $page_size
     * @param unknown $condition
     * @param unknown $order
     * @return unknown
     */
    public function getViewList($page_index, $page_size, $condition, $order){
    
        $queryList = $this->getViewQuery($page_index, $page_size, $condition, $order);
        $queryCount = $this->getViewCount($condition);
        $list = $this->setReturnList($queryList, $queryCount, $page_size);
        return $list;
    }
    /**
     * 获取列表
     * @param unknown $page_index
     * @param unknown $page_size
     * @param unknown $condition
     * @param unknown $order
     * @return \data\model\multitype:number
     */
    public function getViewQuery($page_index, $page_size, $condition, $order)
    {
        //设置查询视图
        $viewObj = $this->alias('npa')
        ->join('ns_platform_adv_position npap','npa.ap_id = npap.ap_id','left')
        ->field('npa.adv_id,npa.ap_id,npa.adv_title,npa.adv_url,npa.adv_image,npa.slide_sort,npa.click_num,npa.background,npap.ap_name,npap.type,npap.instance_id');
        $list = $this->viewPageQuery($viewObj, $page_index, $page_size, $condition, $order);
        return $list;
    }
    /**
     * 获取列表数量
     * @param unknown $condition
     * @return \data\model\unknown
     */
    public function getViewCount($condition)
    {
        $viewObj = $this->alias('npa')
        ->join('ns_platform_adv_position npap','npa.ap_id = npap.ap_id','left')
        ->field('npa.adv_id,npa.ap_id,npa.adv_title,npa.adv_url,npa.adv_image,npa.slide_sort,npa.click_num,npa.background,npap.ap_name,npap.type,npap.instance_id');
        $count = $this->viewCount($viewObj,$condition);
        return $count;
    }

}