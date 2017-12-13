/**
 *  常用工具包
 * 
 */

/**
 * 设置对象垂直居中
 * @param obj 当前DOM对象
 */
function setObjectVerticalCenter(obj) {
//	console.log($(window).width()+",obj:"+obj.outerWidth());
	obj.css({
		"display" : "block",
		"top" : ($(window).height()-obj.outerHeight())/2,
	});
}