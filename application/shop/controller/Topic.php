<?php
/**
 * Member.php
 */
namespace app\shop\controller;

use data\service\Article;

/**
 * 专题
 * 
 * @author Administrator
 *        
 */
class Topic extends BaseController
{

    public function __construct()
    {
        parent::__construct();
    }

    /**
     * 专题页
     */
    public function detail()
    {
        $article = new Article();
        $topic_id = request()->get('topic_id', '');
        $info = $article->getTopicDetail($topic_id);
        $this->assign('info', $info);
        //专题详情页网站title
        $this->assign('title_before',$info['title'].'-');
        return view($this->style . 'Topic/detail');
    }
}