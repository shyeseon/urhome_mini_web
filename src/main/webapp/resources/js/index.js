// 카테고리별 조회
function categoryFunction(category) {

	var pcategoryName = category;
	console.log(pcategoryName);

	$.ajax({
		url : "index?pcategoryName=" + pcategoryName,
		type : "get",
		success : function(data) {
			console.log(data);
			// 서버로부터 받은 데이터를 div에 적용
			$("#productItem").remove();
			$(".product-list").html(data);
		},
		error : function(xhr, status, error) {
			console.error("AJAX 요청 실패: ", error);
		}
	});
}