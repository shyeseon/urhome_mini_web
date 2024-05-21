// 전체 조회
function categoryAllFunction() {
	// AJAX 요청 보내기
	$.ajax({
		url : "getProductListAllAjax",
		type : "get",
		success : function(data) {
			// 서버로부터 받은 데이터를 div에 적용
			$("#productItem").remove();
			$(".product-list").html(data);
		},
		error : function(xhr, status, error) {
			console.error("AJAX 요청 실패: ", error);
		}
	});
}

// 카테고리별 조회
function categoryFunction(category) {
	var pcategoryName = category;

	$.ajax({
		url : "getProductListAjax?pcategoryName=" + pcategoryName,
		type : "get",
		success : function(data) {
			// 서버로부터 받은 데이터를 div에 적용
			$("#productItem").remove();
			$(".product-list").html(data);
		},
		error : function(xhr, status, error) {
			console.error("AJAX 요청 실패: ", error);
		}
	});
}
//이벤트 중복  방지
$(function() {
    $(".addcartBtn").off('click').on('click', function() {
        var pid = $(this).parent("div").find("input[name=pid]").val();
        var pname = $(this).parent("div").find("#pname").text();
        var pprice = $(this).parent("div").find("#pprice").text();
        var pbuyAmount = 1;
        var cartItem = {
            "pid": pid,
            "pname": pname,
            "pprice": pprice,
            "pbuyAmount": 1
        };
        cartItem = JSON.stringify(cartItem);
        $.ajax({
            url: "../cart/addCartItem",
            method: "POST",
            data: cartItem,
            contentType: "application/json",
            success: function(data) {
                $("#addCartModal").modal('show'); // Bootstrap 모달 열기
            }
        })
    });
    
    $(".nav-link").on("click", function(){
    	$(".nav-active").removeClass("nav-active");
    	$(this).addClass("nav-active");
    });
    

    // 모달 닫기 버튼
    document.querySelector(".btn-close").addEventListener('click', () => {
        $("#addCartModal").modal('hide'); // Bootstrap 모달 닫기
    });

    // 쇼핑 계속하기 버튼
    document.querySelector(".shopping").addEventListener('click', () => {
        $("#addCartModal").modal('hide'); // Bootstrap 모달 닫기
    });
    
	var query = document.location.search;
	var param = new URLSearchParams(query);
	var pcategoryName = param.get('pcategoryName');
	
	if(pcategoryName != null){
		$.ajax({
			url : "getProductListAjax?pcategoryName=" + pcategoryName,
			type : "get",
			success : function(data) {
				// 서버로부터 받은 데이터를 div에 적용
				$("#productItem").remove();
				$(".product-list").html(data);
			},
			error : function(xhr, status, error) {
				console.error("AJAX 요청 실패: ", error);
			}
		});
	}
});

