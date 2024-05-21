function ajaxTable(pageNo){
	$.ajax({
		url:"productManageTable?pageNo="+pageNo,
		method:"get",
		contentType : "application/json; charset:UTF-8",
		success: function(data){
			$("table").remove();
			$(".card-body").html(data);
		}
	});
}

$(function(){
	$(".disableProduct").on("click", function(){
		var pid = $(this).attr("id");
		var pstatus = $(this).val();
		
		var product = {
			"pid":pid,
			"pstatus": pstatus
		}
		
		$.ajax({
			url:"disableProduct",
			method:"POST",
			data:JSON.stringify(product),
			contentType : "application/json; charset:UTF-8",
			success: function(data){
				var pidId = "#"+pid;
				if(pstatus=='N'){
					$(pidId).text("활성화");
					$(pidId).val('Y');
					$(pidId).removeClass("btn-danger")
					$(pidId).addClass("btn-primary");
				}else{
					$(pidId).text("비활성화");
					$(pidId).val('N');
					$(pidId).removeClass("btn-primary")
					$(pidId).addClass("btn-danger");
				}
			}
		});
	})
});