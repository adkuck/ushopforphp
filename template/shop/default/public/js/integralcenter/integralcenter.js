/**
 * 积分中心
 */
function getMemberInfo() {

	$.ajax({
		type : "post",
		url : __URL(SHOPMAIN + "/components/getlogininfo"),
		async : true,
		success : function(data) {
//			alert(JSON.stringify(data));
			$(".js-membername").text("Hi," + data['member_name']);
			$(".js-member-point").text(data["member_point"]);
		}
	});
}
// 加载数据