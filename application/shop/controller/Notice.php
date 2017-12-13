<?php
/**
 * Cms.php
 */
namespace app\shop\controller;


use data\service\Platform;
/**
 * 内容控制器
 */
class Notice extends BaseController
{
    /**
     * 公告详情
     */
    public function detail()
    {
        $platform = new Platform();
        $id = request()->get("id",0);
        $info = $platform -> getNoticeDetail($id);
        if(empty($info)){
            $this->error("没有获取到公告信息");
        }else{
            $this->assign('info', $info);
            //专题详情页网站title
            $this->assign('title_before',$info['notice_title']);
        }
        //上一篇
        $prev_info = $platform->getNoticeList(1,1,[
            "id" => array("<",$id),
        ],"id desc");
        $this->assign("prev_info",$prev_info['data'][0]);
        //下一篇
        $next_info = $platform->getNoticeList(1,1,[
            "id" => array(">",$id),
        ],"id asc");
        $this->assign("next_info",$next_info['data'][0]);
        return view($this->style . 'Notice/detail');
    }
    
    /**
     * 公告列表
     */
    public function noticeList(){
        $platform = new Platform();
        $list = $platform -> getNoticeList(1, 0, "", "sort");
        $this->assign("list", $list['data']);
        return view($this->style. "Notice/noticeList");
    }
}