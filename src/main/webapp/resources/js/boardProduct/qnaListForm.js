function removeQna(bpnumber, pid) {
	$.ajax({
		url : "../boardProduct/removeQna?bpnumber=" + bpnumber + "&pid="
				+ pid,
		method : "get",
		contentType : "application/json; charset:UTF-8",
		success : function(data) {
			$("#tab04").html(data);
		}
	});
}

function getQnaPage(pid, qpageNo) {
	$.ajax({
		url : "../boardProduct/qnaList?pid=" + pid + "&qpageNo=" + qpageNo,
		method : "get",
		contentType : "application/json; charset:UTF-8",
		success : function(data) {
			$("#tab04").html(data);
		}
	});
}