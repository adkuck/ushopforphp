<?php
/**
 * Login.php
 */

/**
 * 后台登录控制器
 */

namespace app\wap\controller;

use data\service\Config;
use data\service\Events;
use data\service\Upgrade;
use data\service\WebSite;
use think\Cache;
use think\Controller;

\think\Loader::addNamespace( 'data', 'data/' );

/**
 * 执行定时任务
 *
 * @author Administrator
 *
 */
class Task extends Controller {

	public function __construct() {
		parent::__construct();
	}

	/**
	 * 加载执行任务
	 */
	public function load_task() {
		$this->autoTask();
		$this->minutesTask();
		$this->hoursTask();
	}

	/**
	 * 立即执行事件
	 */
	public function autoTask() {
		$event                     = new Events();
		$retval_mansong_operation  = $event->mansongOperation();
		$retval_discount_operation = $event->discountOperation();
		$retval_auto_coupon_close  = $event->autoCouponClose();
	}

	/**
	 * 每分钟执行事件
	 */
	public function minutesTask() {
		$time  = time() - 60;
		$cache = Cache::get( "niushop_minutes_task" );
		if ( ! empty( $cache ) && $time < $cache ) {
			return 1;
		} else {
			$event                 = new Events();
			$retval_order_close    = $event->ordersClose();
			$retval_order_complete = $event->ordersComplete();
			Cache::set( "niushop_minutes_task", time() );

			return 1;
		}
	}

	/**
	 * 每小时执行事件
	 */
	public function hoursTask() {
		$time  = time() - 60;
		$cache = Cache::get( "niushop_hours_task" );
		if ( ! empty( $cache ) && $time < $cache ) {
			return 1;
		} else {
			$event                     = new Events();
			$retval_order_autodeilvery = $event->autoDeilvery();
			Cache::set( "niushop_hours_task", time() );

			return 1;
		}
	}

	/**
	 * 获取备案信息等
	 * 网站备案
	 * 公安备案
	 */
	public function copyRightIsLoad() {
		$website       = new WebSite();
		$web_site_info = $website->getWebSiteInfo();
		$result        = array();
		$bottom_info   = array();

		if ( ! empty( $web_site_info["web_icp"] ) ) {
			$bottom_info['copyright_meta'] = $web_site_info["web_icp"];
		} else {
			$bottom_info['copyright_meta'] = '';
		}
		$bottom_info['web_gov_record']     = $web_site_info["web_gov_record"];
		$bottom_info['web_gov_record_url'] = $web_site_info["web_gov_record_url"];

		$result["bottom_info"]  = $bottom_info;
		$result["default_logo"] = "/blue/img/logo.png";

		return $result;
	}
}
