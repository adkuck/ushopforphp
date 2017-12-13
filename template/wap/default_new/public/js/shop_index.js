/**
 * 店铺首页
 */

$(window).scroll(function() {
	// 店铺首页滑动固定位置
	var top = $(document).scrollTop();
	if (top > 300) {
		$(".js-user-nav").addClass("user-nav-fixed");
	} else {
		$(".js-user-nav").removeClass("user-nav-fixed");
	}
});