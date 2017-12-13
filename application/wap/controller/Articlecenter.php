<?php
/**
 * Helpcenter.php
 */

namespace app\wap\controller;

use data\service\Article;

/**
 * 帮助中心
 */
class Articlecenter extends BaseController {

	public function __construct() {
		parent::__construct();
	}

	/**
	 * 首页
	 */
	public function index() {
		$document_id         = request()->post( 'id', '' );
		$article             = new Article();
		$platform_help_class = $article->getArticleClassQuery();
		$this->assign( 'platform_help_class', $platform_help_class["data"] ); // 文章一级分类列表
		$this->assign( "title_before", "文章中心" );

		return view( $this->style . 'Articlecenter/index' );
	}

	/**
	 * 获取分类下文章列表
	 */
	public function getArticleList() {
		$class_id = request()->post( 'class_id', '' );
		$page     = request()->post( "page", 1 );
		if ( ! is_numeric( $class_id ) ) {
			$this->error( "未获取到分类信息" );
		}
		$article      = new Article();
		$article_list = $article->getArticleList( $page, PAGESIZE, [
			'nca.class_id' => $class_id
		], 'nca.sort desc' );

		return $article_list;
	}

	/**
	 * 文章内容
	 */
	public function articleContent() {
		$article_id   = request()->get( 'article_id', '' );
		$article      = new Article();
		$article_info = $article->getArticleDetail( $article_id );
		if ( empty( $article_info ) ) {
			$this->error( "未获取到文章信息" );
		}
		$this->assign( "title_before", $article_info['title'] );
		$this->assign( 'article_info', $article_info );

		return view( $this->style . 'Articlecenter/articleContent' );
	}

	public function articleList() {
		$class_id = request()->get( 'class_id', '' );
		$this->assign( "class_id", $class_id );

		return view( $this->style . "Articlecenter/articleList" );
	}
}