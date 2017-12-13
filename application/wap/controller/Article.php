<?php
namespace app\wap\controller;

use data\model\AlbumPictureModel as AlbumPictureModel;
use data\service\Article as ArticleService;
use data\service\Config;
use data\service\Member as Member;
use data\service\WebSite as WebSite;
use think\Controller;
\think\Loader::addNamespace('data', 'data/');

class Article extends Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->init();
    }

    public function init()
    {
        $this->user = new Member();
        $this->web_site = new WebSite();
        $web_info = $this->web_site->getWebSiteInfo();
        $this->assign("title", $web_info['title']);
        // 使用那个手机模板
        $config = new Config();
        $use_wap_template = $config->getUseWapTemplate(0);
        
        if (empty($use_wap_template)) {
            $use_wap_template['value'] = 'default';
        }
        $this->style = "wap/" . $use_wap_template['value']."/";
        $this->assign("style", "wap/" . $use_wap_template['value']);
        
        $Config = new Config();
         $seoconfig = $Config->getSeoConfig(0);
        $this->assign("seoconfig", $seoconfig);
        
        if($web_info['wap_status'] == 3 && $web_info['web_status'] == 1){
            Cookie::set("default_client", "shop");
            $this->redirect(__URL(\think\Config::get('view_replace_str.SHOP_MAIN')."/shop"));
        }else if ($web_info['wap_status'] == 2) {
            webClose($web_info['close_reason']);
        }else if(($web_info['wap_status'] == 3 && $web_info['web_status'] == 3)||($web_info['wap_status'] == 3 && $web_info['web_status'] == 2)){
            webClose($web_info['close_reason']);
        }
    }

    public function showArticle()
    {
        $article_id = request()->get('id',0);
        if (!is_numeric($article_id)) {
            $this->error("没有获取到文章信息");
        }
        $article = new ArticleService();
        $ArticleDetail = $article->getArticleDetail($article_id);
        $this->assign("ArticleDetail", $ArticleDetail);
        $this->assign("content", $ArticleDetail['content']);
        $attachment_path = explode(",", $ArticleDetail['attachment_path']);
        $this->assign('attachment_path', $attachment_path);
        // 查询图片表
        $goods_img = new AlbumPictureModel();
        $imginfo = $goods_img->all($ArticleDetail['image']);
        $img = empty($imginfo) ? '' : $imginfo[0]["pic_cover_big"];
        $this->assign('img', $img);

        return view($this->style . 'Article/showArticle');
    }
}