function removeReview(bpnumber, pid) {
	$.ajax({
		url : "../boardProduct/removeReview?bpnumber=" + bpnumber + "&pid="
				+ pid,
		method : "get",
		contentType : "application/json; charset:UTF-8",
		success : function(data) {
			$("#tab03").html(data);
		}
	});
}

function getReviewPage(pid, rpageNo) {
	$.ajax({
		url : "../boardProduct/reviewList?pid=" + pid + "&rpageNo=" + rpageNo,
		method : "get",
		contentType : "application/json; charset:UTF-8",
		success : function(data) {
			$("#tab03").html(data);
		}
	});
}

function writeReview(pid){
	$.ajax({
		url : "../boardProduct/isWriteReview?pid="+pid,
		method : "get",
		contentType : "application/json; charset:UTF-8",
		success : function(data) {
			console.log(data);
			var isBought = data;
			if(isBought){
				location.href = "../boardProduct/writeReviewForm?pid="+pid;
			}else{
				const modal=new bootstrap.Modal("#writeReviewModal");
	      	  modal.show();
			}
		}
	})
}